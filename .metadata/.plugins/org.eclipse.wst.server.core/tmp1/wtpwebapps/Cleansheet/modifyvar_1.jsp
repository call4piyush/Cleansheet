<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.DB.connection.Connect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%  	 
		if(request.getSession().getAttribute("empid")==null)
        {      request.getRequestDispatcher("index.jsp").forward(request, response);   
           }else{
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
			<form action="modifyvar_2.jsp" method="post">
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
					 		String[] selected;
					 		 selected=request.getParameterValues("check");
					 		 int j=0;
					 		
        						
      					 		 while( rs.next() )
					 		 { for (int i = 0; i < selected.length; i++) 
     						 { 
      					 		 if(Integer.parseInt(selected[i]) == j)
					          {
							 	%>
						<tr>
						<tbody>
							<td><input type="text" name="type"
								value='<%=rs.getString("typeofgood")%>'></td>
							<td><input type="text" name="tyrelife"
								value='<%=rs.getInt("tyrelife")%>'></td>
							<td><input type="text" name="usedtyrelife"
								value='<%=rs.getInt("reusedtyrelife")%>'></td>
							<td><input type="text" name="tyrecost"
								value='<%=rs.getInt("tyrecost")%>'></td>
							<td><input type="text" name="usedtyrecost"
								value='<%=rs.getInt("reusedtyrecost")%>'></td>
							<td><input type="text" name="tyres"
								value='<%=rs.getInt("tyres")%>'></td>
							<td><input type="text" name="diesel"
								value='<%=rs.getFloat("dieselcost")%>'></td>
							<td><input type="text" name="mileage"
								value='<%=rs.getFloat("dieselmileage")%>'></td>
							<td><input type="text" name="mileagewithload"
								value='<%=rs.getFloat("diesealmileagewithload")%>'></td>
							<td><input type="text" name="toll"
								value='<%=rs.getFloat("toll")%>'></td>
							<td><input type="text" name="routeexpense"
								value='<%=rs.getFloat("routeexpenses")%>'></td>
							<td><input type="text" name="maintenance"
								value='<%=rs.getFloat("maintenancecostperkm")%>'></td>
							</tr>
						</tbody>
						<%
					 		}
					 		}j++;
					 		
					 		}%><input type="hidden" value='<%=j %>' name="no">
						<% 
					            	
				}
				catch(Exception e){
					e.printStackTrace();
					RequestDispatcher ReqDis = request.getRequestDispatcher("Adminerror.jsp");
				ReqDis.forward(request, response);
				}
		%>
					</table>
				</div>
				<div class="table-responsive">
					<table class="table">
						<tr>
						<tr id="2">
							<td></td>
							<td><center>
									<input type="hidden" value='<%=session.getAttribute("empid")%>'
										name="empid"> <input type="submit"
										name="submit" value="Submit"
										class="login login-submit btn btn-primary active">
								</center></td>
							<td><center>
									<a href="adminvariable.jsp"><input type="button"
										onclick="myFunction()" value="Cancel"
										class="login login-submit btn btn-primary active"></a>
								</center></td>
							<td></td>
						</tr>
						</form>
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