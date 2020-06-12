<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>维修记录管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
            //表格样式
            $("#dndTable").children("tr").hover(function () {
                $(this.cells).css('background', '#E4E4E4').eq(0).addClass('showDragHandle');
            }, function () {
                $(this.cells).css('background', '').eq(0).removeClass('showDragHandle');
            }).click(function () {//点击背景变色
                if (window._preCells) $(window._preCells).removeClass('my-text-shadow');
                $(window._preCells = this.cells).addClass('my-text-shadow');
            });
            //重置表单
            $("#btnReset").click(function(){
                $("#searchForm")[0].reset();
            });
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs my-nav-tabs">
		<li class="active"><a href="${ctx}/iot/iotWatermeterRepair/?iotWatermeterId=${iotWatermeter.id}&watermeterNumForSelect=${iotWatermeter.watermeterNum}">维修记录列表</a></li>
		<shiro:hasPermission name="iot:iotWatermeterRepair:edit"><li><a href="${ctx}/iot/iotWatermeterRepair/form?iotWatermeterId=${iotWatermeter.id}">维修记录添加</a></li></shiro:hasPermission>
	</ul>
	<div class="my-container">
		<form:form id="searchForm"  method="post" class="breadcrumb form-search">
			<table class="table table-striped table-bordered table-condensed">
				<thead>
					<tr>
						<th>名称</th>
						<%--<th>区域</th>--%>
						<th>猪场名</th>
						<th>采集器名</th>
						<th>采集器编号</th>
						<th>猪舍名</th>
						<th>所在房间</th>
						<th>用水类型</th>
						<th>水表编号</th>
						<th>设备类型</th>
						<th>水表状态</th>
						<th>安装日期</th>
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
				<li><label>名称：</label>
					${iotWatermeter.name}
				</li>
				<li><label>区域：</label>
					${iotWatermeter.area.name}
				</li>
				<li><label>猪场名：</label>
					${iotWatermeter.farmName}
				</li>
				<li><label>采集器名：</label>
						${iotWatermeter.concentratorName}
				</li>
				<li><label>采集器编号：</label>
						${iotWatermeter.concentratorNum}
				</li>
				<li><label>猪舍名：</label>
						${iotWatermeter.houseName}
				</li>
				<li><label>所在房间：</label>
						${iotWatermeter.roomName}
				</li>
				<li><label>用水类型：</label>
						${fns:getDictLabel(iotWatermeter.watermeterType,'enum_watermeter_type','')}
				</li>
				<li><label>水表编号：</label>
						${iotWatermeter.watermeterNum}
				</li>
				<li><label>设备类型：</label>
						${fns:getDictLabel(iotWatermeter.deviceType,'enmu_device_type','')}
				</li>
				<li><label>水表状态：</label>
						${fns:getDictLabel(iotWatermeter.watermeterStatus,'enmu_watermeter_status','')}
				</li>
				<li><label>安装日期：</label>
						${iotWatermeter.installedTime}
				</li>
				<li class="clearfix"></li>
			</ul>--%>
		</form:form>
		<sys:message content="${message}"/>
		<table id="contentTable" class="table table-striped table-bordered table-condensed">
			<thead>
				<tr>
					<th >新水表编号</th>
					<th >老水表编号</th>
					<th >老水表读数</th>
					<th >维修人</th>
					<th >维修时间</th>
					<th >维修类型</th>
					<th >故障类型</th>
					<th >维修描述</th>
					<th >故障描述</th>
					<%--<shiro:hasPermission name="iot:iotWatermeterRepair:edit"><th>操作</th></shiro:hasPermission>--%>
				</tr>
			</thead>
			<tbody id="dndTable">
			<c:forEach items="${list}" var="iotWatermeterRepair" varStatus="status">
				<tr>
					<td>
					<%-- <a href="javascript:showDialogByUrl('${ctx}/iot/iotWatermeterRepair/view?id=${iotWatermeterRepair.id}','查看详情');" target="_blank"> --%>
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
						<a href="javascript:showDialogByIdVal('td-repairDesc-${status.index}','维修描述');">
								${fns:abbr(fns:replaceHtml(iotWatermeterRepair.repairDesc),10)}
						</a>
					</td>
					<td>
						<textarea id="td-faultDesc-${status.index}" style="display:none;">
								${iotWatermeterRepair.faultDesc}
						</textarea>
						<a href="javascript:showDialogByIdVal('td-faultDesc-${status.index}','故障描述');">
								${fns:abbr(fns:replaceHtml(iotWatermeterRepair.faultDesc),10)}
						</a>
					</td>
					<%--<shiro:hasPermission name="iot:iotWatermeterRepair:edit"><td>
						<a href="${ctx}/iot/iotWatermeterRepair/form?id=${iotWatermeterRepair.id}">修改</a>
						<a href="${ctx}/iot/iotWatermeterRepair/delete?id=${iotWatermeterRepair.id}" onclick="return confirmx('确认要删除该维修记录吗？', this.href)">删除</a>
					</td></shiro:hasPermission>--%>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>