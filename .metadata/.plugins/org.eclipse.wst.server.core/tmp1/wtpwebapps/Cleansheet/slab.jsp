<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.DB.connection.Connect"%>
<%
				String slab=request.getParameter("slab");
				int min=Integer.parseInt(request.getParameter("min"));
				int max=Integer.parseInt(request.getParameter("max"));
				float nooftrip=Float.parseFloat(request.getParameter("nooftrip"));
				int minmonth=Integer.parseInt(request.getParameter("minmonth"));
				int maxmonth=Integer.parseInt(request.getParameter("maxmonth"));
				int mindaily=Integer.parseInt(request.getParameter("mindaily"));
				int maxdaily=Integer.parseInt(request.getParameter("maxdaily"));
				Float average=Float.parseFloat(request.getParameter("average"));
				
				String sql="INSERT INTO slabtable (`Slab`, `Min Distance`, `Max Distance`, `NoofTrip`, `Min Monthly Distance`, `Max Monthly Distance`, `Min Daily Distance`, `Max Daily Distance`, `Average`)VALUES(?,?,?,?,?,?,?,?,?)";
				try{
				Connection con1=Connect.getconnection();
				 PreparedStatement ps1=con1.prepareStatement(sql);
				 ps1.setString(1, slab);
				 ps1.setInt(2, min);
				 ps1.setInt(3, max);
				 ps1.setFloat(4, nooftrip);
				 ps1.setInt(5, minmonth);
				 ps1.setInt(6, maxmonth);
				 ps1.setInt(7, mindaily);
				 ps1.setInt(8, maxdaily);
				 ps1.setFloat(9, average);
				 ps1.executeUpdate();
				 RequestDispatcher ReqDis = request.getRequestDispatcher("trip.jsp");
				 ReqDis.forward(request, response);
				}
				catch(Exception e){
				RequestDispatcher ReqDis = request.getRequestDispatcher("error.jsp");
				ReqDis.forward(request, response);
				}
			 %>