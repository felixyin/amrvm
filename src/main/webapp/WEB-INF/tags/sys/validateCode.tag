<%@ tag language="java" pageEncoding="GBK"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="name" type="java.lang.String" required="true" description="��֤�����������"%>
<%@ attribute name="inputCssStyle" type="java.lang.String" required="false" description="��֤����ʽ"%>
<%@ attribute name="imageCssStyle" type="java.lang.String" required="false" description="��֤��ͼƬ��ʽ"%>
<%@ attribute name="buttonCssStyle" type="java.lang.String" required="false" description="�����尴ť��ʽ"%>
<input type="text" id="${name}" name="${name}" maxlength="5" class="txt required" style="font-weight:bold;width:45px;${inputCssStyle}"/>
<img src="${pageContext.request.contextPath}/servlet/validateCodeServlet" onclick="$('.${name}Refresh').click();" class="mid ${name}" style="${imageCssStyle}"/>
<a href="javascript:" onclick="$('.${name}').attr('src','${pageContext.request.contextPath}/servlet/validateCodeServlet?'+new Date().getTime());" class="mid ${name}Refresh" style="${buttonCssStyle}">������</a>