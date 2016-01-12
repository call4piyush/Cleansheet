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
<META HTTP-EQUIV="refresh" CONTENT="180">
<title>ADVANCED</title>
<script type="text/javascript"
	src="http://maps.google.com/maps/api/js?sensor=false"></script>
<script language="javascript" type="text/javascript"
	src="js/AdvancedMap.js"></script>
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
document.getElementById("map_canvas").style.height='82%';
document.getElementById("tab").style.visibility="visible";
}  
}  
  
</script>
</head>
<body onload="initialize()" class="panel-body">
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
		<section>
		<div id="map_canvas" class="right panel-body embed-responsive-item"
			style="height: 18%"></div>
		<div class="login-card">
			<center>
				<h5 class="panel-header" style="font-weight: bold; padding: 1%">Advanced</h5>
			</center>
			<form action="Advanced" method="post" class="form-group, panel-body"
				name="vform">
				<table align="center">
					<tr>
						<td rowspan="4"><input type="text" name="headstart"
							id="start" placeholder="Headhaul Origin" required size="30"
							class="form-control"></td>
					</tr>
					<tr>
						<td rowspan="3"><input type="text" id="mid"
							onblur="calcRoute()" name="backstart" placeholder="Destination"
							class="form-control" required size="30"></td>
					</tr>
					<tr>
						<td rowspan="2"><input type="text" name="end" id="end"
							onchange="calcRoute()" placeholder="Backhaul Origin" required
							class="form-control" size="30"></td>
					</tr>
					<tr>
						<td><select name='Capacity' class="form-control"
							onchange="sendInfo()" id="dropDownId">
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
									name='typeofgood' class="form-control"><%=rs.getString("typeofgood") %></option>
								<%
					 		}
			
					            	
				}
				catch(Exception e){
					e.printStackTrace();
					RequestDispatcher ReqDis = request.getRequestDispatcher("Adminerror.jsp");
				ReqDis.forward(request, response);
				}
		%>
						</select></td>
					</tr>
					<tr>
						<center>
							<input type="hidden" name="distance" id="distance"> <input
								type="hidden" name="distance1" id="distance1">
							<input type="hidden" value='<%=session.getAttribute("empid")%>'
								name="empid">
							<td colspan="3"></td>
							<td colspan="2"><center>
									<input type="submit" name="submit"
										class="login login-submit btn btn-primary active"
										value="Submit" disabled="true" id="mySubmit">
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
			id="tab" style="visibility: hidden;"></div>
		</section>
		<div class="panel-body"></div>
		<footer class="panel-footer"
			style=" bottom:2%; text-align:center; color:white;position:  relative; ">
		Copyright &copy McKinsey & Company</footer>
	</div>
	</div>
</body>
</html>
<%}%>