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
          
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<title>Variable Cost</title>
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
				<li class="active"><a href="Auto.jsp">Auto</a></li>
				<li class="active"><a href="home.jsp">Classic</a></li>
				<li class="active"><a href="Advanced.jsp">Advanced</a></li>
				<li class="active" class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"
				>Control Panel<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="Capex.jsp">Capex</a></li>
						<li><a href="fixed.jsp">Fixed Cost</a></li>
						<li><a href="variable.jsp">Variable Cost</a></li>
						<li><a href="trip.jsp">Trip Matrix</a></li>
					</ul></li>
				<li class="active"><a href="uploadFreight.jsp">Upload
						Freight</a></li>
				<li class="active"><a href="uploadContract.jsp">Upload
						Contract</a></li>
			</ul>
		</div>
		</nav>
		<section style="width:100%">
		<div class="login-card">
			<h2 align="center">Control Panel</h2>
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
		 	String sql = "select * from  mckc.truckparam t, mckc.routeparam r where r.typeofgood=t.typeofgood GROUP BY t.capacity,r.capacity HAVING COUNT(*) > 0  order by t.capacity";
			 
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
					RequestDispatcher ReqDis = request.getRequestDispatcher("error.jsp");
				ReqDis.forward(request, response);
				}
		%>
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