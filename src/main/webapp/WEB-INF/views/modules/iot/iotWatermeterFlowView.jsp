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
	<ul class="nav nav-tabs  my-nav-tabs ">
		<li><a href="${ctx}/iot/iotWatermeterFlow/">ˮ��������Ϣ�б�</a></li>
		<li class="active"><a href="${ctx}/iot/iotWatermeterFlow/form?id=${iotWatermeterFlow.id}">ˮ��������Ϣ<shiro:hasPermission name="iot:iotWatermeterFlow:edit">${not empty iotWatermeterFlow.id?(isForEdit?'�޸�':'�鿴'):'���'}</shiro:hasPermission><shiro:lacksPermission name="iot:iotWatermeterFlow:edit">�鿴</shiro:lacksPermission></a></li>
	</ul><br/>
	<div class="my-container">
        <form:form id="inputForm" modelAttribute="iotWatermeterFlow" action="${ctx}/iot/iotWatermeterFlow/save" method="post" class="form-horizontal">
            <form:hidden path="id"/>
            <sys:message content="${message}"/>
            <div class="control-group">
                <label class="control-label">ˮ���ţ�</label>
                <div class="controls">
                    ${iotWatermeterFlow.watermeterNum}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">�ն�����</label>
                <div class="controls">
                    ${iotWatermeterFlow.countCd}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">���ڣ�</label>
                <div class="controls">
                    ${iotWatermeterFlow.collectCd}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">��������</label>
                <div class="controls">
                    ${iotWatermeterFlow.flowDay}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">�ܶ�����</label>
                <div class="controls">
                    ${iotWatermeterFlow.countCw}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">�ܣ�</label>
                <div class="controls">
                    ${iotWatermeterFlow.collectCw}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">��������</label>
                <div class="controls">
                    ${iotWatermeterFlow.flowWeek}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">�¶�����</label>
                <div class="controls">
                    ${iotWatermeterFlow.countCm}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">�·ݣ�</label>
                <div class="controls">
                    ${iotWatermeterFlow.collectCm}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">��������</label>
                <div class="controls">
                    ${iotWatermeterFlow.flowMonth}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">��������</label>
                <div class="controls">
                    ${iotWatermeterFlow.countCq}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">���ȣ�</label>
                <div class="controls">
                    ${iotWatermeterFlow.collectCq}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">��������</label>
                <div class="controls">
                    ${iotWatermeterFlow.flowQuarter}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">�������</label>
                <div class="controls">
                    ${iotWatermeterFlow.countCy}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">��ݣ�</label>
                <div class="controls">
                    ${iotWatermeterFlow.collectCy}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">��������</label>
                <div class="controls">
                    ${iotWatermeterFlow.flowYear}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">��ע��</label>
                <div class="controls">
                    <pre>
                    ${iotWatermeterFlow.remarks}
                    </pre>
                </div>
            </div>
            <div class="form-actions my-form-actions hide">
                <shiro:hasPermission name="iot:iotWatermeterFlow:save"><input id="btnSubmit" class="btn btn-primary" type="submit" value="�� ��"/>&nbsp;</shiro:hasPermission>
                <input id="btnCancel" class="btn" type="button" value="�� ��" onclick="history.go(-1)"/>
            </div>
        </form:form>
    </div>
</body>
</html>