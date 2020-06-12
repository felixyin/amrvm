<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>水表管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
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
	<ul class="nav nav-tabs my-nav-tabs">
		<li><a href="${ctx}/iot/iotWatermeter/">水表列表</a></li>
		<li class="active"><a href="${ctx}/iot/iotWatermeter/form?id=${iotWatermeter.id}&parent.id=${iotWatermeterparent.id}">水表<shiro:hasPermission name="iot:iotWatermeter:edit">${not empty iotWatermeter.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="iot:iotWatermeter:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<div class="my-container">
		<form:form id="inputForm" modelAttribute="iotWatermeter" action="${ctx}/iot/iotWatermeter/save" method="post" class="form-horizontal">
			<form:hidden path="id"/>
			<sys:message content="${message}"/>
			<div class="control-group">
				<label class="control-label">名称：</label>
				<div class="controls">
					<form:input path="name" htmlEscape="false" maxlength="25" class="input-xlarge "/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">区域：</label>
				<div class="controls">
					<sys:treeselect id="area" name="area.id" value="${iotWatermeter.area.id}" labelName="area.name" labelValue="${iotWatermeter.area.name}"
						title="区域" url="/sys/area/treeData" cssClass="" allowClear="true" notAllowSelectParent="true"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">猪场名：</label>
				<div class="controls">
					<form:input path="farmName" htmlEscape="false" maxlength="50" class="input-xlarge "/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">采集器名：</label>
				<div class="controls">
					<form:input path="concentratorName" htmlEscape="false" maxlength="50" class="input-xlarge "/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">采集器编号：</label>
				<div class="controls">
					<form:input path="concentratorNum" htmlEscape="false" maxlength="25" class="input-xlarge "/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">猪舍名：</label>
				<div class="controls">
					<form:input path="houseName" htmlEscape="false" maxlength="50" class="input-xlarge "/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">所在房间：</label>
				<div class="controls">
					<form:input path="roomName" htmlEscape="false" maxlength="50" class="input-xlarge "/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">用水类型：</label>
				<div class="controls">
					<form:select path="watermeterType" class="input-xlarge ">
						<form:option value="" label=""/>
						<form:options items="${fns:getDictList('enum_watermeter_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">水表编号：</label>
				<div class="controls">
					<form:input path="watermeterNum" htmlEscape="false" maxlength="25" class="input-xlarge "/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">设备类型：</label>
				<div class="controls">
					<form:select path="deviceType" class="input-xlarge ">
						<form:option value="" label=""/>
						<form:options items="${fns:getDictList('enmu_device_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">水表状态：</label>
				<div class="controls">
					<form:select path="watermeterStatus" class="input-xlarge ">
						<form:option value="" label=""/>
						<form:options items="${fns:getDictList('enmu_watermeter_status')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">安装日期：</label>
				<div class="controls">
					<input name="installedTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
						value="${iotWatermeter.installedTime}"
						onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">备注：</label>
				<div class="controls">
					<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">列表排序：</label>
				<div class="controls">
					<form:input path="orderNo" htmlEscape="false" class="input-xlarge "/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">上级上级ID:</label>
				<div class="controls">
					<sys:treeselect id="parent" name="parent.id" value="${iotWatermeter.parent.id}" labelName="parent.name" labelValue="${iotWatermeter.parent.name}"
						title="上级ID" url="/iot/iotWatermeter/treeData" extId="${iotWatermeter.id}" cssClass="" allowClear="true"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">层级：</label>
				<div class="controls">
					<form:select path="levelType" class="input-xlarge ">
						<form:option value="" label=""/>
						<form:options items="${fns:getDictList('enum_level_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select>
				</div>
			</div>
			<div class="form-actions my-form-actions">
				<shiro:hasPermission name="iot:iotWatermeter:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
				<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
			</div>
		</form:form>
	</div>
</body>
</html>