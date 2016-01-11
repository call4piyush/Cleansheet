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
int cap=Integer.parseInt(request.getParameter("cap"+i));
int costoftruck=Integer.parseInt(request.getParameter("cost"+i));
float residualvalueoftruck=Float.parseFloat(request.getParameter("residual"+i));
int yearsemi=Integer.parseInt(request.getParameter("years"+i));
float loanpercentage=Float.parseFloat(request.getParameter("loan"+i));
float rateofintrest=Float.parseFloat(request.getParameter("roi"+i));
float flatroi=Float.parseFloat(request.getParameter("flatroi"+i));
String sql = "Update `truckparam`  Set capacity="+cap+",costoftruck="+costoftruck+",residualvalueoftruck="+residualvalueoftruck+
			",yearsemi="+yearsemi+",loanpercentage="+loanpercentage+",rateofintrest="+rateofintrest+",flatroi="+flatroi
			+"where typeofgood=?";
		try{ 
							Connection con = Connect.getconnection();
							PreparedStatement ps=con.prepareStatement(sql);		
							ps.setString(1, typeofgood);			 		 
					 		ps.executeUpdate();
		}catch(Exception e)
				{
				e.printStackTrace();
				RequestDispatcher ReqDis = request.getRequestDispatcher("Adminerror.jsp");
				ReqDis.forward(request, response);
				}
}							
							RequestDispatcher ReqDis = request.getRequestDispatcher("adminCapex.jsp");
							ReqDis.forward(request, response);

%>