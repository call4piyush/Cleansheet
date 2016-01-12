<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.DB.connection.Connect"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.DecimalFormatSymbols"%>
<%@page import="java.util.Locale"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
	<h5
		style="font-weight: bold; text-align: center; background-color: #96CBFF; padding: 1%">Key
		cleansheet assumptions</h5>
	<% 
					DecimalFormat df = new DecimalFormat("##,###", new DecimalFormatSymbols(Locale.US));
							try{
							String cap=(String)request.getParameter("val");
							String sql1 = "select * from truckparam t, routeparam r where t.typeofgood=r.typeofgood and t.typeofgood=?";
							 Connection con = Connect.getconnection();
							 PreparedStatement ps1=con.prepareStatement(sql1);					 		 
							 ps1.setString(1, cap);
					 		 ResultSet rs1 = ps1.executeQuery();
					               while( rs1.next())
					 		 {
			%><table class="table table-bordered table-condensed tabel-hover">
		<tr>
			<th>Diesel Cost (INR/liter):</th>
			<td><%=df.format(rs1.getInt("dieselcost")) %></td>
		</tr>
		<tr>
			<th colspan="2"
				style="text-transform: uppercase; font-style: bold; background-color: #337ab7; color: white;">CAPEX</th>
		</tr>
		<tr>
			<th>Cost of truck (INR):</th>
			<td><%=df.format(rs1.getInt("costoftruck")) %></td>
		</tr>
		<tr>
			<th>Capacity(tons):</th>
			<td><%=rs1.getInt("capacity") %></td>
		</tr>
		<tr>
			<th>Rate of interest(%):</th>
			<td><%=rs1.getFloat("rateofintrest") %></td>
		</tr>
		<tr>
			<th colspan="2"
				style="text-transform: uppercase; font-style: bold; background-color: #337ab7; color: white;">Fixed
				Cost</th>
		</tr>
		<tr>
			<th>Driver Salary (INR/month):</th>
			<td><%=df.format(rs1.getInt("driver/cleaner salary")) %></td>
		</tr>
		<tr>
			<th>Maintenance (INR/month):</th>
			<td><%=df.format(rs1.getInt("maintenancepermonth")) %></td>
		</tr>
		<tr>
			<th>Road tax (INR/year):</th>
			<td><%=df.format(rs1.getInt("roadtaxyear") )%></td>
		</tr>
		<tr>
			<th>Road permit (INR/year):</th>
			<td><%=df.format(rs1.getInt("roadpermityear") )%></td>
		</tr>
		<tr>
			<th>Admin Cost (INR/month):</th>
			<td><%=df.format(rs1.getInt("admin costs")) %></td>
		</tr>
		<tr>
			<th colspan="2"
				style="font-style: bold; background-color: #337ab7; text-transform: uppercase; color: white;">Variable
				Cost</th>
		</tr>
		<tr>
			<th>Tyre Cost(INR/tyre):</th>
			<td><%=df.format(rs1.getInt("tyrecost") )%></td>
		</tr>
		<tr>
			<th>Tyre life(km):</th>
			<td><%=df.format(rs1.getInt("tyrelife") )%></td>
		</tr>
		<tr>
			<th>Mileage with load(INR/km):</th>
			<td><%=rs1.getFloat("diesealmileagewithload") %></td>
		</tr>
		<tr>
			<th>Route Expense(INR/km):</th>
			<td><%=rs1.getFloat("routeexpenses") %></td>
		</tr>
	</table>
	<%} 
					}
				catch(Exception e){
				e.printStackTrace();
				}%>
</body>
</html>