<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>水表流量阈值管理</title>
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
                $(".my-select").select2('val','-1');
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
		<li class="active"><a href="${ctx}/iot/iotWatermeterVpt/">水表流量阈值列表</a></li>
		<%--<shiro:hasPermission name="iot:iotWatermeterVpt:edit"><li><a href="${ctx}/iot/iotWatermeterVpt/form">水表流量阈值添加</a></li></shiro:hasPermission>--%>
	</ul>
	<div class="my-container">
		<form:form id="searchForm" modelAttribute="iotWatermeterVpt" action="${ctx}/iot/iotWatermeterVpt/" method="post" class="breadcrumb form-search">
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
				<%--<li><label>最小值：</label>
					<form:input path="minFlow" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>--%>
				<li><label>最大值：</label>
					<form:input path="maxFlow" htmlEscape="false" maxlength="255" class="input-medium"/>
				</li>
				<li><label>日期范围：</label>
					<form:select path="dateName" class="input-medium2 my-select">
						<form:option value="" label="全部"/>
						<form:options items="${fns:getDictList('enum_date_name')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select>
				</li>
				<%--<li><label>是否启用：</label>--%>
					<%--<form:select path="delFlag" class="input-medium2">--%>
						<%--<form:option value="" label="全部"/>--%>
						<%--<form:options items="${fns:getDictList('del_flag')}" itemLabel="label" itemValue="value" htmlEscape="false"/>--%>
					<%--</form:select>--%>
				<%--</li>--%>
				<li class="btns" style="margin-left: 18px;">
					<input id="btnSubmit" class="btn btn-primary" type="submit" value=" 查     询 "/>
					<input id="btnReset" class="btn btn-default" type="reset" value="重置"/>
				</li>
				<li class="clearfix"></li>
			</ul>
		</form:form>
		<%--<sys:message content="${message}"/>--%>
		<table id="contentTable" class="table table-striped table-bordered table-condensed">
			<thead>
				<tr>
					<th class="checkbox-width"><input type="checkbox" class="my-checkbox" name="all" id="all"/>全选</th>
					<%--<th class="sort-column minFlow">最小值</th>--%>
					<th class="sort-column maxFlow">最大值</th>
					<th class="sort-column dateName">日期范围</th>
					<th >更新时间</th>
					<th >备注</th>
					<th class="sort-column delFlag">是否启用</th>
					<shiro:hasPermission name="iot:iotWatermeterVpt:edit"><th>操作</th></shiro:hasPermission>
				</tr>
			</thead>
			<tbody id="dndTable">
			<c:forEach items="${page.list}" var="iotWatermeterVpt">
				<tr>
					<td>
						<input type="checkbox" class="my-checkbox" name="ids" value="${iotWatermeterVpt.id}"/>
					</td>
					<%--<td>
					&lt;%&ndash; <a href="javascript:showDialogByUrl('${ctx}/iot/iotWatermeterVpt/view?id=${iotWatermeterVpt.id}','查看详情');" target="_blank"> &ndash;%&gt;
					<a href="${ctx}/iot/iotWatermeterVpt/view?id=${iotWatermeterVpt.id}">
						${iotWatermeterVpt.minFlow}
					</a>
					</td>--%>
					<td>
						${iotWatermeterVpt.maxFlow}
					</td>
					<td>
						${fns:getDictLabel(iotWatermeterVpt.dateName, 'enum_date_name', '')}
					</td>
					<td>
						<fmt:formatDate value="${iotWatermeterVpt.updateDate}" pattern="yyyy-MM-dd"/>
					</td>
					<td>
						${iotWatermeterVpt.remarks}
					</td>
					<td>
						${fns:getDictLabel(iotWatermeterVpt.delFlag, 'enum_flag', '')}
					</td>
					<shiro:hasPermission name="iot:iotWatermeterVpt:edit"><td>
						<a style="color: #0b2c89" href="${ctx}/iot/iotWatermeterVpt/form?id=${iotWatermeterVpt.id}">修改</a>
						<c:choose>
							<c:when test="${iotWatermeterVpt.delFlag eq '1'}">
								<a style="color: #0b2c89" href="${ctx}/iot/iotWatermeterVpt/switchFlag?id=${iotWatermeterVpt.id}" onclick="return confirmx('确认要禁用该水表流量阈值吗？', this.href)">启用</a>
							</c:when>
							<c:otherwise>
								<a style="color: #0b2c89" href="${ctx}/iot/iotWatermeterVpt/switchFlag?id=${iotWatermeterVpt.id}" onclick="return confirmx('确认要禁用该水表流量阈值吗？', this.href)">禁用</a>
							</c:otherwise>
						</c:choose>
					</td></shiro:hasPermission>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<div class="pagination">${page}</div>
	</div>
</body>
</html>