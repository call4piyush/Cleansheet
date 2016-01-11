<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
%>
<%  	 
		if(request.getSession().getAttribute("empid")==null)
        {      request.getRequestDispatcher("index.jsp").forward(request, response);   
           }else{
 %>
<%@page import="java.text.NumberFormat"%>
<%@page import=" java.text.DecimalFormat"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Output Summary</title>
<script type="text/javascript"
	src="http://maps.google.com/maps/api/js?sensor=false"
></script>
<script src="./js/amcharts.js" type="text/javascript"></script>
<script src="./js/serial.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript" src="js/Map.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script>
			function roundToTwo(num) {    
    return +(Math.round(num + "e+2")  + "e-2");
}
			<%
			
			float dep=Float.parseFloat((String)session.getAttribute("dep"));
			float distance=(Float)session.getAttribute("distance");
			dep=dep/distance;
			float intres=Float.parseFloat((String)session.getAttribute("intres"));
			intres=intres/distance;
			float sal=Float.parseFloat((String)session.getAttribute("salr"));
			sal=sal/distance;
			float insu=Float.parseFloat((String)session.getAttribute("insu"));
			insu=insu/distance;
			float road=Float.parseFloat((String)session.getAttribute("rota"));
			road=road/distance;
			%>
			
			var Depreciation=roundToTwo(<%=dep %>); 
			var Interest=roundToTwo(<%=intres %>); 				
			var Salary=roundToTwo(<%=sal%>);
			var cost=0;
			var Insurance=roundToTwo(<%=insu %>);
			var Roadtax=roundToTwo(<%=road %>);
			var Others=0;
			var Total=roundToTwo(Depreciation+Interest+Salary+cost+Insurance+Roadtax+Others);
			
			
			var Diesel=roundToTwo(<%=session.getAttribute("dies") %>);
			var toll=roundToTwo(<%=session.getAttribute("tole") %>);
			var tyre=roundToTwo(<%=session.getAttribute("tyres") %>);
			var	route=roundToTwo(<%=session.getAttribute("routes") %>);
			var cost=roundToTwo(<%=session.getAttribute("maint") %>);
			var Total1=roundToTwo(Diesel+toll+tyre+route+cost);
			
			var chart,chart1,chart2,chart3, chart4;

			var fixed=roundToTwo(<%=session.getAttribute("fixedkm") %>);
			var variable=roundToTwo(<%=session.getAttribute("variablekm") %>);
			var	profit=roundToTwo(<%=session.getAttribute("profitkm")%>);
			var total=roundToTwo(fixed+variable+profit);
			total=total.toFixed(2);
			
			var fixed1=roundToTwo(<%=session.getAttribute("fixedton") %>);
			var variable1=roundToTwo(<%=session.getAttribute("variableton") %>);
			var	profit1=roundToTwo(<%=session.getAttribute("profitton") %>);
			var total1=roundToTwo(fixed1+variable1+profit1);
			total1=total1.toFixed(2);
			
			var fixed2=roundToTwo(<%=session.getAttribute("fixedptpk") %>);
			var variable2=roundToTwo(<%=session.getAttribute("variableptpk") %>);
			var	profit2=roundToTwo(<%=session.getAttribute("profitptpk") %>);
			var total2=roundToTwo(fixed2+variable2+profit2);
			total2=total2.toFixed(2);
						
						
			
            var chartDa = [
                {
                    "name": "Fixed<br>Cost",
                    "open": 0,
                    "close": fixed,
                    "color": "#0D47A1",
                    "balloonValue": fixed
                },
                {
                    "name": "Variable<br>Cost",
                    "open": fixed,
                    "close": variable+fixed,
                    "color": "#0D47A1",
                    "balloonValue": variable
                },
                {
                    "name": "Profit",
                    "open":variable+fixed,
                    "close": profit+variable+fixed,
                    "color": "#0D47A1",
                    "balloonValue": profit
                },
                {
                    "name": "Total<br>Cost",
                    "open": 0,
                    "close": profit+variable+fixed,
                    "color": "#1A237E",
                    "balloonValue": total
                },
            ];
			  var Data = [
                {
                    "name": "Fixed<br>Cost",
                    "open": 0,
                    "close": fixed1,
                    "color": "#0D47A1",
                    "balloonValue": fixed1
                },
                {
                    "name": "Variable<br>Cost",
                    "open": fixed1,
                    "close": variable1+fixed1,
                    "color": "#0D47A1",
                    "balloonValue": variable1
                },
                {
                    "name": "Profit",
                    "open":variable1+fixed1,
                    "close": profit1+variable1+fixed1,
                    "color": "#0D47A1",
                    "balloonValue": profit1
                },
                {
                    "name": "Total<br> Cost",
                    "open": 0,
                    "close": profit1+variable1+fixed1,
                    "color": "#1A237E",
                    "balloonValue": total1
                },
            ];
			  var cData = [
                {
                    "name": "Fixed<br>Cost",
                    "open": 0,
                    "close": fixed2,
                    "color": "#0D47A1",
                    "balloonValue": fixed2
                },
                {
                    "name": "Variable<br>Cost",
                    "open": fixed2,
                    "close": variable2+fixed2,
                    "color": "#0D47A1",
                    "balloonValue": variable2
                },
                {
                    "name": "Profit",
                    "open":variable2+fixed2,
                    "close": profit2+variable2+fixed2,
                    "color": "#0D47A1",
                    "balloonValue": profit2
                },
                {
                    "name": "Total<br>Cost",
                    "open": 0,
                    "close": profit2+variable2+fixed2,
                    "color": "#1A237E",
                    "balloonValue": total2
                },
            ];

            
			var chartData = [
                {
                    "name": "Depre<br>ciation",
                    "open": 0,
                    "close": Depreciation,
                    "color": "#0D47A1",
                    "balloonValue": Depreciation
                },
                {
                    "name": "Interest<br>Cost",
                    "open": Depreciation,
                    "close":Depreciation+Interest,
                    "color": "#0D47A1",
                    "balloonValue": Interest
                },
                {
                    "name": "Driver/<br>Cleaner<br>Salary",
                    "open":Depreciation+Interest,
                    "close": Depreciation+Interest+Salary,
                    "color": "#0D47A1",
                    "balloonValue": Salary
                },
              	{
                    "name": "Insurance",
                    "open": Depreciation+Interest+Salary,
                    "close": Depreciation+Interest+Salary+Insurance,
                    "color": "#0D47A1",
                    "balloonValue": Insurance
                },
				{
                    "name": "Road<br>Tax<br>(Including<br>Fitness)",
                    "open": Depreciation+Interest+Salary+Insurance,
                    "close": Depreciation+Interest+Salary+Insurance+Roadtax,
                    "color": "#0D47A1",
                    "balloonValue": Roadtax
                },
				{
                    "name": "Others",
                    "open": Depreciation+Interest+Salary+Insurance+Roadtax,
                    "close": Depreciation+Interest+Salary+Insurance+Roadtax+Others,
                    "color": "#0D47A1",
                    "balloonValue": Others
                },
				{
                    "name": "Total",
                    "open": 0,
                    "close": Depreciation+Interest+Salary+Insurance+Roadtax+Others,
                    "color": "#1A237E",
                    "balloonValue": Total
                },
            ];
				
				var chartD = [
                {
                    "name": "Diesel<br>Cost",
                    "open": 0,
                    "close": Diesel,
                    "color": "#0D47A1",
                    "balloonValue": Diesel
                },
                {
                    "name": "Toll<br>expenses",
                    "open": Diesel,
                    "close":Diesel+toll,
                    "color": "#0D47A1",
                    "balloonValue": toll
                },
                {
                    "name": "Tyre<br>Cost",
                    "open":Diesel+toll,
                    "close": Diesel+toll+tyre,
                    "color": "#0D47A1",
                    "balloonValue": tyre
                },
                {
                    "name": "Route<br>Expenses",
                    "open": Diesel+toll+tyre,
                    "close": Diesel+toll+tyre+route,
                    "color": "#0D47A1",
                    "balloonValue": route
                },
				{
                    "name": "Maintanence<br>Cost",
                    "open": Diesel+toll+tyre+route,
                    "close": Diesel+toll+tyre+route+cost,
                    "color": "#0D47A1",
                    "balloonValue": cost
                },
				{
                    "name": "Total",
                    "open": 0,
                    "close": Diesel+toll+tyre+route+cost,
                    "color": "#1A237E",
                    "balloonValue": Total1
                },
            ];

            AmCharts.ready(function () {
                // Waterfall chart is a simple serial chart with some specific settings
				chart = new AmCharts.AmSerialChart();
                chart.dataProvider = chartDa;
                chart.categoryField = "name";
                chart.columnWidth = 0.6;
                chart.startDuration = 1;
				
				chart1 = new AmCharts.AmSerialChart();
                chart1.dataProvider = Data;
                chart1.categoryField = "name";
                chart1.columnWidth = 0.6;
                chart1.startDuration = 1;
				
				chart2 = new AmCharts.AmSerialChart();
                chart2.dataProvider = cData;
                chart2.categoryField = "name";
                chart2.columnWidth = 0.6;
                chart2.startDuration = 1;        
			   
				chart3 = new AmCharts.AmSerialChart();
                chart3.dataProvider = chartData;
                chart3.categoryField = "name";
                chart3.columnWidth = .6;
                chart3.startDuration = 1;
				
				chart4 = new AmCharts.AmSerialChart();
                chart4.dataProvider = chartD;
                chart4.categoryField = "name";
                chart4.columnWidth = .6;
                chart4.startDuration = 1;

                // AXES
                // Category
				var categoryAxis = chart.categoryAxis;
                categoryAxis.gridAlpha = 0.1;
                categoryAxis.axisAlpha = 0;
                categoryAxis.gridPosition = "start";
				
				var categoryAxis1 = chart1.categoryAxis;
                categoryAxis1.gridAlpha = 0.1;
                categoryAxis1.axisAlpha = 0;
                categoryAxis1.gridPosition = "start";
				
				var categoryAxis2 = chart2.categoryAxis;
                categoryAxis2.gridAlpha = 0.1;
                categoryAxis2.axisAlpha = 0;
                categoryAxis2.gridPosition = "start";
				
                var categoryAxis3 = chart3.categoryAxis;
                categoryAxis3.gridAlpha = 0.1;
                categoryAxis3.axisAlpha = 0;
                categoryAxis3.gridPosition = "start";
				
				var categoryAxis4 = chart4.categoryAxis;
                categoryAxis4.gridAlpha = 0.1;
                categoryAxis4.axisAlpha = 0;
                categoryAxis4.gridPosition = "start";
				
				

                // Value
                var valueAxis = new AmCharts.ValueAxis();
                valueAxis.gridAlpha = 0.1;
                valueAxis.axisAlpha = 0;
                chart.addValueAxis(valueAxis);
				
				var valueAxis1 = new AmCharts.ValueAxis();
                valueAxis1.gridAlpha = 0.1;
                valueAxis1.axisAlpha = 0;
                chart1.addValueAxis(valueAxis1);
				
				var valueAxis2 = new AmCharts.ValueAxis();
                valueAxis2.gridAlpha = 0.1;
                valueAxis2.axisAlpha = 0;
                chart2.addValueAxis(valueAxis2);

                var valueAxis3 = new AmCharts.ValueAxis();
                valueAxis3.gridAlpha = 0.1;
                valueAxis3.axisAlpha = 0;
                chart3.addValueAxis(valueAxis3);
				
				var valueAxis4= new AmCharts.ValueAxis();
                valueAxis4.gridAlpha = 0.1;
                valueAxis4.axisAlpha = 0;
                chart4.addValueAxis(valueAxis4);

                // GRAPH
				
                var graph = new AmCharts.AmGraph();
                graph.valueField = "close";
                graph.openField = "open";
                graph.type = "column";
                graph.lineAlpha = 1;
                graph.lineColor = "#BBBBBB";
                graph.colorField = "color";
                graph.fillAlphas = 0.8;
                graph.balloonText = "<span style='color:[[color]]'>[[category]]</span><br><span style='font-size:13px;'><b>Rs.[[balloonValue]]</b></span>";
                graph.labelText = "Rs.[[balloonValue]]";
                chart.addGraph(graph);
				
				var graph1 = new AmCharts.AmGraph();
                graph1.valueField = "close";
                graph1.openField = "open";
                graph1.type = "column";
                graph1.lineAlpha = 1;
                graph1.lineColor = "#BBBBBB";
                graph1.colorField = "color";
                graph1.fillAlphas = 0.8;
                graph1.balloonText = "<span style='color:[[color]]'>[[category]]</span><br><span style='font-size:13px;'><b>Rs.[[balloonValue]]</b></span>";
                graph1.labelText = "Rs.[[balloonValue]]";
                chart1.addGraph(graph1);
				
				var graph2 = new AmCharts.AmGraph();
                graph2.valueField = "close";
                graph2.openField = "open";
                graph2.type = "column";
                graph2.lineAlpha = 1;
                graph2.lineColor = "#BBBBBB";
                graph2.colorField = "color";
                graph2.fillAlphas = 0.8;
                graph2.balloonText = "<span style='color:[[color]]'>[[category]]</span><br><span style='font-size:13px;'><b>Rs.[[balloonValue]]</b></span>";
                graph2.labelText = "Rs.[[balloonValue]]";
                chart2.addGraph(graph2);

                var graph3 = new AmCharts.AmGraph();
                graph3.valueField = "close";
                graph3.openField = "open";
                graph3.type = "column";
                graph3.lineAlpha = 1;
                graph3.lineColor = "#BBBBBB";
                graph3.colorField = "color";
                graph3.fillAlphas = 0.8;
                graph3.balloonText = "<span style='color:[[color]]'> [[category]] </span><br><span style='font-size:13px;'> <b>Rs.[[balloonValue]]</b></span>";
                graph3.labelText = "Rs.[[balloonValue]]";
                chart3.addGraph(graph3);
				
				
				var graph4 = new AmCharts.AmGraph();
                graph4.valueField = "close";
                graph4.openField = "open";
                graph4.type = "column";
                graph4.lineAlpha = 1;
                graph4.lineColor = "#BBBBBB";
                graph4.colorField = "color";
                graph4.fillAlphas = 0.8;
                graph4.balloonText = "<span style='color:[[color]]'> [[category]] </span><br><span style='font-size:13px;'> <b>Rs.[[balloonValue]]</b></span>";
                graph4.labelText = "Rs.[[balloonValue]]";
                chart4.addGraph(graph4);
                

                // WRITE
				chart.write("chartdiv");
				chart1.write("chart");
				chart2.write("div");
				document.getElementById("perkm").innerHTML=total;
				document.getElementById("perton").innerHTML=total1;
				document.getElementById("ptpk").innerHTML=total2;
                chart3.write("fixed");
				chart4.write("variable");
            });
			  
        </script>
</head>
<body onload="calcRoute()" class="panel-body">
	<div class="card">
		<input type="hidden" value='<%=session.getAttribute("start") %>'
			id="start"
		> <input type="hidden" value='<%=session.getAttribute("end") %>'
			id="end"
		>
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
				<li class="active"><a href="Auto.jsp">Auto</a></li>
				<li class="active"><a href="home.jsp">Classic</a></li>
				<li class="active"><a href="Advanced.jsp">Advanced</a></li>
				<li class="active" class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#"
				>Control Panel<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="Capex.jsp">Capex</a></li>
						<li><a href="fixed.jsp">Fixed Cost</a></li>
						<li><a href="variable.jsp">Variable Cost</a></li>
						<li><a href="trip.jsp">Trip Matrix</a></li>
					</ul></li>
				<li class="active"><a href="uploadFreight.jsp">Upload
						Freight</a></li>
				<li class="active"><a href="uploadContract.jsp">View
						Contract</a></li>
				<li class="active"><a href="GetLat.jsp">Get Lat Long</a></li>
				<li class="active"><a href="Help.jsp">Help/FAQs</a></li>
			</ul>
		</div>
		</nav>
		<section>
		<div class="login-card">
			<h5 class="panel-header" style="font-weight: bold; padding: 1%">Result
				Summary For Classic</h5>
			<ul class="nav nav-tabs">
				<li class="active"><a data-toggle="tab" href="#home">Summary</a></li>
				<li><a data-toggle="tab" href="#menu1">Cost/Km</a></li>
				<li><a data-toggle="tab" href="#menu2">Cost/Ton</a></li>
				<li><a data-toggle="tab" href="#menu3">Cost/Ton/Km</a></li>
				<li><a data-toggle="tab" href="#menu4">Fixed Cost</a></li>
				<li><a data-toggle="tab" href="#menu5">Variable Cost</a></li>
			</ul>
			<div class="tab-content">
				<div id="home" class="tab-pane fade in active">
					<div
						class="table-responsive table table-bordered table-condensed tabel-hover"
					>
						<table class="table table-bordered table-condensed tabel-hover">
							<tr>
								<td>Origin City :</td>
								<td><%=session.getAttribute("start") %></td>
							</tr>
							<tr>
								<td>Destination City :</td>
								<td><%=session.getAttribute("end") %></td>
							</tr>
							<tr>
								<td>
									<%DecimalFormat df = new DecimalFormat("#.##");
						Float dist=(Float)session.getAttribute("distance");%> Distance (In
									KM) :
								</td>
								<td><%=df.format(dist) %></td>
							</tr>
							<tr>
								<td>Cost per Km (INR):</td>
								<td id="perkm"></td>
							</tr>
							<tr>
								<td>Cost per ton (INR):</td>
								<td id="perton"></td>
							</tr>
							<tr>
								<td>Cost per Km per ton (INR):</td>
								<td id="ptpk"></td>
							</tr>
						</table>
					</div>
				</div>
				<div id="menu1" class="tab-pane fade">
					<h3>Cost/Km</h3>
					<div id="chartdiv" style="padding-left: 2%; height: 350px;"></div>
				</div>
				<div id="menu2" class="tab-pane fade">
					<h3>Cost/ton</h3>
					<div id="chart" style="padding-left: 2%; height: 350px;"></div>
				</div>
				<div id="menu3" class="tab-pane fade">
					<h3>Cost/Ton/Km</h3>
					<div id="div" style="padding-left: 2%; height: 350px;"></div>
				</div>
				<div id="menu4" class="tab-pane fade">
					<h3>Fixed Cost/Month/Km</h3>
					<br>
					<div id="fixed" style="padding-left: 2%; height: 250px;"></div>
				</div>
				<div id="menu5" class="tab-pane fade">
					<h3>Variable Cost/Km</h3>
					<div id="variable" style="padding-left: 2%; height: 250px;"></div>
				</div>
				<div align="center">
					<% Float cost=(Float)session.getAttribute("cost");
								int cos= cost.intValue();
								String co=NumberFormat.getNumberInstance().format(cos);%>Total
					cost of trip :<%=co %></div>
			</div>
		</section>
		<div id="map_canvas" class="right" style="height: 43%"></div>
		<div class="panel-body"></div>
		<footer class="panel-footer"
			style=" bottom:2%; text-align:center; color:white;position:  relative; "
		> Copyright &copy McKinsey & Company</footer>
	</div>
	</div>
	</div>
</body>
</html>
<%}%>