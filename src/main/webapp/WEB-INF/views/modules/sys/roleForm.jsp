<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>��ɫ����</title>
	<meta name="decorator" content="default"/>
	<%@include file="/WEB-INF/views/include/treeview.jsp" %>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#name").focus();
			$("#inputForm").validate({
				rules: {
					name: {remote: "${ctx}/sys/role/checkName?oldName=" + encodeURIComponent("${role.name}")},
					enname: {remote: "${ctx}/sys/role/checkEnname?oldEnname=" + encodeURIComponent("${role.enname}")}
				},
				messages: {
					name: {remote: "��ɫ���Ѵ���"},
					enname: {remote: "Ӣ�����Ѵ���"}
				},
				submitHandler: function(form){
					var ids = [], nodes = tree.getCheckedNodes(true);
					for(var i=0; i<nodes.length; i++) {
						ids.push(nodes[i].id);
					}
					$("#menuIds").val(ids);
					var ids2 = [], nodes2 = tree2.getCheckedNodes(true);
					for(var i=0; i<nodes2.length; i++) {
						ids2.push(nodes2[i].id);
					}
					$("#officeIds").val(ids2);
					loading('�����ύ�����Ե�...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("�����������ȸ�����");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});

			var setting = {check:{enable:true,nocheckInherit:true},view:{selectedMulti:false},
					data:{simpleData:{enable:true}},callback:{beforeClick:function(id, node){
						tree.checkNode(node, !node.checked, true, true);
						return false;
					}}};
			
			// �û�-�˵�
			var zNodes=[
					<c:forEach items="${menuList}" var="menu">{id:"${menu.id}", pId:"${not empty menu.parent.id?menu.parent.id:0}", name:"${not empty menu.parent.id?menu.name:'Ȩ���б�'}"},
		            </c:forEach>];
			// ��ʼ�����ṹ
			var tree = $.fn.zTree.init($("#menuTree"), setting, zNodes);
			// ��ѡ�񸸽ڵ�
			tree.setting.check.chkboxType = { "Y" : "ps", "N" : "s" };
			// Ĭ��ѡ��ڵ�
			var ids = "${role.menuIds}".split(",");
			for(var i=0; i<ids.length; i++) {
				var node = tree.getNodeByParam("id", ids[i]);
				try{tree.checkNode(node, true, false);}catch(e){}
			}
			// Ĭ��չ��ȫ���ڵ�
			tree.expandAll(true);
			
			// �û�-����
			var zNodes2=[
					<c:forEach items="${officeList}" var="office">{id:"${office.id}", pId:"${not empty office.parent?office.parent.id:0}", name:"${office.name}"},
		            </c:forEach>];
			// ��ʼ�����ṹ
			var tree2 = $.fn.zTree.init($("#officeTree"), setting, zNodes2);
			// ��ѡ�񸸽ڵ�
			tree2.setting.check.chkboxType = { "Y" : "ps", "N" : "s" };
			// Ĭ��ѡ��ڵ�
			var ids2 = "${role.officeIds}".split(",");
			for(var i=0; i<ids2.length; i++) {
				var node = tree2.getNodeByParam("id", ids2[i]);
				try{tree2.checkNode(node, true, false);}catch(e){}
			}
			// Ĭ��չ��ȫ���ڵ�
			tree2.expandAll(true);
			// ˢ�£���ʾ/���أ�����
			refreshOfficeTree();
			$("#dataScope").change(function(){
				refreshOfficeTree();
			});
		});
		function refreshOfficeTree(){
			if($("#dataScope").val()==9){
				$("#officeTree").show();
			}else{
				$("#officeTree").hide();
			}
		}
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/sys/role/">��ɫ�б�</a></li>
		<li class="active"><a href="${ctx}/sys/role/form?id=${role.id}">��ɫ<shiro:hasPermission name="sys:role:edit">${not empty role.id?'�޸�':'���'}</shiro:hasPermission><shiro:lacksPermission name="sys:role:edit">�鿴</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="role" action="${ctx}/sys/role/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<div class="control-group">
			<label class="control-label">��������:</label>
			<div class="controls">
                <sys:treeselect id="office" name="office.id" value="${role.office.id}" labelName="office.name" labelValue="${role.office.name}"
					title="����" url="/sys/office/treeData" cssClass="required"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">��ɫ����:</label>
			<div class="controls">
				<input id="oldName" name="oldName" type="hidden" value="${role.name}">
				<form:input path="name" htmlEscape="false" maxlength="50" class="required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">Ӣ������:</label>
			<div class="controls">
				<input id="oldEnname" name="oldEnname" type="hidden" value="${role.enname}">
				<form:input path="enname" htmlEscape="false" maxlength="50" class="required"/>
				<span class="help-inline"><font color="red">*</font> �������û����ʶ</span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">��ɫ����:</label>
			<div class="controls"><%--
				<form:input path="roleType" htmlEscape="false" maxlength="50" class="required"/>
				<span class="help-inline" title="activiti��3��Ԥ����������ͣ�security-role��assignment��user ���ʹ��Activiti Explorer����Ҫsecurity-role���ܿ���manageҳǩ����Ҫassignment����claim����">
					���������û������ͣ�security-role������Ա��assignment���ɽ���������䡢user����ͨ�û���</span> --%>
				<form:select path="roleType" class="input-medium">
					<form:option value="assignment">�������</form:option>
					<form:option value="security-role">�����ɫ</form:option>
					<form:option value="user">��ͨ��ɫ</form:option>
				</form:select>
				<span class="help-inline" title="activiti��3��Ԥ����������ͣ�security-role��assignment��user ���ʹ��Activiti Explorer����Ҫsecurity-role���ܿ���manageҳǩ����Ҫassignment����claim����">
					���������û������ͣ�������䣺assignment�������ɫ��security-role����ͨ��ɫ��user��</span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">�Ƿ�ϵͳ����:</label>
			<div class="controls">
				<form:select path="sysData">
					<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<span class="help-inline">���ǡ����������ֻ�г�������Ա�ܽ����޸ģ��������ʾӵ�н�ɫ�޸���Ա��Ȩ�޶��ܽ����޸�</span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">�Ƿ����</label>
			<div class="controls">
				<form:select path="useable">
					<form:options items="${fns:getDictList('yes_no')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<span class="help-inline">���ǡ���������ݿ��ã��������ʾ�����ݲ�����</span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">���ݷ�Χ:</label>
			<div class="controls">
				<form:select path="dataScope" class="input-medium">
					<form:options items="${fns:getDictList('sys_data_scope')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<span class="help-inline">��������£�����Ϊ������ϸ���á����ɽ��п������Ȩ</span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">��ɫ��Ȩ:</label>
			<div class="controls">
				<div id="menuTree" class="ztree" style="margin-top:3px;float:left;"></div>
				<form:hidden path="menuIds"/>
				<div id="officeTree" class="ztree" style="margin-left:100px;margin-top:3px;float:left;"></div>
				<form:hidden path="officeIds"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">��ע:</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="3" maxlength="200" class="input-xlarge"/>
			</div>
		</div>
		<div class="form-actions">
			<c:if test="${(role.sysData eq fns:getDictValue('��', 'yes_no', '1') && fns:getUser().admin)||!(role.sysData eq fns:getDictValue('��', 'yes_no', '1'))}">
				<shiro:hasPermission name="sys:role:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="�� ��"/>&nbsp;</shiro:hasPermission>
			</c:if>
			<input id="btnCancel" class="btn" type="button" value="�� ��" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>