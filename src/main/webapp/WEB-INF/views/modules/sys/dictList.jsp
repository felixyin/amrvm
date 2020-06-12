<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>�ֵ����</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
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
		<li class="active"><a href="${ctx}/sys/dict/">�ֵ��б�</a></li>
		<shiro:hasPermission name="sys:dict:edit"><li><a href="${ctx}/sys/dict/form?sort=10">�ֵ����</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="dict" action="${ctx}/sys/dict/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<label>���ͣ�</label><form:select id="type" path="type" class="input-medium"><form:option value="" label=""/><form:options items="${typeList}" htmlEscape="false"/></form:select>
		&nbsp;&nbsp;<label>���� ��</label><form:input path="description" htmlEscape="false" maxlength="50" class="input-medium"/>
		&nbsp;<input id="btnSubmit" class="btn btn-primary" type="submit" value="��ѯ"/>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead><tr><th>��ֵ</th><th>��ǩ</th><th>����</th><th>����</th><th>����</th><shiro:hasPermission name="sys:dict:edit"><th>����</th></shiro:hasPermission></tr></thead>
		<tbody>
		<c:forEach items="${page.list}" var="dict">
			<tr>
				<td>${dict.value}</td>
				<td><a href="${ctx}/sys/dict/form?id=${dict.id}">${dict.label}</a></td>
				<td><a href="javascript:" onclick="$('#type').val('${dict.type}');$('#searchForm').submit();return false;">${dict.type}</a></td>
				<td>${dict.description}</td>
				<td>${dict.sort}</td>
				<shiro:hasPermission name="sys:dict:edit"><td>
    				<a href="${ctx}/sys/dict/form?id=${dict.id}" style="color: #0b2c89">�޸�</a>
					<a  style="color: #0b2c89" href="${ctx}/sys/dict/delete?id=${dict.id}&type=${dict.type}" onclick="return confirmx('ȷ��Ҫɾ�����ֵ���', this.href)">ɾ��</a>
    				<a style="color: #0b2c89" href="<c:url value='${fns:getAdminPath()}/sys/dict/form?type=${dict.type}&sort=${dict.sort+10}'><c:param name='description' value='${dict.description}'/></c:url>">��Ӽ�ֵ</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>