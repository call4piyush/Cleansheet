/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.64
 * Generated at: 2015-10-20 04:38:49 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Param_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

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

      out.write('\r');
      out.write('\n');
 	 if(session==null )
        {
            response.sendRedirect("index.jsp");
            return;
        }else{
 
      out.write("\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"css/homestyle.css\">\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=ISO-8859-1\">\r\n");
      out.write("<title>Control Panel</title>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"./css/styles.css\" type=\"text/css\">\r\n");
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
      out.write("\t\t");
response.sendRedirect("Capex.jsp"); 
      out.write("\r\n");
      out.write("\t\t<nav> <a href=\"Auto.jsp\">Auto</a> <br>\r\n");
      out.write("\t\t<a href=\"home.jsp\">Classic</a> <br>\r\n");
      out.write("\t\t<a href=\"Advanced.jsp\">Advanced</a> <br>\r\n");
      out.write("\t\t<a href=\"Param.jsp\">Control Panel</a>\r\n");
      out.write("\t\t<ul type=\"circle\" compact=\"true\">\r\n");
      out.write("\t\t\t<li><a href=\"Capex.jsp\"> Capex</a></li>\r\n");
      out.write("\t\t\t<li><a href=\"fixed.jsp\"> Fixed Cost</a></li>\r\n");
      out.write("\t\t\t<li><a href=\"variable.jsp\"> Variable Cost</a></li>\r\n");
      out.write("\t\t\t<li><a href=\"trip.jsp\"> Trip Matrix</a></li>\r\n");
      out.write("\t\t</ul>\r\n");
      out.write("\t\t<a href=\"uploadFreight.jsp\">Upload Freight</a> <br>\r\n");
      out.write("\t\t<a href=\"uploadContract.jsp\">Upload Contract</a> <br>\r\n");
      out.write("\t\t</nav>\r\n");
      out.write("\t\t<section style=\"width:79%\"> </section>\r\n");
      out.write("\t\t<footer style=\"position:  relative;\"> Copyright © McKinsey &\r\n");
      out.write("\t\tCompany </footer>\r\n");
      out.write("\t</div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
}
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
