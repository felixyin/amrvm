<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>维修记录管理</title>
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

            $('#jsCarousel').jsCarousel({ onthumbnailclick: function(src) {
                // 可在这里加入点击图片之后触发的效果
                $("#overlay_pic").attr('src', src);
                $(".overlay").show();
            } });

            $(".overlay").click(function(){
                $(this).hide();
            });
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs  my-nav-tabs ">
		<li><a href="${ctx}/iot/iotWatermeterRepair/?iotWatermeterId=${iotWatermeter.id}&watermeterNumForSelect=${iotWatermeterRepair.watermeterNumForSelect}">维修记录列表</a></li>
		<li class="active"><a href="${ctx}/iot/iotWatermeterRepair/form?id=${iotWatermeterRepair.id}&iotWatermeterId=${iotWatermeter.id}">维修记录<shiro:hasPermission name="iot:iotWatermeterRepair:edit">${not empty iotWatermeterRepair.id?(isForEdit?'修改':'查看'):'添加'}</shiro:hasPermission><shiro:lacksPermission name="iot:iotWatermeterRepair:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<div class="my-container">
        <form:form id="inputForm" modelAttribute="iotWatermeterRepair" action="${ctx}/iot/iotWatermeterRepair/save" method="post" class="form-horizontal">
            <form:hidden path="id"/>
            <sys:message content="${message}"/>
            <div class="control-group">
                <label class="control-label">新水表编号：</label>
                <div class="controls">
                    ${iotWatermeterRepair.watermeterNumNew}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">老水表编号：</label>
                <div class="controls">
                    ${iotWatermeterRepair.watermeterNumOld}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">老水表读数：</label>
                <div class="controls">
                    ${iotWatermeterRepair.countOld}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">维修人：</label>
                <div class="controls">
                    ${iotWatermeterRepair.repairBy.name}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">维修时间：</label>
                <div class="controls">
                    <fmt:formatDate value="${iotWatermeterRepair.repairTime}" pattern="yyyy-MM-dd" />
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">维修类型：</label>
                <div class="controls">
                    ${fns:getDictLabel(iotWatermeterRepair.repairType,'enum_repair_type','')}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">维修描述：</label>
                <div class="controls">
                    <form:textarea path="repairDesc" htmlEscape="false" rows="4" maxlength="255" readonly="true" disabled="true" class="input-xxlarge "/>
                    <sys:ckeditor replace="repairDesc" uploadPath="/repair" height="200"/>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">维修照片：</label>
                <div class="controls">
                    <div class="overlay"><img src="" id="overlay_pic"></div>
                    <div>
                        <div id="jsCarousel">
                            <c:forEach items="${fn:split(iotWatermeterRepair.repairPhoto, '|') }" var="imgUrl">
                                <div>
                                    <img src="${imgUrl}">
                                </div>
                            </c:forEach>
                        </div>
                        <div id="demo-side-bar">
                        </div>
                    </div>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">故障类型：</label>
                <div class="controls">
                    ${fns:getDictLabel(iotWatermeterRepair.faultType,'enum_fault_type','')}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">故障描述：</label>
                <div class="controls">
                    <form:textarea path="faultDesc" htmlEscape="false" rows="4" maxlength="255" readonly="true" disabled="true" class="input-xxlarge "/>
                    <sys:ckeditor replace="faultDesc" uploadPath="/repair" height="200"/>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">备注：</label>
                <div class="controls">
                    <form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" readonly="true" disabled="true" class="input-xxlarge "/>
                    <sys:ckeditor replace="remarks" uploadPath="/repair" height="200"/>
                </div>
            </div>
            <div class="form-actions my-form-actions hide">
                <shiro:hasPermission name="iot:iotWatermeterRepair:save"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
                <input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
            </div>
        </form:form>
    </div>
</body>
</html>