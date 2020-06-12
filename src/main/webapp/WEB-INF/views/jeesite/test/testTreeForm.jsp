<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>���ṹ����</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('�����ύ�����Ե�...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("�����������ȸ�����");
					if (element.is(":checkbox") || element.is(":radio") || element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/test/testTree/">���ṹ�б�</a></li>
		<li class="active"><a href="${ctx}/test/testTree/form?id=${testTree.id}&parent.id=${testTreeparent.id}">���ṹ<shiro:hasPermission name="test:testTree:edit">${not empty testTree.id?'�޸�':'���'}</shiro:hasPermission><shiro:lacksPermission name="test:testTree:edit">�鿴</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="testTree" action="${ctx}/test/testTree/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">�ϼ��������:</label>
			<div class="controls">
				<sys:treeselect id="parent" name="parent.id" value="${testTree.parent.id}" labelName="parent.name" labelValue="${testTree.parent.name}"
					title="�������" url="/test/testTree/treeData" extId="${testTree.id}" cssClass="" allowClear="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">���ƣ�</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="100" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">����</label>
			<div class="controls">
				<form:input path="sort" htmlEscape="false" maxlength="10" class="input-xlarge required digits"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">��ע��Ϣ��</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="test:testTree:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="�� ��"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="�� ��" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>