package com.Register;

import com.DB.connection.*;
import javax.servlet.http.HttpServlet;
import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;


public class Register extends HttpServlet {

	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		int e = Integer.parseInt(request.getParameter("empid"));
		String n = request.getParameter("user");
		String p = request.getParameter("pass");
		String a=request.getParameter("address");
		String c=request.getParameter("company");
		String code=request.getParameter("chargecode");
		
		
		try {

			Connection con = Connect.getconnection();

			PreparedStatement ps = con.prepareStatement("INSERT INTO registeruser (Emp_id,username,password,address,company,chargecode) VALUES (?,?,?,?,?,?)");
			ps.setInt(1, e);
			ps.setString(2, n);
			ps.setString(3, p);
			ps.setString(4, a);
			ps.setString(5, c);
			ps.setString(6, code);
			
			ps.executeUpdate();
			request.getRequestDispatcher("index_2.jsp").include(request, response);

		} catch (Exception e1) {
			e1.printStackTrace();
		}

		out.close();
	}

}
