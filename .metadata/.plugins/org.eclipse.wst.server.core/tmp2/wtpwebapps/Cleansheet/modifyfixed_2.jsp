<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.DB.connection.Connect"%>
<%
int j=Integer.parseInt(request.getParameter("no"));
for(int i=0;i<j;i++)
{
String typeofgood=request.getParameter("type");
int salary=Integer.parseInt(request.getParameter("salary"));
int bhatta=Integer.parseInt(request.getParameter("bhatta"));
int month=Integer.parseInt(request.getParameter("month"));
int roadtax=Integer.parseInt(request.getParameter("roadtax"));
int permit=Integer.parseInt(request.getParameter("roadpermit"));
float insurance=Float.parseFloat(request.getParameter("insurance"));
int admin=Integer.parseInt(request.getParameter("admin"));
int tarpaulin=Integer.parseInt(request.getParameter("tarpaulin"));
int profit=Integer.parseInt(request.getParameter("profit"));
int loading=Integer.parseInt(request.getParameter("loading"));
String sql="UPDATE routeparam SET `driver/cleaner salary`= ?, `driver/cleaner bhatta`= ?, `admin costs`=? WHERE typeofgood=?";
String sql1 = "UPDATE routeparam SET loadingcharges=?, insuranceaspercentageofvechiclecost=?, maintenancepermonth= ?, roadpermityear=?, roadtaxyear=?, tarpaulin=? WHERE typeofgood=?";
		try{ 
							Connection con = Connect.getconnection();
							PreparedStatement ps=con.prepareStatement(sql1);
							PreparedStatement ps1=con.prepareStatement(sql);		
							ps.setInt(1, loading);
							ps.setFloat(2, insurance);
							ps.setInt(3, month);
							ps.setInt(4, roadtax);
							ps.setInt(5, permit);
							ps.setInt(6, tarpaulin);
							ps.setString(7, typeofgood);			 		 
					 		ps.executeUpdate();
					 		ps1.setInt(1, salary);
					 		ps1.setInt(2, bhatta);
					 		ps1.setInt(3, admin);
					 		ps1.setString(4, typeofgood);
					 		ps1.executeUpdate();
		}catch(Exception e)
				{
				e.printStackTrace();
				RequestDispatcher ReqDis = request.getRequestDispatcher("Adminerror.jsp");
				ReqDis.forward(request, response);
				}
}							
							RequestDispatcher ReqDis = request.getRequestDispatcher("adminfixed.jsp");
							ReqDis.forward(request, response);

%>