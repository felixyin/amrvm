<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>��Ƶ��ز鿴</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//ȫѡ
            $("#all").click(function(){
                if(this.checked) {
                    $("input[name='ids']").prop("checked",true);
                }
                else {
                    $("input[name='ids']").prop("checked",false);
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
            //���ñ�
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
				��һ�β鿴��Ƶģ�������ؿؼ���װ���Ƽ�����ie10������������鿴��Ƶ���
			</pre>
			<a href="${ctxStatic}/videomonitor/demo/codebase/WebComponentsKit.exe" target="_blank">����WebComponentsKit.exe</a>
		</form:form>
		<sys:message content="${message}"/>
		<table id="contentTable" class="table table-striped table-bordered table-condensed">
			<thead>
				<tr>
					<th class="checkbox-width"><input type="checkbox" class="my-checkbox" name="all" id="all"/>ȫѡ</th>
					<th class="sort-column office.id">����</th>
					<th class="sort-column account">�˺�</th>
					<th class="sort-column ip">��������ַ</th>
					<th class="sort-column devicePort">�豸�˿�</th>
					<th class="sort-column httpPort">����˿�</th>
					<th class="sort-column createDate">����ʱ��</th>
					<th class="sort-column updateDate">�޸�ʱ��</th>
					<th >��ע</th>
					<th >�Ƿ�ɾ��</th>
					<%--<shiro:hasPermission name="iot:iotVideoMonitor:edit">--%>
						<th>����</th>
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
					<%-- <a href="javascript:showDialogByUrl('${ctx}/iot/iotVideoMonitor/view?id=${iotVideoMonitor.id}','�鿴����');" target="_blank"> --%>
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
                            <a href="${ctx}/iot/iotVideoMonitor/viewVm?id=${iotVideoMonitor.id}" target="_blank" style="color: #0b2c89">�鿴���</a>
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