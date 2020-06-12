<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>ˮ��������Ϣ����</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {
            //ȫѡ
            $("#all").click(function () {
                if (this.checked) {
                    $("input[name='ids']").prop("checked", true);
                }
                else {
                    $("input[name='ids']").prop("checked", false);
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


        });

        function page(n, s) {
            $("#pageNo").val(n);
            $("#pageSize").val(s);
            $("#searchForm").submit();
            return false;
        }


    </script>
</head>
<body>
<ul class="nav nav-tabs my-nav-tabs">
    <li class="active"><a href="${ctx}/iot/iotWatermeterFlow/">ˮ��������Ϣ�б�</a></li>
    <shiro:hasPermission name="iot:iotWatermeterFlow:edit">
        <li><a href="${ctx}/iot/iotWatermeterFlow/form">ˮ��������Ϣ���</a></li>
    </shiro:hasPermission>
</ul>
<div class="my-container">
    <form:form id="searchForm" modelAttribute="iotWatermeterFlow" action="${ctx}/iot/iotWatermeterFlow/" method="post"
               class="breadcrumb form-search">
        <input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
        <input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
        <input id="orderBy" name="orderBy" type="hidden" value="${page.orderBy}">
        <script type="text/javascript">
            $(document).ready(function () {
                var orderBy = $("#orderBy").val().split(" ");
                $(".sort-column").each(function () {
                    if ($(this).hasClass(orderBy[0])) {
                        orderBy[1] = orderBy[1] && orderBy[1].toUpperCase() == "DESC" ? "down" : "up";
                        $(this).html($(this).html() + " <i class=\"icon icon-arrow-" + orderBy[1] + "\"></i>");
                    }
                });
                $(".sort-column").click(function () {
                    var order = $(this).attr("class").split(" ");
                    var sort = $("#orderBy").val().split(" ");
                    for (var i = 0; i < order.length; i++) {
                        if (order[i] == "sort-column") {
                            order = order[i + 1];
                            break;
                        }
                    }
                    if (order == sort[0]) {
                        sort = (sort[1] && sort[1].toUpperCase() == "DESC" ? "ASC" : "DESC");
                        $("#orderBy").val(order + " DESC" != order + " " + sort ? "" : order + " " + sort);
                    } else {
                        $("#orderBy").val(order + " ASC");
                    }
                    page();
                });
            });
        </script>
        <ul class="ul-form">
            <li><label>ˮ���ţ�</label>
                <form:input path="watermeterNum" htmlEscape="false" maxlength="25" class="input-medium"/>
            </li>
            <li><label>�ܣ�</label>
                <form:input path="collectCw" htmlEscape="false" maxlength="25" class="input-medium"/>
            </li>
            <li><label>�·ݣ�</label>
                <form:input path="collectCm" htmlEscape="false" maxlength="25" class="input-medium"/>
            </li>
            <li><label>���ȣ�</label>
                <form:input path="collectCq" htmlEscape="false" maxlength="25" class="input-medium"/>
            </li>
            <li><label>��ݣ�</label>
                <form:input path="collectCy" htmlEscape="false" maxlength="25" class="input-medium"/>
            </li>
            <li class="btns">
                <input id="btnSubmit" class="btn btn-primary" type="submit" value="��ѯ"/>
                <input id="btnReset" class="btn btn-default" type="reset" value="����"/>
            </li>
            <li class="clearfix"></li>
        </ul>
    </form:form>
    <sys:message content="${message}"/>
    <table id="contentTable" class="table table-striped table-bordered table-condensed">
        <thead>
        <tr>
            <th class="checkbox-width"><input type="checkbox" class="my-checkbox" name="all" id="all"/>ȫѡ</th>
            <th>ˮ����</th>
            <th>�ն���</th>
            <th>����</th>
            <th>������</th>
            <th>�ܶ���</th>
            <th>��</th>
            <th>������</th>
            <th>�¶���</th>
            <th>�·�</th>
            <th>������</th>
            <th>������</th>
            <th>����</th>
            <th>������</th>
            <th>�����</th>
            <th>���</th>
            <th>������</th>
            <th>�޸�����</th>
            <th>��ע</th>
            <shiro:hasPermission name="iot:iotWatermeterFlow:edit">
                <th>����</th>
            </shiro:hasPermission>
        </tr>
        </thead>
        <tbody id="dndTable">
        <c:forEach items="${page.list}" var="iotWatermeterFlow">
            <tr>
                <td>
                    <input type="checkbox" class="my-checkbox" name="ids" value="${iotWatermeterFlow.id}"/>
                </td>
                <td>
                        <%-- <a href="javascript:showDialogByUrl('${ctx}/iot/iotWatermeterFlow/view?id=${iotWatermeterFlow.id}','�鿴����');" target="_blank"> --%>
                    <a href="${ctx}/iot/iotWatermeterFlow/view?id=${iotWatermeterFlow.id}">
                            ${iotWatermeterFlow.watermeterNum}
                    </a></td>
                <td>
                        ${iotWatermeterFlow.countCd}
                </td>
                <td>
                        ${iotWatermeterFlow.collectCd}
                </td>
                <td>
                        ${iotWatermeterFlow.flowDay}
                </td>
                <td>
                        ${iotWatermeterFlow.countCw}
                </td>
                <td>
                        ${iotWatermeterFlow.collectCw}
                </td>
                <td>
                        ${iotWatermeterFlow.flowWeek}
                </td>
                <td>
                        ${iotWatermeterFlow.countCm}
                </td>
                <td>
                        ${iotWatermeterFlow.collectCm}
                </td>
                <td>
                        ${iotWatermeterFlow.flowMonth}
                </td>
                <td>
                        ${iotWatermeterFlow.countCq}
                </td>
                <td>
                        ${iotWatermeterFlow.collectCq}
                </td>
                <td>
                        ${iotWatermeterFlow.flowQuarter}
                </td>
                <td>
                        ${iotWatermeterFlow.countCy}
                </td>
                <td>
                        ${iotWatermeterFlow.collectCy}
                </td>
                <td>
                        ${iotWatermeterFlow.flowYear}
                </td>
                <td>
                    <fmt:formatDate value="${iotWatermeterFlow.updateDate}" pattern="yyyy-MM-dd"/>
                </td>
                <td>
                        ${iotWatermeterFlow.remarks}
                </td>
                <shiro:hasPermission name="iot:iotWatermeterFlow:edit">
                    <td>
                        <a href="${ctx}/iot/iotWatermeterFlow/form?id=${iotWatermeterFlow.id}" style="color: #0b2c89">�޸�</a>
                        <a href="${ctx}/iot/iotWatermeterFlow/delete?id=${iotWatermeterFlow.id}"
                           onclick="return confirmx('ȷ��Ҫɾ����ˮ��������Ϣ��', this.href)" style="color: #0b2c89">ɾ��</a>
                    </td>
                </shiro:hasPermission>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="pagination">${page}</div>
</div>
</body>
</html>