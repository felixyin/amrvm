<%
response.setStatus(400);

// ��ȡ�쳣��
Throwable ex = Exceptions.getThrowable(request);

// ���������Ϣ
StringBuilder sb = new StringBuilder("������Ϣ��\n");
if (ex != null) {
	if (ex instanceof BindException) {
		for (ObjectError e : ((BindException)ex).getGlobalErrors()){
			sb.append("��" + e.getDefaultMessage() + "(" + e.getObjectName() + ")\n");
		}
		for (FieldError e : ((BindException)ex).getFieldErrors()){
			sb.append("��" + e.getDefaultMessage() + "(" + e.getField() + ")\n");
		}
		LoggerFactory.getLogger("400.jsp").warn(ex.getMessage(), ex);
	}else if (ex instanceof ConstraintViolationException) {
		for (ConstraintViolation<?> v : ((ConstraintViolationException)ex).getConstraintViolations()) {
			sb.append("��" + v.getMessage() + "(" + v.getPropertyPath() + ")\n");
		}
	} else {
		//sb.append(Exceptions.getStackTraceAsString(ex));
		sb.append("��" + ex.getMessage());
	}
} else {
	sb.append("δ֪����.\n\n");
}

// ������첽��������ֻ��ˣ���ֱ�ӷ�����Ϣ
if (Servlets.isAjaxRequest(request)) {
	out.print(sb);
}

// ����쳣��Ϣҳ��
else {
%>
<%@page import="javax.validation.ConstraintViolation"%>
<%@page import="javax.validation.ConstraintViolationException"%>
<%@page import="org.springframework.validation.BindException"%>
<%@page import="org.springframework.validation.ObjectError"%>
<%@page import="org.springframework.validation.FieldError"%>
<%@page import="org.slf4j.Logger,org.slf4j.LoggerFactory"%>
<%@page import="com.fy.erp.common.web.Servlets"%>
<%@page import="com.fy.erp.common.utils.Exceptions"%>
<%@page import="com.fy.erp.common.utils.StringUtils"%>
<%@page contentType="text/html;charset=GBK"  isErrorPage="true"%>
<%@include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>400 - �������</title>
	<%@include file="/WEB-INF/views/include/head.jsp" %>
</head>
<body>
	<div class="container-fluid">
		<div class="page-header"><h1>��������,�������޷�����.</h1></div>
		<div class="errorMessage">
			<%=StringUtils.toHtml(sb.toString())%> <br/>
		</div>
		<a href="javascript:" onclick="history.go(-1);" class="btn">������һҳ</a> &nbsp;
		<br/> <br/>
		<script>try{top.$.jBox.closeTip();}catch(e){}</script>
	</div>
</body>
</html>
<%
} out = pageContext.pushBody();
%>