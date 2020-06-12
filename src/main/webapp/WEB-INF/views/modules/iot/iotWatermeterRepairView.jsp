<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>ά�޼�¼����</title>
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

            $('#jsCarousel').jsCarousel({ onthumbnailclick: function(src) {
                // �������������ͼƬ֮�󴥷���Ч��
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
		<li><a href="${ctx}/iot/iotWatermeterRepair/?iotWatermeterId=${iotWatermeter.id}&watermeterNumForSelect=${iotWatermeterRepair.watermeterNumForSelect}">ά�޼�¼�б�</a></li>
		<li class="active"><a href="${ctx}/iot/iotWatermeterRepair/form?id=${iotWatermeterRepair.id}&iotWatermeterId=${iotWatermeter.id}">ά�޼�¼<shiro:hasPermission name="iot:iotWatermeterRepair:edit">${not empty iotWatermeterRepair.id?(isForEdit?'�޸�':'�鿴'):'���'}</shiro:hasPermission><shiro:lacksPermission name="iot:iotWatermeterRepair:edit">�鿴</shiro:lacksPermission></a></li>
	</ul><br/>
	<div class="my-container">
        <form:form id="inputForm" modelAttribute="iotWatermeterRepair" action="${ctx}/iot/iotWatermeterRepair/save" method="post" class="form-horizontal">
            <form:hidden path="id"/>
            <sys:message content="${message}"/>
            <div class="control-group">
                <label class="control-label">��ˮ���ţ�</label>
                <div class="controls">
                    ${iotWatermeterRepair.watermeterNumNew}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">��ˮ���ţ�</label>
                <div class="controls">
                    ${iotWatermeterRepair.watermeterNumOld}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">��ˮ�������</label>
                <div class="controls">
                    ${iotWatermeterRepair.countOld}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">ά���ˣ�</label>
                <div class="controls">
                    ${iotWatermeterRepair.repairBy.name}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">ά��ʱ�䣺</label>
                <div class="controls">
                    <fmt:formatDate value="${iotWatermeterRepair.repairTime}" pattern="yyyy-MM-dd" />
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">ά�����ͣ�</label>
                <div class="controls">
                    ${fns:getDictLabel(iotWatermeterRepair.repairType,'enum_repair_type','')}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">ά��������</label>
                <div class="controls">
                    <form:textarea path="repairDesc" htmlEscape="false" rows="4" maxlength="255" readonly="true" disabled="true" class="input-xxlarge "/>
                    <sys:ckeditor replace="repairDesc" uploadPath="/repair" height="200"/>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">ά����Ƭ��</label>
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
                <label class="control-label">�������ͣ�</label>
                <div class="controls">
                    ${fns:getDictLabel(iotWatermeterRepair.faultType,'enum_fault_type','')}
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">����������</label>
                <div class="controls">
                    <form:textarea path="faultDesc" htmlEscape="false" rows="4" maxlength="255" readonly="true" disabled="true" class="input-xxlarge "/>
                    <sys:ckeditor replace="faultDesc" uploadPath="/repair" height="200"/>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label">��ע��</label>
                <div class="controls">
                    <form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="255" readonly="true" disabled="true" class="input-xxlarge "/>
                    <sys:ckeditor replace="remarks" uploadPath="/repair" height="200"/>
                </div>
            </div>
            <div class="form-actions my-form-actions hide">
                <shiro:hasPermission name="iot:iotWatermeterRepair:save"><input id="btnSubmit" class="btn btn-primary" type="submit" value="�� ��"/>&nbsp;</shiro:hasPermission>
                <input id="btnCancel" class="btn" type="button" value="�� ��" onclick="history.go(-1)"/>
            </div>
        </form:form>
    </div>
</body>
</html>