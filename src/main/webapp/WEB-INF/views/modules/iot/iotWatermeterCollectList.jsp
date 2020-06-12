<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>水表采集信息管理</title>
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
	<%--<ul class="nav nav-tabs my-nav-tabs">
		<li class="active"><a href="${ctx}/iot/iotWatermeterCollect/">水表采集信息列表</a></li>
		<shiro:hasPermission name="iot:iotWatermeterCollect:edit"><li><a href="${ctx}/iot/iotWatermeterCollect/form">水表采集信息添加</a></li></shiro:hasPermission>
	</ul>--%>
	<div class="">
		<form:form id="searchForm" modelAttribute="iotWatermeterCollect" action="${ctx}/iot/iotWatermeterCollect/" method="post" class="" cssStyle="margin: 0px">
			<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
			<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
			<input id="orderBy" name="orderBy" type="hidden" value="${page.orderBy}">
			<form:hidden path="iotWatermeter.id" />
			<form:hidden path="watermeterNum"/>
			<script type="text/javascript">
				$(document).ready(function() {
					var orderBy = $("#orderBy").val().split(" ");
					$(".sort-column").each(function(){
						if ($(this).hasClass(orderBy[0])){
							orderBy[1] = orderBy[1]&&orderBy[1].toUpperCase()=="DESC"?"down":"up";
							$(this).html($(this).html()+" <i class=\"icon icon-arrow-"+orderBy[1]+"\"></i>");
						}
					});
					$(".sort-column").click(function(){
						var order = $(this).attr("class").split(" ");
						var sort = $("#orderBy").val().split(" ");
						for(var i=0; i<order.length; i++){
							if (order[i] == "sort-column"){order = order[i+1]; break;}
						}
						if (order == sort[0]){
							sort = (sort[1]&&sort[1].toUpperCase()=="DESC"?"ASC":"DESC");
							$("#orderBy").val(order+" DESC"!=order+" "+sort?"":order+" "+sort);
						}else{
							$("#orderBy").val(order+" ASC");
						}
						page();
					});
				});
			</script>
			<%--<ul class="ul-form">
				<li><label>水表编号：</label>
					<form:input path="watermeterNum" htmlEscape="false" maxlength="25" class="input-medium"/>
				</li>
				<li><label>采集时间：</label>
					<input name="collectTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
						value="<fmt:formatDate value="${iotWatermeterCollect.collectTime}" pattern="yyyy-MM-dd"/>"
						onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
				</li>
				<li><label>水表读数：</label>
					<form:input path="totalFlow" htmlEscape="false" class="input-medium"/>
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
					<th >水表编号</th>
					<th >采集时间</th>
					<th >水表读数</th>
				</tr>
			</thead>
			<tbody id="dndTable">
			<c:forEach items="${page.list}" var="iotWatermeterCollect">
				<tr>

					<td>
						${iotWatermeterCollect.watermeterNum}
					</td>
					<td>
                        <fmt:formatDate value="${iotWatermeterCollect.collectTime}" pattern="yyyy-MM-dd HH:mm:ss.SSS"/>
					</td>
					<td>
						${iotWatermeterCollect.totalFlow}
					</td>
				</tr>
			</c:forEach>
			</tbody>
			<tfoot>
			<tr><td colspan="3"><div class="pagination">${page}</div></td></tr>
			</tfoot>
		</table>
	</div>
</body>
</html>