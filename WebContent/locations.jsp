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
<title>Locations</title>
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
document.getElementById('del').style.visibility = 'hidden';
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
					data-toggle="dropdown" href="#">Control Panel<span
						class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="adminCapex.jsp">Capex</a></li>
						<li><a href="adminfixed.jsp">Fixed Cost</a></li>
						<li><a href="adminvariable.jsp">Variable Cost</a></li>
						<li><a href="admintrip.jsp">Trip Matrix</a></li>
						<li><a href="DistanceFactor.jsp">Distance Factor</a></li>
						<li><a href="locations.jsp">Locations</a></li>
						<li><a href="diesel.jsp">Update Diesel Price</a></li>
					</ul></li>
				<li class="active"><a href="adminUploadFreight.jsp">Upload
						Freight</a></li>
				<li class="active" class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">Contract<span
						class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="adminContract.jsp">View Contract</a></li>
						<li><a href="adminUploadContract.jsp">Upload Contract</a></li>
					</ul></li>
				<li class="active"><a href="UserSession.jsp">User Record</a></li>
				<li class="active"><a href="adminGetLat.jsp">Get Lat Long</a></li>
				<li class="active"><a href="adminHelp.jsp">Help/FAQs</a></li>
				<li class="active"></li>
			</ul>

		</div>
		</nav>
		<section style="width:100%">
		<div class="login-card">
			<div class="table-responsive">
				<table class="table">
					<thead>
						<td align="center"><a href="add.jsp"><input type="button"
								value="Add" name="add" id="add"
								class="login login-submit btn btn-primary active"></a></td>
						<td align="center"><input type="button" value="Refresh"
							name="refresh" id="refresh"
							class="login login-submit btn btn-primary active"
							onclick="myFunction()"></td>
						</tr>
					</thead>
				</table>
			</div>
			<h5 align="center" style="font-weight: bold; padding: 1%">
				Control Panel<br>Locations
			</h5>
			<div class="table-responsive">
				<table class="table table-hover table-condensed">
					<thead>
						<tr>
							<th>Vehicle Type</th>
							<th>Backhaul Locations</th>
							<th>Capacity(tons)</th>
							<th>Priority</th>
							<th>Volume Rating</th>
						</tr>
					</thead>
					<%
		int empid=(int)session.getAttribute("empid");
		 String sql = "select * from `autoparam`  order by `capacity`";
			 
				try{ 
							 Connection con = Connect.getconnection();
							 PreparedStatement ps=con.prepareStatement(sql);					 		 
					 		 ResultSet rs = ps.executeQuery();
					               while( rs.next() )
					 		 {
							 	%>
					<tbody>
						<tr>
							<td><input type="text" readonly="readonly"
								value='<%=rs.getString("typeofgood")%>'></td>
							<td><input type="text" readonly="readonly"
								value='<%=rs.getString("Origin")%>'></td>
							<td><input type="text" readonly="readonly"
								value='<%=rs.getInt("capacity")%>'></td>
							<td><input type="text" readonly="readonly"
								value='<%=rs.getInt("Pirority")%>'></td>
							<td><input type="text" readonly="readonly"
								value='<%=rs.getInt("Volume Rating")%>'></td>
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
<% }%>