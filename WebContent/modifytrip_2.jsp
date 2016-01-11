<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.DB.connection.Connect"%>
<%
int j=Integer.parseInt(request.getParameter("no"));


for(int i=0;i<j;i++)
{
String slab=request.getParameter("slab"+i);

int mindistance=Integer.parseInt((String)request.getParameter("mindistance"+i));
int maxdistance=Integer.parseInt(request.getParameter("maxdistance"+i));
int maxmonthly=Integer.parseInt(request.getParameter("maxmothly"+i));
int minmonthly=Integer.parseInt(request.getParameter("minmonthly"+i));
int maxdaily=Integer.parseInt(request.getParameter("maxdaily"+i));
int mindaily=Integer.parseInt(request.getParameter("mindaily"+i));
float notrip=Float.parseFloat(request.getParameter("notrip"+i));
float avg=Float.parseFloat(request.getParameter("avg"+i));
String sql = "Update `slabtable`  Set `Min Distance`="+mindistance+", `Max Distance`="+maxdistance+", `NoofTrip`="+notrip
			+", `Min Monthly Distance`="+minmonthly+", `Max Monthly Distance`="+maxmonthly+", `Min Daily Distance`="+mindaily+", `Max Daily Distance`="+maxdaily+", Average="+avg+"where Slab=?";
 
					try{		Connection con = Connect.getconnection();
							PreparedStatement ps=con.prepareStatement(sql);		
							ps.setString(1, slab);			 		 
					 		ps.executeUpdate();		 		
		}catch(Exception e){
		e.printStackTrace();
		RequestDispatcher ReqDis = request.getRequestDispatcher("Adminerror.jsp");
		ReqDis.forward(request, response);
		}
		}
		RequestDispatcher ReqDis = request.getRequestDispatcher("admintrip.jsp");
		ReqDis.forward(request, response);					
	

%>