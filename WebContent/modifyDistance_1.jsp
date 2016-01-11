<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.DB.connection.Connect"%>
<%
int j=Integer.parseInt(request.getParameter("no"));
for(int i=0;i<j;i++)
{
int typeofgood=Integer.parseInt(request.getParameter("type"+i));
String cap=(request.getParameter("cap"+i));
float costoftruck=Float.parseFloat(request.getParameter("cost"+i));
String sql = "Update distance_factor  Set DistanceFactor="+costoftruck+",STATE=? where SNO="+typeofgood;
		try{ 
							Connection con = Connect.getconnection();
							PreparedStatement ps=con.prepareStatement(sql);		
							ps.setString(1, cap);			 		 
					 		ps.executeUpdate();
		}catch(Exception e)
				{
				e.printStackTrace();
				RequestDispatcher ReqDis = request.getRequestDispatcher("Adminerror.jsp");
				ReqDis.forward(request, response);
				}
}							
							RequestDispatcher ReqDis = request.getRequestDispatcher("DistanceFactor.jsp");
							ReqDis.forward(request, response);

%>