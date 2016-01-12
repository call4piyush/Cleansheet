<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.DB.connection.Connect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<% 	if(request.getSession().getAttribute("empid")==null)
        {      request.getRequestDispatcher("index.jsp").forward(request, response);   
           }else{
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Fixed Cost</title>
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
			<h5 align="center" style="font-weight: bold; padding: 1%">
				Control Panel<br>Fixed Cost
			</h5>
			<form action="modifyfixed_2.jsp" method="post" class="form-group">
				<div class="table-responsive">
					<table class="table table-hover table-condensed">
						<thead>
							<tr>
								<th>Truck Type</th>
								<th>Driver/Cleaner monthly salary</th>
								<th>Driver/Cleaner monthly bhatta</th>
								<th>Maintenace (per month)</th>
								<th>Road tax per year (including fitness)</th>
								<th>Road permit per year</th>
								<th>Insurance as percentage of vehicle cost (% p.a.)</th>
								<th>Admin Costs</th>
								<th>Tarpaulin</th>
								<th>Profit Margin(%)</th>
								<th>Loading Charges</th>
							</tr>
						</thead>
						<%
			int empid=(int)session.getAttribute("empid");
			
		 	String sql = "select * from  mckc.truckparam t, mckc.routeparam r where r.typeofgood=t.typeofgood GROUP BY t.typeofgood,r.typeofgood HAVING COUNT(*) > 0  order by t.typeofgood";
			 
				try{ 
							Connection con = Connect.getconnection();
							PreparedStatement ps=con.prepareStatement(sql);					 		 
					 		ResultSet rs = ps.executeQuery();
					 		int j=0;
					 		      						
      					 		 while( rs.next() )
					 		 {
							 	%><tbody>
							<tr>
								<td><input type="text"
									value='<%=rs.getString("typeofgood")%>' name="type<%=j %>"></td>
								<td><input type="text"
									value='<%=rs.getInt("driver/cleaner salary")%>'
									name="salary<%=j %>"></td>
								<td><input type="text"
									value='<%=rs.getInt("driver/cleaner bhatta")%>'
									name="bhatta<%=j %>"></td>
								<td><input type="text"
									value='<%=rs.getInt("maintenancepermonth")%>'
									name="month<%=j %>"></td>
								<td><input type="text"
									value='<%=rs.getInt("roadtaxyear")%>' name="roadtax<%=j %>"></td>
								<td><input type="text"
									value='<%=rs.getInt("roadpermityear")%>'
									name="roadpermit<%=j %>"></td>
								<td><input type="text"
									value='<%=rs.getFloat("insuranceaspercentageofvechiclecost")%>'
									name="insurance<%=j %>"></td>
								<td><input type="text"
									value='<%=rs.getInt("admin costs")%>' name="admin<%=j %>"></td>
								<td><input type="text" value='<%=rs.getInt("tarpaulin")%>'
									name="tarpaulin<%=j %>"></td>
								<td><input type="text"
									value='<%=rs.getInt("profitmargin")%>' name="profit<%=j %>"></td>
								<td><input type="text"
									value='<%=rs.getInt("loadingcharges")%>' name="loading<%=j %>"></td>
							</tr>
						</tbody>
						<%
					 		j++;
					 		
					 		}%><input type="hidden" value='<%=j %>' name="no">
						<% 
			
					            	
					            	
				}
				catch(Exception e){
					e.printStackTrace();
					RequestDispatcher ReqDis = request.getRequestDispatcher("Adminerror.jsp");
				ReqDis.forward(request, response);
				}
		%>
					</table>
				</div>
				<div class="table-responsive">
					<table class="table">
						<tr id="2" style="visibility: visible;">
							<td></td>
							<td><center>
									<input type="hidden" value='<%=session.getAttribute("empid")%>'
										name="empid"> <input type="submit"
										name="submit" value="Submit"
										class="login login-submit btn btn-primary active">
								</center></td>
							<td><center>
									<a href="adminfixed.jsp"><input type="button"
										value="Cancel"
										class="login login-submit btn btn-primary active"></a>
								</center></td>
							<td></td>
						</tr>
						</form>
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
<%}%>