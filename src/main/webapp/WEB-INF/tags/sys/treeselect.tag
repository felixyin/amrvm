<%@ tag language="java" pageEncoding="GBK"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="id" type="java.lang.String" required="true" description="���"%>
<%@ attribute name="viewName" type="java.lang.String" required="false" description="��ѯ��ͼ������"%>
<%@ attribute name="name" type="java.lang.String" required="true" description="���������ƣ�ID��"%>
<%@ attribute name="value" type="java.lang.String" required="true" description="������ֵ��ID��"%>
<%@ attribute name="labelName" type="java.lang.String" required="true" description="��������ƣ�Name��"%>
<%@ attribute name="labelValue" type="java.lang.String" required="true" description="�����ֵ��Name��"%>
<%@ attribute name="title" type="java.lang.String" required="true" description="ѡ������"%>
<%@ attribute name="url" type="java.lang.String" required="true" description="���ṹ���ݵ�ַ"%>
<%@ attribute name="checked" type="java.lang.Boolean" required="false" description="�Ƿ���ʾ��ѡ���������Ҫ���ظ��ڵ㣬������notAllowSelectParentΪtrue"%>
<%@ attribute name="extId" type="java.lang.String" required="false" description="�ų����ı�ţ�����ѡ��ı�ţ�"%>
<%@ attribute name="isAll" type="java.lang.Boolean" required="false" description="�Ƿ��г�ȫ�����ݣ�����true�򲻽�������Ȩ�޹��ˣ�Ŀǰ����Office��Ч��"%>
<%@ attribute name="notAllowSelectRoot" type="java.lang.Boolean" required="false" description="������ѡ����ڵ�"%>
<%@ attribute name="notAllowSelectParent" type="java.lang.Boolean" required="false" description="������ѡ�񸸽ڵ�"%>
<%@ attribute name="module" type="java.lang.String" required="false" description="������Ŀģ�ͣ�ֻ��ʾָ��ģ�ͣ������CMS��Category����"%>
<%@ attribute name="selectScopeModule" type="java.lang.Boolean" required="false" description="ѡ��Χ�ڵ�ģ�ͣ����Ʋ���ѡ�񹫹�ģ�ͣ�����ѡ����Ŀ���ģ�ͣ��������CMS��Category����"%>
<%@ attribute name="allowClear" type="java.lang.Boolean" required="false" description="�Ƿ��������"%>
<%@ attribute name="allowInput" type="java.lang.Boolean" required="false" description="�ı������д"%>
<%@ attribute name="cssClass" type="java.lang.String" required="false" description="css��ʽ"%>
<%@ attribute name="cssStyle" type="java.lang.String" required="false" description="css��ʽ"%>
<%@ attribute name="smallBtn" type="java.lang.Boolean" required="false" description="��С��ť��ʾ"%>
<%@ attribute name="hideBtn" type="java.lang.Boolean" required="false" description="�Ƿ���ʾ��ť"%>
<%@ attribute name="disabled" type="java.lang.String" required="false" description="�Ƿ�����ѡ��������ƣ�����Ϊdisabled"%>
<%@ attribute name="dataMsgRequired" type="java.lang.String" required="false" description=""%>
<div class="input-append">
	<input id="${id}Id" name="${name}" class="${cssClass}" type="hidden" value="${value}"/>
	<input id="${id}Name" name="${labelName}" ${allowInput?'':'readonly="readonly"'} type="text" value="${labelValue}" data-msg-required="${dataMsgRequired}"
		class="${cssClass}" style="${cssStyle}"/><a id="${id}Button" href="javascript:" class="btn ${disabled} ${hideBtn ? 'hide' : ''}" style="${smallBtn?'padding:4px 2px;':''}">&nbsp;<i class="icon-search"></i>&nbsp;</a>&nbsp;&nbsp;
</div>
<script type="text/javascript">
	$("#${id}Button, #${id}Name").click(function(){
		// �Ƿ�����ѡ��������ƣ�����Ϊdisabled
		if ($("#${id}Button").hasClass("disabled")){
			return true;
		}
		// ������	
		top.$.jBox.open("iframe:${ctx}/tag/treeselect?viewName=${viewName}&url="+encodeURIComponent("${url}")+"&module=${module}&checked=${checked}&extId=${extId}&isAll=${isAll}", "ѡ��${title}", 300, 420, {
			ajaxData:{selectIds: $("#${id}Id").val()},buttons:{"ȷ��":"ok", ${allowClear?"\"���\":\"clear\", ":""}"�ر�":true}, submit:function(v, h, f){
				if (v=="ok"){
					var tree = h.find("iframe")[0].contentWindow.tree;//h.find("iframe").contents();
					var ids = [], names = [], nodes = [];
					if ("${checked}" == "true"){
						nodes = tree.getCheckedNodes(true);
					}else{
						nodes = tree.getSelectedNodes();
					}
					for(var i=0; i<nodes.length; i++) {//<c:if test="${checked && notAllowSelectParent}">
						if (nodes[i].isParent){
							continue; // ���Ϊ��ѡ��ѡ������˵����ڵ�
						}//</c:if><c:if test="${notAllowSelectRoot}">
						if (nodes[i].level == 0){
							top.$.jBox.tip("����ѡ����ڵ㣨"+nodes[i].name+"��������ѡ��");
							return false;
						}//</c:if><c:if test="${notAllowSelectParent}">
						if (nodes[i].isParent){
							top.$.jBox.tip("����ѡ�񸸽ڵ㣨"+nodes[i].name+"��������ѡ��");
							return false;
						}//</c:if><c:if test="${not empty module && selectScopeModule}">
						if (nodes[i].module == ""){
							top.$.jBox.tip("����ѡ�񹫹�ģ�ͣ�"+nodes[i].name+"��������ѡ��");
							return false;
						}else if (nodes[i].module != "${module}"){
							top.$.jBox.tip("����ѡ��ǰ��Ŀ�������Ŀģ�ͣ�������ѡ��");
							return false;
						}//</c:if>
						ids.push(nodes[i].id);
						names.push(nodes[i].name);//<c:if test="${!checked}">
						break; // ���Ϊ�Ǹ�ѡ��ѡ���򷵻ص�һ��ѡ��  </c:if>
					}
					$("#${id}Id").val(ids.join(",").replace(/u_/ig,""));
					$("#${id}Name").val(names.join(","));
				}//<c:if test="${allowClear}">
				else if (v=="clear"){
					$("#${id}Id").val("");
					$("#${id}Name").val("");
                }//</c:if>
				if(typeof ${id}TreeselectCallBack == 'function'){
					${id}TreeselectCallBack(v, h, f);
				}
			}, loaded:function(h){
				$(".jbox-content", top.document).css("overflow-y","hidden");
			}
		});
	});
</script>