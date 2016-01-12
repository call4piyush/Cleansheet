<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.DB.connection.Connect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%  	 
		if(request.getSession().getAttribute("empid")==null)
        {      request.getRequestDispatcher("index.jsp").forward(request, response);   
           }else{
           				try{
           				String truckType=(String)request.getParameter("Trucktype");
           				int cap=Integer.parseInt(request.getParameter("cap"));
						int cost=Integer.parseInt(request.getParameter("cost")); 
						float residual=Float.parseFloat(request.getParameter("residual"));
						float loan=Float.parseFloat(request.getParameter("loan"));
						int emi=Integer.parseInt(request.getParameter("emi"));
						float roi=Float.parseFloat(request.getParameter("roi"));
						float flatroi=Float.parseFloat(request.getParameter("flatroi"));
						
						session.setAttribute("truckType", truckType);
						session.setAttribute("cap", cap);
						session.setAttribute("cost", cost);
						session.setAttribute("residual", residual);
						session.setAttribute("loan", loan);
						session.setAttribute("emi", emi);
						session.setAttribute("roi", roi);
						session.setAttribute("flatroi", flatroi);
						}catch(Exception e){e.printStackTrace();
						}
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Fixed Cost</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
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
		<h1 align="center">TRAC- Transport Cleansheet Costing Tool</h1>
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
					data-toggle="dropdown" href="#">Control Panel<span
						class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="adminCapex.jsp">Capex</a></li>
						<li><a href="adminfixed.jsp">Fixed Cost</a></li>
						<li><a href="adminvariable.jsp">Variable Cost</a></li>
						<li><a href="admintrip.jsp">Trip Matrix</a></li>
						<li><a href="add.jsp">Add Locations</a></li>
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
			<form action="adminvariable.jsp" method="post" class="form-group">
				<h2 align="center">Fixed Cost</h2>
				<div class="table-responsive">
					<table class="table table-hover table-condensed">
						<thead>
							<tr>
								<th>Truck Type</th>
								<th>Driver/Cleaner monthly salary</th>
								<th>Driver/Cleaner monthly bhatta</th>
								<th>Maintenace (per month)</th>
								<th>Road tax per year (including fitness)</th>
								<th>Road permit per year</th>
								<th>Insurance as percentage of vehicle cost (% p.a.)</th>
								<th>Admin Costs</th>
								<th>Tarpaulin</th>
								<th>Profit Margin(%)</th>
								<th>Loading Charges</th>
							</tr>
						</thead>
						<%
			int empid=(int)session.getAttribute("empid");
			
		 	String sql = "select * from  mckc.truckparam t, mckc.routeparam r where r.typeofgood=t.typeofgood GROUP BY t.capacity,r.capacity HAVING COUNT(*) > 0  order by t.capacity";
			 
				try{ 
							 Connection con = Connect.getconnection();
							PreparedStatement ps=con.prepareStatement(sql);					 		 
					 		ResultSet rs = ps.executeQuery();
					               while( rs.next() )
					 		 {
							 	%><tbody>
							<tr>
								<td><input type="text" readonly="readonly"
									value='<%=rs.getString("typeofgood")%>'></td>
								<td><input type="text" readonly="readonly"
									value='<%=rs.getInt("r.driver/cleaner salary")%>'></td>
								<td><input type="text" readonly="readonly"
									value='<%=rs.getInt("r.driver/cleaner bhatta")%>'></td>
								<td><input type="text" readonly="readonly"
									value='<%=rs.getInt("r.maintenancepermonth")%>'></td>
								<td><input type="text" readonly="readonly"
									value='<%=rs.getInt("roadtaxyear")%>'></td>
								<td><input type="text" readonly="readonly"
									value='<%=rs.getInt("roadpermityear")%>'></td>
								<td><input type="text" readonly="readonly"
									value='<%=rs.getFloat("insuranceaspercentageofvechiclecost")%>'></td>
								<td><input type="text" readonly="readonly"
									value='<%=rs.getInt("admin costs")%>'></td>
								<td><input type="text" readonly="readonly"
									value='<%=rs.getInt("tarpaulin")%>'></td>
								<td><input type="text" readonly="readonly"
									value='<%=rs.getInt("profitmargin")%>'></td>
								<td><input type="text" readonly="readonly"
									value='<%=rs.getInt("loadingcharges")%>'></td>
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
							<tr id="1" style="visibility: hidden;">
								<td><input type="text" name="truckType" required></td>
								<td><input type="text" name="salary" required></td>
								<td><input type="text" name="bhatta" required></td>
								<td><input type="text" name="main" required></td>
								<td><input type="text" name="roadtax" required></td>
								<td><input type="text" name="permit" required></td>
								<td><input type="text" name="insurance" required></td>
								<td><input type="text" name="admin" required></td>
								<td><input type="text" name="tarpaulin" required></td>
								<td><input type="text" name="profit" required></td>
								<td><input type="text" name="loading" required></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="table-responsive">
					<table class="table">
						<tr id="2" style="visibility: hidden;">
							<td></td>
							<td><center>
									<input type="hidden" value='<%=session.getAttribute("empid")%>'
										name="empid"> <input type="submit"
										name="submit" value="Submit"
										class="login login-submit btn btn-primary active">
								</center></td>
							<td><center>
									<input type="button" onclick="myFunction()" value="Cancel"
										class="login login-submit btn btn-primary active">
								</center></td>
							<td></td>
						</tr>
						</form>
						<tr>
						<thead>
							<td align="center"><input type="button" value="Add"
								name="add" id="add"
								class="login login-submit btn btn-primary active"
								onclick="clickadd()"></td>
							<td align="center"><a href="modifyfixed.jsp"><input
									type="button" value="Modify" name="modify" id="modify"
									class="login login-submit btn btn-primary active"></a></td>
							<td align="center"><input type="button" value="Refresh"
								name="refresh" id="refresh"
								class="login login-submit btn btn-primary active"
								onclick="myFunction()"></td>
							</tr>
						</thead>
					</table>
				</div>
		</section>
		<div class="panel-body"></div>
		<footer class="panel-footer"
			style=" bottom:2%; text-align:center; color:white;position:  relative; ">
		Copyright &copy McKinsey & Company</footer>
	</div>
</body>
</html>
<%}%>