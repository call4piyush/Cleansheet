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
<title>Upload Contract</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
</head>
<body style="width: 100%" class="panel-body">
	<%String name = request.getParameter( "name" ); %>
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
						<li><a href="DistanceFactor.jsp">Distance Factor</a></li>
						<li><a href="locations.jsp">Locations</a></li>
						<li><a href="diesel.jsp">Update Diesel Price</a></li>
					</ul></li>
				<li class="active"><a href="adminUploadFreight.jsp">Upload
						Freight</a></li>
				<li class="active" class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"
				>Contract<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="adminContract.jsp">View Contract</a></li>
						<li><a href="adminUploadContract.jsp">Upload Contract</a></li>
					</ul></li>
				<li class="active"><a href="UserSession.jsp">User Record</a></li>
				<li class="active"><a href="adminGetLat.jsp">Get Lat Long</a></li>
				<li class="active"><a href="adminHelp.jsp">Help/FAQs</a></li>
				<li class="active"></li>
			</ul>
			
		</div></nav>
		<section style="width:100%" class="panel-body">
		<center>
			<h5 style="font-weight: bold; padding: 1%">Upload Contract</h5>
			<form action="UploadContract" method="post"
				class="form-group panel-body" enctype="multipart/form-data"
			>
				<table>
					<tr>
						<td align="center">Industry Name<br>
						<br></td>
						<td><input type="text" name="nameind" required><br>
						<br></td>
						
						<br>
					</tr>
						<tr>
						<td align="center">Company Name<br>
						<br></td>
						<td><input type="text" name="namecom" required><br>
						<br></td>
						
						<br>
					</tr>
					<tr>
						<td align="center">Upload The Contract File(.pdf):<br>
						<br></td>
						<td align="center"><input type="file" name="p1" accept=".pdf"
							class="login login-submit form-control btn btn-primary active"
							style="background: white; color: black;"
						><br></td>
					</tr>
					<tr>
						<td colspan="2"><center>
								<input type="hidden" value='<%=session.getAttribute("empid")%>'
									name="empid"
								> <br> <input type="submit" name="submit"
									class="login login-submit btn btn-primary active"
									value="Upload"
								>
							</center></td>
					</tr>
				</table>
			</form>
		</center>
		<footer class="panel-footer"
			style=" bottom:2%; text-align:center; color:white;position:  relative; "
		> Copyright &copy McKinsey & Company</footer> </section>
	</div>
</body>
</html>
</body>
</html>
<%}%>