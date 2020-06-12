<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>ˮ��������Ϣ����</title>
	<meta name="decorator" content="default"/>
    <script src="${ctxStatic}/echarts/echarts.min.js"></script>
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
		<li><a href="${ctx}/iot/iotWatermeterReport/">ˮ��������Ϣ�б�</a></li>
		<li class="active"><a href="${ctx}/iot/iotWatermeterReport/form?id=${iotWatermeterReport.id}">ˮ��������Ϣ<shiro:hasPermission name="iot:iotWatermeterReport:edit">${not empty iotWatermeterReport.id?(isForEdit?'�޸�':'�鿴'):'���'}</shiro:hasPermission><shiro:lacksPermission name="iot:iotWatermeterReport:edit">�鿴</shiro:lacksPermission></a></li>
	</ul><br/>
	<div class="my-container">
        <form:form id="inputForm" modelAttribute="iotWatermeterReport" action="${ctx}/iot/iotWatermeterReport/save" method="post" class="form-horizontal">
            <form:hidden path="id"/>
            <sys:message content="${message}"/>
            <div class="control-group">
                <label class="control-label">ˮ���ţ�</label>
                <div class="controls">
                    ${iotWatermeterReport.watermeterNum}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">�ն�����</label>
                <div class="controls">
                    ${iotWatermeterReport.countCd}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">���ڣ�</label>
                <div class="controls">
                    ${iotWatermeterReport.collectCd}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">��������</label>
                <div class="controls">
                    ${iotWatermeterReport.flowDay}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">�ܶ�����</label>
                <div class="controls">
                    ${iotWatermeterReport.countCw}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">�ܣ�</label>
                <div class="controls">
                    ${iotWatermeterReport.collectCw}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">��������</label>
                <div class="controls">
                    ${iotWatermeterReport.flowWeek}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">�¶�����</label>
                <div class="controls">
                    ${iotWatermeterReport.countCm}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">�·ݣ�</label>
                <div class="controls">
                    ${iotWatermeterReport.collectCm}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">��������</label>
                <div class="controls">
                    ${iotWatermeterReport.flowMonth}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">��������</label>
                <div class="controls">
                    ${iotWatermeterReport.countCq}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">���ȣ�</label>
                <div class="controls">
                    ${iotWatermeterReport.collectCq}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">��������</label>
                <div class="controls">
                    ${iotWatermeterReport.flowQuarter}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">�������</label>
                <div class="controls">
                    ${iotWatermeterReport.countCy}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">��ݣ�</label>
                <div class="controls">
                    ${iotWatermeterReport.collectCy}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">��������</label>
                <div class="controls">
                    ${iotWatermeterReport.flowYear}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">��ע��</label>
                <div class="controls">
                    <pre>
                    ${iotWatermeterReport.remarks}
                    </pre>
                </div>
            </div>
            <div class="form-actions my-form-actions hide">
                <shiro:hasPermission name="iot:iotWatermeterReport:save"><input id="btnSubmit" class="btn btn-primary" type="submit" value="�� ��"/>&nbsp;</shiro:hasPermission>
                <input id="btnCancel" class="btn" type="button" value="�� ��" onclick="history.go(-1)"/>
            </div>
        </form:form>
    </div>
</body>
</html>