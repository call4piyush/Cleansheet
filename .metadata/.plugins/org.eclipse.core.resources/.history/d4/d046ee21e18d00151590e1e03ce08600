<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.DB.connection.Connect"%>
<%  	 
		if(request.getSession().getAttribute("empid")==null)
        {      request.getRequestDispatcher("index.jsp").forward(request, response);   
           }else{
           int i=0;
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Trip Matrix</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
function clickadd()
{
document.getElementById('add').style.visibility = 'hidden';
document.getElementById('del').style.visibility = 'hidden';
document.getElementById('modify').style.visibility = 'hidden';
document.getElementById('refresh').style.visibility = 'hidden';
document.getElementById('1').style.visibility = 'visible';
document.getElementById('2').style.visibility = 'visible';
}


function myFunction() {
    location.reload();
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
					data-toggle="dropdown" href="#"
				>Control Panel<span class="caret"></span></a>
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
			<h2 align="center">Trip Matrix</h2>
			<form action="slab.jsp" method="post">
				<div class="table-responsive">
					<table class="table table-hover table-condensed">
						<thead>
							<tr>
								<th>Slab No.</th>
								<th>Minimum Distance</th>
								<th>Maximum Distance</th>
								<th>Number of Trips</th>
								<th>Minimum Monthly Distance</th>
								<th>Maximum Monthly Distance</th>
								<th>Minimum Daily Distance</th>
								<th>Maximum Daily Distance</th>
								<th>Average Distance</th>
							</tr>
						</thead>
						<%
		 String sql = "select * from slabtable order by `Max Distance`";
			 
				try{ 
							 Connection con = Connect.getconnection();
							 PreparedStatement ps=con.prepareStatement(sql);					 		 
					 		 ResultSet rs = ps.executeQuery();
					               while( rs.next() )
					 		 {
							 	%>
						<tbody>
							<tr>
								<td align="justify"><input type="text"
									value='<%= rs.getString("Slab") %>' readonly
								></td>
								<td align="justify"><input type="text"
									value='<%= rs.getInt("Min Distance") %>' readonly
								></td>
								<td align="justify"><input type="text"
									value='<%= rs.getInt("Max Distance") %>' readonly
								></td>
								<td align="justify"><input type="text"
									value='<%= rs.getFloat("NoofTrip") %>' readonly
								></td>
								<td align="justify"><input type="text"
									value='<%= rs.getInt("Min Monthly Distance") %>' readonly
								></td>
								<td align="justify"><input type="text"
									value='<%= rs.getInt("Max Monthly Distance") %>' readonly
								></td>
								<td align="justify"><input type="text"
									value='<%= rs.getInt("Min Daily Distance") %>' readonly
								></td>
								<td align="justify"><input type="text"
									value='<%= rs.getInt("Max Daily Distance") %>' readonly
								></td>
								<td align="justify"><input type="text"
									value='<%= rs.getFloat("Average") %>' readonly
								></td>
							</tr>
						</tbody>
						<%
					 		i++;}
			
					            	
				}
				catch(Exception e){
					e.printStackTrace();
					RequestDispatcher ReqDis = request.getRequestDispatcher("Adminerror.jsp");
				ReqDis.forward(request, response);
				}
		%>
						</tr>
						<tbody>
							<tr style="visibility: hidden;" id="1">
								<td align="justify"><input type="text" name="slab" required></td>
								<td align="justify"><input type="text" name="min" required></td>
								<td align="justify"><input type="text" name="max" required></td>
								<td align="justify"><input type="text" name="nooftrip"
									required
								></td>
								<td align="justify"><input type="text" name="minmonth"
									required
								></td>
								<td align="justify"><input type="text" name="maxmonth"
									required
								></td>
								<td align="justify"><input type="text" name="mindaily"
									required
								></td>
								<td align="justify"><input type="text" name="maxdaily"
									required
								></td>
								<td align="justify"><input type="text" name="average"
									required
								></td>
							</tr>
							<tr style="visibility: hidden;" id="2">
								<td colspan="4"></td>
								<td><center>
										<input type="hidden"
											value='<%=session.getAttribute("empid")%>' name="empid"
										> <input type="submit" name="submit" value="Submit"
											class="login login-submit btn btn-primary active"
										>
									</center></td>
								<td><center>
										<input type="button" onclick="myFunction()" value="Cancel"
											class="login login-submit btn btn-primary active"
										>
									</center></td>
								<td colspan="4">
							</tr>
							</form>
					</table>
				</div>
				<div class="table-responsive">
					<table class="table">
						<tr>
						<thead>
							<td align="center"><input type="button" value="Add Slab"
								name="add" id="add"
								class="login login-submit btn btn-primary active"
								onclick="clickadd()"
							></td>
							<td align="center"></td>
							<td align="center"></td>
							<td align="center"><input type="button" value="Refresh"
								name="refresh" id="refresh"
								class="login login-submit btn btn-primary active"
							></td>
							</tr>
						</thead>
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
<% }%>