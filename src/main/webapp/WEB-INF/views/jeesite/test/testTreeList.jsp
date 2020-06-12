<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>���ṹ����</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/treetable.jsp" %>
	<script type="text/javascript">
		$(document).ready(function() {
			var tpl = $("#treeTableTpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
			var data = ${fns:toJson(list)}, ids = [], rootIds = [];
			for (var i=0; i<data.length; i++){
				ids.push(data[i].id);
			}
			ids = ',' + ids.join(',') + ',';
			for (var i=0; i<data.length; i++){
				if (ids.indexOf(','+data[i].parentId+',') == -1){
					if ((','+rootIds.join(',')+',').indexOf(','+data[i].parentId+',') == -1){
						rootIds.push(data[i].parentId);
					}
				}
			}
			for (var i=0; i<rootIds.length; i++){
				addRow("#treeTableList", tpl, data, rootIds[i], true);
			}
			$("#treeTable").treeTable({expandLevel : 5});
		});
		function addRow(list, tpl, data, pid, root){
			for (var i=0; i<data.length; i++){
				var row = data[i];
				if ((${fns:jsGetVal('row.parentId')}) == pid){
					$(list).append(Mustache.render(tpl, {
						dict: {
						blank123:0}, pid: (root?0:pid), row: row
					}));
					addRow(list, tpl, data, row.id);
					if(i == 0) { // �����һ������Ӧ���Ǹ��ڵ㣬������
						$('#'+row.id).find('a').not(':last').hide();
                    }
				}
			}
		}
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/test/testTree/">���ṹ�б�</a></li>
		<shiro:hasPermission name="test:testTree:edit"><li><a href="${ctx}/test/testTree/form">���ṹ���</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="testTree" action="${ctx}/test/testTree/" method="post" class="breadcrumb form-search">
		<ul class="ul-form">
			<li><label>���ƣ�</label>
				<form:input path="name" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="��ѯ"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="treeTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>����</th>
				<th>����</th>
				<th>����ʱ��</th>
				<th>��ע��Ϣ</th>
				<shiro:hasPermission name="test:testTree:edit"><th>����</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody id="treeTableList"></tbody>
	</table>
	<script type="text/template" id="treeTableTpl">
		<tr id="{{row.id}}" pId="{{pid}}">
			<td><a href="${ctx}/test/testTree/form?id={{row.id}}">
				{{row.name}}
			</a></td>
			<td>
				{{row.sort}}
			</td>
			<td>
				{{row.updateDate}}
			</td>
			<td>
				{{row.remarks}}
			</td>
			<shiro:hasPermission name="test:testTree:edit"><td>
   				<a href="${ctx}/test/testTree/form?id={{row.id}}">�޸�</a>
				<a href="${ctx}/test/testTree/delete?id={{row.id}}" onclick="return confirmx('ȷ��Ҫɾ�������ṹ�����������ṹ��', this.href)">ɾ��</a>
				<a href="${ctx}/test/testTree/form?parent.id={{row.id}}">����¼����ṹ</a> 
			</td></shiro:hasPermission>
		</tr>
	</script>
</body>
</html>