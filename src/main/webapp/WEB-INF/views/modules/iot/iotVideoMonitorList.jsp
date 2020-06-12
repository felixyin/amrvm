<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>视频监控设置管理</title>
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
		<li class="active"><a href="${ctx}/iot/iotVideoMonitor/">视频监控设置列表</a></li>
		<shiro:hasPermission name="iot:iotVideoMonitor:edit"><li><a href="${ctx}/iot/iotVideoMonitor/form">视频监控设置添加</a></li></shiro:hasPermission>
	</ul>
	<div class="my-container">
		<form:form id="searchForm" modelAttribute="iotVideoMonitor" action="${ctx}/iot/iotVideoMonitor/" method="post" class="breadcrumb form-search">
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
				<li><label>猪场名：</label>
					<sys:treeselect id="office" name="office.id" value="${iotVideoMonitor.office.id}"
								labelName="office.name" labelValue="${iotVideoMonitor.office.name}"
								title="猪场名" url="/autoComplete/treeData?type=3" viewName="v_farm_combo"
								cssClass="input-small" allowClear="true" notAllowSelectParent="true"/>
				</li>
				<li><label>账号：</label>
					<form:input path="account" htmlEscape="false" maxlength="25" class="input-medium"/>
				</li>
				<li><label>服务器地址：</label>
					<form:input path="ip" htmlEscape="false" maxlength="25" class="input-medium"/>
				</li>
				<li><label>设备端口：</label>
					<form:input path="devicePort" htmlEscape="false" maxlength="10" class="input-medium"/>
				</li>
			</ul>
			<ul class="ul-form">
				<li><label>网络端口：</label>
					<form:input path="httpPort" htmlEscape="false" maxlength="10" class="input-medium"/>
				</li>
				<li><label>修改时间：</label>
					<input name="updateDate" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
						value="<fmt:formatDate value="${iotVideoMonitor.updateDate}" pattern="yyyy-MM-dd"/>"
						onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
				</li>
				<li><label>是否删除：</label>
					<form:select path="delFlag" class="input-medium2">
						<form:option value="" label="全部"/>
						<form:options items="${fns:getDictList('del_flag')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
					</form:select>
				</li>
				<li class="btns" style="margin-left: 18px;">
					<input id="btnSubmit" class="btn btn-primary" type="submit" value=" 查     询 "/>
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
					<th class="sort-column office.id">猪场名</th>
					<th class="sort-column account">账号</th>
					<th class="sort-column ip">服务器地址</th>
					<th class="sort-column devicePort">设备端口</th>
					<th class="sort-column httpPort">网络端口</th>
					<th class="sort-column createDate">创建时间</th>
					<th class="sort-column updateDate">修改时间</th>
					<th >备注</th>
					<th >是否删除</th>
					<shiro:hasPermission name="iot:iotVideoMonitor:edit"><th>操作</th></shiro:hasPermission>
				</tr>
			</thead>
			<tbody id="dndTable">
			<c:forEach items="${page.list}" var="iotVideoMonitor">
				<tr>
					<td>
						<input type="checkbox" class="my-checkbox" name="ids" value="${iotVideoMonitor.id}"/>
					</td>
					<td>
					<%-- <a href="javascript:showDialogByUrl('${ctx}/iot/iotVideoMonitor/view?id=${iotVideoMonitor.id}','查看详情');" target="_blank"> --%>
					<a href="${ctx}/iot/iotVideoMonitor/view?id=${iotVideoMonitor.id}">
						${iotVideoMonitor.office.name}
					</a></td>
					<td>
						${iotVideoMonitor.account}
					</td>
					<td>
						${iotVideoMonitor.ip}
					</td>
					<td>
						${iotVideoMonitor.devicePort}
					</td>
					<td>
						${iotVideoMonitor.httpPort}
					</td>
					<td>
						<fmt:formatDate value="${iotVideoMonitor.createDate}" pattern="yyyy-MM-dd"/>
					</td>
					<td>
						<fmt:formatDate value="${iotVideoMonitor.updateDate}" pattern="yyyy-MM-dd"/>
					</td>
					<td>
						${iotVideoMonitor.remarks}
					</td>
					<td>
						${fns:getDictLabel(iotVideoMonitor.delFlag, 'del_flag', '')}
					</td>
					<shiro:hasPermission name="iot:iotVideoMonitor:edit"><td>
						<a href="${ctx}/iot/iotVideoMonitor/form?id=${iotVideoMonitor.id}" style="color: #0b2c89">修改</a>
						<a href="${ctx}/iot/iotVideoMonitor/delete?id=${iotVideoMonitor.id}" style="color: #0b2c89" onclick="return confirmx('确认要删除该视频监控吗？', this.href)">删除</a>
					</td></shiro:hasPermission>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<div class="pagination">${page}</div>
	</div>
</body>
</html>