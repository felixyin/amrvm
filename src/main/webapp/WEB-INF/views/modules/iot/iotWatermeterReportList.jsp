<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>水表统计报表管理</title>
    <meta name="decorator" content="default"/>
    <%@include file="/WEB-INF/views/include/treetable.jsp" %>
    <style rel="stylesheet" type="text/css">
        html, body {
            overflow-y: hidden;
        }

        #treeTable > thead {
            margin-top: -10px;
        }
    </style>
    <script src="${ctxStatic}/jQuery-TableHeadFixer/tableHeadFixer.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            //重置表单
            $("#btnReset").click(function (e) {
                clearIptDateRange(e);
                $(':input', '#searchForm')
                    .not(':button,:submit,:reset')   //将searchForm表单中input元素type为button、submit、reset、hidden排除
                    .val('')  //将input元素的value设为空值
                $(".my-select").select2('val', '-1');
            });
            //表格样式
            $("#treeTableList").children("tr").hover(function () {
                $(this.cells).css('background', '#E4E4E4').eq(0).addClass('showDragHandle');
            }, function () {
                $(this.cells).css('background', '').eq(0).removeClass('showDragHandle');
            }).click(function () {//点击背景变色
                if (window._preCells) $(window._preCells).removeClass('my-text-shadow');
                $(window._preCells = this.cells).addClass('my-text-shadow');
            });

            var tpl = $("#treeTableTpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g, "");
            var data = ${fns:toJson(list)}, ids = [], rootIds = [];
            for (var i = 0; i < data.length; i++) {
                ids.push(data[i].id);
            }
            ids = ',' + ids.join(',') + ',';
            for (var i = 0; i < data.length; i++) {
                if (ids.indexOf(',' + data[i].parentId + ',') == -1) {
                    if ((',' + rootIds.join(',') + ',').indexOf(',' + data[i].parentId + ',') == -1) {
                        rootIds.push(data[i].parentId);
                    }
                }
            }
            for (var i = 0; i < rootIds.length; i++) {
                addRow("#treeTableList", tpl, data, rootIds[i], true);
            }
            $("#treeTable").treeTable({expandLevel: 5});
            var selectValue = '-1';
            if ('${iotWatermeter.watermeterType}' != '') {
                selectValue = '${iotWatermeter.watermeterType}'.split(",");
            }
            $("#watermeterType").select2("val", selectValue);

            $('#parent').height($(document.body).height() - 120);
            $("#treeTable").tableHeadFixer({"head": true, "left": 0});

            $("#btnExport").click(function () {
                var oldAction = $("#searchForm").attr('action');
                $("#searchForm").attr({'action': oldAction + 'exportXls', 'target': '_blank'}).submit();
                setTimeout(function () {
                    $("#searchForm").attr({'action': oldAction}).removeAttr('target');
                }, 500);
            });
        });

        function addRow(list, tpl, data, pid, root) {
            for (var i = 0; i < data.length; i++) {
                var row = data[i];
                if (row.watermeterStatus == '2') {
                    row.color = 'red';
                }
                var iotWatermeterFlow = row.iotWatermeterFlow;
                if (iotWatermeterFlow) {
                    if (row.levelType == 3) {
                        row.dayPair = calColor('0', iotWatermeterFlow.flowDay);
                        row.weekPair = calColor('1', iotWatermeterFlow.flowWeek);
                        row.monthPair = calColor('2', iotWatermeterFlow.flowMonth);
                        row.quarterPair = calColor('3', iotWatermeterFlow.flowQuarter);
                        row.yearPair = calColor('4', iotWatermeterFlow.flowYear);
                    }
                }

                if ((${fns:jsGetVal('row.parentId')}) == pid) {
                    var isLlj = '${iotWatermeter.deviceType}';
                    if(isLlj == '2' && row.levelType != '3'){
                        row.iotWatermeterFlow.flowDay = '';
                        row.iotWatermeterFlow.countCd = '';
                        row.iotWatermeterFlow.flowWeek = '';
                        row.iotWatermeterFlow.flowMonth = '';
                        row.iotWatermeterFlow.flowQuarter = '';
                        row.iotWatermeterFlow.flowYear = '';
                    }
                    $(list).append(Mustache.render(tpl, {
                        dict: {
                            watermeterType: getDictLabel(${fns:toJson(fns:getDictList('enum_watermeter_type'))}, row.watermeterType),
                            watermeterStatus: getDictLabel(${fns:toJson(fns:getDictList('enmu_watermeter_status'))}, row.watermeterStatus),
                            blank123: 0
                        }, pid: (root ? 0 : pid), row: row
                    }));
                    addRow(list, tpl, data, row.id);
                }
            }
        }

        function calColor(datename, flow) {
            var vptFlow = ${vptFlow};
            var maxFlow = vptFlow[datename];
            if (parseInt(flow) > parseInt(maxFlow)) {
                return {color: '#ff8547', flow: '该水表已超出' + (parseInt(flow) - parseInt(maxFlow)) + '立方'};
            } else {
                return null;
            }
        }
    </script>
</head>
<body>
<%--<ul class="nav nav-tabs">--%>
<%--<li class="active"><a href="${ctx}/iot/iotWatermeter/">水表统计报表列表</a></li>--%>
<%--<shiro:hasPermission name="iot:iotWatermeter:edit"><li><a href="${ctx}/iot/iotWatermeter/form">水表添加</a></li></shiro:hasPermission>--%>
<%--</ul>--%>
<form:form id="searchForm" modelAttribute="iotWatermeter" action="${ctx}/iot/iotWatermeterFlow/" method="post"
           class="breadcrumb form-search">

    <ul class="ul-form">
        <li><label>名称：</label>
            <sys:treeselect id="iotWatermeter" name="ids" value="${iotWatermeter.ids}" labelName="name"
                            labelValue="${iotWatermeter.name}"
                            checked="true" title="名称" url="/iot/iotWatermeter/treeData2" cssClass="input-medium"
                            cssStyle="width: 157px;"
                            allowClear="true"
                            notAllowSelectParent="true"/>
        </li>
        <li><label>用水类型：</label>
            <form:select id="watermeterType" path="watermeterType" class="input-medium my-select" multiple="multiple">
                <form:option value="-1" label="全部"/>
                <form:options items="${fns:getDictList('enum_watermeter_type')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select>
        </li>
        <li><label>设备类型：</label>
            <form:select path="deviceType" class="input-medium my-select">
                <form:options items="${fns:getDictList('enmu_device_type')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select>
        </li>
    </ul>
    <ul class="ul-form">
            <%--<li><label>日期范围：</label>
                <form:select path="datename" class="input-medium2">
                    <form:options items="${fns:getDictList('enum_date_name')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
                </form:select>
            </li>--%>
        <li><label>时间区间：</label>
            <input id="startTime" name="startTime" type="text" readonly="readonly" maxlength="20"
                   class="input-mini Wdate"
                   value="${iotWatermeter.startTime}"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true});"
                   onFocus="WdatePicker({maxDate:'#F{$dp.$D(\'endTime\')}'})"/>
            -
            <input id="endTime" name="endTime" type="text" readonly="readonly" maxlength="20" class="input-mini Wdate"
                   value="${iotWatermeter.endTime}"
                   onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:true});"
                   onFocus="WdatePicker({minDate:'#F{$dp.$D(\'startTime\')}'})"/>
        </li>
        <li><label>水表状态：</label>
            <form:select path="watermeterStatus" class="input-medium my-select">
                <form:option value="" label="全部"/>
                <form:options items="${fns:getDictList('enmu_watermeter_status')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select>
        </li>
        <li class="btns" style="margin-left: 18px;">
            <input id="btnSubmit" class="btn btn-primary" type="submit" value=" 查     询 "/>
            <input id="btnExport" class="btn btn-success" type="button" value=" 导  出 "/>
            <input id="btnReset" class="btn btn-default" type="reset" value="重置"/>
        </li>
        <li class="clearfix"></li>
    </ul>
</form:form>
<sys:message content="${message}"/>
<div id="parent">
    <table id="treeTable" class="table table-striped my-table-bordered table-condensed">
        <thead>
        <tr>
            <th>名称</th>
            <%--<th>区域</th>--%>
            <%--<th>猪场名</th>
            <th>采集器名</th>
            <th>采集器编号</th>
            <th>猪舍名</th>--%>
            <%--<th>所在房间</th>--%>
            <th>用水类型</th>
            <th>水表编号</th>
            <th>水表状态</th>
            <th>日读数</th>
            <th>日期</th>
            <th>日流量</th>
            <%--<th >周读数</th>
            <th >周</th>--%>
            <th>周流量</th>
            <%--<th >月读数</th>
            <th >月份</th>--%>
            <th>月流量</th>
            <%--<th >季读数</th>
            <th >季度</th>--%>
            <th>季流量</th>
            <%--<th >年读数</th>
            <th >年份</th>--%>
            <th>年流量</th>
            <%--<th>安装日期</th>--%>
            <%--<th>修改时间</th>
            <th>备注</th>--%>
        </tr>
        </thead>
        <tbody id="treeTableList"></tbody>
    </table>
</div>
<script type="text/template" id="treeTableTpl">
    <tr id="{{row.id}}" pId="{{pid}}">
        <td>
            {{row.name}}
        </td>
        <%--<td>
            {{row.office.name}}
        </td>--%>
        <%--<td>
            {{row.farmName}}
        </td>
        <td>
            {{row.concentratorName}}
        </td>
        <td>
            {{row.concentratorNum}}
        </td>
        <td>
            {{row.houseName}}
        </td>--%>
        <%--<td>
            {{row.roomName}}
        </td>--%>
        <td>
            {{dict.watermeterType}}
        </td>
        <td>
            {{row.watermeterNum}}
        </td>
        <td>
            <b style="color:{{row.color}}">{{dict.watermeterStatus}}</b>
        </td>
        <td>
            {{row.iotWatermeterFlow.countCd}}
        </td>
        <td>
            {{row.iotWatermeterFlow.collectCd}}
        </td>
        <td>
            <a onclick="showDialogByUrl('${ctx}/iot/iotWatermeterFlow/reportDrillList?id={{row.id}}&datename=0','日流量统计')">
                <b style="color:{{row.dayPair.color}}"
                   title="{{row.dayPair.flow}}">{{row.iotWatermeterFlow.flowDay}}</b>
            </a>
        </td>
        <%--<td>
            {{row.iotWatermeterFlow.countCw}}
        </td>
        <td>
            {{row.iotWatermeterFlow.collectCw}}
        </td>--%>
        <td>
            <a onclick="showDialogByUrl('${ctx}/iot/iotWatermeterFlow/reportDrillList?id={{row.id}}&datename=1','周流量统计')">
                <%--<b style="color:{{row.weekPair.color}}"--%>
                <%--title="{{row.weekPair.flow}}">--%>{{row.iotWatermeterFlow.flowWeek}}<%--</b>--%>
            </a>
        </td>
        <%--<td>
            {{row.iotWatermeterFlow.countCm}}
        </td>
        <td>
            {{row.iotWatermeterFlow.collectCm}}
        </td>--%>
        <td>
            <a onclick="showDialogByUrl('${ctx}/iot/iotWatermeterFlow/reportDrillList?id={{row.id}}&datename=2','月流量统计')">
                <%--<b style="color:{{row.monthPair.color}}" title="{{row.monthPair.flow}}">--%>{{row.iotWatermeterFlow.flowMonth}}<%--</b>--%>
            </a>
        </td>
        <%--<td>
            {{row.iotWatermeterFlow.countCq}}
        </td>
        <td>
            {{row.iotWatermeterFlow.collectCq}}
        </td>--%>
        <td>
            <a onclick="showDialogByUrl('${ctx}/iot/iotWatermeterFlow/reportDrillList?id={{row.id}}&datename=3','季流量统计')">
                <%--<b style="color:{{row.quarterPair.color}" title="{{row.quarterPair.flow}}">--%>{{row.iotWatermeterFlow.flowQuarter}}<%--</b>--%>
            </a>
        </td>
        <%--<td>
            {{row.iotWatermeterFlow.countCy}}
        </td>
        <td>
            {{row.iotWatermeterFlow.collectCy}}
        </td>--%>
        <td>
            <a onclick="showDialogByUrl('${ctx}/iot/iotWatermeterFlow/reportDrillList?id={{row.id}}&datename=4','年流量统计')">
                <%--<b style="color:{{row.yearPair.color}}" title="{{row.yearPair.flow}}">--%>{{row.iotWatermeterFlow.flowYear}}<%--</b>--%>
            </a>
        </td>
        <%--<td>
            {{row.installedTime}}
        </td>--%>
        <%--<td>
            {{row.updateDate}}
        </td>
        <td>
            {{row.remarks}}
        </td>--%>
    </tr>
</script>
</body>
</html>