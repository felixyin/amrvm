<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>水表流量信息管理</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        $(document).ready(function () {
            //全选
            $("#all").click(function () {
                if (this.checked) {
                    $("input[name='ids']").prop("checked", true);
                }
                else {
                    $("input[name='ids']").prop("checked", false);
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
    <li class="active"><a href="${ctx}/iot/iotWatermeterFlow/">水表流量信息列表</a></li>
    <shiro:hasPermission name="iot:iotWatermeterFlow:edit">
        <li><a href="${ctx}/iot/iotWatermeterFlow/form">水表流量信息添加</a></li>
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
            <li><label>水表编号：</label>
                <form:input path="watermeterNum" htmlEscape="false" maxlength="25" class="input-medium"/>
            </li>
            <li><label>周：</label>
                <form:input path="collectCw" htmlEscape="false" maxlength="25" class="input-medium"/>
            </li>
            <li><label>月份：</label>
                <form:input path="collectCm" htmlEscape="false" maxlength="25" class="input-medium"/>
            </li>
            <li><label>季度：</label>
                <form:input path="collectCq" htmlEscape="false" maxlength="25" class="input-medium"/>
            </li>
            <li><label>年份：</label>
                <form:input path="collectCy" htmlEscape="false" maxlength="25" class="input-medium"/>
            </li>
            <li class="btns">
                <input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
                <input id="btnReset" class="btn btn-default" type="reset" value="重置"/>
            </li>
            <li class="clearfix"></li>
        </ul>
    </form:form>
    <sys:message content="${message}"/>
    <table id="contentTable" class="table table-striped table-bordered table-condensed">
        <thead>
        <tr>
            <th class="checkbox-width"><input type="checkbox" class="my-checkbox" name="all" id="all"/>全选</th>
            <th>水表编号</th>
            <th>日读数</th>
            <th>日期</th>
            <th>日流量</th>
            <th>周读数</th>
            <th>周</th>
            <th>周流量</th>
            <th>月读数</th>
            <th>月份</th>
            <th>月流量</th>
            <th>季读数</th>
            <th>季度</th>
            <th>季流量</th>
            <th>年读数</th>
            <th>年份</th>
            <th>年流量</th>
            <th>修改日期</th>
            <th>备注</th>
            <shiro:hasPermission name="iot:iotWatermeterFlow:edit">
                <th>操作</th>
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
                        <%-- <a href="javascript:showDialogByUrl('${ctx}/iot/iotWatermeterFlow/view?id=${iotWatermeterFlow.id}','查看详情');" target="_blank"> --%>
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
                        <a href="${ctx}/iot/iotWatermeterFlow/form?id=${iotWatermeterFlow.id}" style="color: #0b2c89">修改</a>
                        <a href="${ctx}/iot/iotWatermeterFlow/delete?id=${iotWatermeterFlow.id}"
                           onclick="return confirmx('确认要删除该水表流量信息吗？', this.href)" style="color: #0b2c89">删除</a>
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