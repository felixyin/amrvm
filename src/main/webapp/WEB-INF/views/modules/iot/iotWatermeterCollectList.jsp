<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>ˮ��ɼ���Ϣ����</title>
	<meta name="decorator" content="default"/>
	<script src="${ctxStatic}/jQuery-TableHeadFixer/tableHeadFixer.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function() {
            $("#contentTable").tableHeadFixer({"head": true, "left": 0});
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
	<%--<ul class="nav nav-tabs my-nav-tabs">
		<li class="active"><a href="${ctx}/iot/iotWatermeterCollect/">ˮ��ɼ���Ϣ�б�</a></li>
		<shiro:hasPermission name="iot:iotWatermeterCollect:edit"><li><a href="${ctx}/iot/iotWatermeterCollect/form">ˮ��ɼ���Ϣ���</a></li></shiro:hasPermission>
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
				<li><label>ˮ���ţ�</label>
					<form:input path="watermeterNum" htmlEscape="false" maxlength="25" class="input-medium"/>
				</li>
				<li><label>�ɼ�ʱ�䣺</label>
					<input name="collectTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
						value="<fmt:formatDate value="${iotWatermeterCollect.collectTime}" pattern="yyyy-MM-dd"/>"
						onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});"/>
				</li>
				<li><label>ˮ�������</label>
					<form:input path="totalFlow" htmlEscape="false" class="input-medium"/>
				</li>
				<li class="btns">
					<input id="btnSubmit" class="btn btn-primary" type="submit" value="��ѯ"/>
					<input id="btnReset" class="btn btn-default" type="button" value="����"/>
				</li>
				<li class="clearfix"></li>
			</ul>--%>
		</form:form>
		<sys:message content="${message}"/>
		<table id="contentTable" class="table table-striped my-table-bordered table-condensed">
			<thead>
				<tr>
					<th >ˮ����</th>
					<th >�ɼ�ʱ��</th>
					<th >ˮ�����</th>
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