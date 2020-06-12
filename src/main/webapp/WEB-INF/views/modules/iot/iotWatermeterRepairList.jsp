<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>ά�޼�¼����</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
            //�����ʽ
            $("#dndTable").children("tr").hover(function () {
                $(this.cells).css('background', '#E4E4E4').eq(0).addClass('showDragHandle');
            }, function () {
                $(this.cells).css('background', '').eq(0).removeClass('showDragHandle');
            }).click(function () {//���������ɫ
                if (window._preCells) $(window._preCells).removeClass('my-text-shadow');
                $(window._preCells = this.cells).addClass('my-text-shadow');
            });
            //���ñ�
            $("#btnReset").click(function(){
                $("#searchForm")[0].reset();
            });
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs my-nav-tabs">
		<li class="active"><a href="${ctx}/iot/iotWatermeterRepair/?iotWatermeterId=${iotWatermeter.id}&watermeterNumForSelect=${iotWatermeter.watermeterNum}">ά�޼�¼�б�</a></li>
		<shiro:hasPermission name="iot:iotWatermeterRepair:edit"><li><a href="${ctx}/iot/iotWatermeterRepair/form?iotWatermeterId=${iotWatermeter.id}">ά�޼�¼���</a></li></shiro:hasPermission>
	</ul>
	<div class="my-container">
		<form:form id="searchForm"  method="post" class="breadcrumb form-search">
			<table class="table table-striped table-bordered table-condensed">
				<thead>
					<tr>
						<th>����</th>
						<%--<th>����</th>--%>
						<th>����</th>
						<th>�ɼ�����</th>
						<th>�ɼ������</th>
						<th>������</th>
						<th>���ڷ���</th>
						<th>��ˮ����</th>
						<th>ˮ����</th>
						<th>�豸����</th>
						<th>ˮ��״̬</th>
						<th>��װ����</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${iotWatermeter.name}</td>
						<%--<td>${iotWatermeter.area.name}</td>--%>
						<td>${iotWatermeter.farmName}</td>
						<td>${iotWatermeter.concentratorName}</td>
						<td>${iotWatermeter.concentratorNum}</td>
						<td>${iotWatermeter.houseName}</td>
						<td>${iotWatermeter.roomName}</td>
						<td>${fns:getDictLabel(iotWatermeter.watermeterType,'enum_watermeter_type','')}</td>
						<td>${iotWatermeter.watermeterNum}</td>
						<td>${fns:getDictLabel(iotWatermeter.deviceType,'enmu_device_type','')}</td>
						<td>${fns:getDictLabel(iotWatermeter.watermeterStatus,'enmu_watermeter_status','')}</td>
						<td>${iotWatermeter.installedTime}</td>
					</tr>
				</tbody>
			</table>
			<%--<ul class="ul-form">
				<li><label>���ƣ�</label>
					${iotWatermeter.name}
				</li>
				<li><label>����</label>
					${iotWatermeter.area.name}
				</li>
				<li><label>������</label>
					${iotWatermeter.farmName}
				</li>
				<li><label>�ɼ�������</label>
						${iotWatermeter.concentratorName}
				</li>
				<li><label>�ɼ�����ţ�</label>
						${iotWatermeter.concentratorNum}
				</li>
				<li><label>��������</label>
						${iotWatermeter.houseName}
				</li>
				<li><label>���ڷ��䣺</label>
						${iotWatermeter.roomName}
				</li>
				<li><label>��ˮ���ͣ�</label>
						${fns:getDictLabel(iotWatermeter.watermeterType,'enum_watermeter_type','')}
				</li>
				<li><label>ˮ���ţ�</label>
						${iotWatermeter.watermeterNum}
				</li>
				<li><label>�豸���ͣ�</label>
						${fns:getDictLabel(iotWatermeter.deviceType,'enmu_device_type','')}
				</li>
				<li><label>ˮ��״̬��</label>
						${fns:getDictLabel(iotWatermeter.watermeterStatus,'enmu_watermeter_status','')}
				</li>
				<li><label>��װ���ڣ�</label>
						${iotWatermeter.installedTime}
				</li>
				<li class="clearfix"></li>
			</ul>--%>
		</form:form>
		<sys:message content="${message}"/>
		<table id="contentTable" class="table table-striped table-bordered table-condensed">
			<thead>
				<tr>
					<th >��ˮ����</th>
					<th >��ˮ����</th>
					<th >��ˮ�����</th>
					<th >ά����</th>
					<th >ά��ʱ��</th>
					<th >ά������</th>
					<th >��������</th>
					<th >ά������</th>
					<th >��������</th>
					<%--<shiro:hasPermission name="iot:iotWatermeterRepair:edit"><th>����</th></shiro:hasPermission>--%>
				</tr>
			</thead>
			<tbody id="dndTable">
			<c:forEach items="${list}" var="iotWatermeterRepair" varStatus="status">
				<tr>
					<td>
					<%-- <a href="javascript:showDialogByUrl('${ctx}/iot/iotWatermeterRepair/view?id=${iotWatermeterRepair.id}','�鿴����');" target="_blank"> --%>
					<a href="${ctx}/iot/iotWatermeterRepair/view?id=${iotWatermeterRepair.id}&iotWatermeterId=${iotWatermeter.id}">
						${iotWatermeterRepair.watermeterNumNew}
					</a></td>
					<td>
						${iotWatermeterRepair.watermeterNumOld}
					</td>
					<td>
						${iotWatermeterRepair.countOld}
					</td>
					<td>
						${iotWatermeterRepair.repairBy.name}
					</td>
					<td>
						<fmt:formatDate value="${iotWatermeterRepair.repairTime}" pattern="yyyy-MM-dd"/>
					</td>
					<td>
						${fns:getDictLabel(iotWatermeterRepair.repairType, 'enum_repair_type', '')}
					</td>
					<td>
						${fns:getDictLabel(iotWatermeterRepair.faultType, 'enum_fault_type', '')}
					</td>
					<td>
						<textarea id="td-repairDesc-${status.index}" style="display:none;">
								${iotWatermeterRepair.repairDesc}
						</textarea>
						<a href="javascript:showDialogByIdVal('td-repairDesc-${status.index}','ά������');">
								${fns:abbr(fns:replaceHtml(iotWatermeterRepair.repairDesc),10)}
						</a>
					</td>
					<td>
						<textarea id="td-faultDesc-${status.index}" style="display:none;">
								${iotWatermeterRepair.faultDesc}
						</textarea>
						<a href="javascript:showDialogByIdVal('td-faultDesc-${status.index}','��������');">
								${fns:abbr(fns:replaceHtml(iotWatermeterRepair.faultDesc),10)}
						</a>
					</td>
					<%--<shiro:hasPermission name="iot:iotWatermeterRepair:edit"><td>
						<a href="${ctx}/iot/iotWatermeterRepair/form?id=${iotWatermeterRepair.id}">�޸�</a>
						<a href="${ctx}/iot/iotWatermeterRepair/delete?id=${iotWatermeterRepair.id}" onclick="return confirmx('ȷ��Ҫɾ����ά�޼�¼��', this.href)">ɾ��</a>
					</td></shiro:hasPermission>--%>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>