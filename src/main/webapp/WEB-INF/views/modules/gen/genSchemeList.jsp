<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>���ɷ�������</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/gen/genScheme/">���ɷ����б�</a></li>
		<shiro:hasPermission name="gen:genScheme:edit"><li><a href="${ctx}/gen/genScheme/form">���ɷ������</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="genScheme" action="${ctx}/gen/genScheme/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<label>�������� ��</label><form:input path="name" htmlEscape="false" maxlength="50" class="input-medium"/>
		&nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="��ѯ"/>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead><tr><th>��������</th><th>����ģ��</th><th>ģ����</th><th>������</th><th>��������</th><shiro:hasPermission name="gen:genScheme:edit"><th>����</th></shiro:hasPermission></tr></thead>
		<tbody>
		<c:forEach items="${page.list}" var="genScheme">
			<tr>
				<td><a href="${ctx}/gen/genScheme/form?id=${genScheme.id}">${genScheme.name}</a></td>
				<td>${genScheme.packageName}</td>
				<td>${genScheme.moduleName}${not empty genScheme.subModuleName?'.':''}${genScheme.subModuleName}</td>
				<td>${genScheme.functionName}</td>
				<td>${genScheme.functionAuthor}</td>
				<shiro:hasPermission name="gen:genScheme:edit"><td>
    				<a href="${ctx}/gen/genScheme/form?id=${genScheme.id}">�޸�</a>
					<a href="${ctx}/gen/genScheme/delete?id=${genScheme.id}" onclick="return confirmx('ȷ��Ҫɾ�������ɷ�����', this.href)">ɾ��</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>
