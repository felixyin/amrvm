<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>����ģ�����</title>
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
		<li class="active"><a href="${ctx}/gen/genTemplate/">����ģ���б�</a></li>
		<shiro:hasPermission name="gen:genTemplate:edit"><li><a href="${ctx}/gen/genTemplate/form">����ģ�����</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="genTemplate" action="${ctx}/gen/genTemplate/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<label>���� ��</label><form:select path="category" class="input-medium">
			<form:option value=""></form:option>
			<form:options items="${fns:getDictList('gen_category')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
		</form:select>
		<label>���� ��</label><form:input path="name" htmlEscape="false" maxlength="50" class="input-medium"/>
		&nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="��ѯ"/>
	</form:form>
	<div id="messageBoxError" class="alert alert-error"><button data-dismiss="alert" class="close">��</button>
		����ģ������ѷ�����ģ������ΪXML���÷�ʽ����  /src/main/java/com/thinkgem/jeesite/modules/gen/template �ļ���
	</div>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead><tr><th>����</th><th>����</th><th>��ע</th><shiro:hasPermission name="gen:genTemplate:edit"><th>����</th></shiro:hasPermission></tr></thead>
		<tbody>
		<c:forEach items="${page.list}" var="genTemplate">
			<tr>
				<td><a href="${ctx}/gen/genTemplate/form?id=${genTemplate.id}">${genTemplate.name}</a></td>
				<td>${fns:getDictLabels(genTemplate.category, 'gen_category', '')}</td>
				<td>${fns:abbr(genTemplate.remarks, 100)}</td>
				<shiro:hasPermission name="gen:genTemplate:edit"><td>
    				<a href="${ctx}/gen/genTemplate/form?id=${genTemplate.id}">�޸�</a>
					<a href="${ctx}/gen/genTemplate/delete?id=${genTemplate.id}" onclick="return confirmx('ȷ��Ҫɾ���ô���ģ����', this.href)">ɾ��</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>
