<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>ˮ�����</title>
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
		<li><a href="${ctx}/iot/iotWatermeter/">ˮ���б�</a></li>
		<li class="active"><a href="${ctx}/iot/iotWatermeter/form?id=${iotWatermeter.id}">ˮ��<shiro:hasPermission name="iot:iotWatermeter:edit">${not empty iotWatermeter.id?(isForEdit?'�޸�':'�鿴'):'���'}</shiro:hasPermission><shiro:lacksPermission name="iot:iotWatermeter:edit">�鿴</shiro:lacksPermission></a></li>
	</ul><br/>
	<div class="my-container">
        <form:form id="inputForm" modelAttribute="iotWatermeter" action="${ctx}/iot/iotWatermeter/save" method="post" class="form-horizontal">
            <form:hidden path="id"/>
            <sys:message content="${message}"/>
           <%-- <div class="control-group">
                <label class="control-label">���ƣ�</label>
                <div class="controls">
                    ${iotWatermeter.name}
                </div>
            </div>--%>
            <div class="control-group">
                <label class="control-label">����</label>
                <div class="controls">
                    ${iotWatermeter.area.name}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">������</label>
                <div class="controls">
                    ${iotWatermeter.farmName}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">�ɼ�������</label>
                <div class="controls">
                    ${iotWatermeter.concentratorName}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">�ɼ�����ţ�</label>
                <div class="controls">
                    ${iotWatermeter.concentratorNum}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">��������</label>
                <div class="controls">
                    ${iotWatermeter.houseName}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">���ڷ��䣺</label>
                <div class="controls">
                    ${iotWatermeter.roomName}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">��ˮ���ͣ�</label>
                <div class="controls">
                    ${fns:getDictLabel(iotWatermeter.watermeterType,'enum_watermeter_type','')}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">ˮ���ţ�</label>
                <div class="controls">
                    ${iotWatermeter.watermeterNum}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">�豸���ͣ�</label>
                <div class="controls">
                    ${fns:getDictLabel(iotWatermeter.deviceType,'enmu_device_type','')}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">ˮ��״̬��</label>
                <div class="controls">
                    ${fns:getDictLabel(iotWatermeter.watermeterStatus,'enmu_watermeter_status','')}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">��װ���ڣ�</label>
                <div class="controls">
                    ${iotWatermeter.installedTime}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">��ע��</label>
                <div class="controls">
                    <pre>
                    ${iotWatermeter.remarks}
                    </pre>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">�б�����</label>
                <div class="controls">
                    ${iotWatermeter.orderNo}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">�ϼ�ID��</label>
                <div class="controls">
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">�㼶��</label>
                <div class="controls">
                    ${fns:getDictLabel(iotWatermeter.levelType,'enum_level_type','')}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">�����ϼ�ID��</label>
                <div class="controls">
                    ${iotWatermeter.parentIds}
                </div>
            </div>
            <div class="form-actions my-form-actions hide">
                <shiro:hasPermission name="iot:iotWatermeter:save"><input id="btnSubmit" class="btn btn-primary" type="submit" value="�� ��"/>&nbsp;</shiro:hasPermission>
                <input id="btnCancel" class="btn" type="button" value="�� ��" onclick="history.go(-1)"/>
            </div>
        </form:form>
    </div>
</body>
</html>