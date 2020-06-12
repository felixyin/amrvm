<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>ˮ��������ֵ����</title>
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
		<li><a href="${ctx}/iot/iotWatermeterVpt/">ˮ��������ֵ�б�</a></li>
		<li class="active"><a href="${ctx}/iot/iotWatermeterVpt/form?id=${iotWatermeterVpt.id}">ˮ��������ֵ<shiro:hasPermission name="iot:iotWatermeterVpt:edit">${not empty iotWatermeterVpt.id?'�޸�':'���'}</shiro:hasPermission><shiro:lacksPermission name="iot:iotWatermeterVpt:edit">�鿴</shiro:lacksPermission></a></li>
	</ul><br/>
	<div class="my-container">
		<form:form id="inputForm" modelAttribute="iotWatermeterVpt" action="${ctx}/iot/iotWatermeterVpt/save" method="post" class="form-horizontal">
			<form:hidden path="id"/>
			<sys:message content="${message}"/>
		<%--	<div class="control-group">
				<label class="control-label">��Сֵ��</label>
				<div class="controls">
					<form:input path="minFlow" htmlEscape="false" maxlength="255" class="input-xlarge "/>



				</div>
			</div>--%>
			<div class="control-group">
				<label class="control-label">���ֵ��</label>
				<div class="controls">
					<form:input path="maxFlow" htmlEscape="false" maxlength="255" class="input-xlarge "/>



				</div>
			</div>
			<div class="control-group">
				<label class="control-label">���ڷ�Χ��</label>
				<div class="controls">
					<form:select path="dateName" class="input-xlarge ">
						<form:option value="" label=""/>
						<form:options items="${fns:getDictList('enum_date_name')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select>



				</div>
			</div>
			<div class="control-group">
				<label class="control-label">��ע��</label>
				<div class="controls">
					<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" class="input-xxlarge "/>



				</div>
			</div>
			<div class="form-actions my-form-actions">
				<shiro:hasPermission name="iot:iotWatermeterVpt:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="�� ��"/>&nbsp;</shiro:hasPermission>
				<input id="btnCancel" class="btn" type="button" value="�� ��" onclick="history.go(-1)"/>
			</div>
		</form:form>
	</div>
</body>
</html>