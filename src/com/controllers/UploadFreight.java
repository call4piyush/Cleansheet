package com.controllers;

import java.io.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.output.*;

import com.DB.connection.Connect;

import java.util.Iterator;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;


@SuppressWarnings("serial")
public class UploadFreight extends HttpServlet {
	private boolean isMultipart;
	   private String filePath;
	   private int maxFileSize = 100000 * 1024;
	   private int maxMemSize = 50 * 1024;
	   private File file ;

	   public void init( ){
	      // Get the file location where it would be stored.
	      filePath = 
	             getServletContext().getInitParameter("file-upload"); 
	   }
	   @SuppressWarnings("null")
	public void doPost(HttpServletRequest request, 
	               HttpServletResponse response) throws ServletException, IOException 
	              {
		   		   
		  //String empid = request.getParameter("empid");
		   int empid = 0;
		   java.io.PrintWriter out;
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
	      float Backhaul=0;
	     
	      while ( i.hasNext () ) 
	      {
	         FileItem fi = (FileItem)i.next();
	         if ( !fi.isFormField () )	
	         {
	            // Get the uploaded file parameters
	            String fieldName = fi.getFieldName();
	            String fileName = fi.getName();
	            String contentType = fi.getContentType();
	            boolean isInMemory = fi.isInMemory();
	            long sizeInBytes = fi.getSize();
	            // Write the file
	            if( fileName.lastIndexOf("\\") >= 0 ){
	               file = new File( filePath + 
	               fileName.substring( fileName.lastIndexOf("\\"))) ;
	            }else{
	               file = new File( filePath + 
	               fileName.substring(fileName.lastIndexOf("\\")+1)) ;
	            }
	            fi.write( file ) ;
	           
	          
	         }else{
	        	 empid=Integer.parseInt(fi.getString());    	
	         		break;
	         	}
	         	
	         }	     
	      
	      readExcel(file);
          calculatePTPK(Backhaul);
	      
          if(empid==11){
	 			RequestDispatcher ReqDis1 = request.getRequestDispatcher("AdminUploadResult.jsp");
	 			ReqDis1.forward(request, response);
	 			
	 		}else
	 		{
	 		RequestDispatcher ReqDis = request.getRequestDispatcher("UploadResult.jsp");
	 		ReqDis.forward(request, response);
	 		}
	      }
	      catch(Exception ex) {
	    	  ex.printStackTrace();
			  if(empid==11){
				  RequestDispatcher ReqDis = request.getRequestDispatcher("Adminerror.jsp");
				  ReqDis.forward(request, response);
					
				}else{
				RequestDispatcher ReqDis = request.getRequestDispatcher("error.jsp");
				ReqDis.forward(request, response);
				}
		   }
	   }
	  
	private void readExcel(File fileItem) throws Exception {	           
	        	 	FileInputStream file = new FileInputStream(fileItem);
		            XSSFWorkbook workbook = new XSSFWorkbook(file);
		            XSSFSheet sheet = workbook.getSheetAt(0);
		            Iterator<Row> rowIterator = sheet.iterator();
		            Connection con = Connect.getconnection();
		            PreparedStatement ps1=con.prepareStatement("DELETE FROM freightupload");
		            ps1.executeUpdate();
		            
		            Row nextRow = rowIterator.next();
	            while (rowIterator.hasNext()) {
	            	nextRow = rowIterator.next();
	                Iterator<Cell> cellIterator = nextRow.cellIterator();
	                PreparedStatement ps = con.prepareStatement(
	        				"INSERT INTO `mckc`.`freightupload` (`Origin`, `Destination`, `Truck_type`, `Freight_rate`, `Distance`, `lat`, `long`,`Empty`) VALUES  (?,?,?,?,?,?,?,?)");	        		

	                while (cellIterator.hasNext()) {
	                	Cell cell = cellIterator.next();
	                	
	                     
	                    switch (cell.getCellType()) {
	                        case Cell.CELL_TYPE_STRING:
	                        	if(cell.getColumnIndex()==0)
	                        	{
	                        		//Origin City
	                        		ps.setString(1, cell.getStringCellValue());
	                        		//System.out.println(cell.getStringCellValue());
	                        		break;
	                        	}
	                        	else if(cell.getColumnIndex()==1)
	                        	{
	                        		//Destination
	                        		ps.setString(2, cell.getStringCellValue());
	                        		//System.out.println(cell.getStringCellValue());
	                        		break;
	                        	}
	                        	else if(cell.getColumnIndex()==2)
	                        	{
	                        		//Truck Type
	                        		ps.setString(3, cell.getStringCellValue());
	                        		//System.out.println(cell.getStringCellValue());
	                        		break;
	                        	} 
	                        case Cell.CELL_TYPE_NUMERIC:
	                        	 if(cell.getColumnIndex()==3)
	                        	{
	                        		//Freight Rate
	                        		 ps.setDouble(4, cell.getNumericCellValue());
	                        		 //System.out.println(cell.getNumericCellValue());
	                        		break;
	                        	}
	                        	 else if(cell.getColumnIndex()==4)
	                        	{
	                        		//Distance
	                        		 ps.setDouble(5, cell.getNumericCellValue());
	                        		 //System.out.println(cell.getNumericCellValue());
	                        		break;
	                        	}
	                        	 else if(cell.getColumnIndex()==5)
		                        	{
		                        		//Destination Lat
		                        		 ps.setDouble(6, cell.getNumericCellValue());
		                        		 //System.out.println(cell.getNumericCellValue());
		                        		break;
		                        	}
		                        	 else if(cell.getColumnIndex()==6)
			                        	{
			                        		//Destination Lon
			                        		 ps.setDouble(7, cell.getNumericCellValue());
			                        		 //System.out.println(cell.getNumericCellValue());
			                        		break;
			                        	}
		                        	 else if(cell.getColumnIndex()==7)
			                        	{
			                        		//Empty Yes/No
			                        		 ps.setInt(8, (int) cell.getNumericCellValue());
			                        		 //System.out.println(cell.getNumericCellValue());
			                        		break;
			                        	}
	                        case Cell.CELL_TYPE_BLANK:
	                               	break;
	                        
	                    }
	                   //out.print("&nbsp;&nbsp;&nbsp;&nbsp");
	                }ps.executeUpdate();
	               //out.println("<br>");
	                
	            }
	             
	            workbook.close();
	            file.close();
	           	con.close();
	        }
	void calculatePTPK(float Backhaul) throws Exception
	{
		Connection con=Connect.getconnection();
		PreparedStatement ps=con.prepareStatement("Select * from `mckc`.`freightupload`");
		ResultSet rs=ps.executeQuery();
		double freight=0,distance=0,lat=0,lon=0;
		String trucktype=null;
		String start=null,end=null;
		String dest=null;
		int empty;
		while(rs.next())
		{	
			freight=rs.getDouble("Freight_rate");
			distance=rs.getDouble("Distance");
			trucktype=rs.getString("Truck_type");
			lat=rs.getDouble("Lat");
			lon=rs.getDouble("long");
			dest=rs.getString("Destination");
			empty=rs.getInt("Empty");
			if(empty==0)
			{
			commitptpk(freight,distance);
			commitautoptpk((float) distance, trucktype, 0, freight, null, dest, 0);
			//NearbyLocations(distance, trucktype, start, end, lat, lon,freight,dest, 0);
			}
			else if(empty==1){
				commitptpk(freight,distance);
				NearbyLocations(distance, trucktype, start, end, lat, lon,freight,dest, 100);
			}
			
			
		}
		ps.close();
		con.close();
	}
	private void commitptpk(double freight, double distance) throws Exception {
		double ptpk=freight/distance;
		Connection con=Connect.getconnection();
		PreparedStatement ps = con.prepareStatement("UPDATE `mckc`.`freightupload` SET Ptpk=? WHERE Freight_rate=? And Distance=?");
		ps.setDouble(1, ptpk);
		ps.setDouble(2, freight);
		ps.setDouble(3, distance);
		ps.executeUpdate();
		ps.close();
		con.close();
	}
	void NearbyLocations(double distance,String truckType,String start,String end,double lat,double lon, double freight, String dest, float Backhaul) throws Exception {
		//float distance = Float.parseFloat(request.getParameter("distance"));
		//int empid = Integer.parseInt(request.getParameter("empid"));
		//int cap = Integer.parseInt(request.getParameter("cap"));
		//String truckType=request.getParameter("Capacity");
		//String type = request.getParameter("good");
		//String start = request.getParameter("start");
		//String end = request.getParameter("end");
		
		//session.setAttribute("start", start);
		//session.setAttribute("end", end);
		//session.setAttribute("cap", cap);
						
		//int area=Integer.parseInt(request.getParameter("area"));
		//double lat=Double.parseDouble(request.getParameter("lat"));
		//double lon=Double.parseDouble(request.getParameter("long"));
		
		double lat1=0,lon1=0;
		String origin= null;
		
		Connection con=Connect.getconnection();
		
		PreparedStatement ps = con.prepareStatement("SELECT * FROM mckc.autoparam WHERE `typeofgood`= ? order by lat");
		ps.setString(1, truckType);
		ResultSet rs =ps.executeQuery();
		
		while (rs.next()) {
			lat1=rs.getDouble("lat");
			lon1=rs.getDouble("long");
			float dist=calculateDistance(lat,lon,lat1,lon1);
			PreparedStatement ps1 = con.prepareStatement("UPDATE mckc.autoparam SET `distance`=? WHERE `typeofgood`=? And `lat`=? And `long`=?");
			ps1.setFloat(1, dist);
			ps1.setString(2, truckType);
			ps1.setDouble(3, lat1);
			ps1.setDouble(4, lon1);
			ps1.executeUpdate();
		}
		
		float dista = 0;
		PreparedStatement ps2 = con.prepareStatement("SELECT * FROM mckc.autoparam a, priorityslab p WHERE p.Pirority=a.Pirority and a.typeofgood=? order by distance ASC,`Volume Rating` Desc,a.Pirority ASC");
		ps2.setString(1, truckType);
		ResultSet rset =ps2.executeQuery();
						
		while (rset.next()) 
		{
			if(rset.getInt("a.Pirority")==1 && rset.getInt("a.Volume Rating")==3)	
			{
				dista=rset.getFloat("distance");
				if(dista>=rset.getInt("p.Min Distance")&&dista<=rset.getInt("p.Max Distance"))
				{
					origin=rset.getString("Origin");
					//System.out.println(origin);	
					break;
				}				
			}
		else if(rset.getInt("a.Pirority")==2 && rset.getInt("a.Volume Rating")==3)	
			{
				dista=rset.getFloat("distance");
				if(dista>=rset.getInt("p.Min Distance")&&dista<=rset.getInt("p.Max Distance"))
				{
					origin=rset.getString("Origin");
					//System.out.println(origin);	
					break;
				}				
			}
			
			else if(rset.getInt("a.Pirority")==3 && rset.getInt("a.Volume Rating")==3)	
			{
				dista=rset.getFloat("distance");
				if(dista>=rset.getInt("p.Min Distance")&&dista<=rset.getInt("p.Max Distance"))
				{
					origin=rset.getString("Origin");
					//System.out.println(origin);	
					break;
				}
			}
			else if(rset.getInt("a.Pirority")==1 && rset.getInt("a.Volume Rating")==2)	
			{
				dista=rset.getFloat("distance");
				if(dista>=rset.getInt("p.Min Distance")&&dista<=rset.getInt("p.Max Distance"))
				{
					origin=rset.getString("Origin");
					//System.out.println(origin);	
					break;
				}				
			}
			else if(rset.getInt("a.Pirority")==2 && rset.getInt("a.Volume Rating")==2)	
			{
				dista=rset.getFloat("distance");
				if(dista>=rset.getInt("p.Min Distance")&&dista<=rset.getInt("p.Max Distance"))
				{
					origin=rset.getString("Origin");
					//System.out.println(origin);	
					break;
				}				
			}
			else if(rset.getInt("a.Pirority")==3 && rset.getInt("a.Volume Rating")==2)	
			{
				dista=rset.getFloat("distance");
				if(dista>=rset.getInt("p.Min Distance")&&dista<=rset.getInt("p.Max Distance"))
				{
					origin=rset.getString("Origin");
					//System.out.println(origin);	
					break;
				}
			}
			else if(rset.getInt("a.Pirority")==1 && rset.getInt("a.Volume Rating")==1)	
			{
				dista=rset.getFloat("distance");
				if(dista>=rset.getInt("p.Min Distance")&&dista<=rset.getInt("p.Max Distance"))
				{
					origin=rset.getString("Origin");
					//System.out.println(origin);	
					break;
				}				
			}
			else if(rset.getInt("a.Pirority")==2 && rset.getInt("a.Volume Rating")==1)	
			{
				dista=rset.getFloat("distance");
				if(dista>=rset.getInt("p.Min Distance")&&dista<=rset.getInt("p.Max Distance"))
				{
					origin=rset.getString("Origin");
					//System.out.println(origin);	
					break;
				}				
			}
			else if(rset.getInt("a.Pirority")==3 && rset.getInt("a.Volume Rating")==1)	
			{
				dista=rset.getFloat("distance");
				if(dista>=rset.getInt("p.Min Distance")&&dista<=rset.getInt("p.Max Distance"))
				{
					origin=rset.getString("Origin");
					//System.out.println(origin);	
					break;
				}
			}
			
			
			else if(rset.getInt("a.Pirority")==1)
			{
							
					origin=rset.getString("Origin");
					dista=rset.getFloat("distance");
					//System.out.println(origin);
					break;
				
			}
			
		}
		//System.out.println(origin);
		//session.setAttribute("distance", distance+dista);
		//session.setAttribute("backstart", origin);
		
		//float dista=calculateDistance(28.613939, 77.209021, 29.945691, 78.164248);
		//System.out.println(dista);
		//System.out.println(distance);
		PreparedStatement ps0 = con.prepareStatement("SELECT DistanceFactor FROM mckc.Distance_Factor WHERE `long0`< ? and `long2` > ? and `lat2`< ? and `lat0`> ?");
		ps0.setDouble(1, lon);
		ps0.setDouble(2, lon);
		ps0.setDouble(3, lat);
		ps0.setDouble(4, lat);
		//System.out.println(lat);
		//System.out.println(lon);
		ResultSet rs0 =ps0.executeQuery();
		float DistFact=0;
		while (rs0.next()) {
			DistFact=(float) (rs0.getDouble("DistanceFactor")/100);
		}
		//System.out.println(DistFact);
		//System.out.println(distance);
		//System.out.println(dista);
		dista=(float) Math.max(distance*DistFact,dista);
		//System.out.println(dista);
		commitautoptpk((float) (distance+dista),truckType,Backhaul,freight,origin,dest,dista);
			
	
}


	@SuppressWarnings("unused")
	private float calculateDistance(double lat, double lon, double lat0, double lon0) {
		float lat1=(float) lat;
		float lon1=(float) lon;
		float lat2=(float) lat0;
		float lon2=(float) lon0;
			
		float radlat1 = (float) (Math.PI * lat1/180);
		float radlat2 = (float) (Math.PI * lat2/180);
		float radlon1 = (float) (Math.PI * lon1/180);
		float radlon2 = (float) (Math.PI * lon2/180);
		float theta = lon1-lon2;
		float radtheta = (float) (Math.PI * theta/180);
		float dist = (float) (Math.sin(radlat1) * Math.sin(radlat2) + Math.cos(radlat1) * Math.cos(radlat2) * Math.cos(radtheta));
		dist = (float) Math.acos(dist);
		dist = (float) (dist * 180/Math.PI);
		dist = (float) (dist * 60 * 1.1515 * 1.609344);
		return dist;
	}
	private void commitautoptpk(float distance, String trucktype, float backhaul, double freight, String origin, String dest, float dista) throws Exception {
		float intrest1 = 0, costOfTyre = 0, costOfTruck = 0, loan = 0,noOfYears = 0,
				residualValue = 0, noOfTyre = 0, costOfTyreUsed = 0, tyreLife = 0, tyreLifeUsed = 0,
				 mileage = 0, noTrips = 0;

		float mileageWithLoad = 0, diesel = 0,roi=0;
		int cap=0;
		
		Connection con = Connect.getconnection();

		PreparedStatement ps = con.prepareStatement("select * from truckparam where typeofgood=?");
		ps.setString(1, trucktype);
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
		
		float Salary = 0, batta = 0, maintenance = 0, Admin = 0, tarpaulin = 0;
		float expense = 0, totaltoll = 0, insurancepercent = 0, permit = 0, tax = 0;
		float  maintenancePerKm = 0,loading=0;
		float pro=0;
		
		PreparedStatement ps2 = con.prepareStatement("select * from routeparam where typeofgood=?");
		ps2.setString(1, trucktype);
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

		
		float unloading=calculateUnloadingCharges(cap);
		float unloadingloading=unloading+loading;
		float dieselCost =calculateDieselCostPerKm(diesel, netMileage);
		float variableCost = calculateVaribleCostperKm(dieselCost,totaltoll, cost, maintenancePerKm,expense);
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
		
		float freightPerTon = calculateFreightPerTon(totalPTPK, (float) distance);		
		/*
			
		System.out.println("<p>");
		
		System.out.print("Truck Parameter<br>");
		System.out.print("distance"+distance+"<br>");
		System.out.print("costOfTruck"+costOfTruck+"<br>");
		System.out.print("loan"+loan+"<br>");
		System.out.print("intrest"+intrest1+"<br>");
		System.out.print("roi"+roi+"<br>");
		System.out.print("costOfTyre"+costOfTyre+"<br>");
		System.out.print("noOfYears"+noOfYears+"<br>");
		System.out.print("residualValue"+residualValue+"<br>");
		System.out.print("noOfTyre"+noOfTyre+"<br>");
		System.out.print("costOfTyreUsed"+costOfTyreUsed+"<br>");
		System.out.print("tyreLife"+tyreLife+"<br>");
		System.out.print("tyreLifeUsed "+tyreLifeUsed+"<br>");
		System.out.print("mileage"+mileage+"<br>");
		System.out.print("mileageWithLoad"+mileageWithLoad+"<br>");
		System.out.print("diesel"+diesel+"<br>");
		System.out.print("noTrips"+noTrips+"<br>");
		System.out.print("cost"+cost+"<br>");
		System.out.print("loanamount "+loanamount+"<br>");
		System.out.print("amount paid "+paid +"<br>");
		System.out.print("residualValueTruck"+residualValueTruck+"<br>");
		System.out.print("depreciation"+depreciation+"<br>");
		System.out.print("interestcost"+interestcost+"<br>");
		System.out.print("netMileage"+netMileage+"<br>");
		System.out.print("roundtrip"+roundtrip+"<br>");
		System.out.print("distanceTravled"+distanceTravled+"<br>");
		System.out.println("<p>");
		
		System.out.println("<p>");
		System.out.println("Route Paramaters");
		System.out.println("Route expense per trip"+expense+"<br>");
		System.out.println("toll per trip "+totaltoll +"<br>");
		System.out.println("insurancepercent "+insurancepercent +"<br>");
		System.out.println("permit anually"+permit +"<br>");
		System.out.println("tax anually"+tax +"<br>");
		System.out.println("Salary "+Salary +"<br>");
		System.out.println("batta "+batta +"<br>");
		System.out.println("maintenance per month"+maintenance+"<br>");
		System.out.println("Admin Charges"+Admin+"<br>");
		System.out.println("tarpaulin"+tarpaulin+"<br>");
		System.out.println("profit "+profit +"<br>");
		System.out.println("loading"+loading+"<br>");
		System.out.println("route per Km"+expense +"<br>");
		System.out.println("toll per KM"+totaltoll+"<br>");
		System.out.println("unloading"+unloading+"<br>");
		System.out.println("unloadingloading"+unloadingloading+"<br>");
		System.out.println("dieselCost"+dieselCost+"<br>");
		System.out.println("variableCost per Km"+variableCost+"<br>");
		System.out.println("variable cost per Month"+variable+"<br>");
		System.out.println("insuranceMonth"+insuranceMonth+"<br>");
		System.out.println("roadPermit "+roadPermit +"<br>");
		System.out.println("fixedcostperMonth"+fixedcostperMonth+"<br>");
		System.out.println("monthlyoperating"+monthlyoperating+"<br>");
		System.out.println("profit margin"+profit+"<br>");
		System.out.println(" perKmCost"+ perKmCost+"<br>");
		System.out.println("monthlyTon"+monthlyTon+"<br>");
		System.out.println("fixedPTPK"+fixedPTPK+"<br>");
		System.out.println("variablePTPK"+variablePTPK+"<br>");
		System.out.println("profitPTPK"+profitPTPK+"<br>");
		System.out.println("totalPTPK"+totalPTPK+"<br>");
		System.out.println("freightPerTon"+freightPerTon+"<br>");
		System.out.println("profitkm"+(profit/distanceTravled)+"<br>");
		System.out.println("variablekm"+(variable/distanceTravled)+"<br>");
		System.out.println("fixedkm"+((fixedcostperMonth+profit)/distanceTravled)+"<br>");
		
		System.out.println("variableton"+(variable/monthlyTon)+"<br>");
		System.out.println("profitton"+ (profit/monthlyTon)+"<br>");
		System.out.println("fixedton"+((fixedcostperMonth+profit)/monthlyTon)+"<br>");
		System.out.println("Origin"+origin);
		System.out.println("</p>");
		
	*/
		float costs = cap * distance * totalPTPK;
		float trip_cost=(variable/monthlyTon)+(profit/monthlyTon)+((fixedcostperMonth+profit)/monthlyTon);

		PreparedStatement ps3 = con.prepareStatement("UPDATE `mckc`.`freightupload` SET Ptpk_auto=?,backhaul=?,emptyhaul=?, TripCost=?, CostTon=? WHERE Truck_type=? and Destination=?");
		ps3.setDouble(1, totalPTPK);
		ps3.setString(2, origin);
		ps3.setFloat(3, dista);
		ps3.setFloat(4, costs);
		ps3.setFloat(5, trip_cost);
		ps3.setString(6, trucktype);
		ps3.setString(7, dest);
		ps3.executeUpdate();
		con.close();
		ps3.close();
		ps2.close();
		ps.close();
		//PreparedStatement ps4=con.prepareStatement("UPDATE `mckc`.`freightupload` SET Ptpk_auto=?,backhaul=? WHERE Freight_rate=? And Distance=? And Truck_type=?");
		//System.out.println("Backhaul Origin:"+origin);
	
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

	private float calculateRoundTrip(double distance) {

		return (float) (distance * 2);
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
