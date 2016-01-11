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

public class Param extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		int empid = Integer.parseInt(request.getParameter("empid"));
		try {
			HttpSession session = request.getSession();
			InsertValues(request,response,session);
		
		} catch (Exception e) {
			e.printStackTrace();
			if(empid==11){
				RequestDispatcher ReqDis = request.getRequestDispatcher("Adminerror.jsp");
				ReqDis.forward(request, response);
					
			}else{RequestDispatcher ReqDis = request.getRequestDispatcher("error.jsp");
			ReqDis.forward(request, response);}
		}
	}

	@SuppressWarnings("unused")
	private void InsertValues(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException, SQLException, ServletException {
		int empid=Integer.parseInt(request.getParameter("empid"));
		PrintWriter out=response.getWriter();
		Connection con = Connect.getconnection();
			String truckType=(String)session.getAttribute("truckType");	
			String truckType1=request.getParameter("truckType");
			if(truckType.equals(truckType1))
			{
			int cap=(int)session.getAttribute("cap");
			int costofTruck=(int)session.getAttribute("cost");
			float residual=(float)session.getAttribute("residual")/100;
			float loan=(float)session.getAttribute("loan");
			int yearsemi=(int)session.getAttribute("emi");
			float roi=(float)session.getAttribute("roi");
			float flatroi=(float)session.getAttribute("flatroi");
			
			float insurance=(float)session.getAttribute("insurance");
			
			int tyrelife=Integer.parseInt(request.getParameter("tyrelife"));
			int usedtyrelife=Integer.parseInt(request.getParameter("resusedtyrelife"));
			int tyrecost=Integer.parseInt(request.getParameter("tyrecost"));
			int usedtyrecost=Integer.parseInt(request.getParameter("reusedtyrecost"));
			int tyres=Integer.parseInt(request.getParameter("tyres"));
			float dieselcost=Float.parseFloat(request.getParameter("diesel"));
			float mileage=Float.parseFloat(request.getParameter("mileage"));
			float mileagewithload=Float.parseFloat(request.getParameter("mileageload"));
			
			
			
			int salary=(int)session.getAttribute("sal");;
			int bhatta=(int)session.getAttribute("bhatta");
			int maintenanceMonth=(int)session.getAttribute("main");
			int roadtaxyearly=(int)session.getAttribute("roadtax");
			int roadpermityearly=(int)session.getAttribute("permit");
			int admin=(int)session.getAttribute("admin");
			int tarpaulin=(int)session.getAttribute("tarpaulin");
			int loading=(int)session.getAttribute("loading");
			int profit=(int)session.getAttribute("profit");
			
			float toll=Float.parseFloat(request.getParameter("toll"));
			float routeexpences=Float.parseFloat(request.getParameter("routeexpense"));
			float maintanecekm=Float.parseFloat(request.getParameter("maintkm"));
			/*
			out.println("<p>");
			
			out.println("Capacity"+cap);
			out.println("Cost Of Truck"+costofTruck);
			out.println("Good is "+Good);
			out.println("Residual Value"+residual);
			out.println("Loan Amount"+loan);
			out.println("NO. of Years"+yearsemi);
			out.println("Roi"+roi);
			out.println("flat Roi"+flatroi);
			out.println("Insurance"nsurance);
			
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
			out.println("<br>");
			out.println("<br>");
			*/
			PreparedStatement ps = con.prepareStatement("INSERT INTO truckparam (capacity,typeofgood,costoftruck, residualvalueoftruck, loanpercentage, yearsemi, rateofintrest, flatroi , tyrelife, reusedtyrelife, tyrecost, reusedtyrecost, tyres, dieselcost, dieselmileage, diesealmileagewithload)  VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			
			ps.setInt(1, cap);
			ps.setString(2, truckType);
			ps.setInt(3, costofTruck);
			ps.setFloat(4, residual);
			ps.setFloat(5, loan);
			ps.setInt(6, yearsemi);
			ps.setFloat(7, roi);
			ps.setFloat(8, flatroi);
			ps.setInt(9, tyrelife);
			ps.setInt(10, usedtyrelife);
			ps.setInt(11, tyrecost);
			ps.setInt(12, usedtyrecost);
			ps.setInt(13,tyres );
			ps.setFloat(14, dieselcost);
			ps.setFloat(15, mileage);
			ps.setFloat(16, mileagewithload);
			
			ps.executeUpdate();
			PreparedStatement ps1 = con.prepareStatement("INSERT INTO routeparam (`capacity`, `loadingcharges`, `routeexpenses`, `toll`, `maintenancecostperkm`, `insuranceaspercentageofvechiclecost`, `driver/cleaner salary`, `driver/cleaner bhatta`, `maintenancepermonth`, `roadpermityear`, `roadtaxyear`, `admin costs`, `tarpaulin`,`profitmargin`,`typeofgood`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ");
			ps1.setInt(1, cap);
			ps1.setFloat(2, loading);
			ps1.setFloat(3, routeexpences);
			ps1.setFloat(4, toll);
			ps1.setFloat(5, maintanecekm);
			ps1.setFloat(6, insurance);
			ps1.setFloat(7, salary);
			ps1.setFloat(8, bhatta);
			ps1.setFloat(9, maintenanceMonth);
			ps1.setFloat(10, roadpermityearly);
			ps1.setFloat(11, roadtaxyearly);
			ps1.setFloat(12, admin);
			ps1.setFloat(13, tarpaulin);
			ps1.setInt(14, profit);
			ps1.setString(15, truckType);
			ps1.executeUpdate();
			if(empid==11){
				RequestDispatcher ReqDis = request.getRequestDispatcher("adminAuto.jsp");
				ReqDis.forward(request, response);
			}
		}else{
			RequestDispatcher ReqDis = request.getRequestDispatcher("Adminerror.jsp");
			ReqDis.forward(request, response);
			}
			}
		
	
}
