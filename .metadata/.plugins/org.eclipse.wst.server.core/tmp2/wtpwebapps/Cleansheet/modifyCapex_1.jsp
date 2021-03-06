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
<title>Capex</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
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
					data-toggle="dropdown" href="#">Control Panel<span
						class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="adminCapex.jsp">Capex</a></li>
						<li><a href="adminfixed.jsp">Fixed Cost</a></li>
						<li><a href="adminvariable.jsp">Variable Cost</a></li>
						<li><a href="admintrip.jsp">Trip Matrix</a></li>
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
			<form action="modifyCapex_2.jsp" method="post" class="form-group">
				<h2 align="center">Capex</h2>
				<div class="table-responsive">
					<table class="table table-hover table-condensed">
						<thead>
							<tr>
								<th>Vehicle Type</th>
								<th>Capacity(tons)</th>
								<th>Cost of Truck (INR)</th>
								<th>Residual value of the truck at end of EMI (%)</th>
								<th>Loan amount(%)</th>
								<th>No. of years of EMI payment</th>
								<th>Rate of Interest (%)</th>
								<th>Flat Rate of Interest (%)</th>
							</tr>
						</thead>
						<%
		int empid=(int)session.getAttribute("empid");
		 String sql = "select * from `truckparam`  order by `capacity`";
			 
				try{ 
							 Connection con = Connect.getconnection();
							 PreparedStatement ps=con.prepareStatement(sql);					 		 
					 		 ResultSet rs = ps.executeQuery();
					 		 String[] selected;
					 		 selected=request.getParameterValues("check");
					 		 int j=0;
					 		
        						
      					 		 while( rs.next() )
					 		 { for (int i = 0; i < selected.length; i++) 
     						 { 
      					 		 if(Integer.parseInt(selected[i]) == j)
					          {
					            
							 	%>
						<tbody>
							<tr>
								<td><input type="text" name='type_'
									value='<%=rs.getString("typeofgood")%>' required></td>
								<td><input type="text" name='cap_'
									value='<%=rs.getInt("capacity")%>' required></td>
								<td><input type="text" name='cost_'
									value='<%=rs.getInt("costoftruck")%>' required></td>
								<td><input type="text" name='residual_'
									value='<%=rs.getFloat("residualvalueoftruck")*100%>' required></td>
								<td><input type="text" name='loan_'
									value='<%=rs.getFloat("loanpercentage")%>' required></td>
								<td><input type="text" name='years_'
									value='<%=rs.getInt("yearsemi")%>' required></td>
								<td><input type="text" name='roi_'
									value='<%=rs.getFloat("rateofintrest")%>' required></td>
								<td><input type="text" name='flatroi_'
									value='<%=rs.getFloat("flatroi")%>' required></td>
							</tr>
						</tbody>
						<%
					 		}
					 		}j++;
					 		
					 		}%><input type="hidden" value='<%=j %>' name="no">
						<% 
			
					            	
				}
				catch(Exception e){
					e.printStackTrace();
					RequestDispatcher ReqDis = request.getRequestDispatcher("Adminerror.jsp");
				ReqDis.forward(request, response);
				}
		%>
						<tr>
							<td colspan="3"></td>
							<td><center>
									<input type="hidden" value='<%=session.getAttribute("empid")%>'
										name="empid"> <input type="submit"
										name="submit" value="Submit"
										class="login login-submit btn btn-primary active">
								</center></td>
							<td><center>
									<a href="adminCapex.jsp"><input type="button"
										onclick="myFunction()" value="Cancel"
										class="login login-submit btn btn-primary active"></a>
								</center></td>
							<td colspan="3">
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
<% }%>