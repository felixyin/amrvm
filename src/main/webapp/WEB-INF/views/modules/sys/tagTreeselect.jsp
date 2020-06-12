<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>����ѡ��</title>
	<meta name="decorator" content="blank"/>
	<%@include file="/WEB-INF/views/include/treeview.jsp" %>
	<script type="text/javascript">
		var key, lastValue = "", nodeList = [], type = getQueryString("type", "${url}");
		var tree, setting = {view:{selectedMulti:false,dblClickExpand:false},check:{enable:"${checked}",nocheckInherit:true},
				async:{enable:(type==3),url:"${ctx}/sys/user/treeData",autoParam:["id=officeId"]},
				data:{simpleData:{enable:true}},callback:{<%--
					beforeClick: function(treeId, treeNode){
						if("${checked}" == "true"){
							//tree.checkNode(treeNode, !node.checked, true, true);
							tree.expandNode(treeNode, true, false, false);
						}
					}, --%>
					onClick:function(event, treeId, treeNode){
						tree.expandNode(treeNode);
					},onCheck: function(e, treeId, treeNode){
						var nodes = tree.getCheckedNodes(true);
						for (var i=0, l=nodes.length; i<l; i++) {
							tree.expandNode(nodes[i], true, false, false);
						}
						return false;
					},onAsyncSuccess: function(event, treeId, treeNode, msg){
						var nodes = tree.getNodesByParam("pId", treeNode.id, null);
						for (var i=0, l=nodes.length; i<l; i++) {
							try{tree.checkNode(nodes[i], treeNode.checked, true);}catch(e){}
							//tree.selectNode(nodes[i], false);
						}
						selectCheckNode();
					},onDblClick: function(){//<c:if test="${!checked}">
						top.$.jBox.getBox().find("button[value='ok']").trigger("click");
						//$("input[type='text']", top.mainFrame.document).focus();//</c:if>
					}
				}
			};
		function expandNodes(nodes) {
			if (!nodes) return;
			for (var i=0, l=nodes.length; i<l; i++) {
				tree.expandNode(nodes[i], true, false, false);
				if (nodes[i].isParent && nodes[i].zAsync) {
					expandNodes(nodes[i].children);
				}
			}
		}
		$(document).ready(function(){
			$.get("${ctx}${url}${fn:indexOf(url,'?')==-1?'?':'&'}&viewName=${viewName}&extId=${extId}&isAll=${isAll}&module=${module}&t="
					+ new Date().getTime(), function(zNodes){
				// ��ʼ�����ṹ
				tree = $.fn.zTree.init($("#tree"), setting, zNodes);
				
				// Ĭ��չ��һ���ڵ�
				var nodes = tree.getNodesByParam("level", 0);
				for(var i=0; i<nodes.length; i++) {
					tree.expandNode(nodes[i], true, false, false);
				}
				//�첽�����ӽڵ㣨�����û���
				var nodesOne = tree.getNodesByParam("isParent", true);
				for(var j=0; j<nodesOne.length; j++) {
					tree.reAsyncChildNodes(nodesOne[j],"!refresh",true);
				}
				selectCheckNode();
			});
			key = $("#key");
			key.bind("focus", focusKey).bind("blur", blurKey).bind("change cut input propertychange", searchNode);
			key.bind('keydown', function (e){if(e.which == 13){searchNode();}});
			setTimeout("search();", "300");
		});
		
		// Ĭ��ѡ��ڵ�
		function selectCheckNode(){
			var ids = "${selectIds}".split(",");
			for(var i=0; i<ids.length; i++) {
				var node = tree.getNodeByParam("id", (type==3?"u_":"")+ids[i]);
				if("${checked}" == "true"){
					try{tree.checkNode(node, true, true);}catch(e){}
					tree.selectNode(node, false);
				}else{
					tree.selectNode(node, true);
				}
			}
		}
	  	function focusKey(e) {
			if (key.hasClass("empty")) {
				key.removeClass("empty");
			}
		}
		function blurKey(e) {
			if (key.get(0).value === "") {
				key.addClass("empty");
			}
			searchNode(e);
		}
		
		//�����ڵ�
		function searchNode() {
			// ȡ������Ĺؼ��ֵ�ֵ
			var value = $.trim(key.get(0).value);
			
			// �����ֲ�ѯ
			var keyType = "name";<%--
			if (key.hasClass("empty")) {
				value = "";
			}--%>
			
			// ������ϴ�һ�Σ����˳������ˡ�
			if (lastValue === value) {
				return;
			}
			
			// �������һ��
			lastValue = value;
			
			var nodes = tree.getNodes();
			// ���Ҫ����ִ������˳������ˡ�
			if (value == "") {
				showAllNode(nodes);
				return;
			}
			hideAllNode(nodes);
			nodeList = tree.getNodesByParamFuzzy(keyType, value);
			updateNodes(nodeList);
		}
		
		//�������нڵ�
		function hideAllNode(nodes){			
			nodes = tree.transformToArray(nodes);
			for(var i=nodes.length-1; i>=0; i--) {
				tree.hideNode(nodes[i]);
			}
		}
		
		//��ʾ���нڵ�
		function showAllNode(nodes){			
			nodes = tree.transformToArray(nodes);
			for(var i=nodes.length-1; i>=0; i--) {
				/* if(!nodes[i].isParent){
					tree.showNode(nodes[i]);
				}else{ */
					if(nodes[i].getParentNode()!=null){
						tree.expandNode(nodes[i],false,false,false,false);
					}else{
						tree.expandNode(nodes[i],true,true,false,false);
					}
					tree.showNode(nodes[i]);
					showAllNode(nodes[i].children);
				/* } */
			}
		}
		
		//���½ڵ�״̬
		function updateNodes(nodeList) {
			tree.showNodes(nodeList);
			for(var i=0, l=nodeList.length; i<l; i++) {
				
				//չ����ǰ�ڵ�ĸ��ڵ�
				tree.showNode(nodeList[i].getParentNode()); 
				//tree.expandNode(nodeList[i].getParentNode(), true, false, false);
				//��ʾչ�����������ڵ�ĸ��ڵ�
				while(nodeList[i].getParentNode()!=null){
					tree.expandNode(nodeList[i].getParentNode(), true, false, false);
					nodeList[i] = nodeList[i].getParentNode();
					tree.showNode(nodeList[i].getParentNode());
				}
				//��ʾ���ڵ�
				tree.showNode(nodeList[i].getParentNode());
				//չ�����ڵ�
				tree.expandNode(nodeList[i].getParentNode(), true, false, false);
			}
		}
		
		// ��ʼ����
		function search() {
			$("#search").slideToggle(200);
			$("#txt").toggle();
			$("#key").focus();
		}
		
	</script>
</head>
<body>
	<div style="position:absolute;right:8px;top:5px;cursor:pointer;" onclick="search();">
		<i class="icon-search"></i><label id="txt">����</label>
	</div>
	<div id="search" class="form-search hide" style="padding:10px 0 0 13px;">
		<label for="key" class="control-label" style="padding:5px 5px 3px 0;">�ؼ��֣�</label>
		<input type="text" class="empty" id="key" name="key" maxlength="50" style="width:110px;">
		<button class="btn" id="btn" onclick="searchNode()">����</button>
	</div>
	<div id="tree" class="ztree" style="padding:15px 20px;"></div>
</body>