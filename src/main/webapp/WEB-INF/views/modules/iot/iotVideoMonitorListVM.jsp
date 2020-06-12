<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>视频监控查看</title>
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
	<div>
		<form:form id="searchForm" modelAttribute="iotVideoMonitor" action="${ctx}/iot/iotVideoMonitor/" method="post" class="breadcrumb form-search">
			<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
			<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
			<input id="orderBy" name="orderBy" type="hidden" value="${page.orderBy}">
			<pre>
				第一次查看视频模块需下载控件安装，推荐采用ie10及以上浏览器查看视频监控
			</pre>
			<a href="${ctxStatic}/videomonitor/demo/codebase/WebComponentsKit.exe" target="_blank">下载WebComponentsKit.exe</a>
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
					<%--<shiro:hasPermission name="iot:iotVideoMonitor:edit">--%>
						<th>操作</th>
					<%--</shiro:hasPermission>--%>
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
					<%--<shiro:hasPermission name="iot:iotVideoMonitor:edit">--%>
						<td>
                            <a href="${ctx}/iot/iotVideoMonitor/viewVm?id=${iotVideoMonitor.id}" target="_blank" style="color: #0b2c89">查看监控</a>
                        </td>
					<%--</shiro:hasPermission>--%>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<div class="pagination">${page}</div>
	</div>
</body>
</html>