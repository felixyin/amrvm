/**
 * jqGrid ��װ��
 * @author ThinkGem@163.COM
 * @version 2014-8-22
 */
var DataGrid = function(options){
	
	var dataGrid = options.dataGrid ? options.dataGrid : $("#dataGrid");
	var dataGridPage = options.dataGridPage ? options.dataGridPage : $("#dataGridPage");
	var searchForm = options.searchForm ? options.searchForm : $("#searchForm");
	
	options = $.extend({
		url: searchForm.attr('action'),
		postData: searchForm.serializeArray(),
		mtype: "POST", datatype: "json",
		jsonReader: { 	// �Զ������JSON��ȡ����
			id: options.dataId, root: "list", page: "pageNo", 
			total: "totalPage", records: "count", subgrid: {root:"list"}
		},
		treeReader: {	// �Զ��������JSON��ȡ����
			level_field: "sortGrade", parent_id_field: "parentCode",
			leaf_field: "isLeaf", expanded_field: "isOpen", icon_field: "_icon"
		},
		prmNames: {		// �Զ���Ajax�������
			page:"pageNo", rows:"pageSize", sort: "orderBy",
			order: "sord", search:"_search", nd:"nd", id:"id",
			oper:"oper",editoper:"edit",addoper:"add",deloper:"del", 
			subgridid:"id", npage: null, totalrows:"totalPage"
		},
		rowNum: -1, 		// ��ʾ������-1Ϊ��ʾȫ��
		rownumWidth: 30,	// ����п�
		multiboxonly: true,	// ������ѡ��ʱ�ڶ�ѡ
		altRows: true, 		// ��������ʽ��������altclass

		// ��ǰҳǩ���
		tabPageId: '',
		
		// ������ģ��
		columnModel: [], colNames: [], colModel: options.columnModel,

		// �б����
		dataId: 'id', 		// ָ����������
		showRownum: true,	// �Ƿ���ʾ�к�
		showCheckbox: false,// �Ƿ���ʾ��ѡ��
		sortable: true,	// �б��Ƿ�����֧��
		
		autoGridHeight: true, // �Զ����߶�
		autoGridHeightFix: 0,  // �Զ����߶ȿ��
		autoGridWidth: true,  // �Զ������
		autoGridWidthFix: 0,  // �Զ�����޸����
		
		// ���ṹ���
		treeGrid: false,							// �������ṹ���
		treeGridModel: 'adjacency',					// ���ü򵥽ṹģʽ
		ExpandColClick: true,						// �����п�չ��
		ExpandColumn: options.treeColumn,			// Ҫչ������
		defaultExpandLevel: 0,						// Ĭ��չ���Ĳ��
		initExpandLevel: options.defaultExpandLevel,// �����ʼ�������õ�չ�����

		// ���尴ť��
        btnSearch: $("#btnSearch"), 					// ��ѯ��ť
        btnRefreshTree: $("#btnRefreshTree"), 			// ˢ������ť
        btnExpandTreeNode: $("#btnExpandTreeNode"), 	// չ�����ڵ㰴ť
        btnCollapseTreeNode: $("#btnCollapseTreeNode"), // �۵����ڵ㰴ť

        // ��ҳ����ֶ�
        inputPageNo: $("#pageNo", searchForm),		// ��ǰҳ���ֶ�
        inputPageSize: $("#pageSize", searchForm),	// ҳ���С�ֶ�
        inputOrderBy: $("#orderBy", searchForm),	// �����ֶ�
        
        // ��������ǰ���÷���
		beforeRequest: function(data){
			loading();
			// ��������ṹ���
			if (options.treeGrid){
				// һ���Բ�ѯ����
				var postData = getParam('postData');
				if (postData.id){
					setParam({postData: {id: postData.id}});
				}else if (postData.nodeid){
					setParam({postData: {parentCode: postData.nodeid}});
				}
				// �����������
				else{
					setParam({postData: searchForm.serializeArray()});
				}
			}else{
				// �����������
				setParam({postData: searchForm.serializeArray()});
			}
			
			// �������ǰ���÷���
			if (typeof options.ajaxLoad == 'function'){
				options.ajaxLoad(data);
			}
			
			$('.btn').attr("disabled", true);
			$('.ui-jqgrid .loading').remove();
		},
		
		// ����������ɵ��÷���
		loadComplete: function(data){
			
			// ��������ṹ���
			if (options.treeGrid){
				
				// չ���ȴ�չ�����ڵ�
				if (dataGrid.expandNodeIds){
					setTimeout(function(){
						if (dataGrid.expandNodeIds.length > 0){
							$('#'+dataGrid.expandNodeIds.shift()+':visible .tree-plus', dataGrid).click();
						}else{
							if (dataGrid.currentLevel < dataGrid.expandLevel){
								dataGrid.currentLevel++;
								dataGrid.expandNodeIds = [];
								$('.jqgrow:visible .tree-plus', dataGrid).each(function(){
									var id = $(this).parents('.jqgrow').attr('id');
									dataGrid.expandNodeIds.push(id);
								});
								$('#'+dataGrid.expandNodeIds.shift()+':visible .tree-plus', dataGrid).click();
							}else{
								// ����Ѿ�չ����ɣ�������չ��ID����
								dataGrid.expandNodeIds = null;
							}
						}
					}, 10);
				}
				// �����غ��Ĭ��չ������
				else if (options.defaultExpandLevel && options.defaultExpandLevel > 0){
					expandTreeNode(options.defaultExpandLevel);
					options.defaultExpandLevel = 0;
				}
				// һ���Բ�ѯ���������Ӧ����
				setParam({postData: {id: '', nodeid: ''}});
			}else{
				// ��ʾ��ҳ����
				if (data && data.html){
					dataGridPage.html(data.html);
				}
			}
			
			// ����ɹ�֮����÷���
			if (typeof options.ajaxSuccess == 'function'){
				options.ajaxSuccess(data);
			}
			
			// ���б�ť�¼�
			if (typeof options.btnEventBind == 'function'){
				options.btnEventBind($('.btnList'));
			}
			
			resizeDataGrid();
			$('.btn').attr("disabled", false);
			closeTip();
		},
		loadError: function(data){
			if (typeof options.ajaxError == 'function'){
				options.ajaxError(data);
			}
			$('.btn').attr("disabled", false);
			showTip('����ʧ�ܣ�' + data.responseText);
			closeTip(0, true);
		},
		gridComplete : function() {
			if (typeof options.complete == 'function'){
				options.complete();
			}
			resizeDataGrid();
		},
		onSortCol: function (index, iCol, sortorder) {
			if (options.inputOrderBy && options.inputOrderBy.length){
				options.inputOrderBy.val(index + ' ' + sortorder);
				//setParam({postData: searchForm.serializeArray()});
			}
        },
//		ondblClickRow: function(id, rownum, colnum, event){
////		$('.jqgrow td').attr('onselectstart', 'return false;').css('style', '-moz-user-select:none;');
//			if(document.selection && document.selection.empty) {
//		        document.selection.empty();
//		    }
//		    else if(window.getSelection) {
//		        var sel = window.getSelection();
//		        sel.removeAllRanges();
//		    }
//			$('#' + id + '.jqgrow a:first').click();
//		},
		
//		// ���ö༶��ͷ
//		groupHeaders: {
//	 		twoLevel:[
//	 			{startColumnName: 'postCode', numberOfColumns: 2, titleText: '������ͷ'},
//	 			{startColumnName: 'remarks', numberOfColumns:2, titleText:'������ͷ2'}
//	 		],
//	 		threeLevel:[
//	 			{startColumnName: 'postCode', numberOfColumns:4, titleText:'������ͷ'}
//	 		]
//		},
//		frozenCols: true, 	// �����У���colModelָ��frozen: true
//		showFooter: true,	// �Ƿ���ʾ�ײ��ϼ���
		
        // ��ť�¼���
		btnEventBind: function(elements){ 
			elements.each(function(){
				var clickBinded = $(this).attr('data-click-binded');
				if (clickBinded == undefined){
					// ��ֹ�ظ���
					$(this).attr('data-click-binded', true);
					// �󶨰�ť�����¼�
					$(this).click(function(){
						var se = $(this);
						var url = se.attr('href');
						var title = se.data('title');
						if (title == undefined){
							title = se.attr('title');
						}
						var confirm = se.data('confirm');
						if(confirm != undefined){
							confirmx(confirm, url, function(data){
								showTip(data.message);
								if(data.result==Global.TRUE){
									var confirmSuccess = se.data('confirmSuccess');
									if (confirmSuccess != undefined){
										try{
											eval(confirmSuccess);
										}catch(e){
											Log.log('confirmSuccess error: ' + e);
										}
									}else{
										// ��������ṹ���
										if (options.treeGrid){
											var row = getRowData(se.parents('.jqgrow').attr('id'));
											if (row && !isRoot(row.parentCode)){
												refreshTree(1, row.parentCode);
											}else{
												refreshTree();
											}
										}else{
											refresh();
										}
									}
								}
							}, "json");
						}else{
							addTabPage($(this), title, url, options.tabPageId);
						}
						return false;
					});
				}
			});
			return self;
		},
		ajaxLoad: function(data){ // ����ǰִ�з���
			
		},
		ajaxSuccess: function(data){ // ���سɹ���ִ�з���
			
		},
		ajaxError: function(data){ // ����ʧ�ܺ�ִ�з���
			
		},
		complete: function(){ // ��������ɺ�ִ��
			
		}
    }, options);
	
	// ��ȡ�б���
	options.colNames = [];
	for(var i=0; i<options.colModel.length; i++){
		options.colNames.push(options.colModel[i].header);
		// ��������ṹ���
		if (options.treeGrid || !options.sortable){
			options.colModel[i].sortable = false; // �Ƿ�������
		}
	}
	
	// ��������ṹ���
	if (options.treeGrid){
		options.showRownum = false;	// �Ƿ���ʾ�к�
		options.showCheckbox = false; // �Ƿ���ʾ��ѡ��
	}
	
	// ��ʾ���
	if (options.showRownum){
		options.rownumbers = true;	// ��ʾ���
	}
	
	// ��ʾ��ѡ��ѡ��
	if (options.showCheckbox){
		options.multiselect = true;	// ��ʾ��ѡ��ѡ��
	}
	
	// ��������˶༶��ͷ�򶳽���
	if (options.groupHeaders || options.frozenCols){
		options.shrinkToFit = false;// �����ٷֱ�����Ӧ�п�
	}else{
		options.shrinkToFit = true;	// ���ٷֱ�����Ӧ�п�
	}
	
	// �Ƿ���ʾ�ϼ���
	if (options.showFooter){
		options.footerrow = true; 		// ��ʾ�ײ��ϼ���
		options.userDataOnFooter = true; // ʹ��json������Ϊ�ϼ�������
	}

	// ��ӷ�ҳ���������
	if(options.inputPageNo.length == 0){
		var pageNo = searchForm.data('pageNo');
		searchForm.append('<input id="pageNo" name="pageNo" type="hidden" value="'+(pageNo?pageNo:'')+'"/>');
		options.inputPageNo = $("#pageNo", searchForm);
	}
	if(options.inputPageSize.length == 0){
		var pageSize = searchForm.data('pageSize');
		searchForm.append('<input id="pageSize" name="pageSize" type="hidden" value="'+(pageSize?pageSize:'')+'"/>');
		options.inputPageSize = $("#pageSize", searchForm);
	}
	if(options.inputOrderBy.length == 0){
		var orderBy = searchForm.data('orderBy');
		searchForm.append('<input id="orderBy" name="orderBy" type="hidden" value="'+(orderBy?orderBy:'')+'"/>');
		options.inputOrderBy = $("#orderBy", searchForm);
	}
	
	// �󶨲�ѯ���ύ�¼�
	searchForm.submit(function(){
		refresh();
		return false;
	});
	
	// �󶨹������ϵİ�ť
	if (typeof options.btnEventBind == 'function'){
		
		// �󶨹������ϵİ�ť
		options.btnEventBind($('.btnTool'));
		
		// �󶨲�ѯ��ť
		options.btnSearch.click(function(){
			searchForm.toggleClass('hide');
			resizeDataGrid();
			return false;
		});
		
		// ��ˢ�°�ť
		options.btnRefreshTree.click(function(){
			$('input[type=reset]', searchForm).click();
			refreshTree();
			return false;
		});
		
		// ��ȫ��չ����ť
		options.btnExpandTreeNode.click(function(){
			expandTreeNode(1);
			return false;
		});
		
		// ��ȫ���۵���ť
		options.btnCollapseTreeNode.click(function(){
			collapseTreeNode();
			return false;
		});
	};
	
	// ��ʼ��jqGrid
	dataGrid.jqGrid(options);
	
	// ��������˶༶��ͷ
	if (options.groupHeaders && options.groupHeaders.twoLevel){

	 	// ����������ͷ
		if (options.groupHeaders.threeLevel){
		 	dataGrid.jqGrid('setComplexHeaders', {
		 	  complexHeaders:{
		 		defaultStyle:true,
		 		twoLevel: options.groupHeaders.twoLevel,
		 		threeLevel: options.groupHeaders.threeLevel
		 	  }
		 	});
		}
		
	 	// ���ö�����ͷ
		else{
		 	dataGrid.jqGrid('setGroupHeaders', {
		 	  useColSpanStyle: true, 
		 	  groupHeaders: options.groupHeaders.twoLevel
		 	});
		}
		
	}
	
	// �Ƿ񶳽���
	if (options.frozenCols){
		dataGrid.jqGrid('setFrozenColumns'); // �����У���colModelָ��frozen: true
	}	
	
	// �Զ���������С
	$(window).resize(function(){
		resizeDataGrid();
	});
	resizeDataGrid();

	/**
	 * �Զ���������С
	 */ 
	function resizeDataGrid(){

		// ��ȡGrid�ϼ�Ԫ��
		var jqGridParent = $(dataGrid).parents('.ui-jqgrid').parent();

		// ���ñ��߶ȣ���С�߶�150����
		var setGridHeight = function(){
			if (!options.autoGridHeight){
				return;
			}
			var tabContent = $(dataGrid).parents('.tab-content');
			if (tabContent.length > 0){
				var headerHeight = 30;
				if (options.groupHeaders && options.groupHeaders.twoLevel){
					if (options.groupHeaders.threeLevel){
						headerHeight *= 3;
					}else{
						headerHeight *= 2;
					}
				}
				var gridHeight = tabContent.height() - headerHeight - options.autoGridHeightFix;
				dataGrid.jqGrid('setGridHeight', gridHeight);
			}else{
				var gridHeight = $(dataGrid).height();
				var gridParent = $(dataGrid).parent();
				if (gridParent.length != 0){
					gridHeight = gridParent.height();
				}
				gridHeight = ($(window).height() - $('body').height() + gridHeight - options.autoGridHeightFix);
				if (gridHeight < 150){
					gridHeight = 150; // ��С�߶�
				}
				gridParent.height(gridHeight);
				dataGrid.jqGrid('setGridHeight', gridHeight);
			}
//			var outerHeight = 0;
//			jqGridParent.children().not(jqGrid).each(function(){
//				var height = $(this).outerHeight();
//				outerHeight += height > 0 ? height : 0;
//			});
//			var bodyHeight = jqGridParent.parents('.portlet-body').height();
//			var gridHeight = bodyHeight - outerHeight;
//			dataGrid.jqGrid('setGridHeight', gridHeight);
		}
		setGridHeight();

		// ���ñ���ȣ���С���500����
		var setGridWidth = function(){
			if (!options.autoGridWidth){
				return;
			}
			var gridWidth = 0;
			if (jqGridParent.is(':visible')){
				gridWidth = jqGridParent.width() - 2;
			}else{
				gridWidth = $(window).width() - 24;
			}
			dataGrid.jqGrid('setGridWidth', gridWidth - options.autoGridWidthFix, (options.shrinkToFit && $(window).width() > 500));
		};
		setGridWidth();

		// ����ie8�������ڵ�grid���㲻��ȷ����
		if (!! navigator.userAgent.match(/MSIE 8.0/)){
			setTimeout(function(){
				setGridHeight();
				setGridWidth();
			}, 10);
		}
		
 		// �ײ��ϼ�������
		if (options.showFooter){
			setTimeout(function(){
		 		$(".ui-jqgrid-bdiv>div").css({"height":"auto"});
		 		$(".ui-jqgrid-bdiv").css({"padding-bottom":"24px"});
		 		$(".ui-jqgrid-sdiv").width($(".ui-jqgrid-sdiv").width()-12);
		 		$(".ui-jqgrid-sdiv").css({"position":"absolute","bottom":"12px"});
		 		$(".ui-jqgrid-sdiv td").css({"border-bottom":"solid 1px #ddd"});
		 		$(".ui-jqgrid-ftable td").not("td.jqgrid-rownum").css({"background":"#FFFFE7"});
		 		$(".frozen-sdiv.ui-jqgrid-sdiv").css({"top":"auto","z-index":"1"});
		 		$(".frozen-sdiv td:eq(2)").html("&nbsp;�ϼƣ�");
			}, 100);
		}
	}

	/**
	 * �жϱ���Ƿ��Ǹ��ڵ�
	 */
	function isRoot(code){
		return !code || code == '' || code == '0';
	}
	
	/**
	 * ��ȡ����
	 */
	function getParam(paramName){
		return dataGrid.jqGrid('getGridParam', paramName);
	};

	/**
	 * ���ò���
	 */
	function setParam(params){
		dataGrid.jqGrid('setGridParam', params);
		return self;
	};
	
	/**
	 * ��ȡ����
	 */
	function getRowData(id){
		return dataGrid.jqGrid("getRowData", id);
	};

	/**
	 * ��ȡѡ����ID
	 */
	function getSelectRow(){
		return getParam("selrow");
	};
	
	/**
	 * ��ȡѡ��������ID
	 */
	function getSelectRows(){
		return getParam("selarrrow");
	};

	/**
	 * ����ѡ����
	 */
	function setSelectRow(id){
		if (id == undefined){
			dataGrid.jqGrid("resetSelection");
		}
		dataGrid.jqGrid("setSelection", id);
		return self;
	};
	
	/**
	 * ˢ�±��
	 */
	function refresh(pageNo, pageSize){
		if(pageNo){
			options.inputPageNo.val(pageNo);
		}
		if(pageSize){
			options.inputPageSize.val(pageSize);
		}
		var params = {};
		if (options.inputPageNo.val() != ''){
			params.page = options.inputPageNo.val();
		}
		if (options.inputPageSize.val() != ''){
			params.rowNum = options.inputPageSize.val();
		}
		//params.postData = searchForm.serializeArray();
		setParam(params);
		dataGrid.trigger('reloadGrid');
		return self;
	};
	
	/**
	 * ɾ�����ڵ�
	 */
	function delTreeNode(id){
		dataGrid.jqGrid("delTreeNode", id);
		return self;
	};

	/**
	 * չ�����ڵ�
	 * @param level һ��չ���Ĳ��
	 */
	function expandTreeNode(level){
		loading();
		setTimeout(function(){
			
			// һ��չ���Ĳ��
			dataGrid.expandLevel = level;
			
			// �����չ���ڵ�
			dataGrid.currentLevel = 1;
			dataGrid.expandNodeIds = [];
			$('.jqgrow:visible .tree-plus', dataGrid).each(function(){
				var id = $(this).parents('.jqgrow')[0].id;
				dataGrid.expandNodeIds.push(id);
			});
			if (dataGrid.expandNodeIds.length > 100){
				showTip("������Ҫչ����" + dataGrid.expandNodeIds.length
						+ "�����ڵ㣬��Ϊչ���ڵ���ִ࣬��ȡ����");
				dataGrid.expandNodeIds = [];
			}else{
				$('#'+dataGrid.expandNodeIds.shift()+':visible .tree-plus', dataGrid).click();
			}
			
			// ����Ѽ��أ���ֱ��չ��
	 		for (var i=0; i<dataGrid.expandLevel; i++){
	 			$('.jqgrow:visible .tree-plus', dataGrid).click();
	 		}
			
			closeTip();
		}, 10);
		return self;
	};
	
	/**
	 * �۵����ڵ�
	 */
	function collapseTreeNode(){
		loading();
		setTimeout(function(){
			$('.tree-minus', dataGrid).click();
			closeTip();
		}, 10);
		return self;
	};
	
	/**
	 * ˢ�������
	 */
	function refreshTree(expandLevel, parentCode){
		if (expandLevel){
			options.defaultExpandLevel = expandLevel;
		}
		if (!isRoot(parentCode)){
			setParam({postData: {id: parentCode}});
		}else if (parentCode != undefined){
			options.defaultExpandLevel = options.initExpandLevel;
		}
		dataGrid.trigger('reloadGrid');
		return self;
	};
	
	// public method
	var self = {
		
		/**
		 * ֱ�ӵ���jqGrid���󷽷�
		 */
		jqGrid: function(m, v){
			return dataGrid.jqGrid(m, v);
		},
		
		/**
		 * ���ò���
		 */
		setParam: function(params){
			return setParam(params);
		},
		
		/**
		 * ��ȡ����
		 */
		getParam: function(paramName){
			return getParam(paramName);
		},
		
		/**
		 * ��ȡ������
		 */
		getRowData: function(rowId){
			return getRowData(rowId);
		},
		
		/**
		 * ��ȡѡ����ID
		 */
		getSelectRow: function(){
			return getSelectRow();  
		},
		
		/**
		 * ��ȡѡ��������ID
		 */
		getSelectRows: function(){
			return getSelectRows();  
		},
		
		/**
		 * ����ѡ����
		 */
		setSelectRow: function(id){
			return setSelectRow(id);
		},
		
		/**
		 * ˢ�±��
		 */
		refresh: function(pageNo, pageSize){
			return refresh(pageNo, pageSize);
		},
		
		/**
		 * ɾ�����ڵ�
		 */
		delTreeNode: function(id){
			return delTreeNode(id);
		},
		
		/**
		 * չ�����ڵ�
		 * @param level һ��չ���Ĳ��
		 */
		expandTreeNode: function(level){
			return expandTreeNode(level);
		},

		/**
		 * �۵����ڵ�
		 */
		collapseTreeNode: function(){
			collapseTreeNode();
		},
		
		/**
		 * ˢ�������
		 */
		refreshTree: function(expandLevel, parentCode){
			return refreshTree(expandLevel, parentCode);
		},
		
		/**
		 * ��ť�¼���
		 */
		btnEventBind: function(elements){
			return btnEventBind(elements);
		}
	};
	
	return self;
};

/**
 * ��ҳ����
 */
function page(pageNo, pageSize, param){
	try{
		if (param && param != ''){
			dataGrids[param].refresh(pageNo, param);
		}else{
			dataGrid.refresh(pageNo, param);
		}
	}catch(e){
	}
	return false;
}

/**
 * ��չ����
 */
$.extend($.jgrid,{
//	getIdsByLevel : function(lvl) {
//		var ids = [];
//		this.each(function(){
//			var $t = this;
//			if( !$t.grid || !$t.p.treeGrid ) {return;}
//			var expCol = $t.p.expColInd,
//			expanded = $t.p.treeReader.expanded_field,
//			isLeaf = $t.p.treeReader.leaf_field,
//			level = $t.p.treeReader.level_field,
//			icon = $t.p.treeReader.icon_field,
//			loaded = $t.p.treeReader.loaded;
//			var data = $t.p.data;
//			for (var i=0; i<data.length; i++){
//				if (!data[i][isLeaf] && data[i][level] == lvl){
//					ids.push(data[i]._id_);
//				}
//			};
//		});
//		return ids;
//	},
	/**
	 * ȥ��HTML���
	 */
	stripHtml : function(v) {
		v = String(v);
    	return v.replace(/<[^>]*>/g, "");
	}
});

/**
 * jqGrid complexGroupHeaders
 * name cj
 * email 85309651@qq.com
 * blog http://cjblog.iteye.com/
 * version 0.2
 * date 2012-06-03
**/
(function($){
	$.jgrid.extend({
		/**
		 * ������ͷ by ljq
		 * @���� o : ������ͷ����
		 */
		setComplexHeaders : function ( o ) {
			o = $.extend({
				complexHeaders: {
					defaultStyle : true,
					threeLevel:[],
					twoLevel:[]
					}
			}, o || {});
			return this.each(function(){
				//������ͷ�Ͷ�����ͷ
				var complexHeaders = o.complexHeaders,
					threeHeaders = complexHeaders["threeLevel"],
					twoHeaders = complexHeaders["twoLevel"];
				if (threeHeaders.length === 0 || twoHeaders.length === 0) {
					return;	
				}
				this.p.complexHeader = o;
				var ts = this,
				defaultStyle = complexHeaders.defaultStyle === undefined ? true : complexHeaders.defaultStyle,
				i, cmi, $thirdHeaderRow, $fourHeaderRow, $colHeader, th, $th, thStyle,
				iCol,
				tempInCol,
				inThreeCol,
				inTwoCol,
				threeLevelSkip = 0, 
				twoLevelSkip = 0, 
				hasTwoLevel = false,
				cghi,
				numberOfColumns,
				titleText,
				cVisibleColumns,
				colModel = ts.p.colModel,
				cml = colModel.length,
				ths = ts.grid.headers,
				$htable = $("table.ui-jqgrid-htable", ts.grid.hDiv),
				$secondHeaderRow = $htable.children("thead").children("tr.ui-jqgrid-labels:last").addClass("jqg-second-row-header"),
				$thead = $htable.children("thead"),
				$theadInTable,
				originalResizeStop,
				$firstHeaderRow = $htable.find(".jqg-first-row-header");
				if ($firstHeaderRow[0] === undefined) {
					$firstHeaderRow = $('<tr>', {role: "row", "aria-hidden": "true"}).addClass("jqg-first-row-header").css("height", "auto");
				} else {
					$firstHeaderRow.empty();
				}
				var $firstRow,
				inColumnHeader = function (text, columnHeaders) {
					var i = 0, length = columnHeaders.length;
					for (; i < length; i++) {
						if (columnHeaders[i] && columnHeaders[i].startColumnName === text) {
							return i;
						}
					}
					return -1;
				};

				$(ts).prepend($thead);
				$thirdHeaderRow = $('<tr>', {role: "rowheader"}).addClass("ui-jqgrid-labels jqg-third-row-header");
				$fourHeaderRow = $('<tr>', {role: "rowheader"}).addClass("ui-jqgrid-labels jqg-four-row-header");
				
					  //ѭ��ģ��ÿ��
				for (i = 0; i < cml; i++) {
					th = ths[i].el;
					$th = $(th);
					cmi = colModel[i];
					// ����һ����ӵ�Ԫ��
					thStyle = { height: '0px', width: ths[i].width  +'px', display: (cmi.hidden ? 'none' : '')};
					$("<th>", {role: 'gridcell'}).css(thStyle).addClass("ui-first-th-"+ts.p.direction).appendTo($firstHeaderRow);
					//�Ƴ�����Ҫ����ʽ
					th.style.width = ""; 
					
					//�Ƿ���threeHeaders��������
					inThreeCol = inColumnHeader(cmi.name, threeHeaders);
					if (inThreeCol >= 0) {
						cghi = threeHeaders[inThreeCol];
						numberOfColumns = parseInt(cghi.numberOfColumns,10);
						titleText = cghi.titleText;

						// ������ʾ���г���
						for (cVisibleColumns = 0, iCol = 0; iCol < numberOfColumns && (i + iCol < cml); iCol++) {
							if (!colModel[i + iCol].hidden) {
								cVisibleColumns++;
							}
						}
				
						$colHeader = $('<th>').attr({role: "columnheader",noWrap:true})
							.addClass("ui-state-default ui-th-column-header ui-th-"+ts.p.direction)
							.css({'height':'22px', 'border-top':'0px none','overflow':'hidden'})
							.html(titleText);
						if(cVisibleColumns > 0) {
							$colHeader.attr("colspan", String(cVisibleColumns));
						}
						if (ts.p.headertitles) {
							$colHeader.attr("title", $colHeader.text());
						}
						//���û�пɼ���������
						if( cVisibleColumns === 0) {
							$colHeader.hide();
						}
						$th.before($colHeader); 
						threeLevelSkip = numberOfColumns;
						if (defaultStyle === false) {
							hasTwoLevel = false;
							//�ж��Ƿ���ڶ���
							for (var a=0;a<threeLevelSkip && (a+i<cml);a++) {
								tempInCol = inColumnHeader(colModel[a+i].name, twoHeaders);
								if (tempInCol>=0) {
																   cghi = twoHeaders[tempInCol];
											   numberOfColumns = parseInt(cghi.numberOfColumns,10);
																   // ������ʾ���г���
											   for (iCol = 0; iCol < numberOfColumns && (a+i+iCol < cml); iCol++) {
											   if (!colModel[a+i+iCol].hidden) {
																		   hasTwoLevel = true;
										   break;
											   }
											   }
																   if (hasTwoLevel === true) {
																	   break;
																   }
								}
							}
						}
					}
					
					//�Ƿ���twoHeaders��������
					inTwoCol = inColumnHeader(cmi.name, twoHeaders);
					if (threeLevelSkip >0 && inTwoCol >= 0) {
						cghi = twoHeaders[inTwoCol];
						numberOfColumns = parseInt(cghi.numberOfColumns,10);
						titleText = cghi.titleText;

						// ������ʾ���г���
						for (cVisibleColumns = 0, iCol = 0; iCol < numberOfColumns && (i + iCol < cml); iCol++) {
							if (!colModel[i + iCol].hidden) {
								cVisibleColumns++;
							}
						}
						
						$colHeader = $('<th>').attr({role: "columnheader",noWrap:true})
							.addClass("ui-state-default ui-th-column-header ui-th-"+ts.p.direction)
							.css({'height':'22px', 'border-top': '0px none','overflow':'hidden'})
							.html(titleText);
						if(cVisibleColumns > 0) {
							$colHeader.attr("colspan", String(cVisibleColumns));
						}
						
						if (ts.p.headertitles) {
							$colHeader.attr("title", $colHeader.text());
						}
						//���û�пɼ���������
						if( cVisibleColumns === 0) {
							$colHeader.hide();
						}
						$thirdHeaderRow.append($colHeader);
						twoLevelSkip = numberOfColumns;
					}
					
					//���ڵ�����
					if (threeLevelSkip === 0) {
						$th.attr("rowspan", "3");
						twoLevelSkip = 0;
						continue;
					}
					
					//�ڵ����㲻�ڵڶ���
					if (threeLevelSkip > 0 && twoLevelSkip === 0) {
						if (defaultStyle) {
							$th.attr("rowspan", "2");
							$thirdHeaderRow.append(th);
						} else {
							if (hasTwoLevel) {
								$th.attr("rowspan", "2");
								$thirdHeaderRow.append(th);	
							} else {
								$colHeader.attr("rowspan", "2");
								$fourHeaderRow.append(th);	
							}
						}
						threeLevelSkip--;
						continue;
					}
					
					//�ڵ�����Ҳ�ڵڶ���
					if (threeLevelSkip > 0 && twoLevelSkip > 0) {
						$fourHeaderRow.append(th);
						threeLevelSkip--;
						twoLevelSkip--;
					}
				}
				$theadInTable = $(ts).children("thead");
				$theadInTable.prepend($firstHeaderRow);
				$thirdHeaderRow.insertAfter($secondHeaderRow);
				$fourHeaderRow.insertAfter($thirdHeaderRow);
				$htable.append($theadInTable);

				$htable.find("span.ui-jqgrid-resize").each(function () {
					var $parent = $(this).parent();
					if ($parent.is(":visible")) {
						this.style.cssText = 'height: ' + ($parent.height()/*+4*/) + 'px !important; cursor: col-resize;';
					}
				});
				$htable.find("div.ui-jqgrid-sortable").each(function () {
					var $ts = $(this), $parent = $ts.parent();
					if ($parent.is(":visible") && $parent.is(":has(span.ui-jqgrid-resize)")) {
						$ts.css('top', ($parent.height() - $ts.outerHeight()) / 2 + 'px');
					}
				});
					
				$firstRow = $theadInTable.find("tr.jqg-first-row-header");
				$(ts).bind('jqGridResizeStop.setGroupHeaders', function (e, nw, idx) {
					$firstRow.find('th').eq(idx).width(nw);
				});
			});				
		},
		
		/**
		 * ������ͷ������ by ljq
		 * @���� maxfrozen : �������index
		 * @���� htbl : ���
		 */
		createFrozenHtable : function(maxfrozen, htbl) {
			var ts = this[0],
			complexHeader = ts.p.complexHeader,
			complexHeaders = complexHeader["complexHeaders"],
			defaultStyle = complexHeaders.defaultStyle,
			threeHeaders = complexHeaders["threeLevel"],
			twoHeaders = complexHeaders["twoLevel"],
			tableid = ts.p.id,
			colModel = ts.p.colModel,
			cml = maxfrozen+1,
			ths = ts.grid.headers,
			threeLevelSkip = 0, 
			twoLevelSkip = 0, 
			hasTwoLevel = false,
			i, cmi, thStyle, th, $th, cn, $tempTh, iCol, $colHeader, cghi,
			tempInCol,
			inThreeCol,
			inTwoCol,
			numberOfColumns,
			titleText,
			cVisibleColumns,
			height = ts.grid.fhDiv.height(),
			$fhTable = $("<table class='ui-jqgrid-htable' style='width:1px;height:"+ height +"px' role='grid' aria-labelledby='gbox_"+tableid+"' cellspacing='0' cellpadding='0' border='0'></table>"),
			$thead = $("<thead></thead>"),
			$firstHeaderRow = $('<tr>', {role: "row", "aria-hidden": "true"}).addClass("jqg-first-row-header").css("height", "auto"),
			$secondHeaderRow = $('<tr>', {role: "rowheader"}).addClass("ui-jqgrid-labels jqg-second-row-header"),
			$thirdHeaderRow = $('<tr>', {role: "rowheader"}).addClass("ui-jqgrid-labels jqg-third-row-header"),
			$fourHeaderRow = $('<tr>', {role: "rowheader"}).addClass("ui-jqgrid-labels jqg-four-row-header"),
			inColumnHeader = function (text, columnHeaders) {
				var i = 0, length = columnHeaders.length;
				for (; i < length; i++) {
					if (columnHeaders[i] && columnHeaders[i].startColumnName === text) {
						return i;
					}
				}
				return -1;
			};
			
			//ѭ��ģ��ÿ��
			for (i = 0; i < cml; i++) {
				cmi = colModel[i];
				cn = cmi.name;
				$th = $("#"+tableid+"_"+cn,htbl);
				// ����һ����ӵ�Ԫ��
				thStyle = { height: '0px', width: ths[i].width  +'px', display: (cmi.hidden ? 'none' : '')};
				$("<th>", {role: 'gridcell'}).css(thStyle).addClass("ui-first-th-"+ts.p.direction).appendTo($firstHeaderRow);
				//�Ƿ���threeHeaders��������
				inThreeCol = inColumnHeader(cmi.name, threeHeaders);
				if (inThreeCol >= 0) {
					cghi = threeHeaders[inThreeCol];
					numberOfColumns = parseInt(cghi.numberOfColumns,10);
					if (numberOfColumns+i-1>maxfrozen) {
						numberOfColumns = maxfrozen-i+1;
					}
					titleText = cghi.titleText;
					// ������ʾ���г���
					for (cVisibleColumns = 0, iCol = 0; iCol < numberOfColumns && (i + iCol < cml); iCol++) {
						if (!colModel[i + iCol].hidden) {
							cVisibleColumns++;
						}
					}
					$colHeader = $('<th>').attr({role: "columnheader",noWrap:true})
						.addClass("ui-state-default ui-th-column-header ui-th-"+ts.p.direction)
						.css({'height':'22px', 'border-top':'0px none','overflow':'hidden'})
						.html(titleText);
					if(cVisibleColumns > 0) {
						$colHeader.attr("colspan", String(cVisibleColumns));
					}
					if (ts.p.headertitles) {
						$colHeader.attr("title", $colHeader.text());
					}
					//���û�пɼ���������
					if( cVisibleColumns === 0) {
						$colHeader.hide();
					}
					$colHeader.appendTo($secondHeaderRow);
					threeLevelSkip = numberOfColumns;
					if (defaultStyle === false) {
						hasTwoLevel = false;
						//�ж��Ƿ���ڶ���
						for (var a=0;a<threeLevelSkip && (a+i<cml);a++) {
												   tempInCol = inColumnHeader(colModel[a+i].name, twoHeaders);
							   if (tempInCol>=0) {
													   cghi = twoHeaders[tempInCol];
								   numberOfColumns = parseInt(cghi.numberOfColumns,10);
													   if (numberOfColumns+a+i-1>maxfrozen) {
									   numberOfColumns = maxfrozen-(a+i)+1;
									   }
													   // ������ʾ���г���
								   for (iCol = 0; iCol < numberOfColumns && (a+i+iCol < cml); iCol++) {
								   if (!colModel[a+i+iCol].hidden) {
																hasTwoLevel = true;
											break;
									}
									}
												   }
												   if (hasTwoLevel === true) {
													   break;
												   }	
							}
					}
				}
				//�Ƿ���twoHeaders��������
				inTwoCol = inColumnHeader(cmi.name, twoHeaders);
				if (threeLevelSkip >0 && inTwoCol >= 0) {
					cghi = twoHeaders[inTwoCol];
					numberOfColumns = parseInt(cghi.numberOfColumns,10);
					if (numberOfColumns+i-1>maxfrozen) {
						numberOfColumns = maxfrozen-i+1;
					}
					titleText = cghi.titleText;
					// ������ʾ���г���
					for (cVisibleColumns = 0, iCol = 0; iCol < numberOfColumns && (i + iCol < cml); iCol++) {
						if (!colModel[i + iCol].hidden) {
							cVisibleColumns++;
						}
					}
					$colHeader = $('<th>').attr({role: "columnheader",noWrap:true})
						.addClass("ui-state-default ui-th-column-header ui-th-"+ts.p.direction)
						.css({'height':'22px', 'border-top': '0px none','overflow':'hidden'})
						.html(titleText);
					if(cVisibleColumns > 0) {
						$colHeader.attr("colspan", String(cVisibleColumns));
					}
					if (ts.p.headertitles) {
						$colHeader.attr("title", $colHeader.text());
					}
					//���û�пɼ���������
					if( cVisibleColumns === 0) {
						$colHeader.hide();
					}
					$colHeader.appendTo($thirdHeaderRow);
					twoLevelSkip = numberOfColumns;
				}
				//���ڵ�����
				if (threeLevelSkip === 0) {
					$th.attr("rowspan", "3");
					$th.appendTo($secondHeaderRow);
					twoLevelSkip = 0;
					continue;
				}
				//�ڵ����㲻�ڵڶ���
				if (threeLevelSkip > 0 && twoLevelSkip === 0) {
					if (defaultStyle) {
						$th.attr("rowspan", "2");
						$th.appendTo($thirdHeaderRow);
					} else {
						if (hasTwoLevel) {
							$th.attr("rowspan", "2");
							$th.appendTo($thirdHeaderRow);
						} else {
							$colHeader.attr("rowspan", "2");
							$th.appendTo($fourHeaderRow);
						}
					}
					threeLevelSkip--;
					continue;
				}
				//�ڵ�����Ҳ�ڵڶ���
				if (threeLevelSkip > 0 && twoLevelSkip > 0) {
					$th.appendTo($fourHeaderRow);
					threeLevelSkip--;
					twoLevelSkip--;
				}
			}
			var thirdLen = $thirdHeaderRow.children().length,
				fourLen = $fourHeaderRow.children().length;
			if (thirdLen=== 0 && fourLen === 0) {
				$secondHeaderRow.height(height);
			}
			if (defaultStyle) {
				//Ĭ����Ⱦ��ʽ����
				if (thirdLen > 0 && fourLen === 0) {
					$thirdHeaderRow.height(height-23);
				}
			} else {
				if (thirdLen === 0 && fourLen > 0) {
					$secondHeaderRow.height(height-23);
					$secondHeaderRow.find("th").each(function(){
						var rowspan = $(this).attr("rowspan");
						if (rowspan) {
							$(this).attr("rowspan",String(parseInt(rowspan,10)-1));
						}
					});
				}
			}
			
			$firstHeaderRow.appendTo($thead);
			$secondHeaderRow.appendTo($thead);
			thirdLen && $thirdHeaderRow.appendTo($thead);
			fourLen && $fourHeaderRow.appendTo($thead);
			$thead.appendTo($fhTable);
			return $fhTable;
		}
	});
})(jQuery);

;(function($){
	/**
	 * jqGrid Chinese Translation
	 * ������ yanhonglei@gmail.com
	 * http://www.kafeitu.me 
	 * Dual licensed under the MIT and GPL licenses:
	 * http://www.opensource.org/licenses/mit-license.php
	 * http://www.gnu.org/licenses/gpl.html
	**/
	$.jgrid = $.jgrid || {};
	$.extend($.jgrid,{
	    defaults : {
	        recordtext: "{0} - {1}\u3000�� {2} ��", // ����ǰ��ȫ�ǿո�
	        emptyrecords: "��������ʾ",
	        loadtext: "���ڼ���...",
	        pgtext : " {0} �� {1} ҳ"
	    },
	    search : {
	        caption: "����...",
	        Find: "����",
	        Reset: "����",
	        odata: [{ oper:'eq', text:'����\u3000\u3000'},{ oper:'ne', text:'����\u3000\u3000'},{ oper:'lt', text:'С��\u3000\u3000'},{ oper:'le', text:'С�ڵ���'},{ oper:'gt', text:'����\u3000\u3000'},{ oper:'ge', text:'���ڵ���'},{ oper:'bw', text:'��ʼ��'},{ oper:'bn', text:'����ʼ��'},{ oper:'in', text:'����\u3000\u3000'},{ oper:'ni', text:'������'},{ oper:'ew', text:'������'},{ oper:'en', text:'��������'},{ oper:'cn', text:'����\u3000\u3000'},{ oper:'nc', text:'������'},{ oper:'nu', text:'������'},{ oper:'nn', text:'����'}],
	        groupOps: [ { op: "AND", text: "����" },    { op: "OR",  text: "��һ" } ],
			operandTitle : "Click to select search operation.",
			resetTitle : "Reset Search Value"
	    },
	    edit : {
	        addCaption: "��Ӽ�¼",
	        editCaption: "�༭��¼",
	        bSubmit: "�ύ",
	        bCancel: "ȡ��",
	        bClose: "�ر�",
	        saveData: "�����Ѹı䣬�Ƿ񱣴棿",
	        bYes : "��",
	        bNo : "��",
	        bExit : "ȡ��",
	        msg: {
	            required:"���ֶα���",
	            number:"��������Ч����",
	            minValue:"��ֵ������ڵ��� ",
	            maxValue:"��ֵ����С�ڵ��� ",
	            email: "�ⲻ����Ч��e-mail��ַ",
	            integer: "��������Ч����",
	            date: "��������Чʱ��",
	            url: "��Ч��ַ��ǰ׺����Ϊ ('http://' �� 'https://')",
	            nodefined : " δ���壡",
	            novalue : " ��Ҫ����ֵ��",
	            customarray : "�Զ��庯����Ҫ�������飡",
	            customfcheck : "�������Զ��庯��!"
	        }
	    },
	    view : {
	        caption: "�鿴��¼",
	        bClose: "�ر�"
	    },
	    del : {
	        caption: "ɾ��",
	        msg: "ɾ����ѡ��¼��",
	        bSubmit: "ɾ��",
	        bCancel: "ȡ��"
	    },
	    nav : {
	        edittext: "",
	        edittitle: "�༭��ѡ��¼",
	        addtext:"",
	        addtitle: "����¼�¼",
	        deltext: "",
	        deltitle: "ɾ����ѡ��¼",
	        searchtext: "",
	        searchtitle: "����",
	        refreshtext: "",
	        refreshtitle: "ˢ�±��",
	        alertcap: "ע��",
	        alerttext: "��ѡ���¼",
	        viewtext: "",
	        viewtitle: "�鿴��ѡ��¼"
	    },
	    col : {
	        caption: "ѡ����",
	        bSubmit: "ȷ��",
	        bCancel: "ȡ��"
	    },
	    errors : {
	        errcap : "����",
	        nourl : "û������url",
	        norecords: "û��Ҫ����ļ�¼",
	        model : "colNames �� colModel ���Ȳ��ȣ�"
	    },
	    formatter : {
	        integer : {thousandsSeparator: ",", defaultValue: '0'},
	        number : {decimalSeparator:".", thousandsSeparator: ",", decimalPlaces: 2, defaultValue: '0.00'},
	        currency : {decimalSeparator:".", thousandsSeparator: ",", decimalPlaces: 2, prefix: "", suffix:"", defaultValue: '0.00'},
	        date : {
	            dayNames:   [
	                "��", "һ", "��", "��", "��", "��", "��",
	                "������", "����һ", "���ڶ�", "������", "������", "������", "������",
	            ],
	            monthNames: [
	                "һ", "��", "��", "��", "��", "��", "��", "��", "��", "ʮ", "ʮһ", "ʮ��",
	                "һ��", "����", "����", "����", "����", "����", "����", "����", "����", "ʮ��", "ʮһ��", "ʮ����"
	            ],
	            AmPm : ["am","pm","����","����"],
	            S: function (j) {return j < 11 || j > 13 ? ['st', 'nd', 'rd', 'th'][Math.min((j - 1) % 10, 3)] : 'th';},
	            srcformat: 'Y-m-d',
	            newformat: 'Y-m-d',
	            parseRe : /[#%\\\/:_;.,\t\s-]/,
	            masks : {
	                // see http://php.net/manual/en/function.date.php for PHP format used in jqGrid
	                // and see http://docs.jquery.com/UI/Datepicker/formatDate
	                // and https://github.com/jquery/globalize#dates for alternative formats used frequently
	                // one can find on https://github.com/jquery/globalize/tree/master/lib/cultures many
	                // information about date, time, numbers and currency formats used in different countries
	                // one should just convert the information in PHP format
	                ISO8601Long:"Y-m-d H:i:s",
	                ISO8601Short:"Y-m-d",
	                // short date:
	                //    n - Numeric representation of a month, without leading zeros
	                //    j - Day of the month without leading zeros
	                //    Y - A full numeric representation of a year, 4 digits
	                // example: 3/1/2012 which means 1 March 2012
	                ShortDate: "n/j/Y", // in jQuery UI Datepicker: "M/d/yyyy"
	                // long date:
	                //    l - A full textual representation of the day of the week
	                //    F - A full textual representation of a month
	                //    d - Day of the month, 2 digits with leading zeros
	                //    Y - A full numeric representation of a year, 4 digits
	                LongDate: "l, F d, Y", // in jQuery UI Datepicker: "dddd, MMMM dd, yyyy"
	                // long date with long time:
	                //    l - A full textual representation of the day of the week
	                //    F - A full textual representation of a month
	                //    d - Day of the month, 2 digits with leading zeros
	                //    Y - A full numeric representation of a year, 4 digits
	                //    g - 12-hour format of an hour without leading zeros
	                //    i - Minutes with leading zeros
	                //    s - Seconds, with leading zeros
	                //    A - Uppercase Ante meridiem and Post meridiem (AM or PM)
	                FullDateTime: "l, F d, Y g:i:s A", // in jQuery UI Datepicker: "dddd, MMMM dd, yyyy h:mm:ss tt"
	                // month day:
	                //    F - A full textual representation of a month
	                //    d - Day of the month, 2 digits with leading zeros
	                MonthDay: "F d", // in jQuery UI Datepicker: "MMMM dd"
	                // short time (without seconds)
	                //    g - 12-hour format of an hour without leading zeros
	                //    i - Minutes with leading zeros
	                //    A - Uppercase Ante meridiem and Post meridiem (AM or PM)
	                ShortTime: "g:i A", // in jQuery UI Datepicker: "h:mm tt"
	                // long time (with seconds)
	                //    g - 12-hour format of an hour without leading zeros
	                //    i - Minutes with leading zeros
	                //    s - Seconds, with leading zeros
	                //    A - Uppercase Ante meridiem and Post meridiem (AM or PM)
	                LongTime: "g:i:s A", // in jQuery UI Datepicker: "h:mm:ss tt"
	                SortableDateTime: "Y-m-d\\TH:i:s",
	                UniversalSortableDateTime: "Y-m-d H:i:sO",
	                // month with year
	                //    Y - A full numeric representation of a year, 4 digits
	                //    F - A full textual representation of a month
	                YearMonth: "F, Y" // in jQuery UI Datepicker: "MMMM, yyyy"
	            },
	            reformatAfterEdit : false
	        },
	        baseLinkUrl: '',
	        showAction: '',
	        target: '',
	        checkbox : {disabled:true},
	        idName : 'id'
	    }
	});
})(jQuery);