<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>水表管理</title>
    <meta name="decorator" content="default"/>
    <%@include file="/WEB-INF/views/include/treetable.jsp" %>
    <style rel="stylesheet" type="text/css">
        html, body {
            overflow-y: hidden;
        }

        .tDnD_whileDrag td {
            background-color: #eee;
            -webkit-box-shadow: 6px 3px 5px #555, 0 1px 0 #ccc inset, 0 -1px 0 #ccc inset;
        }

        .tDnD_whileDrag td:last-child {
            -webkit-box-shadow: 1px 8px 6px -4px #555, 0 1px 0 #ccc inset, 0 -1px 0 #ccc inset;
        }

        .showDragHandle {
            background-image: url('${ctxStatic}/tablednd/updown2.gif');
            background-repeat: no-repeat;
            background-position: right center;
            cursor: move;
        }

    </style>
    <script type="text/javascript" src="${ctxStatic}/tablednd/jquery.tablednd.js"></script>
    <script src="${ctxStatic}/jQuery-TableHeadFixer/tableHeadFixer.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {

            //表格样式
            $("#treeTableList").children("tr").hover(function () {
                $(this.cells).css('background', '#E4E4E4').eq(0).addClass('showDragHandle');
            }, function () {
                $(this.cells).css('background', '').eq(0).removeClass('showDragHandle');
            }).click(function () {//点击背景变色
                if (window._preCells) $(window._preCells).removeClass('my-text-shadow');
                $(window._preCells = this.cells).addClass('my-text-shadow');
            });
            //重置表单
            $("#btnReset").click(function (e) {
                clearIptDateRange(e);
                $(':input', '#searchForm')
                    .not(':button,:submit,:reset')   //将searchForm表单中input元素type为button、submit、reset、hidden排除
                    .val('')  //将input元素的value设为空值
                $(".my-select").select2('val', '-1');
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

            $('#parent').height($(document.body).height() - 120);
            $("#treeTable").tableHeadFixer({"head": true});

            var __rows = '';
            $("#treeTable").tableDnD({
                onDragClass: 'tDnD_whileDrag',
                dragHandle: ".showDragHandle",
                onDragStart: function (table, row) {
                    var rows = table.tBodies[0].rows;
                    __rows = $('.my-drag').map(function (index, item) {
                        var data = $(this).data();
                        var num = index + 1;
                        // if (num != data.oldSeq) {
                        var obj = {
                            oldSeq: data.oldSeq,
                            orderNo: num,
                            id: data.id
                        };

                        return obj.id + ':' + obj.orderNo
                        // }
                    }).get().join(',');
                    $(rows).addClass("nodrop nodrag");
                    $("tr[pid='" + $(row).parent().attr("pid") + "']").removeClass("nodrop nodrag");
                    window.$subRows = $(rows).filter(function (i, n) {
                        return $(n).attr('pIds').indexOf($(row).parent().attr("id")) != -1
                    });
                    // size = 0 就是叶子节点  叶子节点不做处理
                    if (window.$subRows.size() > 0) {
                        window.$subRows.hide();
                    }
                },
                /* onDrag: function (table, row) {

                 },*/
                onDragStop: function (table, row, mouseUpObj) {
                    var rows = table.tBodies[0].rows;

                    // 判断拖拽的不是叶子节点
                    if (window.$subRows) {
                        //
                        var mouseUpSubRows = $(rows).filter(function (i, n) {
                            return $(n).attr('pIds').indexOf($(mouseUpObj).attr("id")) != -1
                        });
                        $(mouseUpObj).after(mouseUpSubRows);

                        //
                        $(row).after(window.$subRows);
                        window.$subRows.show()
                        window.$subRows = null;
                    }

                    var data = $('.my-drag').map(function (index, item) {
                        var data = $(this).data();
                        var num = index + 1;
                        // if (num != data.oldSeq) {
                        return {
                            oldSeq: data.oldSeq,
                            orderNo: num,
                            id: data.id
                        };
                        // }
                    }).get();

                    var __rows2 = $(data).map(function (i, n) {
                        return n.id + ':' + n.orderNo
                    }).get().join(',');
                    if (__rows === __rows2) {
                        // 如果前后顺序相同，则不需要调用后台处理
                        return;
                    }

                    if (data.length) { // 顺序有变化，则提交后台保存
                        $.ajax({
                            type: "POST",
                            url: "${ctx}/iot/iotWatermeter/saveOrderNum",
                            dataType: "json",
                            contentType: "application/json",
                            data: JSON.stringify(data),
                            success: function (data) {
                                if (data) {
                                    top.$.jBox.messager('水表排序修改成功!', '消息提示');
                                    $('.my-drag').each(function (index, item) {
                                        var data = $(this).data();
                                        var num = index + 1;
                                        if (num != data.oldSeq) {
                                            $(this).data('oldSeq', num);
                                        }
                                    });
                                } else {
                                    top.$.jBox.messager('水表排序修改失败!', '消息提示');
                                    setTimeout(function () {
                                        window.location.reload();
                                    }, 2000);
                                }
                            }
                        });
                    }

                }
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
                    row.dayPair = calColor('0', iotWatermeterFlow.flowDay);
                    row.weekPair = calColor('1', iotWatermeterFlow.flowWeek);
                    row.monthPair = calColor('2', iotWatermeterFlow.flowMonth);
                    row.quarterPair = calColor('3', iotWatermeterFlow.flowQuarter);
                    row.yearPair = calColor('4', iotWatermeterFlow.flowYear);
                }
                if ((${fns:jsGetVal('row.parentId')}) == pid) {
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
                return {color: '#ff8547', flow: parseInt(flow) - parseInt(maxFlow)};
            } else {
                return null;
            }
        }
    </script>
</head>
<body>
<%--<ul class="nav nav-tabs">--%>
<%--<li class="active"><a href="${ctx}/iot/iotWatermeter/">水表列表</a></li>--%>
<%--<shiro:hasPermission name="iot:iotWatermeter:edit"><li><a href="${ctx}/iot/iotWatermeter/form">水表添加</a></li></shiro:hasPermission>--%>
<%--</ul>--%>
<form:form id="searchForm" modelAttribute="iotWatermeter" action="${ctx}/iot/iotWatermeter/" method="post"
           class="breadcrumb form-search">
    <ul class="ul-form">
        <li><label>名称：</label>
            <form:input path="name" htmlEscape="false" maxlength="25" class="input-medium"/>
        </li>
        <li><label>区域：</label>
            <sys:treeselect id="office" name="office.id" value="${iotWatermeter.office.id}" labelName="office.name"
                            labelValue="${iotWatermeter.office.name}"
                            title="区域" url="/sys/office/treeData" cssClass="input-small" allowClear="true"
                            notAllowSelectParent="true"/>
        </li>
        <li><label>采集器编号：</label>
            <form:input path="concentratorNum" htmlEscape="false" maxlength="25" class="input-medium"/>
        </li>
        <li><label>水表编号：</label>
            <form:input path="watermeterNum" htmlEscape="false" maxlength="25" class="input-medium"/>
        </li>
    </ul>
    <ul class="ul-form">
        <li><label>用水类型：</label>
            <form:select path="watermeterType" class="input-medium2 my-select">
                <form:option value="" label="全部"/>
                <form:options items="${fns:getDictList('enum_watermeter_type')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select>
        </li>

        <li><label>设备类型：</label>
            <form:select path="deviceType" class="input-medium2 my-select">
                <form:option value="" label="全部"/>
                <form:options items="${fns:getDictList('enmu_device_type')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select>
        </li>
        <li><label>水表状态：</label>
            <form:select path="watermeterStatus" class="input-medium2 my-select">
                <form:option value="" label="全部"/>
                <form:options items="${fns:getDictList('enmu_watermeter_status')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select>
        </li>
            <%--<li><label>上级ID：</label></li>--%>
        <li class="btns" style="margin-left: 18px;">
            <input id="btnSubmit" class="btn btn-primary" type="submit" value=" 查     询 "/>
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
            <th>安装日期</th>
            <%--<th>修改时间</th>
            <th>备注</th>--%>
            <shiro:hasPermission name="iot:iotWatermeter:edit">
                <th>操作</th>
            </shiro:hasPermission>
        </tr>
        </thead>
        <tbody id="treeTableList"></tbody>
    </table>
</div>

<script type="text/template" id="treeTableTpl">
    <tr id="{{row.id}}" pId="{{pid}}" pIds="{{row.parentIds}}">
        <td class="my-drag showDragHandle" data-old-seq="{{row.seq}}" data-id="{{row.id}}">
            <%--<a href="${ctx}/iot/iotWatermeter/view?id={{row.id}}">--%>
            <span>
                {{row.name}}
            </span>
            <%--</a>--%>
        </td>
        <%--<td>--%>
        <%--{{row.area.name}}--%>
        <%--</td>--%>
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
            <b style="color:{{row.dayPair.color}}" title="该水表已超出{{row.dayPair.flow}}立方">{{row.iotWatermeterFlow.flowDay}}</b>
        </td>
        <%--<td>
            {{row.iotWatermeterFlow.countCw}}
        </td>
        <td>
            {{row.iotWatermeterFlow.collectCw}}
        </td>--%>
        <td>
            <b style="color:{{row.weekPair.color}}" title="该水表已超出{{row.weekPair.flow}}立方">{{row.iotWatermeterFlow.flowWeek}}</b>
        </td>
        <%--<td>
            {{row.iotWatermeterFlow.countCm}}
        </td>
        <td>
            {{row.iotWatermeterFlow.collectCm}}
        </td>--%>
        <td>
            <b style="color:{{row.monthPair.color}}" title="该水表已超出{{row.monthPair.flow}}立方">{{row.iotWatermeterFlow.flowMonth}}</b>
        </td>
        <%--<td>
            {{row.iotWatermeterFlow.countCq}}
        </td>
        <td>
            {{row.iotWatermeterFlow.collectCq}}
        </td>--%>
        <td>
            <b style="color:{{row.quarterPair.color}" title="该水表已超出{{row.quarterPair.flow}}立方">{{row.iotWatermeterFlow.flowQuarter}}</b>
        </td>
        <%--<td>
            {{row.iotWatermeterFlow.countCy}}
        </td>
        <td>
            {{row.iotWatermeterFlow.collectCy}}
        </td>--%>
        <td>
            <b style="color:{{row.yearPair.color}}" title="该水表已超出{{row.yearPair.flow}}立方">{{row.iotWatermeterFlow.flowYear}}</b>
        </td>
        <td>
            {{row.installedTime}}
        </td>
        <%--<td>
            {{row.updateDate}}
        </td>
        <td>
            {{row.remarks}}
        </td>--%>
        <shiro:hasPermission name="iot:iotWatermeter:edit">
            <td>
                    <%--<a href="${ctx}/iot/iotWatermeter/form?id={{row.id}}">修改</a>
                 <a href="${ctx}/iot/iotWatermeter/delete?id={{row.id}}" onclick="return confirmx('确认要删除该水表及所有子水表吗？', this.href)">删除</a>
                 <a href="${ctx}/iot/iotWatermeter/form?parent.id={{row.id}}">添加下级水表</a>--%>
                {{#row.watermeterStatus}}
                <a style="color: #0b2c89" onclick="showDialogByUrlAndReload('${ctx}/iot/iotWatermeterRepair/list?iotWatermeterId={{row.id}}&watermeterNumForSelect={{row.watermeterNum}}','维修水表',window)">
                    维修水表
                </a>
                {{/row.watermeterStatus}}
            </td>
        </shiro:hasPermission>
    </tr>
</script>
</body>
</html>