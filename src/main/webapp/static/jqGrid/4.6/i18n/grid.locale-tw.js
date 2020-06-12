;(function($){
/**
 * jqGrid Chinese (Taiwan) Translation for v4.2
 * linquize
 * https://github.com/linquize/jqGrid
 * Dual licensed under the MIT and GPL licenses:
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.gnu.org/licenses/gpl.html
 * 
**/
$.jgrid = $.jgrid || {};
$.extend($.jgrid,{
	defaults : {
		recordtext: "{0} - {1} 共 {2} 條",
		emptyrecords: "沒有記錄",
		loadtext: "載入中...",
		pgtext : " {0} 共 {1} 頁"
	},
	search : {
		caption: "搜尋...",
		Find: "搜尋",
		Reset: "重設",
		odata: [{ oper:'eq', text:"等於 "},{ oper:'ne', text:"不等於 "},{ oper:'lt', text:"小於 "},{ oper:'le', text:"小於等於 "},{ oper:'gt', text:"大於 "},{ oper:'ge', text:"大於等於 "},{ oper:'bw', text:"開始於 "},{ oper:'bn', text:"不開始於 "},{ oper:'in', text:"在其中 "},{ oper:'ni', text:"不在其中 "},{ oper:'ew', text:"結束於 "},{ oper:'en', text:"不結束於 "},{ oper:'cn', text:"包含 "},{ oper:'nc', text:"不包含 "},{ oper:'nu', text:'is null'},{ oper:'nn', text:'is not null'}],
		groupOps: [	{ op: "AND", text: "所有" },	{ op: "OR",  text: "任一" }	],
		operandTitle : "Click to select search operation.",
		resetTitle : "Reset Search Value"
	},
	edit : {
		addCaption: "新增記錄",
		editCaption: "編輯記錄",
		bSubmit: "提交",
		bCancel: "取消",
		bClose: "關閉",
		saveData: "資料已改變，是否儲存？",
		bYes : "是",
		bNo : "否",
		bExit : "取消",
		msg: {
			required:"此欄必要",
			number:"請輸入有效的數字",
			minValue:"值必須大於等於 ",
			maxValue:"值必須小於等於 ",
			email: "不是有效的e-mail地址",
			integer: "請輸入有效整数",
			date: "請輸入有效時間",
			url: "網址無效。前綴必須為 ('http://' 或 'https://')",
			nodefined : " 未定義！",
			novalue : " 需要傳回值！",
			customarray : "自訂函數應傳回陣列！",
			customfcheck : "自訂檢查應有自訂函數！"
			
		}
	},
	view : {
		caption: "查看記錄",
		bClose: "關閉"
	},
	del : {
		caption: "刪除",
		msg: "刪除已選記錄？",
		bSubmit: "刪除",
		bCancel: "取消"
	},
	nav : {
		edittext: "",
		edittitle: "編輯已選列",
		addtext:"",
		addtitle: "新增列",
		deltext: "",
		deltitle: "刪除已選列",
		searchtext: "",
		searchtitle: "搜尋記錄",
		refreshtext: "",
		refreshtitle: "重新整理表格",
		alertcap: "警告",
		alerttext: "請選擇列",
		viewtext: "",
		viewtitle: "檢視已選列"
	},
	col : {
		caption: "選擇欄",
		bSubmit: "確定",
		bCancel: "取消"
	},
	errors : {
		errcap : "錯誤",
		nourl : "未設定URL",
		norecords: "無需要處理的記錄",
		model : "colNames 和 colModel 長度不同！"
	},
	formatter : {
		integer : {thousandsSeparator: " ", defaultValue: '0'},
		number : {decimalSeparator:".", thousandsSeparator: " ", decimalPlaces: 2, defaultValue: '0.00'},
		currency : {decimalSeparator:".", thousandsSeparator: " ", decimalPlaces: 2, prefix: "", suffix:"", defaultValue: '0.00'},
		date : {
			dayNames:   [
				"日", "一", "二", "三", "四", "五", "六",
		         "星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六"
			],
			monthNames: [
				"一", "二", "三", "四", "五", "六", "七", "八", "九", "十", "十一", "十二",
				"一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"
			],
			AmPm : ["上午","下午","上午","下午"],
			S: function (j) {return j < 11 || j > 13 ? ['st', 'nd', 'rd', 'th'][Math.min((j - 1) % 10, 3)] : 'th';},
			srcformat: 'Y-m-d',
			newformat: 'm-d-Y',
			parseRe : /[#%\\\/:_;.,\t\s-]/,
			masks : {
				ISO8601Long:"Y-m-d H:i:s",
				ISO8601Short:"Y-m-d",
				ShortDate: "Y/j/n",
				LongDate: "l, F d, Y",
				FullDateTime: "l, F d, Y g:i:s A",
				MonthDay: "F d",
				ShortTime: "g:i A",
				LongTime: "g:i:s A",
				SortableDateTime: "Y-m-d\\TH:i:s",
				UniversalSortableDateTime: "Y-m-d H:i:sO",
				YearMonth: "F, Y"
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
