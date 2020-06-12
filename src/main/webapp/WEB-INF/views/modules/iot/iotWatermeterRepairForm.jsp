<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>ά�޼�¼����</title>
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
	<ul class="nav nav-tabs my-nav-tabs">
		<li><a href="${ctx}/iot/iotWatermeterRepair/?iotWatermeterId=${iotWatermeter.id}&watermeterNumForSelect=${iotWatermeter.watermeterNum}">ά�޼�¼�б�</a></li>
		<li class="active"><a href="${ctx}/iot/iotWatermeterRepair/form?id=${iotWatermeterRepair.id}&iotWatermeterId=${iotWatermeter.id}">ά�޼�¼<shiro:hasPermission name="iot:iotWatermeterRepair:edit">${not empty iotWatermeterRepair.id?'�޸�':'���'}</shiro:hasPermission><shiro:lacksPermission name="iot:iotWatermeterRepair:edit">�鿴</shiro:lacksPermission></a></li>
	</ul><br/>
	<div class="my-container">
		<form:form id="inputForm" modelAttribute="iotWatermeterRepair" action="${ctx}/iot/iotWatermeterRepair/save?iotWatermeterId=${iotWatermeter.id}" method="post" class="form-horizontal">
			<form:hidden path="id"/>
			<sys:message content="${message}"/>
			<div class="control-group">
				<label class="control-label">��ˮ���ţ�</label>
				<div class="controls">
					<form:input path="watermeterNumNew" htmlEscape="false" maxlength="25" class="input-xlarge "/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">��ˮ���ţ�</label>
				<div class="controls">
					<form:input path="watermeterNumOld" htmlEscape="false"  maxlength="25" class="input-xlarge "/>
					<span class="help-inline"><font color="red">*</font> </span>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">��ˮ�������</label>
				<div class="controls">
					<form:input path="countOld" htmlEscape="false" class="input-xlarge "/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">�������ͣ�</label>
				<div class="controls">
					<form:select path="faultType" class="input-xlarge ">
						<form:option value="" label="��"/>
						<form:options items="${fns:getDictList('enum_fault_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">����������</label>
				<div class="controls">
					<form:textarea path="faultDesc" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
					<sys:ckeditor replace="faultDesc" uploadPath="/repair" height="200"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">ά���ˣ�</label>
				<div class="controls">
					<sys:treeselect id="repairBy" name="repairBy.id" value="${iotWatermeterRepair.repairBy.id}" labelName="iotWatermeterRepair.repairBy.name" labelValue="${iotWatermeterRepair.repairBy.name}"
									title="ά����" url="/sys/office/treeData?type=3" allowClear="true" notAllowSelectParent="true"/>
					<span class="help-inline"><font color="red">*</font> </span>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">ά��ʱ�䣺</label>
				<div class="controls">
					<input name="repairTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
						value="<fmt:formatDate value="${iotWatermeterRepair.repairTime}" pattern="yyyy-MM-dd"/>"
						onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">ά�����ͣ�</label>
				<div class="controls">
					<form:select path="repairType" class="input-xlarge ">
						<form:option value="" label="��"/>
						<form:options items="${fns:getDictList('enum_repair_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">ά����Ƭ��</label>
				<div class="controls">
					<form:hidden id="repairPhoto" path="repairPhoto" htmlEscape="false" maxlength="255" class="input-xlarge"/>
					<sys:ckfinder input="repairPhoto" type="images" uploadPath="/repairPhoto" selectMultiple="true" maxWidth="100" maxHeight="100"/>
				</div>
			</div>

			<div class="control-group">
				<label class="control-label">ά��������</label>
				<div class="controls">
					<form:textarea path="repairDesc" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
					<sys:ckeditor replace="repairDesc" uploadPath="/repair" height="200"/>
				</div>
			</div>

			<div class="control-group">
				<label class="control-label">��ע��</label>
				<div class="controls">
					<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>
					<sys:ckeditor replace="remarks" uploadPath="/repair" height="200"/>
				</div>
			</div>
			<div class="form-actions my-form-actions">
				<shiro:hasPermission name="iot:iotWatermeterRepair:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="�� ��"/>&nbsp;</shiro:hasPermission>
				<input id="btnCancel" class="btn" type="button" value="�� ��" onclick="history.go(-1)"/>
			</div>
		</form:form>
	</div>
</body>
</html>