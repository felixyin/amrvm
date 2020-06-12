<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>水表管理</title>
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
		<li><a href="${ctx}/iot/iotWatermeter/">水表列表</a></li>
		<li class="active"><a href="${ctx}/iot/iotWatermeter/form?id=${iotWatermeter.id}">水表<shiro:hasPermission name="iot:iotWatermeter:edit">${not empty iotWatermeter.id?(isForEdit?'修改':'查看'):'添加'}</shiro:hasPermission><shiro:lacksPermission name="iot:iotWatermeter:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<div class="my-container">
        <form:form id="inputForm" modelAttribute="iotWatermeter" action="${ctx}/iot/iotWatermeter/save" method="post" class="form-horizontal">
            <form:hidden path="id"/>
            <sys:message content="${message}"/>
           <%-- <div class="control-group">
                <label class="control-label">名称：</label>
                <div class="controls">
                    ${iotWatermeter.name}
                </div>
            </div>--%>
            <div class="control-group">
                <label class="control-label">区域：</label>
                <div class="controls">
                    ${iotWatermeter.area.name}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">猪场名：</label>
                <div class="controls">
                    ${iotWatermeter.farmName}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">采集器名：</label>
                <div class="controls">
                    ${iotWatermeter.concentratorName}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">采集器编号：</label>
                <div class="controls">
                    ${iotWatermeter.concentratorNum}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">猪舍名：</label>
                <div class="controls">
                    ${iotWatermeter.houseName}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">所在房间：</label>
                <div class="controls">
                    ${iotWatermeter.roomName}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">用水类型：</label>
                <div class="controls">
                    ${fns:getDictLabel(iotWatermeter.watermeterType,'enum_watermeter_type','')}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">水表编号：</label>
                <div class="controls">
                    ${iotWatermeter.watermeterNum}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">设备类型：</label>
                <div class="controls">
                    ${fns:getDictLabel(iotWatermeter.deviceType,'enmu_device_type','')}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">水表状态：</label>
                <div class="controls">
                    ${fns:getDictLabel(iotWatermeter.watermeterStatus,'enmu_watermeter_status','')}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">安装日期：</label>
                <div class="controls">
                    ${iotWatermeter.installedTime}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">备注：</label>
                <div class="controls">
                    <pre>
                    ${iotWatermeter.remarks}
                    </pre>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">列表排序：</label>
                <div class="controls">
                    ${iotWatermeter.orderNo}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">上级ID：</label>
                <div class="controls">
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">层级：</label>
                <div class="controls">
                    ${fns:getDictLabel(iotWatermeter.levelType,'enum_level_type','')}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">所有上级ID：</label>
                <div class="controls">
                    ${iotWatermeter.parentIds}
                </div>
            </div>
            <div class="form-actions my-form-actions hide">
                <shiro:hasPermission name="iot:iotWatermeter:save"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
                <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
            </div>
        </form:form>
    </div>
</body>
</html>