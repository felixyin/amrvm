<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>水表流量信息管理</title>
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
		<li><a href="${ctx}/iot/iotWatermeterFlow/">水表流量信息列表</a></li>
		<li class="active"><a href="${ctx}/iot/iotWatermeterFlow/form?id=${iotWatermeterFlow.id}">水表流量信息<shiro:hasPermission name="iot:iotWatermeterFlow:edit">${not empty iotWatermeterFlow.id?(isForEdit?'修改':'查看'):'添加'}</shiro:hasPermission><shiro:lacksPermission name="iot:iotWatermeterFlow:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<div class="my-container">
        <form:form id="inputForm" modelAttribute="iotWatermeterFlow" action="${ctx}/iot/iotWatermeterFlow/save" method="post" class="form-horizontal">
            <form:hidden path="id"/>
            <sys:message content="${message}"/>
            <div class="control-group">
                <label class="control-label">水表编号：</label>
                <div class="controls">
                    ${iotWatermeterFlow.watermeterNum}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">日读数：</label>
                <div class="controls">
                    ${iotWatermeterFlow.countCd}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">日期：</label>
                <div class="controls">
                    ${iotWatermeterFlow.collectCd}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">日流量：</label>
                <div class="controls">
                    ${iotWatermeterFlow.flowDay}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">周读数：</label>
                <div class="controls">
                    ${iotWatermeterFlow.countCw}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">周：</label>
                <div class="controls">
                    ${iotWatermeterFlow.collectCw}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">周流量：</label>
                <div class="controls">
                    ${iotWatermeterFlow.flowWeek}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">月读数：</label>
                <div class="controls">
                    ${iotWatermeterFlow.countCm}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">月份：</label>
                <div class="controls">
                    ${iotWatermeterFlow.collectCm}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">月流量：</label>
                <div class="controls">
                    ${iotWatermeterFlow.flowMonth}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">季读数：</label>
                <div class="controls">
                    ${iotWatermeterFlow.countCq}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">季度：</label>
                <div class="controls">
                    ${iotWatermeterFlow.collectCq}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">季流量：</label>
                <div class="controls">
                    ${iotWatermeterFlow.flowQuarter}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">年读数：</label>
                <div class="controls">
                    ${iotWatermeterFlow.countCy}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">年份：</label>
                <div class="controls">
                    ${iotWatermeterFlow.collectCy}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">年流量：</label>
                <div class="controls">
                    ${iotWatermeterFlow.flowYear}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">备注：</label>
                <div class="controls">
                    <pre>
                    ${iotWatermeterFlow.remarks}
                    </pre>
                </div>
            </div>
            <div class="form-actions my-form-actions hide">
                <shiro:hasPermission name="iot:iotWatermeterFlow:save"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
                <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
            </div>
        </form:form>
    </div>
</body>
</html>