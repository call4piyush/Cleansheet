<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.DB.connection.Connect"%>
<%
float diesel=Float.parseFloat(request.getParameter("diesel"));

String sql="UPDATE  mckc.truckparam SET dieselcost=? where truck_id>0";
				try{
				Connection con1=Connect.getconnection();
				 PreparedStatement ps1=con1.prepareStatement(sql);
				 ps1.setFloat(1,diesel);
				 ps1.executeUpdate();
				 RequestDispatcher ReqDis = request.getRequestDispatcher("adminAuto.jsp");
				 ReqDis.forward(request, response);
				}
				catch(Exception e){
				RequestDispatcher ReqDis = request.getRequestDispatcher("Adminerror.jsp");
				ReqDis.forward(request, response);
				}
			 %>