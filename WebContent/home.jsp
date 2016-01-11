<%@page import="java.sql.Connection"
	info='&lt;%@page import="java.sql.Connection"%&gt;'
%>
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
<title>Classic</title>
<script type="text/javascript"
	src="http://maps.google.com/maps/api/js?sensor=false"
></script>
<script language="javascript" type="text/javascript" src="js/Map.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script>  
var request;  
function sendInfo()  
{  
var v=document.vform.Capacity.value;  
var url="ajax.jsp?val="+v;  
  
if(window.XMLHttpRequest){  
request=new XMLHttpRequest();  
}  
else if(window.ActiveXObject){  
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
  
function getInfo(){  
if(request.readyState==4){  
var val=request.responseText;  
document.getElementById('tab').innerHTML=val;  
document.getElementById("map_canvas").style.height='83%';
document.getElementById("tab").style.visibility="visible";
}  
}  
  
</script>
</head>
<body onload="initialize()" class="panel-body">
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
				<li class="active"><a href="uploadContract.jsp">View
						Contract</a></li>
				<li class="active"><a href="GetLat.jsp">Get Lat Long</a></li>
				<li class="active"><a href="Help.jsp">Help/FAQs</a></li>
			</ul>
		</div>
		</nav>
		<section>
		<div id="map_canvas" class="right panel-body embed-responsive-item"
			style="height: 19%"
		></div>
		<div class="login-card">
			<center>
				<h5 class="panel-header" style="font-weight: bold; padding: 1%">Classic</h5>
			</center>
			<form method="Post" action="Basic" class="form-group panel-body"
				name="vform"
			>
				<table align="center">
					<tr>
						<td><input type="text" name="start" id="start"
							class="form-control" placeholder="Origin" onchange="calcRoute()"
							required
						></td>
						<td><input type="text" name="end" id="end"
							class="form-control" placeholder="Destination"
							onchange="calcRoute()" required
						></td>
						<td><input type="text" name="back" id="back"
							placeholder="Backhaul %" maxlength="3" required
							class="form-control"
						></td>
						<td><select name='Capacity' class="form-control"
							onchange="sendInfo()" id="dropDownId"
						>
								<%
							int empid=(int)session.getAttribute("empid");
							 String sql = "select typeofgood,capacity from truckparam order by capacity";
			 
							try{ 
							 Connection con = Connect.getconnection();
							 PreparedStatement ps=con.prepareStatement(sql);					 		 
					 		 ResultSet rs = ps.executeQuery();
					               while( rs.next() )
					 		 {
							 	%>
								<option value='<%=rs.getString("typeofgood") %>'
									name='typeofgood' class="form-control"
								><%=rs.getString("typeofgood") %></option>
								<%
					 		}
			
					            	
				}
				catch(Exception e){
					e.printStackTrace();
					RequestDispatcher ReqDis = request.getRequestDispatcher("error.jsp");
				ReqDis.forward(request, response);
				}
		%>
						</select></td>
					</tr>
					<tr>
						<td colspan="3"><input type="hidden" name="distance"
							id="distance"
						> <input type="hidden"
							value='<%=session.getAttribute("empid")%>' name="empid"
						></td>
						<td><center>
								<input type="submit" name="submit"
									class="login login-submit btn btn-primary active"
									value="Submit" disabled="true" id="mySubmit"
								>
							</center></td>
					</tr>
				</table>
			</form>
			<script type="text/javascript">
			document.getElementById("dropDownId").addEventListener("load", initialize());
			document.getElementById("dropDownId").addEventListener("load", sendInfo());
			</script>
			<label id="1234"></label>
		</div>
		<div
			class="login-card table-responsive table table-bordered table-condensed tabel-hover"
			id="tab" style="visibility: hidden;"
		></div>
		</section>
		<div class="panel-body"></div>
		<footer class="panel-footer"
			style=" bottom:2%; text-align:center; color:white;position:  relative; "
		> Copyright &copy McKinsey & Company</footer>
	</div>
</body>
</html>
<%}%>