<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>视频监控管理</title>
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
	<ul class="nav nav-tabs  my-nav-tabs ">
		<li><a href="${ctx}/iot/iotVideoMonitor/">视频监控设置列表</a></li>
		<li class="active"><a href="${ctx}/iot/iotVideoMonitor/form?id=${iotVideoMonitor.id}">视频监控设置<shiro:hasPermission name="iot:iotVideoMonitor:edit">${not empty iotVideoMonitor.id?(isForEdit?'修改':'查看'):'添加'}</shiro:hasPermission><shiro:lacksPermission name="iot:iotVideoMonitor:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<div class="my-container">
        <form:form id="inputForm" modelAttribute="iotVideoMonitor" action="${ctx}/iot/iotVideoMonitor/save" method="post" class="form-horizontal">
            <form:hidden path="id"/>
            <sys:message content="${message}"/>
            <div class="control-group">
                <label class="control-label">猪场名：</label>
                <div class="controls">
                        ${iotVideoMonitor.office.name}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">账号：</label>
                <div class="controls">
                    ${iotVideoMonitor.account}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">密码：</label>
                <div class="controls">
                    ${iotVideoMonitor.password}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">服务器地址：</label>
                <div class="controls">
                    ${iotVideoMonitor.ip}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">设备端口：</label>
                <div class="controls">
                    ${iotVideoMonitor.devicePort}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">网络端口：</label>
                <div class="controls">
                    ${iotVideoMonitor.httpPort}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">窗口分割数：</label>
                <div class="controls">
                    ${fns:getDictLabel(iotVideoMonitor.windowCount,'enum_window_count','')}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">备注：</label>
                <div class="controls">
                    <pre>
                    ${iotVideoMonitor.remarks}
                    </pre>
                </div>
            </div>
            <div class="form-actions my-form-actions hide">
                <shiro:hasPermission name="iot:iotVideoMonitor:save"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
                <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
            </div>
        </form:form>
    </div>
</body>
</html>