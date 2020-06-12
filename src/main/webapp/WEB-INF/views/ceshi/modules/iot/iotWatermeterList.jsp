<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>水表管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
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
	<ul class="nav nav-tabs my-nav-tabs">
		<li class="active"><a href="${ctx}/iot/iotWatermeter/">水表列表</a></li>
		<shiro:hasPermission name="iot:iotWatermeter:edit"><li><a href="${ctx}/iot/iotWatermeter/form">水表添加</a></li></shiro:hasPermission>
	</ul>
	<div class="my-container">
		<form:form id="searchForm" modelAttribute="iotWatermeter" action="${ctx}/iot/iotWatermeter/" method="post" class="breadcrumb form-search">
			<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
			<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
			<input id="orderBy" name="orderBy" type="hidden" value="${page.orderBy}">
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
			<ul class="ul-form">
				<li class="btns">
					<input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
					<input id="btnReset" class="btn btn-default" type="button" value="重置"/>
				</li>
				<li class="clearfix"></li>
			</ul>
		</form:form>
		<sys:message content="${message}"/>
		<table id="contentTable" class="table table-striped table-bordered table-condensed">
			<thead>
				<tr>
					<th class="checkbox-width"><input type="checkbox" class="my-checkbox" name="all" id="all"/>全选</th>
					<th >区域</th>
					<th >猪场名</th>
					<th >采集器名</th>
					<th >采集器编号</th>
					<th >猪舍名</th>
					<th >所在房间</th>
					<th >用水类型</th>
					<th >水表编号</th>
					<th >水表状态</th>
					<th >安装日期</th>
					<th >修改时间</th>
					<th >备注</th>
					<shiro:hasPermission name="iot:iotWatermeter:edit"><th>操作</th></shiro:hasPermission>
				</tr>
			</thead>
			<tbody id="dndTable">
			<c:forEach items="${page.list}" var="iotWatermeter">
				<tr>
					<td>
						<input type="checkbox" class="my-checkbox" name="ids" value="${iotWatermeter.id}"/>
					</td>
					<td>
					<%-- <a href="javascript:showDialogByUrl('${ctx}/iot/iotWatermeter/view?id=${iotWatermeter.id}','查看详情');" target="_blank"> --%>
					<a href="${ctx}/iot/iotWatermeter/view?id=${iotWatermeter.id}">
						${iotWatermeter.area.name}
					</a></td>
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
						${iotWatermeter.watermeterType}
					</td>
					<td>
						${iotWatermeter.watermeterNum}
					</td>
					<td>
						${iotWatermeter.watermeterStatus}
					</td>
					<td>
						${iotWatermeter.installedTime}
					</td>
					<td>
						<fmt:formatDate value="${iotWatermeter.updateDate}" pattern="yyyy-MM-dd"/>
					</td>
					<td>
						${iotWatermeter.remarks}
					</td>
					<shiro:hasPermission name="iot:iotWatermeter:edit"><td>
						<a href="${ctx}/iot/iotWatermeter/form?id=${iotWatermeter.id}">修改</a>
						<a href="${ctx}/iot/iotWatermeter/delete?id=${iotWatermeter.id}" onclick="return confirmx('确认要删除该水表吗？', this.href)">删除</a>
					</td></shiro:hasPermission>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<div class="pagination">${page}</div>
	</div>
</body>
</html>