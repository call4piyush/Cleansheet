<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="com.DB.connection.Connect"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.DecimalFormatSymbols"%>
<%@page import="java.util.Locale"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%  	 
		if(request.getSession().getAttribute("empid")==null)
        {      request.getRequestDispatcher("index.jsp").forward(request, response);   
           }else{
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Upload Freight Result</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/amcharts.js" type="text/javascript"></script>
<script src="js/xy.js" type="text/javascript"></script>
<script>
            var chart;
 var chartData = [<%
			Connection con=Connect.getconnection();
			PreparedStatement ps=con.prepareStatement("Select Ptpk,Ptpk_auto,Distance from freightupload");
			ResultSet rs=ps.executeQuery();
			int z=0;
			while(rs.next())
			{z++;%>      {     
                    "ax": <%=rs.getDouble("Distance")%>,
                    "ay": <%=rs.getDouble("Ptpk")%>,
                    "bx": <%=rs.getDouble("Distance")%>,
                    "by": <%=rs.getDouble("Ptpk_auto")%>
                    },
               <%}%> 
                             
            ];

            AmCharts.ready(function () {
                // XY CHART
                chart = new AmCharts.AmXYChart();

                chart.dataProvider = chartData;
                chart.startDuration = 1;

                // AXES
                // X
                var xAxis = new AmCharts.ValueAxis();
                xAxis.title = "Distance(km.)";
                xAxis.position = "bottom";
                xAxis.dashLength = 0.5;
                xAxis.axisAlpha = 1;
                xAxis.autoGridCount = true;
                chart.addValueAxis(xAxis);

                // Y
                var yAxis = new AmCharts.ValueAxis();
                yAxis.position = "left";
                yAxis.title = "PTPK(INR/t/km)";
                yAxis.dashLength = 0.5;
                yAxis.axisAlpha = 0;
                yAxis.autoGridCount = true;
                chart.addValueAxis(yAxis);

                // GRAPHS
                // triangles up
                var graph1 = new AmCharts.AmGraph();
                graph1.lineColor = "#FF0000";
                graph1.balloonText = "x:[[x]] y:[[y]]";
                graph1.xField = "ax";
                graph1.yField = "ay";
                graph1.lineAlpha = 0;
                graph1.bullet = "bubble";
                chart.addGraph(graph1);

                // triangles down
                var graph2 = new AmCharts.AmGraph();
                graph2.lineColor = "#00FF00";
                graph2.balloonText = "x:[[x]] y:[[y]]";
                graph2.xField = "bx";
                graph2.yField = "by";
                graph2.lineAlpha = 0;
                graph2.bullet = "bubble";
                chart.addGraph(graph2);

              

                // CURSOR
                var chartCursor = new AmCharts.ChartCursor();
                chart.addChartCursor(chartCursor);

                // SCROLLBAR

                // WRITE
                chart.write("chartdiv");
            });
      
            function fun12()
            {
            
            var ab=<%=z%>;
            if(ab<15){}//window.alert(ab);
            else if(ab > 15 & ab <= 30){
            //window.alert(ab+"1");
            document.getElementById("1").style.visibility = "visible";
            document.getElementById("menu1").style.visibility = "visible";
            }
            else if(ab > 30 & ab <= 45){
            //window.alert(ab+"2");
            document.getElementById("1").style.visibility = "visible";
            document.getElementById("menu1").style.visibility = "visible";
            document.getElementById("2").style.visibility = "visible";
            document.getElementById("menu2").style.visibility = "visible";
            }
            else if(ab > 45 & ab <= 60){
            document.getElementById("1").style.visibility = "visible";
            document.getElementById("menu1").style.visibility = "visible";
            document.getElementById("2").style.visibility = "visible";
            document.getElementById("menu2").style.visibility = "visible";
            document.getElementById("3").style.visibility = "visible";
            document.getElementById("menu3").style.visibility = "visible";
            
            }
            else if(ab > 60 & ab <= 75){
            document.getElementById("1").style.visibility = "visible";
            document.getElementById("menu1").style.visibility = "visible";
            document.getElementById("2").style.visibility = "visible";
            document.getElementById("menu2").style.visibility = "visible";
            document.getElementById("3").style.visibility = "visible";
            document.getElementById("menu3").style.visibility = "visible";
            document.getElementById("4").style.visibility = "visible";
            document.getElementById("menu4").style.visibility = "visible";
            }
            else if(ab > 75 & ab <= 90){
            document.getElementById("1").style.visibility = "visible";
            document.getElementById("menu1").style.visibility = "visible";
            document.getElementById("2").style.visibility = "visible";
            document.getElementById("menu2").style.visibility = "visible";
            document.getElementById("3").style.visibility = "visible";
            document.getElementById("menu3").style.visibility = "visible";
            document.getElementById("4").style.visibility = "visible";
            document.getElementById("menu4").style.visibility = "visible";
            document.getElementById("5").style.visibility = "visible";
            document.getElementById("menu5").style.visibility = "visible";
           
            }
            else if(ab > 90 & ab <= 105){
            document.getElementById("1").style.visibility = "visible";
            document.getElementById("menu1").style.visibility = "visible";
            document.getElementById("2").style.visibility = "visible";
            document.getElementById("menu2").style.visibility = "visible";
            document.getElementById("3").style.visibility = "visible";
            document.getElementById("menu3").style.visibility = "visible";
            document.getElementById("4").style.visibility = "visible";
            document.getElementById("menu4").style.visibility = "visible";
            document.getElementById("5").style.visibility = "visible";
            document.getElementById("menu5").style.visibility = "visible";
            document.getElementById("6").style.visibility = "visible";
            document.getElementById("menu6").style.visibility = "visible";
            
            }
            else if(ab > 105 & ab <= 120){
            document.getElementById("1").style.visibility = "visible";
            document.getElementById("menu1").style.visibility = "visible";
            document.getElementById("2").style.visibility = "visible";
            document.getElementById("menu2").style.visibility = "visible";
            document.getElementById("3").style.visibility = "visible";
            document.getElementById("menu3").style.visibility = "visible";
            document.getElementById("4").style.visibility = "visible";
            document.getElementById("menu4").style.visibility = "visible";
            document.getElementById("5").style.visibility = "visible";
            document.getElementById("menu5").style.visibility = "visible";
            document.getElementById("6").style.visibility = "visible";
            document.getElementById("menu6").style.visibility = "visible";
            document.getElementById("7").style.visibility = "visible";
            document.getElementById("menu7").style.visibility = "visible";
            
            }
            else if(ab >120){
            document.getElementById("1").style.visibility = "visible";
            document.getElementById("menu1").style.visibility = "visible";
            document.getElementById("2").style.visibility = "visible";
            document.getElementById("menu2").style.visibility = "visible";
            document.getElementById("3").style.visibility = "visible";
            document.getElementById("menu3").style.visibility = "visible";
            document.getElementById("4").style.visibility = "visible";
            document.getElementById("menu4").style.visibility = "visible";
            document.getElementById("5").style.visibility = "visible";
            document.getElementById("menu5").style.visibility = "visible";
            document.getElementById("6").style.visibility = "visible";
            document.getElementById("menu6").style.visibility = "visible";
            document.getElementById("7").style.visibility = "visible";
            document.getElementById("menu7").style.visibility = "visible";
            document.getElementById("8").style.visibility = "visible";
            document.getElementById("menu8").style.visibility = "visible";
            }
            else if(ab >120){
            document.getElementById("1").style.visibility = "visible";
            document.getElementById("menu1").style.visibility = "visible";
            document.getElementById("2").style.visibility = "visible";
            document.getElementById("menu2").style.visibility = "visible";
            document.getElementById("3").style.visibility = "visible";
            document.getElementById("menu3").style.visibility = "visible";
            document.getElementById("4").style.visibility = "visible";
            document.getElementById("menu4").style.visibility = "visible";
            document.getElementById("5").style.visibility = "visible";
            document.getElementById("menu5").style.visibility = "visible";
            document.getElementById("6").style.visibility = "visible";
            document.getElementById("menu6").style.visibility = "visible";
            document.getElementById("7").style.visibility = "visible";
            document.getElementById("menu7").style.visibility = "visible";
            document.getElementById("8").style.visibility = "visible";
            document.getElementById("menu8").style.visibility = "visible";
            document.getElementById("9").style.visibility = "visible";
            document.getElementById("menu9").style.visibility = "visible";
            
            }
            }
        </script>
</head>
<body class="panel-body" onload="fun12()">
	<%String name = request.getParameter( "name" );
	 %><div class="card">
		<header>
		<h1 align="center">
			<img src="./images/logo.jpg" alt="Logo">
		</h1>
		<p style="text-align: left;">
			Hello,
			<%= session.getAttribute( "name" ) %>
			<a style="float: right;" href="Logout">Logout</a>
		</p>
		</header>

		<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<ul class="nav navbar-nav">
				<li class="active"><a href="adminAuto.jsp">Auto</a></li>
				<li class="active"><a href="admin.jsp">Classic</a></li>
				<li class="active"><a href="adminAdvanced.jsp">Advanced</a></li>
				<li class="active" class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">Control Panel<span
						class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="adminCapex.jsp">Capex</a></li>
						<li><a href="adminfixed.jsp">Fixed Cost</a></li>
						<li><a href="adminvariable.jsp">Variable Cost</a></li>
						<li><a href="admintrip.jsp">Trip Matrix</a></li>
						<li><a href="DistanceFactor.jsp">Distance Factor</a></li>
						<li><a href="locations.jsp">Locations</a></li>
						<li><a href="diesel.jsp">Update Diesel Price</a></li>
					</ul></li>
				<li class="active"><a href="adminUploadFreight.jsp">Upload
						Freight</a></li>
				<li class="active" class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#">Contract<span
						class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="adminContract.jsp">View Contract</a></li>
						<li><a href="adminUploadContract.jsp">Upload Contract</a></li>
					</ul></li>
				<li class="active"><a href="UserSession.jsp">User Record</a></li>
				<li class="active"><a href="adminGetLat.jsp">Get Lat Long</a></li>
				<li class="active"><a href="adminHelp.jsp">Help/FAQs</a></li>
				<li class="active"></li>
			</ul>

		</div>
		</nav>
		<h5 style="font-weight: bold; padding: 1%">Upload Freight Result</h5>
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#home">Tab 1</a></li>
			<li id='1' style="visibility: hidden;"><a data-toggle="tab"
				href="#menu1">Tab 2</a></li>
			<li id='2' style="visibility: hidden;"><a data-toggle="tab"
				href="#menu2">Tab 3</a></li>
			<li id='3' style="visibility: hidden;"><a data-toggle="tab"
				href="#menu3">Tab 4</a></li>
			<li id='4' style="visibility: hidden;"><a data-toggle="tab"
				href="#menu4">Tab 5</a></li>
			<li id='5' style="visibility: hidden;"><a data-toggle="tab"
				href="#menu5">Tab 6</a></li>
			<li id='6' style="visibility: hidden;"><a data-toggle="tab"
				href="#menu6">Tab 7</a></li>
			<li id='7' style="visibility: hidden;"><a data-toggle="tab"
				href="#menu7">Tab 8</a></li>
			<li id='8' style="visibility: hidden;"><a data-toggle="tab"
				href="#menu8">Tab 9</a></li>
			<li id='9' style="visibility: hidden;"><a data-toggle="tab"
				href="#menu9">Tab 10</a></li>
		</ul>
		<section>
		<div class="login-card " style="width: 100%">
			<div class="right panel-body embed-responsive-item"
				style="height: 65%;">
				<h5 style="font-weight: bold; padding: 1%">PTPK Chart</h5>
				<ul style="list-style-type: square; float: right;">
					<li style="color: red">PTPK</li>
					<li style="color: green">PTPK from Auto</li>
				</ul>
				<div id="chartdiv" style="height: 60%; width: 90%"></div>
			</div>
			<div class="tab-content">
				<div id="home" class="tab-pane fade in active">
					<h5 style="font-weight: bold; padding: 1%">Freight Table</h5>
					<table class="table table-bordered table-condensed tabel-hover"
						style="padding: 2%; background-color: white;">
						<tr>
							<th>Origin</th>
							<th>Destination</th>
							<th>Backhaul Origin</th>
							<th>Vehicle Type</th>
							<th>Emptyhaul Distance</th>
							<th>PTPK</th>
							<th>PTPK from Auto</th>
						</tr>
						<%
	//Connection con=Connect.getconnection();
	
	
	PreparedStatement ps1=con.prepareStatement("Select * from freightupload");
	ResultSet rs1=ps1.executeQuery();
	DecimalFormat df = new DecimalFormat("##.###", new DecimalFormatSymbols(Locale.US));
	int i=1;
	while(rs1.absolute(i))
	{ if(i<=15){%>
						<tr>
							<td><%=rs1.getString("Origin")%></td>
							<td><%=rs1.getString("Destination")%></td>
							<td><%=rs1.getString("backhaul")%></td>
							<td><%=rs1.getString("Truck_type")%></td>
							<td><%=df.format(rs1.getDouble("emptyhaul"))%></td>
							<td><%=df.format(rs1.getDouble("Ptpk"))%></td>
							<td><%=df.format(rs1.getDouble("Ptpk_auto"))%></td>
						</tr>
						<%
				}i++;}%>
					</table>
					</center>
				</div>
				<div id="menu1" class="tab-pane fade" style="visibility: hidden;">
					<table class="table table-bordered table-condensed tabel-hover"
						style="padding: 2%; background-color: white;">
						<tr>
							<th>Origin</th>
							<th>Destination</th>
							<th>Backhaul Origin</th>
							<th>Vehicle Type</th>
							<th>Emptyhaul Distance</th>
							<th>PTPK</th>
							<th>PTPK from Auto</th>
						</tr>
						<%
				
	PreparedStatement ps2=con.prepareStatement("Select * from freightupload");
	ResultSet rs2=ps2.executeQuery();
	i=15;
	while(rs2.absolute(i))
	{ if(i>15&&i<=30){%>
						<tr>
							<td><%=rs2.getString("Origin")%></td>
							<td><%=rs2.getString("Destination")%></td>
							<td><%=rs2.getString("backhaul")%></td>
							<td><%=rs2.getString("Truck_type")%></td>
							<td><%=df.format(rs2.getDouble("emptyhaul"))%></td>
							<td><%=df.format(rs2.getDouble("Ptpk"))%></td>
							<td><%=df.format(rs2.getDouble("Ptpk_auto"))%></td>
						</tr>
						<%
				}i++;}%>
					</table>
				</div>
				<div id="menu2" class="tab-pane fade" style="visibility: hidden;">
					<table class="table table-bordered table-condensed tabel-hover"
						style="padding: 2%; background-color: white;">
						<tr>
							<th>Origin</th>
							<th>Destination</th>
							<th>Backhaul Origin</th>
							<th>Vehicle Type</th>
							<th>Emptyhaul Distance</th>
							<th>PTPK</th>
							<th>PTPK from Auto</th>
						</tr>
						<%
				
	PreparedStatement ps3=con.prepareStatement("Select * from freightupload");
	ResultSet rs3=ps3.executeQuery();
	i=30;
	while(rs3.absolute(i))
	{ if(i>30&&i<=45){%>
						<tr>
							<td><%=rs3.getString("Origin")%></td>
							<td><%=rs3.getString("Destination")%></td>
							<td><%=rs3.getString("backhaul")%></td>
							<td><%=rs3.getString("Truck_type")%></td>
							<td><%=df.format(rs3.getDouble("emptyhaul"))%></td>
							<td><%=df.format(rs3.getDouble("Ptpk"))%></td>
							<td><%=df.format(rs3.getDouble("Ptpk_auto"))%></td>
						</tr>
						<%
				}i++;}%>
					</table>
				</div>
				<div id="menu3" class="tab-pane fade" style="visibility: hidden;">
					<table class="table table-bordered table-condensed tabel-hover"
						style="padding: 2%; background-color: white;">
						<tr>
							<th>Origin</th>
							<th>Destination</th>
							<th>Backhaul Origin</th>
							<th>Vehicle Type</th>
							<th>Emptyhaul Distance</th>
							<th>PTPK</th>
							<th>PTPK from Auto</th>
						</tr>
						<%
				
	PreparedStatement ps4=con.prepareStatement("Select * from freightupload");
	ResultSet rs4=ps4.executeQuery();
	i=45;
	while(rs4.absolute(i))
	{ if(i>45&&i<60){%>
						<tr>
							<td><%=rs4.getString("Origin")%></td>
							<td><%=rs4.getString("Destination")%></td>
							<td><%=rs4.getString("backhaul")%></td>
							<td><%=rs4.getString("Truck_type")%></td>
							<td><%=df.format(rs4.getDouble("emptyhaul"))%></td>
							<td><%=df.format(rs4.getDouble("Ptpk"))%></td>
							<td><%=df.format(rs4.getDouble("Ptpk_auto"))%></td>
						</tr>
						<%
				}i++;}%>
					</table>
				</div>
				<div id="menu4" class="tab-pane fade" style="visibility: hidden;">
					<table class="table table-bordered table-condensed tabel-hover"
						style="padding: 2%; background-color: white;">
						<tr>
							<th>Origin</th>
							<th>Destination</th>
							<th>Backhaul Origin</th>
							<th>Vehicle Type</th>
							<th>Emptyhaul Distance</th>
							<th>PTPK</th>
							<th>PTPK from Auto</th>
						</tr>
						<%
				
	PreparedStatement ps5=con.prepareStatement("Select * from freightupload");
	ResultSet rs5=ps5.executeQuery();
	i=60;
	while(rs5.absolute(i))
	{ if(i>60&&i<=75){%>
						<tr>
							<td><%=rs5.getString("Origin")%></td>
							<td><%=rs5.getString("Destination")%></td>
							<td><%=rs5.getString("backhaul")%></td>
							<td><%=rs5.getString("Truck_type")%></td>
							<td><%=df.format(rs5.getDouble("emptyhaul"))%></td>
							<td><%=df.format(rs5.getDouble("Ptpk"))%></td>
							<td><%=df.format(rs5.getDouble("Ptpk_auto"))%></td>
						</tr>
						<%
				}i++;}%>
					</table>
				</div>
				<div id="menu5" class="tab-pane fade" style="visibility: hidden;">
					<table class="table table-bordered table-condensed tabel-hover"
						style="padding: 2%; background-color: white;">
						<tr>
							<th>Origin</th>
							<th>Destination</th>
							<th>Backhaul Origin</th>
							<th>Vehicle Type</th>
							<th>Emptyhaul Distance</th>
							<th>PTPK</th>
							<th>PTPK from Auto</th>
						</tr>
						<%
				
	PreparedStatement ps6=con.prepareStatement("Select * from freightupload");
	ResultSet rs6=ps6.executeQuery();
	i=75;
	while(rs6.absolute(i))
	{ if(i>75&&i<=90){%>
						<tr>
							<td><%=rs6.getString("Origin")%></td>
							<td><%=rs6.getString("Destination")%></td>
							<td><%=rs6.getString("backhaul")%></td>
							<td><%=rs6.getString("Truck_type")%></td>
							<td><%=df.format(rs6.getDouble("emptyhaul"))%></td>
							<td><%=df.format(rs6.getDouble("Ptpk"))%></td>
							<td><%=df.format(rs6.getDouble("Ptpk_auto"))%></td>
						</tr>
						<%
				}i++;}%>
					</table>
				</div>
				<div id="menu6" class="tab-pane fade" style="visibility: hidden;">
					<table class="table table-bordered table-condensed tabel-hover"
						style="padding: 2%; background-color: white;">
						<tr>
							<th>Origin</th>
							<th>Destination</th>
							<th>Backhaul Origin</th>
							<th>Vehicle Type</th>
							<th>Emptyhaul Distance</th>
							<th>PTPK</th>
							<th>PTPK from Auto</th>
						</tr>
						<%
				
	PreparedStatement ps7=con.prepareStatement("Select * from freightupload");
	ResultSet rs7=ps7.executeQuery();
	i=90;
	while(rs7.absolute(i))
	{ if(i>90&&i<=105){%>
						<tr>
							<td><%=rs7.getString("Origin")%></td>
							<td><%=rs7.getString("Destination")%></td>
							<td><%=rs7.getString("backhaul")%></td>
							<td><%=rs7.getString("Truck_type")%></td>
							<td><%=df.format(rs7.getDouble("emptyhaul"))%></td>
							<td><%=df.format(rs7.getDouble("Ptpk"))%></td>
							<td><%=df.format(rs7.getDouble("Ptpk_auto"))%></td>
						</tr>
						<%
				}i++;}%>
					</table>
				</div>
				<div id="menu7" class="tab-pane fade" style="visibility: hidden;">
					<table class="table table-bordered table-condensed tabel-hover"
						style="padding: 2%; background-color: white;">
						<tr>
							<th>Origin</th>
							<th>Destination</th>
							<th>Backhaul Origin</th>
							<th>Vehicle Type</th>
							<th>Emptyhaul Distance</th>
							<th>PTPK</th>
							<th>PTPK from Auto</th>
						</tr>
						<%
				
	PreparedStatement ps8=con.prepareStatement("Select * from freightupload");
	ResultSet rs8=ps8.executeQuery();
	i=105;
	while(rs8.absolute(i))
	{ if(i>105&&i<=120){%>
						<tr>
							<td><%=rs8.getString("Origin")%></td>
							<td><%=rs8.getString("Destination")%></td>
							<td><%=rs8.getString("backhaul")%></td>
							<td><%=rs8.getString("Truck_type")%></td>
							<td><%=df.format(rs8.getDouble("emptyhaul"))%></td>
							<td><%=df.format(rs8.getDouble("Ptpk"))%></td>
							<td><%=df.format(rs8.getDouble("Ptpk_auto"))%></td>
						</tr>
						<%
				}i++;}%>
					</table>
				</div>
				<div id="menu8" class="tab-pane fade" style="visibility: hidden;">
					<table class="table table-bordered table-condensed tabel-hover"
						style="padding: 2%; background-color: white;">
						<tr>
							<th>Origin</th>
							<th>Destination</th>
							<th>Backhaul Origin</th>
							<th>Vehicle Type</th>
							<th>Emptyhaul Distance</th>
							<th>PTPK</th>
							<th>PTPK from Auto</th>
						</tr>
						<%
				
	PreparedStatement ps9=con.prepareStatement("Select * from freightupload");
	ResultSet rs9=ps9.executeQuery();
	i=120;
	while(rs9.absolute(i))
	{ if(i>120&&i<=135){%>
						<tr>
							<td><%=rs9.getString("Origin")%></td>
							<td><%=rs9.getString("Destination")%></td>
							<td><%=rs9.getString("backhaul")%></td>
							<td><%=rs9.getString("Truck_type")%></td>
							<td><%=df.format(rs9.getDouble("emptyhaul"))%></td>
							<td><%=df.format(rs9.getDouble("Ptpk"))%></td>
							<td><%=df.format(rs9.getDouble("Ptpk_auto"))%></td>
						</tr>
						<%
				}i++;}%>
					</table>
				</div>
				<div id="menu9" class="tab-pane fade" style="visibility: hidden;">
					<table class="table table-bordered table-condensed tabel-hover"
						style="padding: 2%; background-color: white;">
						<tr>
							<th>Origin</th>
							<th>Destination</th>
							<th>Backhaul Origin</th>
							<th>Vehicle Type</th>
							<th>Emptyhaul Distance</th>
							<th>PTPK</th>
							<th>PTPK from Auto</th>
						</tr>
						<%
				
	PreparedStatement ps11=con.prepareStatement("Select * from freightupload");
	ResultSet rs11=ps11.executeQuery();
	i=135;
	while(rs11.absolute(i))
	{ if(i>135){%>
						<tr>
							<td><%=rs11.getString("Origin")%></td>
							<td><%=rs11.getString("Destination")%></td>
							<td><%=rs11.getString("backhaul")%></td>
							<td><%=rs11.getString("Truck_type")%></td>
							<td><%=df.format(rs11.getDouble("emptyhaul"))%></td>
							<td><%=df.format(rs11.getDouble("Ptpk"))%></td>
							<td><%=df.format(rs11.getDouble("Ptpk_auto"))%></td>
						</tr>
						<%
				}i++;}%>
					</table>
				</div>
		</section>
		<div class="panel-body"></div>
		<footer class="panel-footer"
			style=" bottom:2%; text-align:center; color:white;position:relative; ">
		Copyright &copy McKinsey & Company</footer>
	</div>
</body>
</html>
<% }%>