<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>ˮ��������Ϣ����</title>
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
		<li><a href="${ctx}/iot/iotWatermeterFlow/">ˮ��������Ϣ�б�</a></li>
		<li class="active"><a href="${ctx}/iot/iotWatermeterFlow/form?id=${iotWatermeterFlow.id}">ˮ��������Ϣ<shiro:hasPermission name="iot:iotWatermeterFlow:edit">${not empty iotWatermeterFlow.id?'�޸�':'���'}</shiro:hasPermission><shiro:lacksPermission name="iot:iotWatermeterFlow:edit">�鿴</shiro:lacksPermission></a></li>
	</ul><br/>
	<div class="my-container">
		<form:form id="inputForm" modelAttribute="iotWatermeterFlow" action="${ctx}/iot/iotWatermeterFlow/save" method="post" class="form-horizontal">
			<form:hidden path="id"/>
			<sys:message content="${message}"/>
			<div class="control-group">
				<label class="control-label">ˮ���ţ�</label>
				<div class="controls">
					<form:input path="watermeterNum" htmlEscape="false" maxlength="25" class="input-xlarge required"/>



					<span class="help-inline"><font color="red">*</font> </span>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">�ն�����</label>
				<div class="controls">
					<form:input path="countCd" htmlEscape="false" class="input-xlarge "/>



				</div>
			</div>
			<div class="control-group">
				<label class="control-label">���ڣ�</label>
				<div class="controls">
					<form:input path="collectCd" htmlEscape="false" maxlength="25" class="input-xlarge "/>



				</div>
			</div>
			<div class="control-group">
				<label class="control-label">��������</label>
				<div class="controls">
					<form:input path="flowDay" htmlEscape="false" class="input-xlarge "/>



				</div>
			</div>
			<div class="control-group">
				<label class="control-label">�ܶ�����</label>
				<div class="controls">
					<form:input path="countCw" htmlEscape="false" class="input-xlarge "/>



				</div>
			</div>
			<div class="control-group">
				<label class="control-label">�ܣ�</label>
				<div class="controls">
					<form:input path="collectCw" htmlEscape="false" maxlength="25" class="input-xlarge "/>



				</div>
			</div>
			<div class="control-group">
				<label class="control-label">��������</label>
				<div class="controls">
					<form:input path="flowWeek" htmlEscape="false" class="input-xlarge "/>



				</div>
			</div>
			<div class="control-group">
				<label class="control-label">�¶�����</label>
				<div class="controls">
					<form:input path="countCm" htmlEscape="false" class="input-xlarge "/>



				</div>
			</div>
			<div class="control-group">
				<label class="control-label">�·ݣ�</label>
				<div class="controls">
					<form:input path="collectCm" htmlEscape="false" maxlength="25" class="input-xlarge "/>



				</div>
			</div>
			<div class="control-group">
				<label class="control-label">��������</label>
				<div class="controls">
					<form:input path="flowMonth" htmlEscape="false" class="input-xlarge "/>



				</div>
			</div>
			<div class="control-group">
				<label class="control-label">��������</label>
				<div class="controls">
					<form:input path="countCq" htmlEscape="false" class="input-xlarge "/>



				</div>
			</div>
			<div class="control-group">
				<label class="control-label">���ȣ�</label>
				<div class="controls">
					<form:input path="collectCq" htmlEscape="false" maxlength="25" class="input-xlarge "/>



				</div>
			</div>
			<div class="control-group">
				<label class="control-label">��������</label>
				<div class="controls">
					<form:input path="flowQuarter" htmlEscape="false" class="input-xlarge "/>



				</div>
			</div>
			<div class="control-group">
				<label class="control-label">�������</label>
				<div class="controls">
					<form:input path="countCy" htmlEscape="false" class="input-xlarge "/>



				</div>
			</div>
			<div class="control-group">
				<label class="control-label">��ݣ�</label>
				<div class="controls">
					<form:input path="collectCy" htmlEscape="false" maxlength="25" class="input-xlarge "/>



				</div>
			</div>
			<div class="control-group">
				<label class="control-label">��������</label>
				<div class="controls">
					<form:input path="flowYear" htmlEscape="false" class="input-xlarge "/>



				</div>
			</div>
			<div class="control-group">
				<label class="control-label">��ע��</label>
				<div class="controls">
					<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>



				</div>
			</div>
			<div class="form-actions my-form-actions">
				<shiro:hasPermission name="iot:iotWatermeterFlow:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="�� ��"/>&nbsp;</shiro:hasPermission>
				<input id="btnCancel" class="btn" type="button" value="�� ��" onclick="history.go(-1)"/>
			</div>
		</form:form>
	</div>
</body>
</html>