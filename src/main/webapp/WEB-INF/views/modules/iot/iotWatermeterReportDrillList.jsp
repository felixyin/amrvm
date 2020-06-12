<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>水表统计报表管理</title>
	<meta name="decorator" content="default"/>
	<script src="${ctxStatic}/jQuery-TableHeadFixer/tableHeadFixer.js" type="text/javascript"></script>
	<script type="text/javascript">
        $(document).ready(function() {
            $("#contentTable").tableHeadFixer({"head": true, "left": 0});
            //全选
            $("#all").click(function(){
                if(this.checked) {
                    $("input[name='ids']").prop("checked",true);
                }
                else {
                    $("input[name='ids']").prop("checked",false);
                }
            });
            //单选
            $("input[name='ids']").click(function () {
                isall = $("input[name='ids']").length == $("input[name='ids']:checked").length;
                $('#all').prop('checked', isall);
            });
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
        function page(n,s){
            $("#pageNo").val(n);
            $("#pageSize").val(s);
            $("#searchForm").submit();
            return false;
        }
	</script>
</head>
<body>
<%--	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/iot/iotWatermeter/">水表统计报表列表</a></li>
		&lt;%&ndash;<shiro:hasPermission name="iot:iotWatermeter:edit"><li><a href="${ctx}/iot/iotWatermeter/form">水表添加</a></li></shiro:hasPermission>&ndash;%&gt;
	</ul>--%>
	<form:form id="searchForm" modelAttribute="iotWatermeter" action="${ctx}/iot/iotWatermeterFlow/reportDrillList" method="post" class="hide breadcrumb form-search">
		<form:hidden path="id" />
		<form:hidden path="datename"/>
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<input id="orderBy" name="orderBy" type="hidden" value="${page.orderBy}">
		<%--<ul class="ul-form">
			<li><label>名称：</label>
				<sys:treeselect id="iotWatermeter" name="ids" value="${iotWatermeter.ids}" labelName="name" labelValue="${iotWatermeter.name}"
								checked="true"		title="猪场" url="/iot/iotWatermeter/treeData2" cssClass="" allowClear="true" notAllowSelectParent="true"/>
			</li>
			<li><label>用水类型：</label>
				<form:select id="watermeterType" path="watermeterType" class="input-medium3" multiple="multiple">
					<form:option value="-1" label="全部"/>
					<form:options items="${fns:getDictList('enum_watermeter_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>设备类型：</label>
				<form:select path="deviceType" class="input-medium">
					<form:option value="-1" label="全部"/>
					<form:options items="${fns:getDictList('enmu_device_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
				&lt;%&ndash;<li><label>日期范围：</label>
                    <form:select path="datename" class="input-medium2">
                        <form:options items="${fns:getDictList('enum_date_name')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
                    </form:select>
                </li>&ndash;%&gt;
			<li><label>时间区间：</label>
				<input id="startTime" name="startTime" type="text" readonly="readonly" maxlength="20" class="input-small Wdate"
					   value="${iotWatermeter.startTime}"
					   onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"  onFocus="WdatePicker({maxDate:'#F{$dp.$D(\'endTime\')}'})"/>
				-
				<input id="endTime" name="endTime" type="text" readonly="readonly" maxlength="20" class="input-small Wdate"
					   value="${iotWatermeter.endTime}"
					   onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"  onFocus="WdatePicker({minDate:'#F{$dp.$D(\'startTime\')}'})"/>
			</li>
			<li><label>水表状态：</label>
				<form:select path="watermeterStatus" class="input-medium">
					<form:option value="" label="全部"/>
					<form:options items="${fns:getDictList('enmu_watermeter_status')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li class="btns">
				<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
				<input id="btnReset" class="btn btn-default" type="button" value="重置"/>
			</li>
			<li class="clearfix"></li>
		</ul>--%>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped my-table-bordered table-condensed">
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
				<th>水表状态</th>
				<th >时间</th>
				<th >表读数</th>
				<th >流量</th>
				<%--<th >周读数</th>
                <th >周</th>--%>
				<%--<th >周流量</th>--%>
				<%--<th >月读数</th>
                <th >月份</th>--%>
				<%--<th >月流量</th>--%>
				<%--<th >季读数</th>
                <th >季度</th>--%>
				<%--<th >季流量</th>--%>
				<%--<th >年读数</th>
                <th >年份</th>--%>
				<%--<th >年流量</th>--%>
				<%--<th>安装日期</th>--%>
				<%--<th>修改时间</th>
                <th>备注</th>--%>
			</tr>
			</thead>
			<tbody id="dndTable">
			<c:forEach items="${page.list}" var="iotWatermeter">
				<tr>
					<td>
							${iotWatermeter.name}
					</td>
						<%--<td>
                            ${iotWatermeter.area.name}
                        </td>--%>
					<td>
							${iotWatermeter.farmName}
					</td>
					<td>
							${iotWatermeter.concentratorName}
					</td>
					<td>
							${iotWatermeter.concentratorNum}
					</td>
					<td>
							${iotWatermeter.houseName}
					</td>
					<td>
							${iotWatermeter.roomName}
					</td>
					<td>
							${fns:getDictLabel(iotWatermeter.watermeterType, 'enum_watermeter_type', '')}
					</td>
					<td>
							${iotWatermeter.watermeterNum}
					</td>
					<td>
						<b style="color:${iotWatermeter.watermeterStatus == "1" ? "" : "red"}">${fns:getDictLabel(iotWatermeter.watermeterStatus, 'enmu_watermeter_status', '')}</b>
					</td>
					<td>
							${iotWatermeter.iotWatermeterFlow.collect}
					</td>
					<td>
							${iotWatermeter.iotWatermeterFlow.countCd}
					</td>
					<td>
						<a onclick="showDialogByUrl2('${ctx}/iot/iotWatermeterCollect/?watermeterNum=${iotWatermeter.watermeterNum}','水表采集明细')">
							<b style="color:${iotWatermeter.iotWatermeterFlow.colorFlowPair.color}"
							   <c:if test="${iotWatermeter.iotWatermeterFlow.colorFlowPair.flow != null}">title="该水表已超出${iotWatermeter.iotWatermeterFlow.colorFlowPair.flow}立方"</c:if>>
									${iotWatermeter.iotWatermeterFlow.flow}
							</b>
						</a>
					</td>
						<%--<td>
                            ${iotWatermeter.iotWatermeterFlow.countCw}
                        </td>
                        <td>
                            ${iotWatermeter.iotWatermeterFlow.collectCw}
                        </td>--%>
						<%--<td>
                            <b style="color:${iotWatermeter.weekPair.color}" title="该水表已超出${iotWatermeter.weekPair.flow}立方">${iotWatermeter.iotWatermeterFlow.flowWeek}</b>
                        </td>--%>
						<%--<td>
                            ${iotWatermeter.iotWatermeterFlow.countCm}
                        </td>
                        <td>
                            ${iotWatermeter.iotWatermeterFlow.collectCm}
                        </td>--%>
						<%--<td>
                            <b style="color:${iotWatermeter.monthPair.color}" title="该水表已超出${iotWatermeter.monthPair.flow}立方">${iotWatermeter.iotWatermeterFlow.flowMonth}</b>
                        </td>--%>
						<%--<td>
                            ${iotWatermeter.iotWatermeterFlow.countCq}
                        </td>
                        <td>
                            ${iotWatermeter.iotWatermeterFlow.collectCq}
                        </td>--%>
						<%--<td>
                            <b style="color:${iotWatermeter.quarterPair.color}" title="该水表已超出${iotWatermeter.quarterPair.flow}立方">${iotWatermeter.iotWatermeterFlow.flowQuarter}</b>
                        </td>--%>
						<%--<td>
                            ${iotWatermeter.iotWatermeterFlow.countCy}
                        </td>
                        <td>
                            ${iotWatermeter.iotWatermeterFlow.collectCy}
                        </td>--%>
						<%--<td>
                            <b style="color:${iotWatermeter.yearPair.color}}" title="该水表已超出{{row.yearPair.flow}}立方">{{row.iotWatermeterFlow.flowYear}</b>
                        </td>--%>
						<%--<td>
                            ${iotWatermeter.installedTime}
                        </td>--%>
						<%--<td>
                            ${iotWatermeter.updateDate}
                        </td>
                        <td>
                            ${iotWatermeter.remarks}
                        </td>--%>
				</tr>
			</c:forEach>
			</tbody>
			<tfoot>
				<tr><td colspan="12"><div class="pagination">${page}</div></td></tr>
			</tfoot>
		</table>


</body>
</html>