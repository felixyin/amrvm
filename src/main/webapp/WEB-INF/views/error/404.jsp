<%
response.setStatus(404);

// ������첽��������ֻ��ˣ���ֱ�ӷ�����Ϣ
if (Servlets.isAjaxRequest(request)) {
	out.print("ҳ�治����.");
}

//����쳣��Ϣҳ��
else {
%>
<%@page import="com.fy.erp.common.web.Servlets"%>
<%@page contentType="text/html;charset=GBK"  isErrorPage="true"%>
<%@include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>404 - ҳ�治����</title>
	<%@include file="/WEB-INF/views/include/head.jsp" %>
</head>
<body>
	<div class="container-fluid">
		<div class="page-header"><h1>ҳ�治����.</h1></div>
		<div><a href="javascript:" onclick="history.go(-1);" class="btn">������һҳ</a></div>
		<script>try{top.$.jBox.closeTip();}catch(e){}</script>
	</div>
</body>
</html>
<%
out.print("<!--"+request.getAttribute("javax.servlet.forward.request_uri")+"-->");
} out = pageContext.pushBody();
%>