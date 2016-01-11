package com.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.connection.Connect;

public class ModifyParam extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		int empid = Integer.parseInt(request.getParameter("empid"));
		try {
			HttpSession session = request.getSession();
			UpdateValues(request,response,session);
		
		} catch (Exception e) {
			e.printStackTrace();
			if(empid==11){
				RequestDispatcher ReqDis = request.getRequestDispatcher("Adminerror.jsp");
				ReqDis.forward(request, response);
					
			}else{RequestDispatcher ReqDis = request.getRequestDispatcher("error.jsp");
			ReqDis.forward(request, response);}
		}
	}

	private void UpdateValues(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException, SQLException, ServletException {
		int empid=Integer.parseInt(request.getParameter("empid"));
		PrintWriter out=response.getWriter();
		Connection con = Connect.getconnection();
		int cap=Integer.parseInt(request.getParameter("cap"));
		int costofTruck=Integer.parseInt(request.getParameter("cost"));
		String Good=request.getParameter("good");
		float residual=Float.parseFloat(request.getParameter("residual"));
		float loan=Float.parseFloat(request.getParameter("loan"));
		int yearsemi=Integer.parseInt(request.getParameter("emi"));
		float roi=Float.parseFloat(request.getParameter("roi"));
		float flatroi=Float.parseFloat(request.getParameter("flatroi"));
		float insurance=Float.parseFloat(request.getParameter("insurance"));
		
		int tyrelife=Integer.parseInt(request.getParameter("newtyre"));
		int usedtyrelife=Integer.parseInt(request.getParameter("oldtyre"));
		int tyrecost=Integer.parseInt(request.getParameter("newtyrecost"));
		int usedtyrecost=Integer.parseInt(request.getParameter("oldtyrecost"));
		int tyres=Integer.parseInt(request.getParameter("notyre"));
		float dieselcost=Float.parseFloat(request.getParameter("dieselcost"));
		float mileage=Float.parseFloat(request.getParameter("mileage"));
		float mileagewithload=Float.parseFloat(request.getParameter("mileagewithload"));
		int notrip=Integer.parseInt(request.getParameter("notrip"));
		
		int salary=Integer.parseInt(request.getParameter("salary"));
		int bhatta=Integer.parseInt(request.getParameter("bhatta"));
		float maintenanceMonth=Float.parseFloat(request.getParameter("maintenace"));
		float roadtaxyearly=Float.parseFloat(request.getParameter("roadtax"));
		float roadpermityearly=Float.parseFloat(request.getParameter("roadpermit"));
		int admin=Integer.parseInt(request.getParameter("admincost"));
		int tarpaulin=Integer.parseInt(request.getParameter("tarpaulin"));
		float loading=Float.parseFloat(request.getParameter("loading"));
		
		float toll=Float.parseFloat(request.getParameter("toll"));
		float routeexpences=Float.parseFloat(request.getParameter("routeexpences"));
		float maintanecekm=Float.parseFloat(request.getParameter("maintanecekm"));
		/*
		out.println("<p>");
		
		out.println("Capacity"+cap);
		out.println("Cost Of Truck"+costofTruck);
		out.println("Type of Good"+Good);
		out.println("Residual Value"+residual);
		out.println("Loan Amount"+loan);
		out.println("NO. of Years"+yearsemi);
		out.println("Roi"+roi);
		out.println("flat Roi"+flatroi);
		out.println("Insurance"+insurance);
		
		out.println("Tyre Life"+tyrelife);
		out.println("Used Tyre Life"+usedtyrelife);
		out.println("Tyre Cost"+tyrecost);
		out.println("Used Tyre Cost"+usedtyrecost);
		out.println("No. Of Tyres"+tyres);
		out.println("Diesel Cost"+dieselcost);
		out.println("Mileage"+mileage);
		out.println("Mileage With Load"+mileagewithload);
		out.println("No. Of trips Month"+notrip);
		
		out.println("Salary"+salary);
		out.println("Bhatta"+bhatta);
		out.println("Maintenance Month"+maintenanceMonth);
		out.println("Road Tax Yearly"+roadtaxyearly);
		out.println("Road Permit Yearly"+roadpermityearly);
		out.println("Admin Cost"+admin);
		out.println("Tarpaulin"+tarpaulin);
		out.println("Loading Charges"+loading);
		
		out.println("toll"+toll);
		out.println("Route Expense"+routeexpences);
		out.println("Maintenance Km"+maintanecekm);
		
		out.println("</p>");
		*/

		 PreparedStatement ps = con.prepareStatement("UPDATE truckparam SET typeofgood=?, costoftruck=?, residualvalueoftruck=?, loanpercentage=?, yearsemi=?, rateofintrest=?, flatroi=?, tyrelife=?, reusedtyrelife=?, tyrecost=?, reusedtyrecost=?, tyres=?, dieselcost=?, dieselmileage=?, diesealmileagewithload=?,noofTrips=? WHERE Emp_id=? And capacity=?");
			ps.setString(1, Good);
			ps.setInt(2, costofTruck);
			ps.setFloat(3, residual);
			ps.setFloat(4, loan);
			ps.setInt(5, yearsemi);
			ps.setFloat(6, roi);
			ps.setFloat(7, flatroi);
			ps.setInt(8, tyrelife);
			ps.setInt(9, usedtyrelife);
			ps.setInt(10, tyrecost);
			ps.setInt(11, usedtyrecost);
			ps.setInt(12,tyres );
			ps.setFloat(13, dieselcost);
			ps.setFloat(14, mileage);
			ps.setFloat(15, mileagewithload);
			ps.setFloat(16, notrip);
			ps.setInt(17, empid);
			ps.setInt(18, cap);
			ps.executeUpdate();
			PreparedStatement ps1 = con.prepareStatement("UPDATE routeparam SET loadingcharges=?, routeexpenses=?, toll=?, maintenancecostperkm=?, insuranceaspercentageofvechiclecost=?, maintenancepermonth= ?, roadpermityear=?, roadtaxyear=?, tarpaulin=? WHERE Emp_id=? And capacity=?");
			ps1.setFloat(1, loading);
			ps1.setFloat(2, routeexpences);
			ps1.setFloat(3, toll);
			ps1.setFloat(4, maintanecekm);
			ps1.setFloat(5, insurance);
			ps1.setFloat(6, maintenanceMonth);
			ps1.setFloat(7, roadpermityearly);
			ps1.setFloat(8, roadtaxyearly);
			//ps1.setFloat(9, admin);
			ps1.setFloat(9, tarpaulin);
			ps1.setInt(10, empid);
			ps1.setInt(11, cap);
			ps1.executeUpdate();
			PreparedStatement ps2=con.prepareStatement("UPDATE routeparam SET driver/cleaner salary= ?, driver/cleaner bhatta= ?, admin costs=? WHERE Emp_id=? And capacity=?");
			ps2.setFloat(1, salary);
			ps2.setFloat(2, bhatta);
			ps2.setInt(3, empid);
			ps2.setInt(4, cap);
			RequestDispatcher ReqDis = request.getRequestDispatcher("Advanced.jsp");
			ReqDis.forward(request, response);
		}
}
