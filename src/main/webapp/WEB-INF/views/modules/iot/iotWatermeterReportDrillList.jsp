<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>ˮ��ͳ�Ʊ������</title>
	<meta name="decorator" content="default"/>
	<script src="${ctxStatic}/jQuery-TableHeadFixer/tableHeadFixer.js" type="text/javascript"></script>
	<script type="text/javascript">
        $(document).ready(function() {
            $("#contentTable").tableHeadFixer({"head": true, "left": 0});
            //ȫѡ
            $("#all").click(function(){
                if(this.checked) {
                    $("input[name='ids']").prop("checked",true);
                }
                else {
                    $("input[name='ids']").prop("checked",false);
                }
            });
            //��ѡ
            $("input[name='ids']").click(function () {
                isall = $("input[name='ids']").length == $("input[name='ids']:checked").length;
                $('#all').prop('checked', isall);
            });
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
		<li class="active"><a href="${ctx}/iot/iotWatermeter/">ˮ��ͳ�Ʊ����б�</a></li>
		&lt;%&ndash;<shiro:hasPermission name="iot:iotWatermeter:edit"><li><a href="${ctx}/iot/iotWatermeter/form">ˮ�����</a></li></shiro:hasPermission>&ndash;%&gt;
	</ul>--%>
	<form:form id="searchForm" modelAttribute="iotWatermeter" action="${ctx}/iot/iotWatermeterFlow/reportDrillList" method="post" class="hide breadcrumb form-search">
		<form:hidden path="id" />
		<form:hidden path="datename"/>
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<input id="orderBy" name="orderBy" type="hidden" value="${page.orderBy}">
		<%--<ul class="ul-form">
			<li><label>���ƣ�</label>
				<sys:treeselect id="iotWatermeter" name="ids" value="${iotWatermeter.ids}" labelName="name" labelValue="${iotWatermeter.name}"
								checked="true"		title="��" url="/iot/iotWatermeter/treeData2" cssClass="" allowClear="true" notAllowSelectParent="true"/>
			</li>
			<li><label>��ˮ���ͣ�</label>
				<form:select id="watermeterType" path="watermeterType" class="input-medium3" multiple="multiple">
					<form:option value="-1" label="ȫ��"/>
					<form:options items="${fns:getDictList('enum_watermeter_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>�豸���ͣ�</label>
				<form:select path="deviceType" class="input-medium">
					<form:option value="-1" label="ȫ��"/>
					<form:options items="${fns:getDictList('enmu_device_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
				&lt;%&ndash;<li><label>���ڷ�Χ��</label>
                    <form:select path="datename" class="input-medium2">
                        <form:options items="${fns:getDictList('enum_date_name')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
                    </form:select>
                </li>&ndash;%&gt;
			<li><label>ʱ�����䣺</label>
				<input id="startTime" name="startTime" type="text" readonly="readonly" maxlength="20" class="input-small Wdate"
					   value="${iotWatermeter.startTime}"
					   onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"  onFocus="WdatePicker({maxDate:'#F{$dp.$D(\'endTime\')}'})"/>
				-
				<input id="endTime" name="endTime" type="text" readonly="readonly" maxlength="20" class="input-small Wdate"
					   value="${iotWatermeter.endTime}"
					   onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"  onFocus="WdatePicker({minDate:'#F{$dp.$D(\'startTime\')}'})"/>
			</li>
			<li><label>ˮ��״̬��</label>
				<form:select path="watermeterStatus" class="input-medium">
					<form:option value="" label="ȫ��"/>
					<form:options items="${fns:getDictList('enmu_watermeter_status')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li class="btns">
				<input id="btnSubmit" class="btn btn-primary" type="submit" value="��ѯ"/>
				<input id="btnReset" class="btn btn-default" type="button" value="����"/>
			</li>
			<li class="clearfix"></li>
		</ul>--%>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped my-table-bordered table-condensed">
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
				<th>ˮ��״̬</th>
				<th >ʱ��</th>
				<th >�����</th>
				<th >����</th>
				<%--<th >�ܶ���</th>
                <th >��</th>--%>
				<%--<th >������</th>--%>
				<%--<th >�¶���</th>
                <th >�·�</th>--%>
				<%--<th >������</th>--%>
				<%--<th >������</th>
                <th >����</th>--%>
				<%--<th >������</th>--%>
				<%--<th >�����</th>
                <th >���</th>--%>
				<%--<th >������</th>--%>
				<%--<th>��װ����</th>--%>
				<%--<th>�޸�ʱ��</th>
                <th>��ע</th>--%>
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
						<a onclick="showDialogByUrl2('${ctx}/iot/iotWatermeterCollect/?watermeterNum=${iotWatermeter.watermeterNum}','ˮ��ɼ���ϸ')">
							<b style="color:${iotWatermeter.iotWatermeterFlow.colorFlowPair.color}"
							   <c:if test="${iotWatermeter.iotWatermeterFlow.colorFlowPair.flow != null}">title="��ˮ���ѳ���${iotWatermeter.iotWatermeterFlow.colorFlowPair.flow}����"</c:if>>
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
                            <b style="color:${iotWatermeter.weekPair.color}" title="��ˮ���ѳ���${iotWatermeter.weekPair.flow}����">${iotWatermeter.iotWatermeterFlow.flowWeek}</b>
                        </td>--%>
						<%--<td>
                            ${iotWatermeter.iotWatermeterFlow.countCm}
                        </td>
                        <td>
                            ${iotWatermeter.iotWatermeterFlow.collectCm}
                        </td>--%>
						<%--<td>
                            <b style="color:${iotWatermeter.monthPair.color}" title="��ˮ���ѳ���${iotWatermeter.monthPair.flow}����">${iotWatermeter.iotWatermeterFlow.flowMonth}</b>
                        </td>--%>
						<%--<td>
                            ${iotWatermeter.iotWatermeterFlow.countCq}
                        </td>
                        <td>
                            ${iotWatermeter.iotWatermeterFlow.collectCq}
                        </td>--%>
						<%--<td>
                            <b style="color:${iotWatermeter.quarterPair.color}" title="��ˮ���ѳ���${iotWatermeter.quarterPair.flow}����">${iotWatermeter.iotWatermeterFlow.flowQuarter}</b>
                        </td>--%>
						<%--<td>
                            ${iotWatermeter.iotWatermeterFlow.countCy}
                        </td>
                        <td>
                            ${iotWatermeter.iotWatermeterFlow.collectCy}
                        </td>--%>
						<%--<td>
                            <b style="color:${iotWatermeter.yearPair.color}}" title="��ˮ���ѳ���{{row.yearPair.flow}}����">{{row.iotWatermeterFlow.flowYear}</b>
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