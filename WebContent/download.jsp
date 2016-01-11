<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.DB.connection.Connect"%>
<% 					
						String nameind=(String)request.getParameter("nameind");
						String namecom=(String)request.getParameter("namecom");
						String sql = "SELECT * from contractupload WHERE industryname =? and companyname=?";
						String filename=null;
						String filepath = null;
			 
				try{ 
							 Connection con = Connect.getconnection();
							 PreparedStatement ps=con.prepareStatement(sql);
							 ps.setString(1, nameind);
							 ps.setString(2, namecom); 		 
					 		 ResultSet rs = ps.executeQuery();
					               while( rs.next() )
					 		 {
							 	filename=rs.getString("filename");
								filepath=rs.getString("filepath");
							}
							}catch(Exception e)
							{
							e.printStackTrace();
							}
  response.setContentType("application/pdf");   
  response.setHeader("Content-Disposition","attachment; filename=\"" + filename + "\"");   
  
  java.io.FileInputStream fileInputStream=new java.io.FileInputStream(filepath + filename);  
            
  int i;   
  while ((i=fileInputStream.read()) != -1) {  
    out.write(i);   
  }   
  fileInputStream.close();   
%>