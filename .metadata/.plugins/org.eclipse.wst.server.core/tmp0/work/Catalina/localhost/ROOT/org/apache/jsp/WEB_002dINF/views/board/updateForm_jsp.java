/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.54
 * Generated at: 2021-11-26 01:30:16 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.views.board;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class updateForm_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(2);
    _jspx_dependants.put("jar:file:/C:/springCoding/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/lastProject/WEB-INF/lib/jstl-1.2.jar!/META-INF/c.tld", Long.valueOf(1153352682000L));
    _jspx_dependants.put("/WEB-INF/lib/jstl-1.2.jar", Long.valueOf(1637024497083L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fif_0026_005ftest;

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.release();
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
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
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("	<head>\r\n");
      out.write("		<meta charset=\"UTF-8\">\r\n");
      out.write("		<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge, chrome=1\" />\r\n");
      out.write("		<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no\" />\r\n");
      out.write("      	<link rel=\"shortcut icon\" href=\"/resources/image/icon.png\" />\r\n");
      out.write("		<link rel=\"apple-touch-icon\" href=\"/resources/image/icon.png\" />\r\n");
      out.write("		<!--[if lt IE 9]>\r\n");
      out.write("		<script src=\"/resources/js/html5shiv.js\"></script>\r\n");
      out.write("		<![endif]-->\r\n");
      out.write("		<script type=\"text/javascript\" src=\"/resources/include/js/common.js\"></script>\r\n");
      out.write("		<script type=\"text/javascript\" src=\"/resources/include/js/jquery-1.12.4.min.js\"></script>\r\n");
      out.write("		<title>수정 화면</title>\r\n");
      out.write("		<script type=\"text/javascript\">\r\n");
      out.write("			$(function(){\r\n");
      out.write("				$(\"#boardUpdateBtn\").click(function(){\r\n");
      out.write("					if(!chkData (\"#b_title\", \"제목을\")) return;\r\n");
      out.write("					else if(!chkData (\"#b_content\", \"수정할 내용을\")) return;\r\n");
      out.write("					else{\r\n");
      out.write("						if($(\"#file\").val() != \"\"){\r\n");
      out.write("							if(!chkFile($(\"#file\"))) return;\r\n");
      out.write("						}\r\n");
      out.write("						$(\"#f_updateForm\").attr({\r\n");
      out.write("							method : \"post\",\r\n");
      out.write("							enctype: \"multipart/form-data\",\r\n");
      out.write("							action : \"/board/boardUpdate\"\r\n");
      out.write("						});\r\n");
      out.write("						$(\"#f_updateForm\").submit();\r\n");
      out.write("					}\r\n");
      out.write("				});\r\n");
      out.write("				\r\n");
      out.write("				$(\"#boardListBtn\").click(function(){\r\n");
      out.write("					location.href=\"/board/boardList\";\r\n");
      out.write("				});\r\n");
      out.write("				\r\n");
      out.write("				$(\"#boardCancleBtn\").click(function(){\r\n");
      out.write("					$(\"#f_updateForm\").each(function(){\r\n");
      out.write("						this.reset();\r\n");
      out.write("					});\r\n");
      out.write("				});\r\n");
      out.write("			});\r\n");
      out.write("		</script>\r\n");
      out.write("	</head>\r\n");
      out.write("	<body>\r\n");
      out.write("		<div class=\"container\">\r\n");
      out.write("		<h1>게시글 수정</h1>\r\n");
      out.write("		<div class=\"form-group\">\r\n");
      out.write("		<form id=\"f_updateForm\" class=\"form-horizontal\">\r\n");
      out.write("			<input type=\"hidden\" id=\"b_num\" name=\"b_num\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${updateData.b_num }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\" />\r\n");
      out.write("			<input type=\"hidden\" id=\"b_file\" name=\"b_file\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${updateData.b_file }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\" />\r\n");
      out.write("			<input type=\"hidden\" id=\"b_thumb\" name=\"b_thumb\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${updateData.b_thumb }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\" />\r\n");
      out.write("			\r\n");
      out.write("		<table class=\"table table-bordered\">\r\n");
      out.write("				<tbody>\r\n");
      out.write("					<tr>\r\n");
      out.write("						<td class=\"col-md-3\">글 번호</td>\r\n");
      out.write("						<td class=\"text-left cld-md-3\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${updateData.b_num }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</td>\r\n");
      out.write("						<td class=\"col-md-3\">작성일</td>\r\n");
      out.write("						<td class=\"text-left cld-md-3\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${updateData.b_date }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</td>\r\n");
      out.write("					</tr>\r\n");
      out.write("					<tr>\r\n");
      out.write("						<td class=\"text-center\">작성자</td>\r\n");
      out.write("						<td colspan=\"3\" class=\"text-left\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${updateData.b_name }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</td>\r\n");
      out.write("					</tr>\r\n");
      out.write("					<tr>\r\n");
      out.write("						<td class=\"text-center\">글 제목</td>\r\n");
      out.write("						<td colspan=\"3\"><input type=\"text\" class=\"form-control\" name=\"b_title\" id=\"b_title\" maxlength=\"50\" value=\"");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${updateData.b_title }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\"></td>\r\n");
      out.write("					</tr>\r\n");
      out.write("					<tr>\r\n");
      out.write("					<tr class=\"table-tr-height\">\r\n");
      out.write("						<td class=\"text-center\">글 내용</td>\r\n");
      out.write("						<td colspan=\"3\"><textarea name=\"b_content\" id=\"b_content\" rows=\"8\" class=\"form-control\">");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${updateData.b_content }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</textarea></td>\r\n");
      out.write("					</tr>\r\n");
      out.write("					<tr>\r\n");
      out.write("						<td class=\"text-center\">비밀번호</td>\r\n");
      out.write("						<td colspan=\"3\"><input type=\"password\" name=\"b_pwd\" id=\"b_pwd\" class=\"form-control\" maxlength=\"15\"></td>\r\n");
      out.write("					</tr>\r\n");
      out.write("					<tr>\r\n");
      out.write("						<td>파일첨부</td>\r\n");
      out.write("						<td colspan=\"3\" class=\"text-left\"><input type=\"file\" name=\"file\" id=\"file\"/></td>\r\n");
      out.write("					</tr>\r\n");
      out.write("						");
      if (_jspx_meth_c_005fif_005f0(_jspx_page_context))
        return;
      out.write("			\r\n");
      out.write("				</tbody>\r\n");
      out.write("			</table>\r\n");
      out.write("		</form>\r\n");
      out.write("			\r\n");
      out.write("				<div class=\"text-right\">\r\n");
      out.write("				<input type=\"button\" value=\"수정완료\" id=\"boardUpdateBtn\" class=\"btn btn-default\" />\r\n");
      out.write("				<input type=\"button\" value=\"목록\" id=\"boardListBtn\" class=\"btn btn-default\" />\r\n");
      out.write("				<input type=\"button\" value=\"취소\" id=\"boardCancleBtn\" class=\"btn btn-default\"/>\r\n");
      out.write("				</div>\r\n");
      out.write("			\r\n");
      out.write("			</div>\r\n");
      out.write("		</div>\r\n");
      out.write("	</body>\r\n");
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

  private boolean _jspx_meth_c_005fif_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f0 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    boolean _jspx_th_c_005fif_005f0_reused = false;
    try {
      _jspx_th_c_005fif_005f0.setPageContext(_jspx_page_context);
      _jspx_th_c_005fif_005f0.setParent(null);
      // /WEB-INF/views/board/updateForm.jsp(86,6) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fif_005f0.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${not empty updateData.b_file}", boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null)).booleanValue());
      int _jspx_eval_c_005fif_005f0 = _jspx_th_c_005fif_005f0.doStartTag();
      if (_jspx_eval_c_005fif_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
        do {
          out.write("\r\n");
          out.write("					");
          out.write("\r\n");
          out.write("					<tr>\r\n");
          out.write("						<td class=\"text-center\">이미지</td>\r\n");
          out.write("						<td colspan=\"3\" class=\"text-left col-md-8\">\r\n");
          out.write("								<img src=\"/uploadStorage/board/");
          out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${updateData.b_file}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
          out.write("\" />\r\n");
          out.write("						</td>\r\n");
          out.write("					</tr>\r\n");
          out.write("					");
          int evalDoAfterBody = _jspx_th_c_005fif_005f0.doAfterBody();
          if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
            break;
        } while (true);
      }
      if (_jspx_th_c_005fif_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
        return true;
      }
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f0);
      _jspx_th_c_005fif_005f0_reused = true;
    } finally {
      org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_c_005fif_005f0, _jsp_getInstanceManager(), _jspx_th_c_005fif_005f0_reused);
    }
    return false;
  }
}
