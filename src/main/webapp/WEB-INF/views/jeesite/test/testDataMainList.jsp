<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>���ӱ����</title>
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
		<li class="active"><a href="${ctx}/test/testDataMain/">���ӱ��б�</a></li>
		<shiro:hasPermission name="test:testDataMain:edit"><li><a href="${ctx}/test/testDataMain/form">���ӱ����</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="testDataMain" action="${ctx}/test/testDataMain/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>�����û���</label>
				<sys:treeselect id="user" name="user.id" value="${testDataMain.user.id}" labelName="user.name" labelValue="${testDataMain.user.name}"
					title="�û�" url="/sys/office/treeData?type=3" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/>
			</li>
			<li><label>���ƣ�</label>
				<form:input path="name" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>�Ա�</label>
				<form:select path="sex" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('sex')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="��ѯ"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>�����û�</th>
				<th>����</th>
				<th>����ʱ��</th>
				<th>��ע��Ϣ</th>
				<shiro:hasPermission name="test:testDataMain:edit"><th>����</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="testDataMain">
			<tr>
				<td><a href="${ctx}/test/testDataMain/form?id=${testDataMain.id}">
					${testDataMain.user.name}
				</a></td>
				<td>
					${testDataMain.name}
				</td>
				<td>
					<fmt:formatDate value="${testDataMain.updateDate}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${testDataMain.remarks}
				</td>
				<shiro:hasPermission name="test:testDataMain:edit"><td>
    				<a href="${ctx}/test/testDataMain/form?id=${testDataMain.id}">�޸�</a>
					<a href="${ctx}/test/testDataMain/delete?id=${testDataMain.id}" onclick="return confirmx('ȷ��Ҫɾ�������ӱ���', this.href)">ɾ��</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>