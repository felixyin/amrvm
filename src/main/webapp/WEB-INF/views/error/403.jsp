<%
response.setStatus(403);

//��ȡ�쳣��
Throwable ex = Exceptions.getThrowable(request);

// ������첽��������ֻ��ˣ���ֱ�ӷ�����Ϣ
if (Servlets.isAjaxRequest(request)) {
	if (ex!=null && StringUtils.startsWith(ex.getMessage(), "msg:")){
		out.print(StringUtils.replace(ex.getMessage(), "msg:", ""));
	}else{
		out.print("����Ȩ�޲���.");
	}
}

//����쳣��Ϣҳ��
else {
%>
<%@page import="com.fy.erp.common.web.Servlets"%>
<%@page import="com.fy.erp.common.utils.Exceptions"%>
<%@page import="com.fy.erp.common.utils.StringUtils"%>
<%@page contentType="text/html;charset=GBK"  isErrorPage="true"%>
<%@include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>403 - ����Ȩ�޲���</title>
	<%@include file="/WEB-INF/views/include/head.jsp" %>
</head>
<body>
	<div class="container-fluid">
		<div class="page-header"><h1>����Ȩ�޲���.</h1></div>
		<%
			if (ex!=null && StringUtils.startsWith(ex.getMessage(), "msg:")){
				out.print("<div>"+StringUtils.replace(ex.getMessage(), "msg:", "")+" <br/> <br/></div>");
			}
		%>
		<div><a href="javascript:" onclick="history.go(-1);" class="btn">������һҳ</a></div>
		<script>try{top.$.jBox.closeTip();}catch(e){}</script>
	</div>
</body>
</html>
<%
} out = pageContext.pushBody();
%>