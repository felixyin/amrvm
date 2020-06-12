<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>维修记录管理</title>
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
		<li><a href="${ctx}/iot/iotWatermeterRepair/?iotWatermeterId=${iotWatermeter.id}&watermeterNumForSelect=${iotWatermeter.watermeterNum}">维修记录列表</a></li>
		<li class="active"><a href="${ctx}/iot/iotWatermeterRepair/form?id=${iotWatermeterRepair.id}&iotWatermeterId=${iotWatermeter.id}">维修记录<shiro:hasPermission name="iot:iotWatermeterRepair:edit">${not empty iotWatermeterRepair.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="iot:iotWatermeterRepair:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<div class="my-container">
		<form:form id="inputForm" modelAttribute="iotWatermeterRepair" action="${ctx}/iot/iotWatermeterRepair/save?iotWatermeterId=${iotWatermeter.id}" method="post" class="form-horizontal">
			<form:hidden path="id"/>
			<sys:message content="${message}"/>
			<div class="control-group">
				<label class="control-label">新水表编号：</label>
				<div class="controls">
					<form:input path="watermeterNumNew" htmlEscape="false" maxlength="25" class="input-xlarge "/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">老水表编号：</label>
				<div class="controls">
					<form:input path="watermeterNumOld" htmlEscape="false"  maxlength="25" class="input-xlarge "/>
					<span class="help-inline"><font color="red">*</font> </span>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">老水表读数：</label>
				<div class="controls">
					<form:input path="countOld" htmlEscape="false" class="input-xlarge "/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">故障类型：</label>
				<div class="controls">
					<form:select path="faultType" class="input-xlarge ">
						<form:option value="" label="无"/>
						<form:options items="${fns:getDictList('enum_fault_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">故障描述：</label>
				<div class="controls">
					<form:textarea path="faultDesc" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
					<sys:ckeditor replace="faultDesc" uploadPath="/repair" height="200"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">维修人：</label>
				<div class="controls">
					<sys:treeselect id="repairBy" name="repairBy.id" value="${iotWatermeterRepair.repairBy.id}" labelName="iotWatermeterRepair.repairBy.name" labelValue="${iotWatermeterRepair.repairBy.name}"
									title="维修人" url="/sys/office/treeData?type=3" allowClear="true" notAllowSelectParent="true"/>
					<span class="help-inline"><font color="red">*</font> </span>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">维修时间：</label>
				<div class="controls">
					<input name="repairTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
						value="<fmt:formatDate value="${iotWatermeterRepair.repairTime}" pattern="yyyy-MM-dd"/>"
						onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">维修类型：</label>
				<div class="controls">
					<form:select path="repairType" class="input-xlarge ">
						<form:option value="" label="无"/>
						<form:options items="${fns:getDictList('enum_repair_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">维修照片：</label>
				<div class="controls">
					<form:hidden id="repairPhoto" path="repairPhoto" htmlEscape="false" maxlength="255" class="input-xlarge"/>
					<sys:ckfinder input="repairPhoto" type="images" uploadPath="/repairPhoto" selectMultiple="true" maxWidth="100" maxHeight="100"/>
				</div>
			</div>

			<div class="control-group">
				<label class="control-label">维修描述：</label>
				<div class="controls">
					<form:textarea path="repairDesc" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
					<sys:ckeditor replace="repairDesc" uploadPath="/repair" height="200"/>
				</div>
			</div>

			<div class="control-group">
				<label class="control-label">备注：</label>
				<div class="controls">
					<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
					<sys:ckeditor replace="remarks" uploadPath="/repair" height="200"/>
				</div>
			</div>
			<div class="form-actions my-form-actions">
				<shiro:hasPermission name="iot:iotWatermeterRepair:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
				<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
			</div>
		</form:form>
	</div>
</body>
</html>