<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.DB.connection.Connect"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
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
<title>Capex</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script>
var request;  
function sendInfo()  
{  
	var v=document.vform.Search.value;  
	var url="ajax_Capex.jsp?val="+v;    
	if(window.XMLHttpRequest)
		{  
			request=new XMLHttpRequest();  
		}  
	else if(window.ActiveXObject)
		{  
			request=new ActiveXObject("Microsoft.XMLHTTP");  
		}  
	try  
		{  
			request.onreadystatechange=getInfo;  
			request.open("GET",url,true);  
			request.send();  
		}  
	catch(e)  
		{  
			document.getElementById('tab').innerHTML="Unable to connect to server";  
		}  
}  
function getInfo()
	{  
		if(request.readyState==4)
		{  
			var val=request.responseText;  
			document.getElementById('tab').innerHTML=val;  
			document.getElementById("map_canvas").style.height='80%';
			document.getElementById("tab").style.visibility="visible";
		}  
	}  
</script>
</head>
<body class="panel-body" onload="sendInfo()">
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
		<form method="post" class="form-group panel-body" name="vform">
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
					<li class="active"></li>
				</ul>
				<p>
				<center>
					<input type="text" placeholder="Search Truck Type" name='Search'
						onchange="sendInfo()">
				</center>
				</p>
		</form>
	</div>
	</nav>
	<section style="width:100%">
	<div class="login-card">
		<h5 align="center" style="font-weight: bold; padding: 1%">
			Control Panel<br>Capex
		</h5>


		<div
			class="table-responsive table table-bordered table-condensed tabel-hover"
			id="tab"></div>
	</div>
	<script type="text/javascript">
			document.getElementById("dropDownId").addEventListener("load", sendInfo());
			</script> </section>
	<div class="panel-body"></div>
	<footer class="panel-footer"
		style=" bottom:2%; text-align:center; color:white;position:  relative; ">
	Copyright &copy McKinsey & Company</footer>
	</div>
</body>
</html>
<% }%>