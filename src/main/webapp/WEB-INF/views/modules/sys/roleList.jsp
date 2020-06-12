]<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>��ɫ����</title>
	<meta name="decorator" content="default"/>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/sys/role/">��ɫ�б�</a></li>
		<shiro:hasPermission name="sys:role:edit"><li><a href="${ctx}/sys/role/form">��ɫ���</a></li></shiro:hasPermission>
	</ul>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<tr><th>��ɫ����</th><th>Ӣ������</th><th>��������</th><th>���ݷ�Χ</th><shiro:hasPermission name="sys:role:edit"><th>����</th></shiro:hasPermission></tr>
		<c:forEach items="${list}" var="role">
			<tr>
				<td><a href="form?id=${role.id}">${role.name}</a></td>
				<td><a href="form?id=${role.id}">${role.enname}</a></td>
				<td>${role.office.name}</td>
				<td>${fns:getDictLabel(role.dataScope, 'sys_data_scope', '��')}</td>
				<shiro:hasPermission name="sys:role:edit"><td>
					<a style="color: #0b2c89" href="${ctx}/sys/role/assign?id=${role.id}">����</a>
					<c:if test="${(role.sysData eq fns:getDictValue('��', 'yes_no', '1') && fns:getUser().admin)||!(role.sysData eq fns:getDictValue('��', 'yes_no', '1'))}">
						<a style="color: #0b2c89" href="${ctx}/sys/role/form?id=${role.id}">�޸�</a>
					</c:if>
					<a style="color: #0b2c89" href="${ctx}/sys/role/delete?id=${role.id}" onclick="return confirmx('ȷ��Ҫɾ���ý�ɫ��', this.href)">ɾ��</a>
				</td></shiro:hasPermission>	
			</tr>
		</c:forEach>
	</table>
</body>
</html>