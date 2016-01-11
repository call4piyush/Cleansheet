<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.DB.connection.Connect"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.DecimalFormatSymbols"%>
<%@page import="java.util.Locale"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
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
					DecimalFormat df = new DecimalFormat("##,###", new DecimalFormatSymbols(Locale.US));
							try{
							String cap=(String)request.getParameter("val");
							if(cap.isEmpty())
							{
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
					 		}
			
					            	
				}
				catch(Exception e){
					e.printStackTrace();
					RequestDispatcher ReqDis = request.getRequestDispatcher("error.jsp");
				ReqDis.forward(request, response);
				}
				}
				else{
							 String sql1 = "select * from slabtable where Slab LIKE '%"+cap+"%'";
							 Connection con = Connect.getconnection();
							 PreparedStatement ps1=con.prepareStatement(sql1);					 		 
							 //ps1.setString(1, cap);
					 		 ResultSet rs1 = ps1.executeQuery();
					               while( rs1.next())
					 		 {
			%><tbody>
						<tr>
							<td align="justify"><input type="text"
								value='<%= rs1.getString("Slab") %>' readonly
							></td>
							<td align="justify"><input type="text"
								value='<%= rs1.getInt("Min Distance") %>' readonly
							></td>
							<td align="justify"><input type="text"
								value='<%= rs1.getInt("Max Distance") %>' readonly
							></td>
							<td align="justify"><input type="text"
								value='<%= rs1.getFloat("NoofTrip") %>' readonly
							></td>
							<td align="justify"><input type="text"
								value='<%= rs1.getInt("Min Monthly Distance") %>' readonly
							></td>
							<td align="justify"><input type="text"
								value='<%= rs1.getInt("Max Monthly Distance") %>' readonly
							></td>
							<td align="justify"><input type="text"
								value='<%= rs1.getInt("Min Daily Distance") %>' readonly
							></td>
							<td align="justify"><input type="text"
								value='<%= rs1.getInt("Max Daily Distance") %>' readonly
							></td>
							<td align="justify"><input type="text"
								value='<%= rs1.getFloat("Average") %>' readonly
							></td>
						</tr>
					</tbody>
	
	<%}}
					}
				catch(Exception e){
				e.printStackTrace();
				}%></table>
</body>
</html>