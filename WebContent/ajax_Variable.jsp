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
							<th>Truck Type</th>
							<th>Tyre life (Km)</th>
							<th>Tyre life (Retredded tyre) (Km)</th>
							<th>Tyre Cost (INR)</th>
							<th>Tyre Cost (Retredded tyre) (INR)</th>
							<th>No. of tyres</th>
							<th>Diesel Cost</th>
							<th>Diesel Milage Km/L</th>
							<th>Diesel Mileage (With Load) Km/L</th>
							<th>Toll per km</th>
							<th>Route expenses per km</th>
							<th>Maintanence cost per km</th>
						</tr>
					</thead><% 
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
						<td><input type="text" readonly="readonly"
							value='<%=rs.getString("typeofgood")%>'
						></td>
						<td><input type="text" readonly="readonly"
							value='<%=rs.getInt("tyrelife")%>'
						></td>
						<td><input type="text" readonly="readonly"
							value='<%=rs.getInt("reusedtyrelife")%>'
						></td>
						<td><input type="text" readonly="readonly"
							value='<%=rs.getInt("tyrecost")%>'
						></td>
						<td><input type="text" readonly="readonly"
							value='<%=rs.getInt("reusedtyrecost")%>'
						></td>
						<td><input type="text" readonly="readonly"
							value='<%=rs.getInt("tyres")%>'
						></td>
						<td><input type="text" readonly="readonly"
							value='<%=rs.getFloat("dieselcost")%>'
						></td>
						<td><input type="text" readonly="readonly"
							value='<%=rs.getFloat("dieselmileage")%>'
						></td>
						<td><input type="text" readonly="readonly"
							value='<%=rs.getFloat("diesealmileagewithload")%>'
						></td>
						<td><input type="text" readonly="readonly"
							value='<%=rs.getFloat("toll")%>'
						></td>
						<td><input type="text" readonly="readonly"
							value='<%=rs.getFloat("routeexpenses")%>'
						></td>
						<td><input type="text" readonly="readonly"
							value='<%=rs.getFloat("maintenancecostperkm")%>'
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
							 String sql1 = "select * from  mckc.truckparam t, mckc.routeparam r where r.typeofgood=t.typeofgood and t.typeofgood LIKE '%"+cap+"%' GROUP BY t.typeofgood,r.typeofgood HAVING COUNT(*) > 0";
							 Connection con = Connect.getconnection();
							 PreparedStatement ps1=con.prepareStatement(sql1);					 		 
							 //ps1.setString(1, cap);
					 		 ResultSet rs1 = ps1.executeQuery();
					               while( rs1.next())
					 		 {
			%><tbody>
						<td><input type="text" readonly="readonly"
							value='<%=rs1.getString("typeofgood")%>'
						></td>
						<td><input type="text" readonly="readonly"
							value='<%=rs1.getInt("tyrelife")%>'
						></td>
						<td><input type="text" readonly="readonly"
							value='<%=rs1.getInt("reusedtyrelife")%>'
						></td>
						<td><input type="text" readonly="readonly"
							value='<%=rs1.getInt("tyrecost")%>'
						></td>
						<td><input type="text" readonly="readonly"
							value='<%=rs1.getInt("reusedtyrecost")%>'
						></td>
						<td><input type="text" readonly="readonly"
							value='<%=rs1.getInt("tyres")%>'
						></td>
						<td><input type="text" readonly="readonly"
							value='<%=rs1.getFloat("dieselcost")%>'
						></td>
						<td><input type="text" readonly="readonly"
							value='<%=rs1.getFloat("dieselmileage")%>'
						></td>
						<td><input type="text" readonly="readonly"
							value='<%=rs1.getFloat("diesealmileagewithload")%>'
						></td>
						<td><input type="text" readonly="readonly"
							value='<%=rs1.getFloat("toll")%>'
						></td>
						<td><input type="text" readonly="readonly"
							value='<%=rs1.getFloat("routeexpenses")%>'
						></td>
						<td><input type="text" readonly="readonly"
							value='<%=rs1.getFloat("maintenancecostperkm")%>'
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