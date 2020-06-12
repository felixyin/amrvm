/*
 * Translated default messages for the jQuery validation plugin.
 * Locale: ZH (Chinese, ���� (Zh��ngw��n), ����, �h�Z)
 */
(function ($) {
	$.extend($.validator.messages, {
		required: "������Ϣ",
		remote: "����������Ϣ",
		email: "��������ȷ��ʽ�ĵ����ʼ�",
		url: "������Ϸ�����ַ",
		date: "������Ϸ�������",
		dateISO: "������Ϸ������� (ISO).",
		number: "������Ϸ�������",
		digits: "ֻ����������",
		creditcard: "������Ϸ������ÿ���",
		equalTo: "���ٴ�������ͬ��ֵ",
		accept: "������ӵ�кϷ���׺�����ַ���",
		maxlength: $.validator.format("������һ����������� {0} ���ַ���"),
		minlength: $.validator.format("������һ������������ {0} ���ַ���"),
		rangelength: $.validator.format("������һ�����Ƚ��� {0} �� {1} ֮����ַ���"),
		range: $.validator.format("������һ������ {0} �� {1} ֮���ֵ"),
		max: $.validator.format("������һ�����Ϊ {0} ��ֵ"),
		min: $.validator.format("������һ����СΪ {0} ��ֵ")
	});
}(jQuery));

jQuery.validator.addMethod("ip", function(value, element) {
	return this.optional(element) || (/^(\d+)\.(\d+)\.(\d+)\.(\d+)$/.test(value) && (RegExp.$1 <256 && RegExp.$2<256 && RegExp.$3<256 && RegExp.$4<256));   
}, "������Ϸ���IP��ַ");

jQuery.validator.addMethod("abc",function(value, element) {
	return this.optional(element) || /^[a-zA-Z0-9_]*$/.test(value);
},"��������ĸ���ֻ��»���");

jQuery.validator.addMethod("username",function(value, element) {
	return this.optional(element) || /^[a-zA-Z0-9][a-zA-Z0-9_]{2,19}$/.test(value);
},"3-20λ��ĸ�����ֿ�ͷ��������ĸ�����»���");

jQuery.validator.addMethod("noEqualTo",function(value, element, param) {
	return value != $(param).val();
},"���ٴ����벻ͬ��ֵ");

//��ʵ������֤
jQuery.validator.addMethod("realName", function(value, element) {
    return this.optional(element) || /^[\u4e00-\u9fa5]{2,30}$/.test(value);
}, "����ֻ��Ϊ2-30������");

// �ַ���֤
jQuery.validator.addMethod("userName", function(value, element) {
    return this.optional(element) || /^[\u0391-\uFFE5\w]+$/.test(value);
}, "��¼��ֻ�ܰ��������֡�Ӣ����ĸ�����ֺ��»���");

// �ֻ�������֤
jQuery.validator.addMethod("mobile", function(value, element) {
    var length = value.length;
    return this.optional(element) || (length == 11 && /^(((13[0-9]{1})|(15[0-9]{1}))+\d{8})$/.test(value));
}, "����ȷ��д�����ֻ�����");

// �绰������֤
jQuery.validator.addMethod("simplePhone", function(value, element) {
    var tel = /^(\d{3,4}-?)?\d{7,9}$/g;
    return this.optional(element) || (tel.test(value));
}, "����ȷ��д���ĵ绰����");

// �绰������֤     
jQuery.validator.addMethod("phone", function(value, element) {     
	var tel = /(^0[1-9]{1}\d{9,10}$)|(^1[3,5,8]\d{9}$)/g;     
	return this.optional(element) || (tel.test(value));     
}, "��ʽΪ:�̻�Ϊ����(3-4λ)����(7-9λ),�ֻ�Ϊ:13,15,18�Ŷ�");	

// ����������֤
jQuery.validator.addMethod("zipCode", function(value, element) {
    var tel = /^[0-9]{6}$/;
    return this.optional(element) || (tel.test(value));
}, "����ȷ��д������������");

//QQ������֤
jQuery.validator.addMethod("qq", function(value, element) {
    var tel = /^[1-9][0-9]{4,}$/;
    return this.optional(element) || (tel.test(value));
}, "����ȷ��д����QQ����");

//����������֤
jQuery.validator.addMethod("zhValidator", function(value, element) {
    var tel = /^[u4e00-u9fa5]+$/;
    return this.optional(element) || (!tel.test(value));
}, "�����������");

//����Ӣ����֤
jQuery.validator.addMethod("enValidator", function(value, element) {
    var tel = /^[a-zA-Z]+$/;
    return this.optional(element) || (tel.test(value));
}, "�������Ӣ��");

//�۸���֤
jQuery.validator.addMethod("price", function(value, element) {
    var tel = /^\d+(\.\d{1,2})?$/;
    return this.optional(element) || (tel.test(value));
}, "����д��ȷ�ĸ�ʽ");

//У�����֤��
jQuery.validator.addMethod("card",function(value, element) {
	return this.optional(element) || checkIdcard(value);
},"��������ȷ�����֤����(15-18λ)")

//��֤���֤����
function checkIdcard(idcard){
	idcard = idcard.toString();
	//var Errors=new Array("��֤ͨ��!","���֤����λ������!","���֤����������ڳ�����Χ���зǷ��ַ�!","���֤����У�����!","���֤�����Ƿ�!");
	var Errors=new Array(true,false,false,false,false);
	var area={11:"����",12:"���",13:"�ӱ�",14:"ɽ��",15:"���ɹ�",21:"����",22:"����",23:"������",31:"�Ϻ�",32:"����",33:"�㽭",34:"����",35:"����",36:"����",37:"ɽ��",41:"����",42:"����",43:"����",44:"�㶫",45:"����",46:"����",50:"����",51:"�Ĵ�",52:"����",53:"����",54:"����",61:"����",62:"����",63:"�ຣ",64:"����",65:"�½�",71:"̨��",81:"���",82:"����",91:"����"}
	var idcard,Y,JYM;
	var S,M;
	var idcard_array = new Array();
	idcard_array = idcard.split("");
	//��������
	if(area[parseInt(idcard.substr(0,2))]==null) return Errors[4];
	//��ݺ���λ������ʽ����
	switch(idcard.length){
		case 15:
			if ( (parseInt(idcard.substr(6,2))+1900) % 4 == 0 || ((parseInt(idcard.substr(6,2))+1900) % 100 == 0 && (parseInt(idcard.substr(6,2))+1900) % 4 == 0 )){
				ereg=/^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$/;//���Գ������ڵĺϷ���
			} else {
				ereg=/^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$/;//���Գ������ڵĺϷ���
			}
			if(ereg.test(idcard)) return Errors[0];
			else return Errors[2];
			break;
		case 18:
			//18 λ��ݺ�����
			//�������ڵĺϷ��Լ��
			//��������:((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))
			//ƽ������:((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))
			if ( parseInt(idcard.substr(6,4)) % 4 == 0 || (parseInt(idcard.substr(6,4)) % 100 == 0 && parseInt(idcard.substr(6,4))%4 == 0 )){
				ereg=/^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$/;//����������ڵĺϷ���������ʽ
			} else {
				ereg=/^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$/;//ƽ��������ڵĺϷ���������ʽ
			}
			if(ereg.test(idcard)) {//���Գ������ڵĺϷ���
				//����У��λ
				S = (parseInt(idcard_array[0]) + parseInt(idcard_array[10])) * 7
					+ (parseInt(idcard_array[1]) + parseInt(idcard_array[11])) * 9
					+ (parseInt(idcard_array[2]) + parseInt(idcard_array[12])) * 10
					+ (parseInt(idcard_array[3]) + parseInt(idcard_array[13])) * 5
					+ (parseInt(idcard_array[4]) + parseInt(idcard_array[14])) * 8
					+ (parseInt(idcard_array[5]) + parseInt(idcard_array[15])) * 4
					+ (parseInt(idcard_array[6]) + parseInt(idcard_array[16])) * 2
					+ parseInt(idcard_array[7]) * 1
					+ parseInt(idcard_array[8]) * 6
					+ parseInt(idcard_array[9]) * 3 ;
				Y = S % 11;
				M = "F";
				JYM = "10X98765432";
				M = JYM.substr(Y,1);//�ж�У��λ
				if(M == idcard_array[17]) return Errors[0]; //���ID��У��λ
				else return Errors[3];
			}
			else return Errors[2];
			break;
		default:
			return Errors[1];
			break;
	}
} 