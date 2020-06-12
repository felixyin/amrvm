<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>水表流量信息管理</title>
	<meta name="decorator" content="default"/>
    <script src="${ctxStatic}/echarts/echarts.min.js"></script>
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
		<li><a href="${ctx}/iot/iotWatermeterReport/">水表流量信息列表</a></li>
		<li class="active"><a href="${ctx}/iot/iotWatermeterReport/form?id=${iotWatermeterReport.id}">水表流量信息<shiro:hasPermission name="iot:iotWatermeterReport:edit">${not empty iotWatermeterReport.id?(isForEdit?'修改':'查看'):'添加'}</shiro:hasPermission><shiro:lacksPermission name="iot:iotWatermeterReport:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<div class="my-container">
        <form:form id="inputForm" modelAttribute="iotWatermeterReport" action="${ctx}/iot/iotWatermeterReport/save" method="post" class="form-horizontal">
            <form:hidden path="id"/>
            <sys:message content="${message}"/>
            <div class="control-group">
                <label class="control-label">水表编号：</label>
                <div class="controls">
                    ${iotWatermeterReport.watermeterNum}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">日读数：</label>
                <div class="controls">
                    ${iotWatermeterReport.countCd}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">日期：</label>
                <div class="controls">
                    ${iotWatermeterReport.collectCd}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">日流量：</label>
                <div class="controls">
                    ${iotWatermeterReport.flowDay}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">周读数：</label>
                <div class="controls">
                    ${iotWatermeterReport.countCw}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">周：</label>
                <div class="controls">
                    ${iotWatermeterReport.collectCw}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">周流量：</label>
                <div class="controls">
                    ${iotWatermeterReport.flowWeek}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">月读数：</label>
                <div class="controls">
                    ${iotWatermeterReport.countCm}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">月份：</label>
                <div class="controls">
                    ${iotWatermeterReport.collectCm}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">月流量：</label>
                <div class="controls">
                    ${iotWatermeterReport.flowMonth}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">季读数：</label>
                <div class="controls">
                    ${iotWatermeterReport.countCq}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">季度：</label>
                <div class="controls">
                    ${iotWatermeterReport.collectCq}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">季流量：</label>
                <div class="controls">
                    ${iotWatermeterReport.flowQuarter}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">年读数：</label>
                <div class="controls">
                    ${iotWatermeterReport.countCy}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">年份：</label>
                <div class="controls">
                    ${iotWatermeterReport.collectCy}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">年流量：</label>
                <div class="controls">
                    ${iotWatermeterReport.flowYear}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">备注：</label>
                <div class="controls">
                    <pre>
                    ${iotWatermeterReport.remarks}
                    </pre>
                </div>
            </div>
            <div class="form-actions my-form-actions hide">
                <shiro:hasPermission name="iot:iotWatermeterReport:save"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
                <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
            </div>
        </form:form>
    </div>
</body>
</html>