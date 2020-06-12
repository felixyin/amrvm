<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>水表流量阈值管理</title>
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
		<li><a href="${ctx}/iot/iotWatermeterVpt/">水表流量阈值列表</a></li>
		<li class="active"><a href="${ctx}/iot/iotWatermeterVpt/form?id=${iotWatermeterVpt.id}">水表流量阈值<shiro:hasPermission name="iot:iotWatermeterVpt:edit">${not empty iotWatermeterVpt.id?(isForEdit?'修改':'查看'):'添加'}</shiro:hasPermission><shiro:lacksPermission name="iot:iotWatermeterVpt:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<div class="my-container">
        <form:form id="inputForm" modelAttribute="iotWatermeterVpt" action="${ctx}/iot/iotWatermeterVpt/save" method="post" class="form-horizontal">
            <form:hidden path="id"/>
            <sys:message content="${message}"/>
            <%--<div class="control-group">
                <label class="control-label">最小值：</label>
                <div class="controls">
                    ${iotWatermeterVpt.minFlow}
                </div>
            </div>--%>
            <div class="control-group">
                <label class="control-label">最大值：</label>
                <div class="controls">
                    ${iotWatermeterVpt.maxFlow}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">日期范围：</label>
                <div class="controls">
                    ${fns:getDictLabel(iotWatermeterVpt.dateName,'enum_date_name','')}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">备注：</label>
                <div class="controls">
                    <pre>
                    ${iotWatermeterVpt.remarks}
                    </pre>
                </div>
            </div>
            <div class="form-actions my-form-actions hide">
                <shiro:hasPermission name="iot:iotWatermeterVpt:save"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
                <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
            </div>
        </form:form>
    </div>
</body>
</html>