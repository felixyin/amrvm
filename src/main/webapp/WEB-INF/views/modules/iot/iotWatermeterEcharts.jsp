<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>水表统计报表管理</title>
    <meta name="decorator" content="default"/>
    <script src="${ctxStatic}/echarts/echarts-all-3.js"></script>
</head>
<body>
<form:form id="searchForm" method="post"
           action="${ctx}/iot/iotWatermeterReport/listTrend" class="breadcrumb form-search">
    <ul class="ul-form">
        <li><label>统计类型：</label>
            <select id="statisticsType" name="statisticsType" class="input-medium">
                <c:forEach items="${fns:getDictList('enum_echarts_type')}" var="op">
                    <c:choose>
                        <c:when test="${statisticsType == op.value}">
                            <option selected="selected" value="${op.value}">${op.label}</option>
                        </c:when>
                        <c:otherwise>
                            <option value="${op.value}">${op.label}</option>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </select>
        </li>
        <li><label>统计时间：</label>
            <select id="dateNameType" name="dateNameType" class="input-medium">
                <c:forEach items="${fns:getDictList('enum_echarts_date_name')}" var="op">
                <c:choose>
                    <c:when test="${dateNameType == op.value}">
                        <option selected="selected" value="${op.value}">${op.label}</option>
                    </c:when>
                    <c:otherwise>
                        <option value="${op.value}">${op.label}</option>
                    </c:otherwise>
                </c:choose>
                </c:forEach>
            </select>
        </li>
        <li><label>时间区间：</label>
            <input name="startTime" id="startTime" type="text" readonly="readonly" maxlength="15"
                        class="input-small Wdate" style="width: 90px;" value="${startTime}"
                        onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"
                        onFocus="WdatePicker({maxDate:'#F{$dp.$D(\'endTime\')}'})"/>
            -
            <input name="endTime" id="endTime" type="text" readonly="readonly" maxlength="20"
                        class="input-small Wdate" style="width: 90px;" value="${endTime}"
                        onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"
                        onFocus="WdatePicker({minDate:'#F{$dp.$D(\'startTime\')}'})"/>
        </li>
        <li class="btns" style="margin-left: 18px;">
            <input id="btnSubmit" class="btn btn-primary" type="button" value="统计分析"/>
            <input id="btnReset" class="btn btn-default" type="reset" value="重置"/>
        </li>
        <li class="clearfix"></li>
    </ul>
</form:form>
<sys:message content="${message}"/>

<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
<div id="echartDiv" style="width:99%;height:500px;float: left;margin-left: 5px;"></div>


<script type="text/javascript">
    var iotWatermeterReport = ${iotWatermeterReport};
</script>
<script type="text/javascript" src="${ctxStatic}/iot-watermeter-echarts/famer.js"></script>
</body>
</html>