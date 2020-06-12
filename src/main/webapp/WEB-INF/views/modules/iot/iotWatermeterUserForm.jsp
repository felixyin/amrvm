<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>����Ա�����м�����</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
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
		});
	</script>
</head>
<body>
	<br/>
	<div class="my-container">
		<form:form id="inputForm" modelAttribute="iotWatermeterUser" action="${ctx}/iot/iotWatermeterUser/save" method="post" class="form-horizontal">
			<form:hidden path="id"/>
			<sys:message content="${message}"/>
			<div class="control-group">
				<label class="control-label">�û�ID��</label>
				<div class="controls">
					<sys:treeselect id="user" name="user.id" value="${iotWatermeterUser.user.id}" labelName="user.name" labelValue="${iotWatermeterUser.user.name}"
						title="�û�" url="/sys/office/treeData?type=3" cssClass="" allowClear="true" notAllowSelectParent="true"/>



				</div>
			</div>
			<div class="control-group">
				<label class="control-label">��ID��</label>
				<div class="controls">
					<sys:treeselect id="iotWatermeter" name="iotWatermeter.id" value="${iotWatermeterUser.iotWatermeter.id}" labelName="name"
									labelValue="${iotWatermeterUser.iotWatermeter.name}"
									checked="true" title="��" url="/iot/iotWatermeter/treeData2" cssClass="" allowClear="true"
									notAllowSelectParent="true"/>
				</div>
			</div>
			<div class="form-actions my-form-actions">
				<shiro:hasPermission name="iot:iotWatermeterUser:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="�� ��"/>&nbsp;</shiro:hasPermission>
				<input id="btnCancel" class="btn" type="button" value="�� ��" onclick="history.go(-1)"/>
			</div>
		</form:form>
	</div>
</body>
</html>