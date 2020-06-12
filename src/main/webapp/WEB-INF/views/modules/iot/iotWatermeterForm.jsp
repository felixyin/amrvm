<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>ˮ������</title>
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
	<ul class="nav nav-tabs my-nav-tabs">
		<li><a href="${ctx}/iot/iotWatermeter/">ˮ���б�</a></li>
		<li class="active"><a href="${ctx}/iot/iotWatermeter/form?id=${iotWatermeter.id}&parent.id=${iotWatermeterparent.id}">ˮ��<shiro:hasPermission name="iot:iotWatermeter:edit">${not empty iotWatermeter.id?'�޸�':'����'}</shiro:hasPermission><shiro:lacksPermission name="iot:iotWatermeter:edit">�鿴</shiro:lacksPermission></a></li>
	</ul><br/>
	<div class="my-container">
		<form:form id="inputForm" modelAttribute="iotWatermeter" action="${ctx}/iot/iotWatermeter/save" method="post" class="form-horizontal">
			<form:hidden path="id"/>
			<sys:message content="${message}"/>
			<div class="control-group">
				<label class="control-label">���ƣ�</label>
				<div class="controls">
					<form:input path="name" htmlEscape="false" maxlength="25" class="input-xlarge "/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">����</label>
				<div class="controls">
					<sys:treeselect id="area" name="area.id" value="${iotWatermeter.area.id}" labelName="area.name" labelValue="${iotWatermeter.area.name}"
						title="����" url="/sys/area/treeData" cssClass="" allowClear="true" notAllowSelectParent="true"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">��������</label>
				<div class="controls">
					<form:input path="farmName" htmlEscape="false" maxlength="50" class="input-xlarge "/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">�ɼ�������</label>
				<div class="controls">
					<form:input path="concentratorName" htmlEscape="false" maxlength="50" class="input-xlarge "/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">�ɼ�����ţ�</label>
				<div class="controls">
					<form:input path="concentratorNum" htmlEscape="false" maxlength="25" class="input-xlarge "/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">��������</label>
				<div class="controls">
					<form:input path="houseName" htmlEscape="false" maxlength="50" class="input-xlarge "/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">���ڷ��䣺</label>
				<div class="controls">
					<form:input path="roomName" htmlEscape="false" maxlength="50" class="input-xlarge "/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">��ˮ���ͣ�</label>
				<div class="controls">
					<form:select path="watermeterType" class="input-xlarge ">
						<form:option value="" label=""/>
						<form:options items="${fns:getDictList('enum_watermeter_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">ˮ����ţ�</label>
				<div class="controls">
					<form:input path="watermeterNum" htmlEscape="false" maxlength="25" class="input-xlarge "/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">�豸���ͣ�</label>
				<div class="controls">
					<form:select path="deviceType" class="input-xlarge ">
						<form:option value="" label=""/>
						<form:options items="${fns:getDictList('enmu_device_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">ˮ��״̬��</label>
				<div class="controls">
					<form:select path="watermeterStatus" class="input-xlarge ">
						<form:option value="" label=""/>
						<form:options items="${fns:getDictList('enmu_watermeter_status')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">��װ���ڣ�</label>
				<div class="controls">
					<input name="installedTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
						value="${iotWatermeter.installedTime}"
						onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">��ע��</label>
				<div class="controls">
					<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">�б�����</label>
				<div class="controls">
					<form:input path="orderNo" htmlEscape="false" class="input-xlarge "/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">�ϼ��ϼ�ID:</label>
				<div class="controls">
					<sys:treeselect id="parent" name="parent.id" value="${iotWatermeter.parent.id}" labelName="parent.name" labelValue="${iotWatermeter.parent.name}"
						title="�ϼ�ID" url="/iot/iotWatermeter/treeData" extId="${iotWatermeter.id}" cssClass="" allowClear="true"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">�㼶��</label>
				<div class="controls">
					<form:select path="levelType" class="input-xlarge ">
						<form:option value="" label=""/>
						<form:options items="${fns:getDictList('enum_level_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select>
				</div>
			</div>
			<div class="form-actions my-form-actions">
				<shiro:hasPermission name="iot:iotWatermeter:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="�� ��"/>&nbsp;</shiro:hasPermission>
				<input id="btnCancel" class="btn" type="button" value="�� ��" onclick="history.go(-1)"/>
			</div>
		</form:form>
	</div>
</body>
</html>