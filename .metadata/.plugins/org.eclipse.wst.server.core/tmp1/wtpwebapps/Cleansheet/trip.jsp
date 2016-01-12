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
				<li class="active"><a href="uploadContract.jsp">Upload
						Contract</a></li>
			</ul>
		</div>
		</nav>
		<section style="width:100%">
		<div class="login-card">
			<h2 align="center">Control Panel</h2>
			<h2 align="center">Trip Matrix</h2>
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
								value='<%= rs.getString("Slab") %>' readonly></td>
							<td align="justify"><input type="text"
								value='<%= rs.getInt("Min Distance") %>' readonly></td>
							<td align="justify"><input type="text"
								value='<%= rs.getInt("Max Distance") %>' readonly></td>
							<td align="justify"><input type="text"
								value='<%= rs.getFloat("NoofTrip") %>' readonly></td>
							<td align="justify"><input type="text"
								value='<%= rs.getInt("Min Monthly Distance") %>' readonly></td>
							<td align="justify"><input type="text"
								value='<%= rs.getInt("Max Monthly Distance") %>' readonly></td>
							<td align="justify"><input type="text"
								value='<%= rs.getInt("Min Daily Distance") %>' readonly></td>
							<td align="justify"><input type="text"
								value='<%= rs.getInt("Max Daily Distance") %>' readonly></td>
							<td align="justify"><input type="text"
								value='<%= rs.getFloat("Average") %>' readonly></td>
						</tr>
					</tbody>
					<%
					 		i++;}
			
					            	
				}
				catch(Exception e){
					e.printStackTrace();
					RequestDispatcher ReqDis = request.getRequestDispatcher("error.jsp");
				ReqDis.forward(request, response);
				}
		%>
					</tr>
					<script type="text/javascript">
		function clickdel(){
			document.getElementById('add').style.visibility = 'hidden';
			document.getElementById('del').style.visibility = 'hidden';
			document.getElementById('modify').style.visibility = 'hidden';
			document.getElementById('refresh').style.visibility = 'hidden';
			document.getElementById('serial').style.visibility = 'visible';
			document.getElementById('2').style.visibility = 'visible';
			for (i = 0; i <<%=i%>; i++)
			{
				document.getElementById('check'+i).style.visibility = 'visible';
			}
		}
		</script>
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