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
<title>Trip Matrix</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
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
		<section style="width:100%">
		<div class="login-card">
			<h5 align="center" style="font-weight: bold; padding: 1%">
				Control Panel<br>Trip Matrix
			</h5>
			<form action="modifytrip_2.jsp" method="post">
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
					 		 int j=0;
					 		
        						
      					 		 while( rs.next() )
					 		 { 
					            
							 	%>
						<tbody>
							<tr>
								<td align="justify"><input type="text" name="slab<%=j %>"
									value='<%= rs.getString("Slab") %>' readonly
								></td>
								<td align="justify"><input type="text" name="mindistance<%=j %>"
									value='<%= rs.getInt("Min Distance") %>' required
								></td>
								<td align="justify"><input type="text" name="maxdistance<%=j %>"
									value='<%= rs.getInt("Max Distance") %>' required
								></td>
								<td align="justify"><input type="text" name="notrip<%=j %>"
									value='<%= rs.getFloat("NoofTrip") %>' required
								></td>
								<td align="justify"><input type="text" name="minmonthly<%=j %>"
									value='<%= rs.getInt("Min Monthly Distance") %>' required
								></td>
								<td align="justify"><input type="text" name="maxmothly<%=j %>"
									value='<%= rs.getInt("Max Monthly Distance") %>' required
								></td>
								<td align="justify"><input type="text" name="mindaily<%=j %>"
									value='<%= rs.getInt("Min Daily Distance") %>' required
								></td>
								<td align="justify"><input type="text" name="maxdaily<%=j %>"
									value='<%= rs.getInt("Max Daily Distance") %>' required
								></td>
								<td align="justify"><input type="text" name="avg<%=j %>"
									value='<%= rs.getFloat("Average") %>' required
								></td>
							</tr>
						</tbody>
						<%j++;
					 		}
					 		
					 		%><input type="hidden" value='<%=j %>' name="no">
					 		
						<% 
			
					            	
				}
				catch(Exception e){
					e.printStackTrace();
					RequestDispatcher ReqDis = request.getRequestDispatcher("Adminerror.jsp");
				ReqDis.forward(request, response);
				}
		%>
						</tr>
						<tr>
							<td colspan="4"></td>
							<td><center>
									<input type="hidden" value='<%=session.getAttribute("empid")%>'
										name="empid"
									> <input type="submit" name="submit" value="Submit"
										class="login login-submit btn btn-primary active"
									>
								</center></td>
							<td><center>
									<a href="adminCapex.jsp"><input type="button"
										onclick="myFunction()" value="Cancel"
										class="login login-submit btn btn-primary active"
									></a>
								</center></td>
							<td colspan="3">
						</tr>
						</form>
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