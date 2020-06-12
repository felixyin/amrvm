<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>管理员和猪场中间表管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
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
				<label class="control-label">用户ID：</label>
				<div class="controls">
					<sys:treeselect id="user" name="user.id" value="${iotWatermeterUser.user.id}" labelName="user.name" labelValue="${iotWatermeterUser.user.name}"
						title="用户" url="/sys/office/treeData?type=3" cssClass="" allowClear="true" notAllowSelectParent="true"/>



				</div>
			</div>
			<div class="control-group">
				<label class="control-label">猪场ID：</label>
				<div class="controls">
					<sys:treeselect id="iotWatermeter" name="iotWatermeter.id" value="${iotWatermeterUser.iotWatermeter.id}" labelName="name"
									labelValue="${iotWatermeterUser.iotWatermeter.name}"
									checked="true" title="猪场" url="/iot/iotWatermeter/treeData2" cssClass="" allowClear="true"
									notAllowSelectParent="true"/>
				</div>
			</div>
			<div class="form-actions my-form-actions">
				<shiro:hasPermission name="iot:iotWatermeterUser:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
				<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
			</div>
		</form:form>
	</div>
</body>
</html>