<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.DB.connection.Connect"%>

<select name='namecom' class="form-control">
	<% 					
						String cap=(String)request.getParameter("val");
						String sql = "SELECT companyname from contractupload WHERE industryname =? ";
			 
				try{ 
							 Connection con = Connect.getconnection();
							 PreparedStatement ps=con.prepareStatement(sql);
							 ps.setString(1, cap);					 		 
					 		 ResultSet rs = ps.executeQuery();
					               while( rs.next() )
					 		 {
							 	%>
	<option value='<%=rs.getString("companyname") %>' class="form-control"><%=rs.getString("companyname") %></option>
	<%
					 		}				            	
				}
				catch(Exception e){
					e.printStackTrace();
					RequestDispatcher ReqDis = request.getRequestDispatcher("error.jsp");
				ReqDis.forward(request, response);
				}
				%>
</select>
