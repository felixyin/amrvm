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
		recordtext: "{0} - {1} �� {2} �l",
		emptyrecords: "�]��ӛ�",
		loadtext: "�d����...",
		pgtext : " {0} �� {1} �"
	},
	search : {
		caption: "�ь�...",
		Find: "�ь�",
		Reset: "���O",
		odata: [{ oper:'eq', text:"��� "},{ oper:'ne', text:"����� "},{ oper:'lt', text:"С� "},{ oper:'le', text:"С춵�� "},{ oper:'gt', text:"��� "},{ oper:'ge', text:"��춵�� "},{ oper:'bw', text:"�_ʼ� "},{ oper:'bn', text:"���_ʼ� "},{ oper:'in', text:"������ "},{ oper:'ni', text:"�������� "},{ oper:'ew', text:"�Y��� "},{ oper:'en', text:"���Y��� "},{ oper:'cn', text:"���� "},{ oper:'nc', text:"������ "},{ oper:'nu', text:'is null'},{ oper:'nn', text:'is not null'}],
		groupOps: [	{ op: "AND", text: "����" },	{ op: "OR",  text: "��һ" }	],
		operandTitle : "Click to select search operation.",
		resetTitle : "Reset Search Value"
	},
	edit : {
		addCaption: "����ӛ�",
		editCaption: "��݋ӛ�",
		bSubmit: "�ύ",
		bCancel: "ȡ��",
		bClose: "�P�]",
		saveData: "�Y���Ѹ�׃���Ƿ񃦴棿",
		bYes : "��",
		bNo : "��",
		bExit : "ȡ��",
		msg: {
			required:"�˙ڱ�Ҫ",
			number:"Ոݔ����Ч�Ĕ���",
			minValue:"ֵ��횴�춵�� ",
			maxValue:"ֵ���С춵�� ",
			email: "������Ч��e-mail��ַ",
			integer: "Ոݔ����Ч����",
			date: "Ոݔ����Ч�r�g",
			url: "�Wַ�oЧ��ǰ�Y��횞� ('http://' �� 'https://')",
			nodefined : " δ���x��",
			novalue : " ��Ҫ����ֵ��",
			customarray : "��ӆ������������У�",
			customfcheck : "��ӆ�z�鑪����ӆ������"
			
		}
	},
	view : {
		caption: "�鿴ӛ�",
		bClose: "�P�]"
	},
	del : {
		caption: "�h��",
		msg: "�h�����xӛ䛣�",
		bSubmit: "�h��",
		bCancel: "ȡ��"
	},
	nav : {
		edittext: "",
		edittitle: "��݋���x��",
		addtext:"",
		addtitle: "������",
		deltext: "",
		deltitle: "�h�����x��",
		searchtext: "",
		searchtitle: "�ь�ӛ�",
		refreshtext: "",
		refreshtitle: "����������",
		alertcap: "����",
		alerttext: "Ո�x����",
		viewtext: "",
		viewtitle: "�zҕ���x��"
	},
	col : {
		caption: "�x���",
		bSubmit: "�_��",
		bCancel: "ȡ��"
	},
	errors : {
		errcap : "�e�`",
		nourl : "δ�O��URL",
		norecords: "�o��Ҫ̎���ӛ�",
		model : "colNames �� colModel �L�Ȳ�ͬ��"
	},
	formatter : {
		integer : {thousandsSeparator: " ", defaultValue: '0'},
		number : {decimalSeparator:".", thousandsSeparator: " ", decimalPlaces: 2, defaultValue: '0.00'},
		currency : {decimalSeparator:".", thousandsSeparator: " ", decimalPlaces: 2, prefix: "", suffix:"", defaultValue: '0.00'},
		date : {
			dayNames:   [
				"��", "һ", "��", "��", "��", "��", "��",
		         "������", "����һ", "���ڶ�", "������", "������", "������", "������"
			],
			monthNames: [
				"һ", "��", "��", "��", "��", "��", "��", "��", "��", "ʮ", "ʮһ", "ʮ��",
				"һ��", "����", "����", "����", "����", "����", "����", "����", "����", "ʮ��", "ʮһ��", "ʮ����"
			],
			AmPm : ["����","����","����","����"],
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
