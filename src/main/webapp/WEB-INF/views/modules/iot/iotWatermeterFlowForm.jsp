<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>水表流量信息管理</title>
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
	<ul class="nav nav-tabs my-nav-tabs">
		<li><a href="${ctx}/iot/iotWatermeterFlow/">水表流量信息列表</a></li>
		<li class="active"><a href="${ctx}/iot/iotWatermeterFlow/form?id=${iotWatermeterFlow.id}">水表流量信息<shiro:hasPermission name="iot:iotWatermeterFlow:edit">${not empty iotWatermeterFlow.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="iot:iotWatermeterFlow:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<div class="my-container">
		<form:form id="inputForm" modelAttribute="iotWatermeterFlow" action="${ctx}/iot/iotWatermeterFlow/save" method="post" class="form-horizontal">
			<form:hidden path="id"/>
			<sys:message content="${message}"/>
			<div class="control-group">
				<label class="control-label">水表编号：</label>
				<div class="controls">
					<form:input path="watermeterNum" htmlEscape="false" maxlength="25" class="input-xlarge required"/>



					<span class="help-inline"><font color="red">*</font> </span>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">日读数：</label>
				<div class="controls">
					<form:input path="countCd" htmlEscape="false" class="input-xlarge "/>



				</div>
			</div>
			<div class="control-group">
				<label class="control-label">日期：</label>
				<div class="controls">
					<form:input path="collectCd" htmlEscape="false" maxlength="25" class="input-xlarge "/>



				</div>
			</div>
			<div class="control-group">
				<label class="control-label">日流量：</label>
				<div class="controls">
					<form:input path="flowDay" htmlEscape="false" class="input-xlarge "/>



				</div>
			</div>
			<div class="control-group">
				<label class="control-label">周读数：</label>
				<div class="controls">
					<form:input path="countCw" htmlEscape="false" class="input-xlarge "/>



				</div>
			</div>
			<div class="control-group">
				<label class="control-label">周：</label>
				<div class="controls">
					<form:input path="collectCw" htmlEscape="false" maxlength="25" class="input-xlarge "/>



				</div>
			</div>
			<div class="control-group">
				<label class="control-label">周流量：</label>
				<div class="controls">
					<form:input path="flowWeek" htmlEscape="false" class="input-xlarge "/>



				</div>
			</div>
			<div class="control-group">
				<label class="control-label">月读数：</label>
				<div class="controls">
					<form:input path="countCm" htmlEscape="false" class="input-xlarge "/>



				</div>
			</div>
			<div class="control-group">
				<label class="control-label">月份：</label>
				<div class="controls">
					<form:input path="collectCm" htmlEscape="false" maxlength="25" class="input-xlarge "/>



				</div>
			</div>
			<div class="control-group">
				<label class="control-label">月流量：</label>
				<div class="controls">
					<form:input path="flowMonth" htmlEscape="false" class="input-xlarge "/>



				</div>
			</div>
			<div class="control-group">
				<label class="control-label">季读数：</label>
				<div class="controls">
					<form:input path="countCq" htmlEscape="false" class="input-xlarge "/>



				</div>
			</div>
			<div class="control-group">
				<label class="control-label">季度：</label>
				<div class="controls">
					<form:input path="collectCq" htmlEscape="false" maxlength="25" class="input-xlarge "/>



				</div>
			</div>
			<div class="control-group">
				<label class="control-label">季流量：</label>
				<div class="controls">
					<form:input path="flowQuarter" htmlEscape="false" class="input-xlarge "/>



				</div>
			</div>
			<div class="control-group">
				<label class="control-label">年读数：</label>
				<div class="controls">
					<form:input path="countCy" htmlEscape="false" class="input-xlarge "/>



				</div>
			</div>
			<div class="control-group">
				<label class="control-label">年份：</label>
				<div class="controls">
					<form:input path="collectCy" htmlEscape="false" maxlength="25" class="input-xlarge "/>



				</div>
			</div>
			<div class="control-group">
				<label class="control-label">年流量：</label>
				<div class="controls">
					<form:input path="flowYear" htmlEscape="false" class="input-xlarge "/>



				</div>
			</div>
			<div class="control-group">
				<label class="control-label">备注：</label>
				<div class="controls">
					<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>



				</div>
			</div>
			<div class="form-actions my-form-actions">
				<shiro:hasPermission name="iot:iotWatermeterFlow:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
				<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
			</div>
		</form:form>
	</div>
</body>
</html>