/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.0.26
 * Generated at: 2015-10-08 11:12:07 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class AdminnewModifyParam_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

final java.lang.String _jspx_method = request.getMethod();
if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET POST or HEAD");
return;
}

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=ISO-8859-1");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/homestyle.css\">\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">\r\n");
      out.write("<title>Parameter Master</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t");
String name = request.getParameter( "name" );
	 
      out.write("\r\n");
      out.write("\t<div class=\"card\">\r\n");
      out.write("\t\t<header>\r\n");
      out.write("\t\t<h1>CLEANSHEET</h1>\r\n");
      out.write("\t\t</header>\r\n");
      out.write("\t\t<p>\r\n");
      out.write("\t\t\tHello,\r\n");
      out.write("\t\t\t");
      out.print( session.getAttribute( "name" ) );
      out.write("\r\n");
      out.write("\t\t\t<a style=\"float: right;\" href=\"Logout\">Logout</a>\r\n");
      out.write("\t\t</p>\r\n");
      out.write("\t\t<nav> <a href=\"admin.jsp\">Basic</a> <br>\r\n");
      out.write("\t<a href=\"adminAdvanced.jsp\">Advanced</a> <br>\r\n");
      out.write("\t<a href=\"adminAuto.jsp\">Auto</a> <br>\r\n");
      out.write("\t<a href=\"adminParam.jsp\">Parameter Master</a> <br>\r\n");
      out.write("\t<a href=\"adminUploadFreight.jsp\">Upload Freight</a> <br>\r\n");
      out.write("\t<a href=\"adminUploadContract.jsp\">Upload Contract</a> <br>\r\n");
      out.write("\t<a href=\"UserSession.jsp\">User Session</a> <br>\r\n");
      out.write("\t<a href=\"editTable.jsp\">Edit Table</a> <br>\r\n");
      out.write("\t</nav>\r\n");
      out.write("\t\t<section style=\"width:79%\">\r\n");
      out.write("\t\t<center>\r\n");
      out.write("\t\t\t<h2>Modify Parameter</h2>\r\n");
      out.write("\t\t\t<form action=\"Update\" method=\"post\">\r\n");
      out.write("\t\t\t\t<h2>Truck Parameter</h2>\r\n");
      out.write("\t\t\t\t<table>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<th colspan=\"8\"><center>Assumption For Fixed Cost</center></th>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td>Capacity (tons)</td>\r\n");
      out.write("\t\t\t\t\t\t<td>Cost of Truck (INR)</td>\r\n");
      out.write("\t\t\t\t\t\t<td>Type Of Goods</td>\r\n");
      out.write("\t\t\t\t\t\t<td>Residual value of the truck at end of EMI (%)</td>\r\n");
      out.write("\t\t\t\t\t\t<td>Loan amount(%)</td>\r\n");
      out.write("\t\t\t\t\t\t<td>No. of years of EMI payment</td>\r\n");
      out.write("\t\t\t\t\t\t<td>Rate of Interest (%)</td>\r\n");
      out.write("\t\t\t\t\t\t<td>Flat Rate of Interest (%)</td>\r\n");
      out.write("\t\t\t\t\t\t<td>Insurance as percentage of vehicle cost (% p.a.)</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"text\" name=\"cap\"\r\n");
      out.write("\t\t\t\t\t\t\tvalue='");
      out.print(Integer.parseInt(request.getParameter( "cap" )) );
      out.write("'\r\n");
      out.write("\t\t\t\t\t\t\treadonly=\"readonly\"\r\n");
      out.write("\t\t\t\t\t\t></td>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"text\" name=\"cost\" required></td>\r\n");
      out.write("\t\t\t\t\t\t<td><select name=\"good\"\r\n");
      out.write("\t\t\t\t\t\t\tstyle='font-family: Palatino Linotype'\r\n");
      out.write("\t\t\t\t\t\t>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"Container\" name=\"good\"\r\n");
      out.write("\t\t\t\t\t\t\t\t\tstyle='font-family: Palatino Linotype'\r\n");
      out.write("\t\t\t\t\t\t\t\t>Container</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"Bulk\" name=\"good\"\r\n");
      out.write("\t\t\t\t\t\t\t\t\tstyle='font-family: Palatino Linotype'\r\n");
      out.write("\t\t\t\t\t\t\t\t>Bulk</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"Liquid\" name=\"good\"\r\n");
      out.write("\t\t\t\t\t\t\t\t\tstyle='font-family: Palatino Linotype'\r\n");
      out.write("\t\t\t\t\t\t\t\t>Liquid</option>\r\n");
      out.write("\t\t\t\t\t\t\t\t<option value=\"Temp. Controlled\" name=\"good\"\r\n");
      out.write("\t\t\t\t\t\t\t\t\tstyle='font-family: Palatino Linotype'\r\n");
      out.write("\t\t\t\t\t\t\t\t>Temp. Controlled</option>\r\n");
      out.write("\t\t\t\t\t\t</select></td>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"text\" name=\"residual\" required></td>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"text\" name=\"loan\" required></td>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"text\" name=\"emi\" required></td>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"text\" name=\"roi\" required></td>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"text\" name=\"flatroi\" required></td>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"text\" name=\"insurance\" required></td>\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t<table>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<th colspan=\"9\"><center>Assumption For Variable Cost</center></th>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td>Tyre life (Km)</td>\r\n");
      out.write("\t\t\t\t\t\t<td>Tyre life (Retredded tyre) (Km)</td>\r\n");
      out.write("\t\t\t\t\t\t<td>Tyre Cost (INR)</td>\r\n");
      out.write("\t\t\t\t\t\t<td>Tyre Cost (Retreading) (INR)</td>\r\n");
      out.write("\t\t\t\t\t\t<td>No. of tyres</td>\r\n");
      out.write("\t\t\t\t\t\t<td>Diesel cost (INR)</td>\r\n");
      out.write("\t\t\t\t\t\t<td>Diesel Mileage Km/L</td>\r\n");
      out.write("\t\t\t\t\t\t<td>Diesel Mileage (With Load) Km/L</td>\r\n");
      out.write("\t\t\t\t\t\t<td>No. Of Trips Per Month</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"text\" name=\"newtyre\" required></td>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"text\" name=\"oldtyre\" required></td>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"text\" name=\"newtyrecost\" required></td>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"text\" name=\"oldtyrecost\" required></td>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"text\" name=\"notyre\" required></td>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"text\" name=\"dieselcost\" required></td>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"text\" name=\"mileage\" required></td>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"text\" name=\"mileagewithload\" required></td>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"text\" name=\"notrip\" required></td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<br>\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t<table>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<th colspan=\"8\"><center>Fixed Cost</center></th>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td>Driver/Cleaner monthly salary</td>\r\n");
      out.write("\t\t\t\t\t\t<td>Driver/Cleaner monthly bhatta</td>\r\n");
      out.write("\t\t\t\t\t\t<td>Maintenace (per month)</td>\r\n");
      out.write("\t\t\t\t\t\t<td>Road tax per month (including fitness)(Annually)</td>\r\n");
      out.write("\t\t\t\t\t\t<td>Road permit per month (Annually)</td>\r\n");
      out.write("\t\t\t\t\t\t<td>Admin Costs</td>\r\n");
      out.write("\t\t\t\t\t\t<td>Tarpaulin</td>\r\n");
      out.write("\t\t\t\t\t\t<td>Loading Charges</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"text\" name=\"salary\" required></td>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"text\" name=\"bhatta\" required></td>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"text\" name=\"maintenace\" required></td>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"text\" name=\"roadtax\" required></td>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"text\" name=\"roadpermit\" required></td>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"text\" name=\"admincost\" required></td>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"text\" name=\"tarpaulin\" required></td>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"text\" name=\"loading\" required></td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t<br>\r\n");
      out.write("\t\t\t\t<h2>Route Parameter</h2>\r\n");
      out.write("\t\t\t\t<table>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<th colspan=\"3\">Variable Cost</th>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td>Toll per km</td>\r\n");
      out.write("\t\t\t\t\t\t<td>Route expenses per km</td>\r\n");
      out.write("\t\t\t\t\t\t<td>Maintanence cost per km</td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"text\" name=\"toll\" required></td>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"text\" name=\"routeexpences\" required></td>\r\n");
      out.write("\t\t\t\t\t\t<td><input type=\"text\" name=\"maintanecekm\" required></td>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t<td colspan=\"25\"><center>\r\n");
      out.write("\t\t\t\t\t\t\t\t<input type=\"hidden\" value='");
      out.print(session.getAttribute("empid"));
      out.write("'\r\n");
      out.write("\t\t\t\t\t\t\t\t\tname=\"empid\"\r\n");
      out.write("\t\t\t\t\t\t\t\t> <input type=\"submit\" name=\"submit\" value=\"Submit\">\r\n");
      out.write("\t\t\t\t\t\t\t</center>\r\n");
      out.write("\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t</table>\r\n");
      out.write("\t\t\t</form>\r\n");
      out.write("\t\t</center>\r\n");
      out.write("\t\t<br>\r\n");
      out.write("\t\t<br>\r\n");
      out.write("\t\t</section>\r\n");
      out.write("\t\t<footer style=\"position:relative\"> Copyright © McKinsey &\r\n");
      out.write("\t\tCompany </footer>\r\n");
      out.write("\t</div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
