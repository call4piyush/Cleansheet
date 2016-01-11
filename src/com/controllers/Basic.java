package com.controllers;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DB.connection.Connect;

public class Basic extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		int empid = Integer.parseInt(request.getParameter("empid"));
		try {
			HttpSession session = request.getSession();
			calculateBasic(session, request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
			if(empid==11){
				RequestDispatcher ReqDis = request.getRequestDispatcher("Adminerror.jsp");
				ReqDis.forward(request, response);
					
			}else{RequestDispatcher ReqDis = request.getRequestDispatcher("error.jsp");
			ReqDis.forward(request, response);}
		}
	}

	private void calculateBasic(HttpSession session, HttpServletRequest request, HttpServletResponse response)throws SQLException, ServletException, IOException {
		PrintWriter out=response.getWriter();
		DecimalFormat df = new DecimalFormat("#.##");
		float distance = Float.parseFloat(request.getParameter("distance"));
		int empid = Integer.parseInt(request.getParameter("empid"));
		String truckType=request.getParameter("Capacity");
		
		String param = request.getParameter("param");
		float backhaul = Float.parseFloat(request.getParameter("back"));
		//String type = request.getParameter("good");
		String start = org.apache.commons.lang3.StringUtils.capitalize(request.getParameter("start"));
		String end = org.apache.commons.lang3.StringUtils.capitalize(request.getParameter("end"));
		
		session.setAttribute("start", start);
		session.setAttribute("end", end);
		session.setAttribute("distance", distance);
		//session.setAttribute("type", type);
		session.setAttribute("cap", truckType);
		session.setAttribute("param", param);
		session.setAttribute("back", backhaul);
		
		
		float intrest1 = 0, costOfTyre = 0, costOfTruck = 0, loan = 0,noOfYears = 0,
				residualValue = 0, noOfTyre = 0, costOfTyreUsed = 0, tyreLife = 0, tyreLifeUsed = 0,
				 mileage = 0, noTrips = 0;

		float mileageWithLoad = 0, diesel = 0,roi=0;
		int cap=0;
		
		Connection con = Connect.getconnection();

		PreparedStatement ps = con.prepareStatement("select * from truckparam where typeofgood=?");
		ps.setString(1, truckType);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			costOfTruck = rs.getFloat("costoftruck");
			loan = rs.getFloat("loanpercentage");
			intrest1 = rs.getFloat("rateofintrest");
			roi=rs.getFloat("flatroi");
			costOfTyre = rs.getFloat("tyrecost");
			noOfYears = rs.getFloat("yearsemi");
			residualValue = rs.getFloat("residualvalueoftruck");
			noOfTyre = rs.getFloat("tyres");
			costOfTyreUsed = rs.getFloat("reusedtyrecost");
			tyreLife = rs.getFloat("tyrelife");
			tyreLifeUsed = rs.getFloat("reusedtyrelife");
			mileage=rs.getFloat("dieselmileage");
			mileageWithLoad=rs.getFloat("diesealmileagewithload");
			diesel=rs.getFloat("dieselcost");
			cap=rs.getInt("capacity");
		}
		PreparedStatement ps0 = con.prepareStatement("select `NoofTrip` from `slabtable` WHERE `Min Distance` <= ? AND `Max Distance` >?");
		ps0.setInt(1, (int) distance);
		ps0.setInt(2, (int) distance);
		ResultSet rs0 = ps0.executeQuery();
		while (rs0.next()) {			
			noTrips = rs0.getFloat("NoofTrip");
		}
		float cost = calculateTyreCostPerKM(noOfTyre, costOfTyre, costOfTyreUsed, tyreLife, tyreLifeUsed);
		float loanamount = calculateLoanAmount(loan, costOfTruck);
		float paid = calculatePaid(costOfTruck, loanamount);
		float residualValueTruck = calulateResidualValueOfTruck(residualValue, costOfTruck);
		float depreciation = calculateDepreciation(costOfTruck, residualValueTruck, noOfYears);
		float interestcost = calculateInterestCostPerMonth(roi, loanamount);
		
		float netMileage =calculateNetMilage(mileageWithLoad, backhaul,mileage);
		float roundtrip = calculateRoundTrip(distance);
		float distanceTravled = calculateKmRunPerMonthAvg(roundtrip,noTrips);
		PreparedStatement ps1 = con
				.prepareStatement("UPDATE truckparam SET loanamount="
						+ loanamount + ",amountpaid=" + paid +",kmrunpermonthaverage="+distanceTravled+ ",tyrecostperkm=" + cost +",roundTrip="+roundtrip+ "WHERE typeofgood=?");
		ps1.setString(1, truckType);
		ps1.executeUpdate();
		
		/*
		out.println("<p>");
		
		out.print("Truck Parameter<br>");
		out.print("distance"+distance+"<br>");
		out.print("costOfTruck"+costOfTruck+"<br>");
		out.print("loan"+loan+"<br>");
		out.print("intrest"+intrest1+"<br>");
		out.print("roi"+roi+"<br>");
		out.print("costOfTyre"+costOfTyre+"<br>");
		out.print("noOfYears"+noOfYears+"<br>");
		out.print("residualValue"+residualValue+"<br>");
		out.print("noOfTyre"+noOfTyre+"<br>");
		out.print("costOfTyreUsed"+costOfTyreUsed+"<br>");
		out.print("tyreLife"+tyreLife+"<br>");
		out.print("tyreLifeUsed "+tyreLifeUsed+"<br>");
		out.print("mileage"+mileage+"<br>");
		out.print("mileageWithLoad"+mileageWithLoad+"<br>");
		out.print("diesel"+diesel+"<br>");
		out.print("noTrips"+noTrips+"<br>");
		out.print("cost"+cost+"<br>");
		out.print("loanamount "+loanamount+"<br>");
		out.print("amount paid "+paid +"<br>");
		out.print("residualValueTruck"+residualValueTruck+"<br>");
		out.print("depreciation"+depreciation+"<br>");
		out.print("interestcost"+interestcost+"<br>");
		out.print("netMileage"+netMileage+"<br>");
		out.print("roundtrip"+roundtrip+"<br>");
		out.print("distanceTravled"+distanceTravled+"<br>");
		out.println("<p>");
		*/
		float Salary = 0, batta = 0, maintenance = 0, Admin = 0, tarpaulin = 0;
		float expense = 0, totaltoll = 0, insurancepercent = 0, permit = 0, tax = 0;
		float  maintenancePerKm = 0,loading=0;
		float pro=0;
		
		PreparedStatement ps2 = con.prepareStatement("select * from routeparam where typeofgood=?");
		ps2.setString(1, truckType);
		ResultSet rs1 = ps2.executeQuery();
		
		while (rs1.next()) {
			expense = rs1.getFloat("routeexpenses");
			totaltoll = rs1.getFloat("toll");
			insurancepercent = rs1.getFloat("insuranceaspercentageofvechiclecost");
			permit = rs1.getFloat("roadpermityear");
			tax = rs1.getFloat("roadtaxyear");
			Salary = rs1.getFloat("driver/cleaner salary");
			batta = rs1.getFloat("driver/cleaner bhatta");
			maintenance = rs1.getFloat("maintenancepermonth");
			Admin = rs1.getFloat("admin costs");
			maintenancePerKm=rs1.getFloat("maintenancecostperkm");
			tarpaulin = rs1.getFloat("tarpaulin");
			loading=rs1.getFloat("loadingcharges");
			pro=rs1.getInt("profitmargin");
		}

		
		float toll = calculateTollPerKm(totaltoll, distance);
		float unloading=calculateUnloadingCharges(cap);
		float unloadingloading=unloading+loading;
		float dieselCost =calculateDieselCostPerKm(diesel, netMileage);
		float variableCost = calculateVaribleCostperKm(dieselCost,toll, cost, maintenancePerKm,expense);
		float variable = calculateVaribleCostperMonth(variableCost,distanceTravled, unloadingloading);
		float insuranceMonth = calculateInsurancePerMonth(costOfTruck, insurancepercent);
		float roadPermit = calculateRoadPermitPerMonth(permit);
		float roadTax = calculateRoadTaxPerMonth(tax);
		
		
		float fixedcostperMonth = calculatefixedCostPerMonth(roadTax, roadPermit,insuranceMonth, Salary,batta,maintenance, Admin,tarpaulin, depreciation,interestcost);
		float monthlyoperating =  calculateMonthlyOperatingCost(fixedcostperMonth, variable);
		
		float profit=calculateProfitMargin(fixedcostperMonth,pro);
		
		double perKmCost= calculatePerKmCost(profit,monthlyoperating,distanceTravled);
		float monthlyTon = calculateMonthlyTons(cap, backhaul, noTrips);
		
		
		
		float fixedPTPK = calculateFixedPTPK(fixedcostperMonth,roundtrip,cap, noTrips,backhaul);
		float variablePTPK = calculateVariablePTPK(variable,roundtrip,cap, noTrips,backhaul);
		float profitPTPK = calculateProfitPTPK(profit, roundtrip,cap, noTrips,backhaul);
		float totalPTPK = calculateTotalPTPK(profitPTPK, variablePTPK, fixedPTPK);
		
		

		float freightPerTon = calculateFreightPerTon(totalPTPK, distance);
		
		float emi = 0;// calculateEmi(intrest1, noOfYears, loanamount);
		float cashInflow = 0;// calculateCashInFlow(depreciation, interestcost,profitMargin);
		float cashFlowPerMonth = 0;// calculateFlowPerMonth(emi, cashInflow);
		float irr = 0;// calculateIRR(cashFlowPerMonth,paid,costOfTruck,residualValue);
		float workingCapital = 0;

		session.setAttribute("fixedptpk", fixedPTPK);
		session.setAttribute("variableptpk", variablePTPK);
		session.setAttribute("profitptpk", profitPTPK);
		session.setAttribute("ptpk", totalPTPK);
		session.setAttribute("freightPerTon", freightPerTon);

		PreparedStatement ps3 = con.prepareStatement("UPDATE routeparam SET backhaul='" + backhaul + "',distance='"
				+ distance + "',unloadingchages='"+unloading+"',loadingunloadingcharges='"+unloadingloading+"',variblecostperkm='" + variableCost
				+ "',variblecostpermonth='" + variable + "',insurancepermonth='" + insuranceMonth
				+ "',workingcapitalinterestcost='" + workingCapital + "',roadpermitmonth='" + roadPermit + "',roadtaxmonth='"
				+ roadTax + "',monthlyoperatingcost='" + monthlyoperating +"',perkmcost='"
				+ perKmCost + "',monthlytons='" + monthlyTon + "',fixedptpk='" + fixedPTPK + "',variableptpk='" + variablePTPK
				+ "', profitptpk='" + profitPTPK + "', totalptpk='" + totalPTPK + "', freightperton='" + freightPerTon+ "' WHERE typeofgood=?");
		PreparedStatement ps31 = con.prepareStatement("UPDATE routeparam SET origin=? ,destination=? WHERE typeofgood=?");
		ps3.setString(1, truckType);
		ps3.executeUpdate();
		ps31.setString(1, start);
		ps31.setString(2, end);
		ps31.setString(3, truckType);
		ps31.executeUpdate();
		/*
		out.println("<p>");
		out.println("Route Paramaters");
		out.println("Route expense per trip"+expense+"<br>");
		out.println("toll per trip "+toll +"<br>");
		out.println("insurancepercent "+insurancepercent +"<br>");
		out.println("permit anually"+permit +"<br>");
		out.println("tax anually"+tax +"<br>");
		out.println("Salary "+Salary +"<br>");
		out.println("batta "+batta +"<br>");
		out.println("maintenance per month"+maintenance+"<br>");
		out.println("Admin Charges"+Admin+"<br>");
		out.println("tarpaulin"+tarpaulin+"<br>");
		out.println("profit "+profit +"<br>");
		out.println("loading"+loading+"<br>");
		out.println("route per Km"+expense +"<br>");
		out.println("toll per KM"+toll+"<br>");
		out.println("unloading"+unloading+"<br>");
		out.println("unloadingloading"+unloadingloading+"<br>");
		out.println("dieselCost"+dieselCost+"<br>");
		out.println("variableCost per Km"+variableCost+"<br>");
		out.println("variable cost per Month"+variable+"<br>");
		out.println("insuranceMonth"+insuranceMonth+"<br>");
		out.println("roadPermit "+roadPermit +"<br>");
		out.println("fixedcostperMonth"+fixedcostperMonth+"<br>");
		out.println("monthlyoperating"+monthlyoperating+"<br>");
		out.println("profit margin"+profit+"<br>");
		out.println(" perKmCost"+ perKmCost+"<br>");
		out.println("monthlyTon"+monthlyTon+"<br>");
		out.println("fixedPTPK"+fixedPTPK+"<br>");
		out.println("variablePTPK"+variablePTPK+"<br>");
		out.println("profitPTPK"+profitPTPK+"<br>");
		out.println("totalPTPK"+totalPTPK+"<br>");
		out.println("freightPerTon"+freightPerTon+"<br>");
		out.println("profitkm"+df.format(profit/distanceTravled)+"<br>");
		out.println("variablekm"+df.format(variable/distanceTravled)+"<br>");
		out.println("fixedkm"+df.format((fixedcostperMonth+profit)/distanceTravled)+"<br>");
		
		out.println("variableton"+df.format(variable/monthlyTon)+"<br>");
		out.println("profitton"+ df.format(profit/monthlyTon)+"<br>");
		out.println("fixedton"+df.format((fixedcostperMonth+profit)/monthlyTon)+"<br>");
		out.println("</p>");
		*/
		float costs = cap * distance * totalPTPK;
		
		session.setAttribute("cost", costs);
				
		session.setAttribute("profitkm", df.format(profit/distanceTravled));
		session.setAttribute("variablekm",variableCost);
		session.setAttribute("fixedkm",df.format((fixedcostperMonth+profit)/distanceTravled));
		
		session.setAttribute("variableton",df.format(variable/monthlyTon));
		session.setAttribute("profitton", df.format(profit/monthlyTon));
		session.setAttribute("fixedton",df.format((fixedcostperMonth+profit)/monthlyTon));
		
		session.setAttribute("dep",df.format(depreciation));
		session.setAttribute("intres",df.format(interestcost));
		session.setAttribute("salr",df.format(Salary));
		//session.setAttribute("Total cost",); 		
		session.setAttribute("insu",df.format(insuranceMonth));
		session.setAttribute("rota",df.format(roadTax));
		//session.setAttribute("",);others
		session.setAttribute("dies",df.format(dieselCost));
		session.setAttribute("tole",df.format(totaltoll));
		session.setAttribute("tyres",df.format(cost));
		session.setAttribute("routes",df.format(expense));
		session.setAttribute("maint",df.format(maintenancePerKm));
		
		
		if(empid==11){
			RequestDispatcher ReqDis = request.getRequestDispatcher("AdminResultBasic.jsp");
			ReqDis.forward(request, response);
				
		}else{
		RequestDispatcher ReqDis = request.getRequestDispatcher("ResultBasic.jsp");
		ReqDis.forward(request, response);
		}
		
	}

	private float calculateProfitMargin(float fixedcostperMonth, float pro) {
		
		return (fixedcostperMonth*pro)/100;
	}

	private float calculateProfit(float monthlyoperating) {
		
		return (float) ((0.0752688172043011)*monthlyoperating);
	}

	private float calculateKmRunPerMonthAvg(float roundtrip, float noTrips) {
		
		return (roundtrip*noTrips);
	}

	private float calculateVaribleCostperMonth(float variableCost, float distanceTravled, float unloadingloading
			) {

		return ((variableCost * distanceTravled)+unloadingloading);
	}

	private float calculateTotalPTPK(float profitPTPK, float variablePTPK, float fixedPTPK) {

		return (profitPTPK + variablePTPK + fixedPTPK);
	}

	private float calculateProfitPTPK(float profit, float roundtrip, int cap, float noTrips, float backhaul) {
		return (profit / ((roundtrip/2)*cap*noTrips*(1+(backhaul/100))));
	}

	private float calculateVariablePTPK(float variable, float roundtrip, int cap, float noTrips, float backhaul) {

		return (variable / ((roundtrip/2)*cap*noTrips*(1+(backhaul/100))));
	}

	private float calculateFixedPTPK(float fixedcostperMonth, float roundtrip, int cap, float noTrips, float backhaul) {

		return (fixedcostperMonth / ((roundtrip/2)*cap*noTrips*(1+(backhaul/100))));
	}

	private float calculateFreightPerTon(float totalPTPK, float distance) {

		return (totalPTPK * distance);
	}

	private float calculateRoundTrip(float distance) {

		return (distance * 2);
	}

	private float calculateTotalCostPerTon(float totalPTPK, float distance, int cap) {

		return (totalPTPK * distance * cap);
	}

	private float calculateMonthlyTons(int cap, float backhaul, float noTrips) {

		return (noTrips * cap * (1 + (backhaul/100)));
	}

	private float calculatePerKmCost(float profitMargin, float monthlyoperating, float distanceTravled) {
		
		return ((profitMargin+monthlyoperating)/distanceTravled);
	}

	private float calculateMonthlyOperatingCost(float fixedcostperMonth, float variable) {
		
		return (fixedcostperMonth+variable);
	}

	private float calculatefixedCostPerMonth(float roadTax, float roadPermit, float insuranceMonth, float salary,
			float batta, float maintenance, float admin, float tarpaulin, float depreciation, float interestcost ) {
		
		return (admin+batta+insuranceMonth+maintenance+roadPermit+roadTax+salary+tarpaulin+depreciation+interestcost);
	}

	private float calculateRoadTaxPerMonth(float tax) {
		
		return (tax/12);
	}

	private float calculateRoadPermitPerMonth(float permit) {
		
		return (permit/12);
	}

	private float calculateInsurancePerMonth(float costOfTruck, float insurancepercent) {
		
		return ((costOfTruck * insurancepercent) / 1200);
	}

	private float calculateVaribleCostperKm(float dieselCost, float toll, float cost, float maintenancePerKm,
			float route) {
		return (dieselCost+toll+cost+maintenancePerKm+route);
	}

	private float calculateRouteExpence(float expense, float distance) {

		return (expense/distance);
	}

	private float calculateUnloadingCharges(int cap) {
		
		return (45*cap);
	}

	private float calculateDieselCostPerKm(float diesel, float netMileage) {
		return (diesel/netMileage);
	}

	private float calculateNetMilage(float mileageWithLoad, float backhaul, float mileage) {
		
		return (((mileageWithLoad*100+(mileageWithLoad*backhaul))+(mileage)*(100-backhaul))/200);
	}

	private float calculateTollPerKm(float totaltoll, float distance) {
	
		return (totaltoll/distance);
	}

	private float calulateResidualValueOfTruck(float residualValue, float costOfTruck) {
		
		return (costOfTruck*residualValue/100);
	}

	private float calculateInterestCostPerMonth(float roi, float loanamount) {
		
		return ((roi*loanamount)/1200);
	}

	private float calculateDepreciation(float costOfTruck, float residualValue, float noOfYears) {
		
		return (((costOfTruck-residualValue)/noOfYears)/12);
	}

	private float calculatePaid(float costOfTruck, float loanamount) {
		
		return (costOfTruck-loanamount);
	}

	private float calculateLoanAmount(float loan, float costOfTruck) {
		
		return ((costOfTruck * loan) / 100);
	}

	private float calculateTyreCostPerKM(float noOfTyre, float costOfTyre, float costOfTyreUsed, float tyreLife,
			float tyreLifeUsed) {
		
		return (noOfTyre*(costOfTyre+costOfTyreUsed)/(tyreLife+tyreLifeUsed));
	}

	
}
