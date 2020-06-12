<%
response.setStatus(500);

// ��ȡ�쳣��
Throwable ex = Exceptions.getThrowable(request);
if (ex != null){
	LoggerFactory.getLogger("500.jsp").error(ex.getMessage(), ex);
}

// ���������Ϣ
StringBuilder sb = new StringBuilder("������Ϣ��\n");
if (ex != null) {
	sb.append(Exceptions.getStackTraceAsString(ex));
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
<%@page import="org.slf4j.Logger,org.slf4j.LoggerFactory"%>
<%@page import="com.fy.erp.common.web.Servlets"%>
<%@page import="com.fy.erp.common.utils.Exceptions"%>
<%@page import="com.fy.erp.common.utils.StringUtils"%>
<%@page contentType="text/html;charset=GBK"  isErrorPage="true"%>
<%@include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>500 - ϵͳ�ڲ�����</title>
	<%@include file="/WEB-INF/views/include/head.jsp" %>
</head>
<body>
	<div class="container-fluid">
		<div class="page-header"><h1>ϵͳ�ڲ�����.</h1></div>
		<div class="errorMessage">
			������Ϣ��<%=ex==null?"δ֪����.":StringUtils.toHtml(ex.getMessage())%> <br/> <br/>
			�������鿴��ϸ��Ϣ����ť������ϸ������Ϣ���͸�ϵͳ����Ա��лл��<br/> <br/>
			<a href="javascript:" onclick="history.go(-1);" class="btn">������һҳ</a> &nbsp;
			<a href="javascript:" onclick="$('.errorMessage').toggle();" class="btn">�鿴��ϸ��Ϣ</a>
		</div>
		<div class="errorMessage hide">
			<%=StringUtils.toHtml(sb.toString())%> <br/>
			<a href="javascript:" onclick="history.go(-1);" class="btn">������һҳ</a> &nbsp;
			<a href="javascript:" onclick="$('.errorMessage').toggle();" class="btn">������ϸ��Ϣ</a>
			<br/> <br/>
		</div>
		<script>try{top.$.jBox.closeTip();}catch(e){}</script>
	</div>
</body>
</html>
<%
} out = pageContext.pushBody();
%>