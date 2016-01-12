<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.DB.connection.Connect"%>
<%  	 
		if(request.getSession().getAttribute("empid")==null)
        {      request.getRequestDispatcher("index.jsp").forward(request, response);   
           }else{
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Add Locations</title>
<script type="text/javascript"
	src="http://maps.google.com/maps/api/js?sensor=false"></script>
<script language="javascript" type="text/javascript" src="js/latlong.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
</head>
<body class="panel-body">
	<%String name = request.getParameter( "name" );
	 %>
	<div class="card">
		<header>
		<h1 align="center" class="panel-heading">
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
					data-toggle="dropdown" href="#">Control Panel<span
						class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="Capex.jsp">Capex</a></li>
						<li><a href="fixed.jsp">Fixed Cost</a></li>
						<li><a href="variable.jsp">Variable Cost</a></li>
						<li><a href="trip.jsp">Trip Matrix</a></li>
					</ul></li>
				<li class="active"><a href="uploadFreight.jsp">Upload
						Freight</a></li>
				<li class="active"><a href="uploadContract.jsp">View
						Contract</a></li>
				<li class="active"><a href="GetLat.jsp">Get Lat Long</a></li>
				<li class="active"><a href="Help.jsp">Help/FAQs</a></li>
			</ul>
		</div>
		</nav>
		<section style="width:100%; " class="panel-body">
		<center>
			<h5 style="font-weight: bold; padding: 1%">Find Latitudes And
				Longitudes</h5>
		</center>
		<form action="#" method="post" class="form-group panel-body">
			<table align="center" style="width: 35%">
				<tr>
					<td colspan="2"><input type="text" name="location"
						id="location" placeholder="Enter Location" onchange="calcLat()"
						required class="form-control"><br></td>
				</tr>
				<tr>
					<td colspan="2"><input type="hidden" name="lat" id="lat">
						<input type="hidden" name="long" id="long"> <input
						type="hidden" value='<%=session.getAttribute("empid")%>'
						name="empid">
						<center>
							<br> <br> <input type="submit" name="submit"
								class="login login-submit btn btn-primary active" value="Submit"
								disabled="true" id="mySubmit">
						</center></td>
				</tr>
			</table>
			<br>
		</form>
		<center>
			<font size="4">
				<p id="1234" align="center" style="width: 40%;"></p>
			</font>
		</center>
		<footer class="panel-footer"
			style=" bottom:2%; text-align:center; color:white;position:  relative; ">
		Copyright © McKinsey & Company</footer> </section>
	</div>
</body>
</html>
<%}%>