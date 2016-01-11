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
					DecimalFormat df = new DecimalFormat("##,###", new DecimalFormatSymbols(Locale.US));
							try{
							String cap=(String)request.getParameter("val");
							if(cap.isEmpty())
							{
							String sql = "select * from `truckparam` order by `typeofgood`";
			 
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
							value='<%=rs.getString("typeofgood")%>'
						></td>
						<td><input type="text" readonly="readonly"
							value='<%=rs.getInt("capacity")%>'
						></td>
						<td><input type="text" readonly="readonly"
							value='<%=rs.getInt("costoftruck")%>'
						></td>
						<td><input type="text" readonly="readonly"
							value='<%=rs.getFloat("residualvalueoftruck")%>'
						></td>
						<td><input type="text" readonly="readonly"
							value='<%=rs.getFloat("loanpercentage")%>'
						></td>
						<td><input type="text" readonly="readonly"
							value='<%=rs.getInt("yearsemi")%>'
						></td>
						<td><input type="text" readonly="readonly"
							value='<%=rs.getFloat("rateofintrest")%>'
						></td>
						<td><input type="text" readonly="readonly"
							value='<%=rs.getFloat("flatroi")%>'
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
							 String sql1 = "select * from `truckparam` where typeofgood LIKE '%"+cap+"%'";
							 Connection con = Connect.getconnection();
							 PreparedStatement ps1=con.prepareStatement(sql1);					 		 
							 //ps1.setString(1, cap);
					 		 ResultSet rs1 = ps1.executeQuery();
					               while( rs1.next())
					 		 {
			%><tbody>
		<tr>
			<td><input type="text" readonly="readonly"
							value='<%=rs1.getString("typeofgood")%>'
						></td>
						<td><input type="text" readonly="readonly"
							value='<%=rs1.getInt("capacity")%>'
						></td>
						<td><input type="text" readonly="readonly"
							value='<%=rs1.getInt("costoftruck")%>'
						></td>
						<td><input type="text" readonly="readonly"
							value='<%=rs1.getFloat("residualvalueoftruck")*100%>'
						></td>
						<td><input type="text" readonly="readonly"
							value='<%=rs1.getFloat("loanpercentage")%>'
						></td>
						<td><input type="text" readonly="readonly"
							value='<%=rs1.getInt("yearsemi")%>'
						></td>
						<td><input type="text" readonly="readonly"
							value='<%=rs1.getFloat("rateofintrest")%>'
						></td>
						<td><input type="text" readonly="readonly"
							value='<%=rs1.getFloat("flatroi")%>'
						></td>
		</tr></tbody>
	
	<%}}
					}
				catch(Exception e){
				e.printStackTrace();
				}%></table>
</body>
</html>