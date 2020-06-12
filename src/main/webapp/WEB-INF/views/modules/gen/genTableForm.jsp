<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>ҵ������</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#comments").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('�����ύ�����Ե�...');
					$("input[type=checkbox]").each(function(){
						$(this).after("<input type=\"hidden\" name=\""+$(this).attr("name")+"\" value=\""
								+($(this).attr("checked")?"1":"0")+"\"/>");
						$(this).attr("name", "_"+$(this).attr("name"));
					});
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("�����������ȸ�����");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/gen/genTable/">ҵ����б�</a></li>
		<li class="active"><a href="${ctx}/gen/genTable/form?id=${genTable.id}&name=${genTable.name}">ҵ���<shiro:hasPermission name="gen:genTable:edit">${not empty genTable.id?'�޸�':'���'}</shiro:hasPermission><shiro:lacksPermission name="gen:genTable:edit">�鿴</shiro:lacksPermission></a></li>
	</ul>
	<c:choose>
		<c:when test="${empty genTable.name}">
			<form:form id="inputForm" modelAttribute="genTable" action="${ctx}/gen/genTable/form" method="post" class="form-horizontal">
				<form:hidden path="id"/>
				<sys:message content="${message}"/>
				<br/>
				<div class="control-group">
					<label class="control-label">����:</label>
					<div class="controls">
						<form:select path="name" class="input-xxlarge">
							<form:options items="${tableList}" itemLabel="nameAndComments" itemValue="name" htmlEscape="false"/>
						</form:select>
					</div>
					<div class="form-actions">
						<input id="btnSubmit" class="btn btn-primary" type="submit" value="��һ��"/>&nbsp;
						<input id="btnCancel" class="btn" type="button" value="�� ��" onclick="history.go(-1)"/>
					</div>
				</div>
			</form:form>
		</c:when>
		<c:otherwise>
			<form:form id="inputForm" modelAttribute="genTable" action="${ctx}/gen/genTable/save" method="post" class="form-horizontal">
				<form:hidden path="id"/>
				<sys:message content="${message}"/>
				<fieldset>
					<legend>������Ϣ</legend>
					<div class="control-group">
						<label class="control-label">����:</label>
						<div class="controls">
							<form:input path="name" htmlEscape="false" maxlength="200" class="required" readonly="true"/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">˵��:</label>
						<div class="controls">
							<form:input path="comments" htmlEscape="false" maxlength="200" class="required"/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">����:</label>
						<div class="controls">
							<form:input path="className" htmlEscape="false" maxlength="200" class="required"/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">�������:</label>
						<div class="controls">
							<form:select path="parentTable" cssClass="input-xlarge">
								<form:option value="">��</form:option>
								<form:options items="${tableList}" itemLabel="nameAndComments" itemValue="name" htmlEscape="false"/>
							</form:select>
							&nbsp;��ǰ�������
							<form:select path="parentTableFk" cssClass="input-xlarge">
								<form:option value="">��</form:option>
								<form:options items="${genTable.columnList}" itemLabel="nameAndComments" itemValue="name" htmlEscape="false"/>
							</form:select>
							<span class="help-inline">����и�����ָ��������������</span>
						</div>
					</div>
					<div class="control-group hide">
						<label class="control-label">��ע:</label>
						<div class="controls">
							<form:textarea path="remarks" htmlEscape="false" rows="4" maxlength="200" class="input-xxlarge"/>
						</div>
					</div>
					<legend>�ֶ��б�</legend>
					<div class="control-group">
						<table id="contentTable" class="table table-striped table-bordered table-condensed">
							<thead><tr><th title="���ݿ��ֶ���">����</th><th title="Ĭ�϶�ȡ���ݿ��ֶα�ע">˵��</th><th title="���ݿ������õ��ֶ����ͼ�����">��������</th><th title="ʵ�����������ֶ�����">Java����</th>
								<th title="ʵ�����������ֶΣ�������.������|������2|������3�����磺�û�user.id|name|loginName��������2��������3ΪJoinʱ������ѯ���ֶΣ�">Java�������� <i class="icon-question-sign"></i></th>
								<th title="�Ƿ������ݿ�����">����</th><th title="�ֶ��Ƿ��Ϊ��ֵ������Ϊ���ֶ��Զ����п�ֵ��֤">�ɿ�</th><th title="ѡ�к���ֶα����뵽insert�����">����</th>
								<th title="ѡ�к���ֶα����뵽update�����">�༭</th><th title="ѡ�к���ֶα����뵽��ѯ�б���">�б�</th><th title="ѡ�к���ֶβ�ѯ�б����������">����</th>
								<th title="ѡ�к���ֶα����뵽��ѯ������">��ѯ</th><th title="���ֶ�Ϊ��ѯ�ֶ�ʱ�Ĳ�ѯƥ�����">��ѯƥ�䷽ʽ</th>
								<th title="�ֶ��ڱ�����ʾ������">��ʾ������</th><th title="��ʾ����������Ϊ�������򡢸�ѡ�򡢵�ѡ��ʱ���������ֵ������">�ֵ�����</th><th>����</th></tr></thead>
							<tbody>
							<c:forEach items="${genTable.columnList}" var="column" varStatus="vs">
								<tr${column.delFlag eq '1'?' class="error" title="��ɾ�����У�����֮����ʧ��"':''}>
									<td nowrap>
										<input type="hidden" name="columnList[${vs.index}].id" value="${column.id}"/>
										<input type="hidden" name="columnList[${vs.index}].delFlag" value="${column.delFlag}"/>
										<input type="hidden" name="columnList[${vs.index}].genTable.id" value="${column.genTable.id}"/>
										<input type="hidden" name="columnList[${vs.index}].name" value="${column.name}"/>${column.name}
									</td>
									<td>
										<input type="text" name="columnList[${vs.index}].comments" value="${column.comments}" maxlength="200" class="required" style="width:100px;"/>
									</td>
									<td nowrap>
										<input type="hidden" name="columnList[${vs.index}].jdbcType" value="${column.jdbcType}"/>${column.jdbcType}
									</td>
									<td>
										<select name="columnList[${vs.index}].javaType" class="required input-mini" style="width:85px;*width:75px">
											<c:forEach items="${config.javaTypeList}" var="dict">
												<option value="${dict.value}" ${dict.value==column.javaType?'selected':''} title="${dict.description}">${dict.label}</option>
											</c:forEach>
										</select>
									</td>
									<td>
										<input type="text" name="columnList[${vs.index}].javaField" value="${column.javaField}" maxlength="200" class="required input-small"/>
									</td>
									<td>
										<input type="checkbox" name="columnList[${vs.index}].isPk" value="1" ${column.isPk eq '1' ? 'checked' : ''}/>
									</td>
									<td>
										<input type="checkbox" name="columnList[${vs.index}].isNull" value="1" ${column.isNull eq '1' ? 'checked' : ''}/>
									</td>
									<td>
										<input type="checkbox" name="columnList[${vs.index}].isInsert" value="1" ${column.isInsert eq '1' ? 'checked' : ''}/>
									</td>
									<td>
										<input type="checkbox" name="columnList[${vs.index}].isEdit" value="1" ${column.isEdit eq '1' ? 'checked' : ''}/>
									</td>
									<td>
										<input type="checkbox" name="columnList[${vs.index}].isList" value="1" ${column.isList eq '1' ? 'checked' : ''}/>
									</td>
									<td>
										<input type="checkbox" name="columnList[${vs.index}].isSort" value="1" ${column.isSort eq '1' ? 'checked' : ''}/>
									</td>
									<td>
										<input type="checkbox" name="columnList[${vs.index}].isQuery" value="1" ${column.isQuery eq '1' ? 'checked' : ''}/>
									</td>
									<td>
										<select name="columnList[${vs.index}].queryType" class="required input-mini">
											<c:forEach items="${config.queryTypeList}" var="dict">
												<option value="${fns:escapeHtml(dict.value)}" ${fns:escapeHtml(dict.value)==column.queryType?'selected':''} title="${dict.description}">${fns:escapeHtml(dict.label)}</option>
											</c:forEach>
										</select>
									</td>
									<td>
										<select name="columnList[${vs.index}].showType" class="required" style="width:100px;">
											<c:forEach items="${config.showTypeList}" var="dict">
												<option value="${dict.value}" ${dict.value==column.showType?'selected':''} title="${dict.description}">${dict.label}</option>
											</c:forEach>
										</select>
									</td>
									<td>
										<input type="text" name="columnList[${vs.index}].dictType" value="${column.dictType}" maxlength="200" class="input-mini"/>
									</td>
									<td>
										<input type="text" name="columnList[${vs.index}].sort" value="${column.sort}" maxlength="200" class="required input-min digits"/>
									</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
					</div>
				</fieldset>
				<div class="form-actions">
					<shiro:hasPermission name="gen:genTable:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="�� ��"/>&nbsp;</shiro:hasPermission>
					<input id="btnCancel" class="btn" type="button" value="�� ��" onclick="history.go(-1)"/>
				</div>
			</form:form>
		</c:otherwise>
	</c:choose>
</body>
</html>
