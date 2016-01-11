package com.controllers;

import java.io.File;

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;

import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.DB.connection.Connect;

@SuppressWarnings("serial")
public class UploadContract extends HttpServlet {
	private boolean isMultipart;
	   private String filePath;
	   private int maxFileSize = 1000 * 1024;
	   private int maxMemSize = 50 * 1024;
	   private File file ;

	   public void init( ){
	      // Get the file location where it would be stored.
	      filePath = 
	             getServletContext().getInitParameter("file-upload"); 
	   }
	   public void doPost(HttpServletRequest request, 
	               HttpServletResponse response) throws ServletException, IOException 
	              {
		 //String empid = request.getParameter("empid");
		   int ab=0;
		   File newName = null;
		   int empid = 0;
		   java.io.PrintWriter out;
		   String fieldName = null;
           String fileName = null;
           String contentType = null;
           String name = null;
           String namecom=null;
           String NewName="Contract File"+ab;
           ab++;
           //boolean isInMemory = fi.isInMemory();
           //long sizeInBytes = fi.getSize();
	      // Check that we have a file upload request
	      isMultipart = ServletFileUpload.isMultipartContent(request);
	      response.setContentType("text/html");
	     // 
	      if( !isMultipart ){
	         return;
	      }
	      DiskFileItemFactory factory = new DiskFileItemFactory();
	      // maximum size that will be stored in memory
	      factory.setSizeThreshold(maxMemSize);
	      // Location to save data that is larger than maxMemSize.
	      //factory.setRepository(new File("d:\\temp"));

	      // Create a new file upload handler
	      ServletFileUpload upload = new ServletFileUpload(factory);
	      // maximum file size to be uploaded.
	      upload.setSizeMax( maxFileSize );
	      //System.out.println(empid);
	      try{ 
	    	  //out = response.getWriter( );
	      // Parse the request to get file items.
	      List fileItems = upload.parseRequest(request);
		
	      // Process the uploaded file items
	      Iterator i = fileItems.iterator();

	     
	      while ( i.hasNext () ) 
	      {
	         FileItem fi = (FileItem)i.next();
	         if( fi.isFormField ()){
	        	 if(fi.getFieldName().equals("nameind")){
	        		 name=fi.getString();
	        	 }
	        	 else if(fi.getFieldName().equals("namecom")){
	        		 namecom=fi.getString();
	        	 }
	        	 
	         }
	         else if ( !fi.isFormField () )	
	         {
	            // Get the uploaded file parameters
	        	 fieldName = fi.getFieldName();
		            fileName = fi.getName();
		            contentType = fi.getContentType();
	            boolean isInMemory = fi.isInMemory();
	            long sizeInBytes = fi.getSize();
	            // Write the file
	            if( fileName.lastIndexOf("\\") >= 0 ){
	            	
	              // newName=new File(filePath + fileName)
	            	file = new File( filePath + 
	               fileName.substring( fileName.lastIndexOf("\\"))) ;
	            }else{
	            	
	               file = new File( filePath + 
	               fileName.substring(fileName.lastIndexOf("\\")+1)) ;
	            }
	            fi.write( file ) ;
	            //((File) fi).renameTo(file);
	         }else{
	        	
	        	 break;
	         }
	         }
	      		commitData(name,namecom,fieldName,fileName,contentType,filePath);
	 			RequestDispatcher ReqDis1 = request.getRequestDispatcher("AdminUploadContract_1.jsp");
	 			ReqDis1.forward(request, response);
	 			
	 		
	      }
	      catch(Exception ex) {
	    	  ex.printStackTrace();
				  RequestDispatcher ReqDis = request.getRequestDispatcher("Adminerror.jsp");
				  ReqDis.forward(request, response);
			
		   }
	   }
	private void commitData(String name, String namecom, String fieldName, String fileName, String contentType, String filePath2) throws SQLException {
		 String sql="INSERT INTO `mckc`.`contractupload` (industryname, companyname, filename, type, filepath) VALUES (?,?,?,?,?)";
		 Connection con = Connect.getconnection();
		 PreparedStatement ps=con.prepareStatement(sql);
		 ps.setString(1, name);
		 ps.setString(2, namecom);
		 ps.setString(3, fileName);
		 ps.setString(4, contentType);
		 ps.setString(5, filePath2);
		 ps.executeUpdate();
		
	}
			
			
		
	
}
				