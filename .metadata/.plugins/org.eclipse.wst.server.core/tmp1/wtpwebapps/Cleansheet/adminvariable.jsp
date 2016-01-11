<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.DB.connection.Connect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
%>
<%  	 
		if(request.getSession().getAttribute("empid")==null)
        {      request.getRequestDispatcher("index.jsp").forward(request, response);   
           }else{
           try{			
           				String truckType=(String)session.getAttribute("truckType");
           				int cap=(int)session.getAttribute("cap");
						int cost=(int)session.getAttribute("cost");
						float residual=(float)session.getAttribute("residual");
						float loan=(float)session.getAttribute("loan");
						int emi=(int)session.getAttribute("emi");
						float roi=(float)session.getAttribute("roi");
						float flatroi=(float)session.getAttribute("flatroi");
						//System.out.print(truckType);
						
						String trucktype1=(String)request.getParameter("truckType");
						int sal=Integer.parseInt(request.getParameter("salary" ));
						int bhatta=Integer.parseInt(request.getParameter("bhatta" ));
						int main=Integer.parseInt(request.getParameter("main" ));
						int roadtax=Integer.parseInt(request.getParameter("roadtax" ));
						int permit=Integer.parseInt(request.getParameter("permit"));
						float insurance=Float.parseFloat(request.getParameter("insurance"));
						int admin=Integer.parseInt(request.getParameter("admin"));
						int tarpaulin=Integer.parseInt(request.getParameter("tarpaulin"));
						int profit=Integer.parseInt(request.getParameter("profit"));
						int loading=Integer.parseInt(request.getParameter("loading"));
						//System.out.print(trucktype1);
						
						if(truckType.equals(trucktype1)){
						
						session.setAttribute("truckType", truckType);
						session.setAttribute("cap", cap);
						session.setAttribute("cost", cost);
						session.setAttribute("residual", residual);
						session.setAttribute("loan", loan);
						session.setAttribute("emi", emi);
						session.setAttribute("roi", roi);
						session.setAttribute("flatroi", flatroi);
												
						session.setAttribute("sal", sal);
						session.setAttribute("bhatta", bhatta);
						session.setAttribute("main", main);
						session.setAttribute("roadtax", roadtax);
						session.setAttribute("permit", permit);
						session.setAttribute("insurance", insurance);
						session.setAttribute("admin", admin);
						session.setAttribute("tarpaulin", tarpaulin);
						session.setAttribute("loading", loading);
						session.setAttribute("profit", profit);
						
					}else{
					RequestDispatcher rd= request.getRequestDispatcher("Adminerror.jsp");
					rd.forward(request, response);
					}					
						
						
						
           }catch(Exception e){e.printStackTrace();
           }
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<title>Variable Cost</title>
<script type="text/javascript">
function myFunction() {
    location.reload();
}
function clickadd()
{
document.getElementById('add').style.visibility = 'hidden';

document.getElementById('modify').style.visibility = 'hidden';
document.getElementById('refresh').style.visibility = 'hidden';
document.getElementById('1').style.visibility = 'visible';
document.getElementById('2').style.visibility = 'visible';
}

</script>
</head>
<body class="panel-body">
	<%String name = request.getParameter( "name" );
	 %>
	<div class="card">
		<header>
		<h1 align="center">
			<img src="./images/logo.jpg" alt="Logo">
		</h1>
		<p style="text-align: left;">
			Hello,
			<%= session.getAttribute( "name" ) %>
			<a style="float: right;" href="Logout">Logout</a>
		</p>
		</header>
		<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<ul class="nav navbar-nav">
				<li class="active"><a href="adminAuto.jsp">Auto</a></li>
				<li class="active"><a href="admin.jsp">Classic</a></li>
				<li class="active"><a href="adminAdvanced.jsp">Advanced</a></li>
				<li class="active" class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"
				>Control Panel<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="adminCapex.jsp">Capex</a></li>
						<li><a href="adminfixed.jsp">Fixed Cost</a></li>
						<li><a href="adminvariable.jsp">Variable Cost</a></li>
						<li><a href="admintrip.jsp">Trip Matrix</a></li>
						<li><a href="locations.jsp">Locations</a></li>
					</ul></li>
				<li class="active"><a href="adminUploadFreight.jsp">Upload
						Freight</a></li>
				<li class="active"><a href="adminUploadContract.jsp">Upload
						Contract</a></li>
				<li class="active"><a href="UserSession.jsp">User Record</a></li>
			</ul>
		</div>
		</nav>
		<section style="width:100%">
		<div class="login-card">
			<h2 align="center">Control Panel</h2>
			<form action="Param" method="post">
				<h2 align="center">Variable Cost</h2>
				<div class="table-responsive">
					<table class="table table-hover table-condensed">
						<thead>
							<tr>
								<th>Truck Type</th>
								<th>Tyre life (Km)</th>
								<th>Tyre life (Retredded tyre) (Km)</th>
								<th>Tyre Cost (INR)</th>
								<th>Tyre Cost (Retredded tyre) (INR)</th>
								<th>No. of tyres</th>
								<th>Diesel Cost</th>
								<th>Diesel Milage Km/L</th>
								<th>Diesel Mileage (With Load) Km/L</th>
								<th>Toll per km</th>
								<th>Route expenses per km</th>
								<th>Maintanence cost per km</th>
							</tr>
						</thead>
						<%
			int empid=(int)session.getAttribute("empid");
		 	String sql = "select * from  mckc.truckparam t, mckc.routeparam r where  r.typeofgood=t.typeofgood GROUP BY t.capacity,r.capacity HAVING COUNT(*) > 0  order by t.capacity";
			 
				try{ 
							 Connection con = Connect.getconnection();
							 PreparedStatement ps=con.prepareStatement(sql);					 		 
					 		 ResultSet rs = ps.executeQuery();
					               while( rs.next() )
					 		 {
							 	%>
						<tr>
						<tbody>
							<td><input type="text" readonly="readonly"
								value='<%=rs.getString("typeofgood")%>'
							></td>
							<td><input type="text" readonly="readonly"
								value='<%=rs.getInt("tyrelife")%>'
							></td>
							<td><input type="text" readonly="readonly"
								value='<%=rs.getInt("reusedtyrelife")%>'
							></td>
							<td><input type="text" readonly="readonly"
								value='<%=rs.getInt("tyrecost")%>'
							></td>
							<td><input type="text" readonly="readonly"
								value='<%=rs.getInt("reusedtyrecost")%>'
							></td>
							<td><input type="text" readonly="readonly"
								value='<%=rs.getInt("tyres")%>'
							></td>
							<td><input type="text" readonly="readonly"
								value='<%=rs.getFloat("dieselcost")%>'
							></td>
							<td><input type="text" readonly="readonly"
								value='<%=rs.getFloat("dieselmileage")%>'
							></td>
							<td><input type="text" readonly="readonly"
								value='<%=rs.getFloat("diesealmileagewithload")%>'
							></td>
							<td><input type="text" readonly="readonly"
								value='<%=rs.getFloat("toll")%>'
							></td>
							<td><input type="text" readonly="readonly"
								value='<%=rs.getFloat("routeexpenses")%>'
							></td>
							<td><input type="text" readonly="readonly"
								value='<%=rs.getFloat("maintenancecostperkm")%>'
							></td>
							</tr>
						</tbody>
						<%
					 		}
			
					            	
				}
				catch(Exception e){
					e.printStackTrace();
					RequestDispatcher ReqDis = request.getRequestDispatcher("Adminerror.jsp");
				ReqDis.forward(request, response);
				}
		%>
						<tbody>
							<tr id=1 style="visibility: hidden;">
								<td><input type="text" name="truckType" required></td>
								<td><input type="text" name="tyrelife" required></td>
								<td><input type="text" name="resusedtyrelife" required></td>
								<td><input type="text" name="tyrecost" required></td>
								<td><input type="text" name="reusedtyrecost" required></td>
								<td><input type="text" name="tyres" required></td>
								<td><input type="text" name="diesel" required></td>
								<td><input type="text" name="mileage" required></td>
								<td><input type="text" name="mileageload" required></td>
								<td><input type="text" name="toll" required></td>
								<td><input type="text" name="routeexpense" required></td>
								<td><input type="text" name="maintkm" required></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="table-responsive">
					<table class="table">
						<tr>
						<thead>
							<td align="center"><input type="button" value="Add"
								name="add" id="add"
								class="login login-submit btn btn-primary active"
								onclick="clickadd()"
							></td>
							<td align="center"><a href="modifyvar.jsp"><input
									type="button" value="Modify" name="modify" id="modify"
									class="login login-submit btn btn-primary active"
								></a></td>
							<td align="center"><input type="button" value="Refresh"
								name="refresh" id="refresh"
								class="login login-submit btn btn-primary active"
								onclick="myFunction()"
							></td>
							</tr>
						</thead>
						<tr id="2" style="visibility: hidden;">
							<td></td>
							<td><center>
									<input type="hidden" value='<%=session.getAttribute("empid")%>'
										name="empid"
									> <input type="submit" name="submit" value="Submit"
										class="login login-submit btn btn-primary active"
									>
								</center></td>
							<td><center>
									<input type="button" onclick="myFunction()" value="Cancel"
										class="login login-submit btn btn-primary active"
									>
								</center></td>
							<td></td>
						</tr>
						</form>
					</table>
				</div>
		</section>
		<div class="panel-body"></div>
		<footer class="panel-footer"
			style=" bottom:2%; text-align:center; color:white;position:  relative; "
		> Copyright &copy McKinsey & Company</footer>
	</div>
</body>
</html>
<%}%>