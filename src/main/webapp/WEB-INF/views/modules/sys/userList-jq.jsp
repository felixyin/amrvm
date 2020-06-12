<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>�û�����</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#btnExport").click(function(){
				top.$.jBox.confirm("ȷ��Ҫ�����û�������","ϵͳ��ʾ",function(v,h,f){
					if(v=="ok"){
						$("#searchForm").attr("action","${ctx}/sys/user/export");
						$("#searchForm").submit();
					}
				},{buttonsFocus:1});
				top.$('.jbox-body .jbox-icon').css('top','55px');
			});
			$("#btnImport").click(function(){
				$.jBox($("#importBox").html(), {title:"��������", buttons:{"�ر�":true}, 
					bottomText:"�����ļ����ܳ���5M���������롰xls����xlsx����ʽ�ļ���"});
			});
		});
		function page(n,s){
			if(n) $("#pageNo").val(n);
			if(s) $("#pageSize").val(s);
			$("#searchForm").attr("action","${ctx}/sys/user/list");
			$("#searchForm").submit();
	    	return false;
	    }
	</script>
</head>
<body>
	<div id="importBox" class="hide">
		<form id="importForm" action="${ctx}/sys/user/import" method="post" enctype="multipart/form-data"
			class="form-search" style="padding-left:20px;text-align:center;" onsubmit="loading('���ڵ��룬���Ե�...');"><br/>
			<input id="uploadFile" name="file" type="file" style="width:330px"/><br/><br/>����
			<input id="btnImportSubmit" class="btn btn-primary" type="submit" value="   ��    ��   "/>
			<a href="${ctx}/sys/user/import/template">����ģ��</a>
		</form>
	</div>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/sys/user/list">�û��б�</a></li>
		<shiro:hasPermission name="sys:user:edit"><li><a href="${ctx}/sys/user/form">�û����</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="user" action="${ctx}/sys/user/listData" method="post" class="breadcrumb form-search ">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<sys:tableSort id="orderBy" name="orderBy" value="${page.orderBy}" callback="page();"/>
		<ul class="ul-form">
			<li><label>������˾��</label><sys:treeselect id="company" name="company.id" value="${user.company.id}" labelName="company.name" labelValue="${user.company.name}" 
				title="��˾" url="/sys/office/treeData?type=1" cssClass="input-small" allowClear="true"/></li>
			<li><label>��¼����</label><form:input path="loginName" htmlEscape="false" maxlength="50" class="input-medium"/></li>
			<li class="clearfix"></li>
			<li><label>�������ţ�</label><sys:treeselect id="office" name="office.id" value="${user.office.id}" labelName="office.name" labelValue="${user.office.name}" 
				title="����" url="/sys/office/treeData?type=2" cssClass="input-small" allowClear="true" notAllowSelectParent="true"/></li>
			<li><label>��&nbsp;&nbsp;&nbsp;����</label><form:input path="name" htmlEscape="false" maxlength="50" class="input-medium"/></li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="��ѯ" onclick="return page();"/>
				<input id="btnExport" class="btn btn-primary" type="button" value="����"/>
				<input id="btnImport" class="btn btn-primary" type="button" value="����"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<%-- <table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead><tr><th>������˾</th><th>��������</th><th class="sort-column login_name">��¼��</th><th class="sort-column name">����</th><th>�绰</th><th>�ֻ�</th><th>��ɫ</th><shiro:hasPermission name="sys:user:edit"><th>����</th></shiro:hasPermission></tr></thead>
		<tbody>
		<c:forEach items="${page.list}" var="user">
			<tr>
				<td>${user.company.name}</td>
				<td>${user.office.name}</td>
				<td><a href="${ctx}/sys/user/form?id=${user.id}">${user.loginName}</a></td>
				<td>${user.name}</td>
				<td>${user.phone}</td>
				<td>${user.mobile}</td>
				<td>${user.roleNames}</td>
				<shiro:hasPermission name="sys:user:edit"><td>
    				<a href="${ctx}/sys/user/form?id=${user.id}">�޸�</a>
					<a href="${ctx}/sys/user/delete?id=${user.id}" onclick="return confirmx('ȷ��Ҫɾ�����û���', this.href)">ɾ��</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div> --%>
	
	<table id="dataGrid"></table>
    <div class="pagination" id="dataGridPage"></div>
	<link href="${ctxStatic}/jqGrid/4.6/css/ui.jqgrid.css" type="text/css" rel="stylesheet" />
	<script src="${ctxStatic}/jqGrid/4.7/js/jquery.jqGrid.js" type="text/javascript"></script>
	<script src="${ctxStatic}/jqGrid/4.7/js/jquery.jqGrid.extend.js" type="text/javascript"></script>
	<script type="text/javascript">
		// ��ʼ��DataGrid����
		$('#dataGrid').dataGrid({
			
			// �������ݱ����
			columnModel: [
				{header:'������˾', name:'loginName', index:'login_name', width:100, frozen:true , formatter: function(val, obj, row, act){
					return '<a href="${ctx}/sys/user/form?id='+row.id+'" class="btnList" data-title="�༭�û�">'+val+'</a>';
				}},
				{header:'������˾', name:'company.name', index:'', width:160},
				{header:'Ƭ���ܹ�', name:'office.name', index:'', width:160},
				{header:'�绰', name:'phone', index:'phone', width:100, sortable:false},
				{header:'�ֻ�', name:'mobile', index:'mobile', width:100, sortable:false},
				{header:'״̬', name:'delFlag', index:'a.del_flag', width:50, fixed:true, align:"center", formatter: function(val, obj, row, act){
					return getDictLabel(${fns:getDictListJson('del_flag')}, val, 'δ֪', true);
				}},
				{header:'����', name:'actions', width:120, fixed:true, sortable:false, fixed:true, formatter: function(val, obj, row, act){
					var actions = [];
					//<shiro:hasPermission name="sys:user:edit">
					actions.push('<a href="${ctx}/sys/user/form?id='+row.id+'" class="btnList" title="�༭�û�">�༭</a>&nbsp;');
					//</shiro:hasPermission>
					return actions.join('');
				}}
			],
			ajaxSuccess: function(data){ // ���سɹ���ִ�з���
				
			}
		});
	</script>
</body>
</html>