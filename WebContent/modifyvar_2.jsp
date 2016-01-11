<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.DB.connection.Connect"%>
<%
int j=Integer.parseInt(request.getParameter("no"));
for(int i=0;i<j;i++)
{
String typeofgood=request.getParameter("type"+i);
int tyrelife=Integer.parseInt(request.getParameter("tyrelife"+i));
int reusedtyrelife=Integer.parseInt(request.getParameter("usedtyrelife"+i));
int tyrecost=Integer.parseInt(request.getParameter("tyrecost"+i));
int reusedtyrecost=Integer.parseInt(request.getParameter("usedtyrecost"+i));
int tyres=Integer.parseInt(request.getParameter("tyres"+i));
float diesel=Float.parseFloat(request.getParameter("diesel"+i));
float mileage=Float.parseFloat(request.getParameter("mileage"+i));
float mileagewithload=Float.parseFloat(request.getParameter("mileagewithload"+i));
float toll=Float.parseFloat(request.getParameter("toll"+i));
float routeexpense=Float.parseFloat(request.getParameter("routeexpense"+i));
float maintenance=Float.parseFloat(request.getParameter("maintenance"+i));
String sql="UPDATE truckparam SET tyrelife=?,reusedtyrelife=?,tyrecost=?,reusedtyrecost=?,tyres=?,dieselcost=?,dieselmileage=?,diesealmileagewithload=? where typeofgood=?";
String sql1="UPDATE routeparam SET toll=?,routeexpenses=?,maintenancecostperkm=? where typeofgood=?";
try{
							Connection con = Connect.getconnection();
							PreparedStatement ps=con.prepareStatement(sql);
							PreparedStatement ps1=con.prepareStatement(sql1);
							ps.setInt(1, tyrelife);
							ps.setInt(2, reusedtyrelife);
							ps.setInt(3, tyrecost);
							ps.setInt(4, reusedtyrecost);
							ps.setInt(5, tyres);
							ps.setFloat(6, diesel);
							ps.setFloat(7, mileage);
							ps.setFloat(8, mileagewithload);
							ps.setString(9, typeofgood);
							ps1.setFloat(1, toll);
							ps1.setFloat(2, routeexpense);
							ps1.setFloat(3, maintenance);
							ps1.setString(4, typeofgood);
							ps.executeUpdate();
							ps1.executeUpdate();

}catch(Exception e)
				{
				e.printStackTrace();
				RequestDispatcher ReqDis = request.getRequestDispatcher("Adminerror.jsp");
				ReqDis.forward(request, response);
				}
}							
							RequestDispatcher ReqDis = request.getRequestDispatcher("adminvariable.jsp");
							ReqDis.forward(request, response);

%>