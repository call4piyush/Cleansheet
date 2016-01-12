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
					DecimalFormat df = new DecimalFormat("##,###", new DecimalFormatSymbols(Locale.US));
							try{
							String cap=(String)request.getParameter("val");
							if(cap.isEmpty())
							{
							String sql = "select * from  mckc.truckparam t, mckc.routeparam r where r.typeofgood=t.typeofgood GROUP BY t.typeofgood,r.typeofgood HAVING COUNT(*) > 0  order by t.typeofgood";
			 
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
					value='<%=rs.getInt("r.driver/cleaner salary")%>'></td>
				<td><input type="text" readonly="readonly"
					value='<%=rs.getInt("r.driver/cleaner bhatta")%>'></td>
				<td><input type="text" readonly="readonly"
					value='<%=rs.getInt("r.maintenancepermonth")%>'></td>
				<td><input type="text" readonly="readonly"
					value='<%=rs.getInt("roadtaxyear")%>'></td>
				<td><input type="text" readonly="readonly"
					value='<%=rs.getInt("roadpermityear")%>'></td>
				<td><input type="text" readonly="readonly"
					value='<%=rs.getFloat("insuranceaspercentageofvechiclecost")%>'></td>
				<td><input type="text" readonly="readonly"
					value='<%=rs.getInt("admin costs")%>'></td>
				<td><input type="text" readonly="readonly"
					value='<%=rs.getInt("tarpaulin")%>'></td>
				<td><input type="text" readonly="readonly"
					value='<%=rs.getInt("profitmargin")%>'></td>
				<td><input type="text" readonly="readonly"
					value='<%=rs.getInt("loadingcharges")%>'></td>
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
							 String sql1 = "select * from  mckc.truckparam t, mckc.routeparam r where r.typeofgood=t.typeofgood and t.typeofgood LIKE '%"+cap+"%' GROUP BY t.typeofgood,r.typeofgood HAVING COUNT(*) > 0";
							 Connection con = Connect.getconnection();
							 PreparedStatement ps1=con.prepareStatement(sql1);					 		 
							 //ps1.setString(1, cap);
					 		 ResultSet rs1 = ps1.executeQuery();
					               while( rs1.next())
					 		 {
			%><tbody>
			<tr>
				<td><input type="text" readonly="readonly"
					value='<%=rs1.getString("typeofgood")%>'></td>
				<td><input type="text" readonly="readonly"
					value='<%=rs1.getInt("r.driver/cleaner salary")%>'></td>
				<td><input type="text" readonly="readonly"
					value='<%=rs1.getInt("r.driver/cleaner bhatta")%>'></td>
				<td><input type="text" readonly="readonly"
					value='<%=rs1.getInt("r.maintenancepermonth")%>'></td>
				<td><input type="text" readonly="readonly"
					value='<%=rs1.getInt("roadtaxyear")%>'></td>
				<td><input type="text" readonly="readonly"
					value='<%=rs1.getInt("roadpermityear")%>'></td>
				<td><input type="text" readonly="readonly"
					value='<%=rs1.getFloat("insuranceaspercentageofvechiclecost")%>'></td>
				<td><input type="text" readonly="readonly"
					value='<%=rs1.getInt("admin costs")%>'></td>
				<td><input type="text" readonly="readonly"
					value='<%=rs1.getInt("tarpaulin")%>'></td>
				<td><input type="text" readonly="readonly"
					value='<%=rs1.getInt("profitmargin")%>'></td>
				<td><input type="text" readonly="readonly"
					value='<%=rs1.getInt("loadingcharges")%>'></td>
			</tr>
		</tbody>

		<%}}
					}
				catch(Exception e){
				e.printStackTrace();
				}%>
	</table>
</body>
</html>