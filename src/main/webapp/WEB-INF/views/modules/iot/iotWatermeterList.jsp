<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>ˮ�����</title>
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

            //�����ʽ
            $("#treeTableList").children("tr").hover(function () {
                $(this.cells).css('background', '#E4E4E4').eq(0).addClass('showDragHandle');
            }, function () {
                $(this.cells).css('background', '').eq(0).removeClass('showDragHandle');
            }).click(function () {//���������ɫ
                if (window._preCells) $(window._preCells).removeClass('my-text-shadow');
                $(window._preCells = this.cells).addClass('my-text-shadow');
            });
            //���ñ�
            $("#btnReset").click(function (e) {
                clearIptDateRange(e);
                $(':input', '#searchForm')
                    .not(':button,:submit,:reset')   //��searchForm����inputԪ��typeΪbutton��submit��reset��hidden�ų�
                    .val('')  //��inputԪ�ص�value��Ϊ��ֵ
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
                    // size = 0 ����Ҷ�ӽڵ�  Ҷ�ӽڵ㲻������
                    if (window.$subRows.size() > 0) {
                        window.$subRows.hide();
                    }
                },
                /* onDrag: function (table, row) {

                 },*/
                onDragStop: function (table, row, mouseUpObj) {
                    var rows = table.tBodies[0].rows;

                    // �ж���ק�Ĳ���Ҷ�ӽڵ�
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
                        // ���ǰ��˳����ͬ������Ҫ���ú�̨����
                        return;
                    }

                    if (data.length) { // ˳���б仯�����ύ��̨����
                        $.ajax({
                            type: "POST",
                            url: "${ctx}/iot/iotWatermeter/saveOrderNum",
                            dataType: "json",
                            contentType: "application/json",
                            data: JSON.stringify(data),
                            success: function (data) {
                                if (data) {
                                    top.$.jBox.messager('ˮ�������޸ĳɹ�!', '��Ϣ��ʾ');
                                    $('.my-drag').each(function (index, item) {
                                        var data = $(this).data();
                                        var num = index + 1;
                                        if (num != data.oldSeq) {
                                            $(this).data('oldSeq', num);
                                        }
                                    });
                                } else {
                                    top.$.jBox.messager('ˮ�������޸�ʧ��!', '��Ϣ��ʾ');
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
<%--<li class="active"><a href="${ctx}/iot/iotWatermeter/">ˮ���б�</a></li>--%>
<%--<shiro:hasPermission name="iot:iotWatermeter:edit"><li><a href="${ctx}/iot/iotWatermeter/form">ˮ�����</a></li></shiro:hasPermission>--%>
<%--</ul>--%>
<form:form id="searchForm" modelAttribute="iotWatermeter" action="${ctx}/iot/iotWatermeter/" method="post"
           class="breadcrumb form-search">
    <ul class="ul-form">
        <li><label>���ƣ�</label>
            <form:input path="name" htmlEscape="false" maxlength="25" class="input-medium"/>
        </li>
        <li><label>����</label>
            <sys:treeselect id="office" name="office.id" value="${iotWatermeter.office.id}" labelName="office.name"
                            labelValue="${iotWatermeter.office.name}"
                            title="����" url="/sys/office/treeData" cssClass="input-small" allowClear="true"
                            notAllowSelectParent="true"/>
        </li>
        <li><label>�ɼ�����ţ�</label>
            <form:input path="concentratorNum" htmlEscape="false" maxlength="25" class="input-medium"/>
        </li>
        <li><label>ˮ���ţ�</label>
            <form:input path="watermeterNum" htmlEscape="false" maxlength="25" class="input-medium"/>
        </li>
    </ul>
    <ul class="ul-form">
        <li><label>��ˮ���ͣ�</label>
            <form:select path="watermeterType" class="input-medium2 my-select">
                <form:option value="" label="ȫ��"/>
                <form:options items="${fns:getDictList('enum_watermeter_type')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select>
        </li>

        <li><label>�豸���ͣ�</label>
            <form:select path="deviceType" class="input-medium2 my-select">
                <form:option value="" label="ȫ��"/>
                <form:options items="${fns:getDictList('enmu_device_type')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select>
        </li>
        <li><label>ˮ��״̬��</label>
            <form:select path="watermeterStatus" class="input-medium2 my-select">
                <form:option value="" label="ȫ��"/>
                <form:options items="${fns:getDictList('enmu_watermeter_status')}" itemLabel="label" itemValue="value"
                              htmlEscape="false"/>
            </form:select>
        </li>
            <%--<li><label>�ϼ�ID��</label></li>--%>
        <li class="btns" style="margin-left: 18px;">
            <input id="btnSubmit" class="btn btn-primary" type="submit" value=" ��     ѯ "/>
            <input id="btnReset" class="btn btn-default" type="reset" value="����"/>
        </li>
        <li class="clearfix"></li>
    </ul>
</form:form>
<sys:message content="${message}"/>

<div id="parent">
    <table id="treeTable" class="table table-striped my-table-bordered table-condensed">
        <thead>
        <tr>
            <th>����</th>
            <%--<th>����</th>--%>
            <%--<th>����</th>
            <th>�ɼ�����</th>
            <th>�ɼ������</th>
            <th>������</th>--%>
            <%--<th>���ڷ���</th>--%>
            <th>��ˮ����</th>
            <th>ˮ����</th>
            <th>ˮ��״̬</th>
            <th>�ն���</th>
            <th>����</th>
            <th>������</th>
            <%--<th >�ܶ���</th>
            <th >��</th>--%>
            <th>������</th>
            <%--<th >�¶���</th>
            <th >�·�</th>--%>
            <th>������</th>
            <%--<th >������</th>
            <th >����</th>--%>
            <th>������</th>
            <%--<th >�����</th>
            <th >���</th>--%>
            <th>������</th>
            <th>��װ����</th>
            <%--<th>�޸�ʱ��</th>
            <th>��ע</th>--%>
            <shiro:hasPermission name="iot:iotWatermeter:edit">
                <th>����</th>
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
            <b style="color:{{row.dayPair.color}}" title="��ˮ���ѳ���{{row.dayPair.flow}}����">{{row.iotWatermeterFlow.flowDay}}</b>
        </td>
        <%--<td>
            {{row.iotWatermeterFlow.countCw}}
        </td>
        <td>
            {{row.iotWatermeterFlow.collectCw}}
        </td>--%>
        <td>
            <b style="color:{{row.weekPair.color}}" title="��ˮ���ѳ���{{row.weekPair.flow}}����">{{row.iotWatermeterFlow.flowWeek}}</b>
        </td>
        <%--<td>
            {{row.iotWatermeterFlow.countCm}}
        </td>
        <td>
            {{row.iotWatermeterFlow.collectCm}}
        </td>--%>
        <td>
            <b style="color:{{row.monthPair.color}}" title="��ˮ���ѳ���{{row.monthPair.flow}}����">{{row.iotWatermeterFlow.flowMonth}}</b>
        </td>
        <%--<td>
            {{row.iotWatermeterFlow.countCq}}
        </td>
        <td>
            {{row.iotWatermeterFlow.collectCq}}
        </td>--%>
        <td>
            <b style="color:{{row.quarterPair.color}" title="��ˮ���ѳ���{{row.quarterPair.flow}}����">{{row.iotWatermeterFlow.flowQuarter}}</b>
        </td>
        <%--<td>
            {{row.iotWatermeterFlow.countCy}}
        </td>
        <td>
            {{row.iotWatermeterFlow.collectCy}}
        </td>--%>
        <td>
            <b style="color:{{row.yearPair.color}}" title="��ˮ���ѳ���{{row.yearPair.flow}}����">{{row.iotWatermeterFlow.flowYear}}</b>
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
                    <%--<a href="${ctx}/iot/iotWatermeter/form?id={{row.id}}">�޸�</a>
                 <a href="${ctx}/iot/iotWatermeter/delete?id={{row.id}}" onclick="return confirmx('ȷ��Ҫɾ����ˮ��������ˮ����', this.href)">ɾ��</a>
                 <a href="${ctx}/iot/iotWatermeter/form?parent.id={{row.id}}">����¼�ˮ��</a>--%>
                {{#row.watermeterStatus}}
                <a style="color: #0b2c89" onclick="showDialogByUrlAndReload('${ctx}/iot/iotWatermeterRepair/list?iotWatermeterId={{row.id}}&watermeterNumForSelect={{row.watermeterNum}}','ά��ˮ��',window)">
                    ά��ˮ��
                </a>
                {{/row.watermeterStatus}}
            </td>
        </shiro:hasPermission>
    </tr>
</script>
</body>
</html>