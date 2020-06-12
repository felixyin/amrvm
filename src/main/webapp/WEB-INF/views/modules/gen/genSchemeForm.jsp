<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>���ɷ�������</title>
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
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/gen/genScheme/">���ɷ����б�</a></li>
		<li class="active"><a href="${ctx}/gen/genScheme/form?id=${genScheme.id}">���ɷ���<shiro:hasPermission name="gen:genScheme:edit">${not empty genScheme.id?'�޸�':'���'}</shiro:hasPermission><shiro:lacksPermission name="gen:genScheme:edit">�鿴</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="genScheme" action="${ctx}/gen/genScheme/save" method="post" class="form-horizontal">
		<form:hidden path="id"/><form:hidden path="flag"/>
		<sys:message content="${message}"/>
		<div class="control-group">
			<label class="control-label">��������:</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="200" class="required"/>
				<span class="help-inline"></span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">ģ�����:</label>
			<div class="controls">
				<form:select path="category" class="required input-xlarge">
					<form:options items="${config.categoryList}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<span class="help-inline">
					���ɽṹ��{����}/{ģ����}/{�ֲ�(dao,entity,service,web)}/{��ģ����}/{java��}
				</span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">���ɰ�·��:</label>
			<div class="controls">
				<form:input path="packageName" htmlEscape="false" maxlength="500" class="required input-xlarge"/>
				<span class="help-inline">����ģ�����com.fy.erp.modules</span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">����ģ����:</label>
			<div class="controls">
				<form:input path="moduleName" htmlEscape="false" maxlength="500" class="required input-xlarge"/>
				<span class="help-inline">�����Ϊ��ϵͳ�������� sys</span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">������ģ����:</label>
			<div class="controls">
				<form:input path="subModuleName" htmlEscape="false" maxlength="500" class="input-xlarge"/>
				<span class="help-inline">��ѡ���ֲ��µ��ļ��У����� </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">���ɹ�������:</label>
			<div class="controls">
				<form:input path="functionName" htmlEscape="false" maxlength="500" class="required input-xlarge"/>
				<span class="help-inline">�����õ�������</span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">���ɹ�����:</label>
			<div class="controls">
				<form:input path="functionNameSimple" htmlEscape="false" maxlength="500" class="required input-xlarge"/>
				<span class="help-inline">����������ʾ���磺���桰ĳĳ���ɹ�</span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">���ɹ�������:</label>
			<div class="controls">
				<form:input path="functionAuthor" htmlEscape="false" maxlength="500" class="required input-xlarge"/>
				<span class="help-inline">���ܿ�����</span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">ҵ�����:</label>
			<div class="controls">
				<form:select path="genTable.id" class="required input-xlarge">
					<form:options items="${tableList}" itemLabel="nameAndComments" itemValue="id" htmlEscape="false"/>
				</form:select>
				<span class="help-inline">���ɵ����ݱ�һ�Զ��������ѡ������</span>
			</div>
		</div>
		<div class="control-group hide">
			<label class="control-label">��ע:</label>
			<div class="controls">
				<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="200" class="input-xxlarge"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">����ѡ��:</label>
			<div class="controls">
				<form:checkbox path="replaceFile" label="�Ƿ��滻�����ļ�"/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="gen:genScheme:edit">
				<input id="btnSubmit" class="btn btn-primary" type="submit" value="���淽��" onclick="$('#flag').val('0');"/>&nbsp;
				<input id="btnSubmit" class="btn btn-danger" type="submit" value="���沢���ɴ���" onclick="$('#flag').val('1');"/>&nbsp;
			</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="�� ��" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>
