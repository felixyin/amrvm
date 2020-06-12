/*!
 * 
 * 
 * ͨ�ù�������
 * @author ThinkGem
 * @version 2014-4-29
 */
$(document).ready(function () {
    try {
        // ����ȥ�����
        $("a").bind("focus", function () {
            if (this.blur) {
                this.blur()
            }
            ;
        });
        //����������ʹ��select2
        $("select").select2();
    } catch (e) {
        // blank
    }
});

// ����js��css�ļ�
function include(id, path, file) {
    if (document.getElementById(id) == null) {
        var files = typeof file == "string" ? [file] : file;
        for (var i = 0; i < files.length; i++) {
            var name = files[i].replace(/^\s|\s$/g, "");
            var att = name.split('.');
            var ext = att[att.length - 1].toLowerCase();
            var isCSS = ext == "css";
            var tag = isCSS ? "link" : "script";
            var attr = isCSS ? " type='text/css' rel='stylesheet' " : " type='text/javascript' ";
            var link = (isCSS ? "href" : "src") + "='" + path + name + "'";
            document.write("<" + tag + (i == 0 ? " id=" + id : "") + attr + link + "></" + tag + ">");
        }
    }
}

// ��ȡURL��ַ����
function getQueryString(name, url) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    if (!url || url == "") {
        url = window.location.search;
    } else {
        url = url.substring(url.indexOf("?"));
    }
    r = url.substr(1).match(reg)
    if (r != null) return unescape(r[2]);
    return null;
}

//��ȡ�ֵ��ǩ
function getDictLabel(data, value, defaultValue) {
    for (var i = 0; i < data.length; i++) {
        var row = data[i];
        if (row.value == value) {
            return row.label;
        }
    }
    return defaultValue;
}

// ��һ������
function windowOpen(url, name, width, height) {
    var top = parseInt((window.screen.height - height) / 2, 10), left = parseInt((window.screen.width - width) / 2, 10),
        options = "location=no,menubar=no,toolbar=no,dependent=yes,minimizable=no,modal=yes,alwaysRaised=yes," +
            "resizable=yes,scrollbars=yes," + "width=" + width + ",height=" + height + ",top=" + top + ",left=" + left;
    window.open(url, name, options);
}

// �ָ���ʾ����ʾ
function resetTip() {
    top.$.jBox.tip.mess = null;
}

// �ر���ʾ��
function closeTip() {
    top.$.jBox.closeTip();
}

//��ʾ��ʾ��
function showTip(mess, type, timeout, lazytime) {
    resetTip();
    setTimeout(function () {
        top.$.jBox.tip(mess, (type == undefined || type == '' ? 'info' : type), {
            opacity: 0,
            timeout: timeout == undefined ? 2000 : timeout
        });
    }, lazytime == undefined ? 500 : lazytime);
}

// ��ʾ���ؿ�
function loading(mess) {
    if (mess == undefined || mess == "") {
        mess = "�����ύ�����Ե�...";
    }
    resetTip();
    top.$.jBox.tip(mess, 'loading', {opacity: 0});
}

// �ر���ʾ��
function closeLoading() {
    // �ָ���ʾ����ʾ
    resetTip();
    // �ر���ʾ��
    closeTip();
}

// ����Ի���
function alertx(mess, closed) {
    top.$.jBox.info(mess, '��ʾ', {
        closed: function () {
            if (typeof closed == 'function') {
                closed();
            }
        }
    });
    top.$('.jbox-body .jbox-icon').css('top', '55px');
}

// ȷ�϶Ի���
function confirmx(mess, href, closed) {
    top.$.jBox.confirm(mess, 'ϵͳ��ʾ', function (v, h, f) {
        if (v == 'ok') {
            if (typeof href == 'function') {
                href();
            } else {
                resetTip(); //loading();
                location = href;
            }
        }
    }, {
        buttonsFocus: 1, closed: function () {
            if (typeof closed == 'function') {
                closed();
            }
        }
    });
    top.$('.jbox-body .jbox-icon').css('top', '55px');
    return false;
}

// ��ʾ����Ի���
function promptx(title, lable, href, closed) {
    top.$.jBox("<div class='form-search' style='padding:20px;text-align:center;'>" + lable + "��<input type='text' id='txt' name='txt'/></div>", {
        title: title, submit: function (v, h, f) {
            if (f.txt == '') {
                top.$.jBox.tip("������" + lable + "��", 'error');
                return false;
            }
            if (typeof href == 'function') {
                href();
            } else {
                resetTip(); //loading();
                location = href + encodeURIComponent(f.txt);
            }
        }, closed: function () {
            if (typeof closed == 'function') {
                closed();
            }
        }
    });
    return false;
}

// ���TABҳ��
function addTabPage(title, url, closeable, $this, refresh) {
    top.$.fn.jerichoTab.addTab({
        tabFirer: $this,
        title: title,
        closeable: closeable == undefined,
        data: {
            dataType: 'iframe',
            dataLink: url
        }
    }).loadData(refresh != undefined);
}

// cookie����
function cookie(name, value, options) {
    if (typeof value != 'undefined') { // name and value given, set cookie
        options = options || {};
        if (value === null) {
            value = '';
            options.expires = -1;
        }
        var expires = '';
        if (options.expires && (typeof options.expires == 'number' || options.expires.toUTCString)) {
            var date;
            if (typeof options.expires == 'number') {
                date = new Date();
                date.setTime(date.getTime() + (options.expires * 24 * 60 * 60 * 1000));
            } else {
                date = options.expires;
            }
            expires = '; expires=' + date.toUTCString(); // use expires attribute, max-age is not supported by IE
        }
        var path = options.path ? '; path=' + options.path : '';
        var domain = options.domain ? '; domain=' + options.domain : '';
        var secure = options.secure ? '; secure' : '';
        document.cookie = [name, '=', encodeURIComponent(value), expires, path, domain, secure].join('');
    } else { // only name given, get cookie
        var cookieValue = null;
        if (document.cookie && document.cookie != '') {
            var cookies = document.cookie.split(';');
            for (var i = 0; i < cookies.length; i++) {
                var cookie = jQuery.trim(cookies[i]);
                // Does this cookie string begin with the name we want?
                if (cookie.substring(0, name.length + 1) == (name + '=')) {
                    cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                    break;
                }
            }
        }
        return cookieValue;
    }
}

// ��ֵǰ����
function pad(num, n) {
    var len = num.toString().length;
    while (len < n) {
        num = "0" + num;
        len++;
    }
    return num;
}

// ת��Ϊ����
function strToDate(date) {
    return new Date(date.replace(/-/g, "/"));
}

// ���ڼӼ�
function addDate(date, dadd) {
    date = date.valueOf();
    date = date + dadd * 24 * 60 * 60 * 1000;
    return new Date(date);
}

//��ȡ�ַ����������ֺ�Ӣ��
function abbr(name, maxLength) {
    if (!maxLength) {
        maxLength = 20;
    }
    if (name == null || name.length < 1) {
        return "";
    }
    var w = 0;//�ַ������ȣ�һ�����ֳ���Ϊ2
    var s = 0;//���ָ���
    var p = false;//�ж��ַ�����ǰѭ����ǰһ���ַ��Ƿ�Ϊ����
    var b = false;//�ж��ַ�����ǰѭ�����ַ��Ƿ�Ϊ����
    var nameSub;
    for (var i = 0; i < name.length; i++) {
        if (i > 1 && b == false) {
            p = false;
        }
        if (i > 1 && b == true) {
            p = true;
        }
        var c = name.charCodeAt(i);
        //���ֽڼ�1
        if ((c >= 0x0001 && c <= 0x007e) || (0xff60 <= c && c <= 0xff9f)) {
            w++;
            b = false;
        } else {
            w += 2;
            s++;
            b = true;
        }
        if (w > maxLength && i <= name.length - 1) {
            if (b == true && p == true) {
                nameSub = name.substring(0, i - 2) + "...";
            }
            if (b == false && p == false) {
                nameSub = name.substring(0, i - 3) + "...";
            }
            if (b == true && p == false) {
                nameSub = name.substring(0, i - 2) + "...";
            }
            if (p == true) {
                nameSub = name.substring(0, i - 2) + "...";
            }
            break;
        }
    }
    if (w <= maxLength) {
        return name;
    }
    return nameSub;
}


function HTMLDecode(text) {
    var temp = document.createElement("div");
    temp.innerHTML = text;
    var output = temp.innerText || temp.textContent;
    temp = null;
    return output;
}

function showDialogByThisDataContent(owner, title) {
    var content = $(owner).data('content');
    top.$.jBox('html:' + content, {
        title: title,
        width: top.$(top.document).innerWidth() * 0.8,
        height: top.$(top.document).innerHeight() * 0.8
    });
    top.$('#jbox-content').css('overflow-y', 'auto');
}
function showDialogByContent(content, title) {
    top.$.jBox('html:' + content, {
        title: title,
        width: top.$(top.document).innerWidth() * 0.8,
        height: top.$(top.document).innerHeight() * 0.8
    });
    top.$('#jbox-content').css('overflow-y', 'auto');
}
function showDialogByIdVal(id, title) {
    top.$.jBox('html:' + $('#' + id).val(), {
        title: title,
        width: top.$(top.document).innerWidth() * 0.8,
        height: top.$(top.document).innerHeight() * 0.8
    });
    top.$('#jbox-content').css('overflow-y', 'auto');
}
function showDialogByUrl(url, title,opener) {
    top.$.jBox('iframe:' + url, {
        opener:opener,
        title: title,
        top: '0px', /* �����붥���ľ���,�����ǰٷֱȻ�����(�� '100px') */
        width: top.$(top.document).innerWidth() - 300,
        height: top.$(top.document).innerHeight() - 200,
        closed:function(){
            try{
                top.window.jBox.openerWindows.pop();
            }catch (e){

            }
        }
    });
    top.$('.jbox-content').css('overflow-y', 'hidden');
}
function showDialogByUrl2(url, title,opener) {
    top.$.jBox('iframe:' + url, {
        opener:opener,
        title: title,
        top: '0px', /* �����붥���ľ���,�����ǰٷֱȻ�����(�� '100px') */
        width: 600,
        height: 550,
        closed:function(){
            try{
                top.window.jBox.openerWindows.pop();
            }catch (e){

            }
        }
    });
    top.$('.jbox-content').css('overflow-y', 'hidden');
}

function showDialogByUrlAndReload(url, title,opener) {
    top.$.jBox('iframe:' + url, {
        opener:opener,
        title: title,
        top: '0px', /* �����붥���ľ���,�����ǰٷֱȻ�����(�� '100px') */
        width: top.$(top.document).innerWidth() - 10,
        height: top.$(top.document).innerHeight() - 10,
        closed:function(){
            try{
                top.window.jBox.openerWindows[0].location.reload(true)
                top.window.jBox.openerWindows.pop();
            }catch (e){

            }
        }
    });
    top.$('.jbox-content').css('overflow-y', 'hidden');
}
function showItemsDialog(url, title) {
    top.$.jBox('iframe:' + url, {
        opener:window,
        title: title,
        top: '100px', /* �����붥���ľ���,�����ǰٷֱȻ�����(�� '100px') */
        width: 600,
        height: 350,
        closed:function(){
            try{
                top.window.jBox.openerWindows.pop();
            }catch (e){

            }
        }
    });
    top.$('#jbox-content').css('overflow-y', 'hidden');
}

$.jBox.setDefaults({
    id: null, /* ��ҳ���е�Ψһid�����Ϊnull���Զ��������id,һ��idֻ����ʾһ��jBox */
    top: '20px', /* �����붥���ľ���,�����ǰٷֱȻ�����(�� '100px') */
    border: 5, /* ���ڵ���߿����ش�С,������0���ϵ����� */
    opacity: 0.1, /* ���ڸ�����͸����,�������Ϊ0,����ʾ����� */
    timeout: 0, /* ������ʾ���ٺ�����Զ��ر�,�������Ϊ0,���Զ��ر� */
    showType: 'fade', /* ������ʾ������,��ѡֵ��:show��fade��slide */
    showSpeed: 'fast', /* ������ʾ���ٶ�,��ѡֵ��:'slow'��'fast'����ʾ��������� */
    showIcon: true, /* �Ƿ���ʾ���ڱ����ͼ�꣬true��ʾ��false����ʾ�����Զ����CSS��ʽ��������Ϊͼ��Ϊ������ */
    showClose: true, /* �Ƿ���ʾ�������ϽǵĹرհ�ť */
    draggable: true, /* �Ƿ�����϶����� */
    dragLimit: true, /* �ڿ����϶����ڵ�����£��Ƿ������ڿ��ӷ�Χ */
    dragClone: false, /* �ڿ����϶����ڵ�����£���갴��ʱ�����Ƿ��¡���� */
    persistent: true, /* ����ʾ����������£���������ʱ���Ƿ��ִ��ڲ��ر� */
    showScrolling: true, /* �Ƿ���ʾ����Ĺ����� */
    ajaxData: {}, /* �ڴ�������ʹ��get:��post:ǰ׺��ʶ������£�ajax post�����ݣ����磺{ id: 1 } �� "id=1" */
    iframeScrolling: 'auto', /* �ڴ�������ʹ��iframe:ǰ׺��ʶ������£�iframe��scrolling����ֵ����ѡֵ�У�'auto'��'yes'��'no' */

    title: 'jBox', /* ���ڵı��� */
    width: 350, /* ���ڵĿ�ȣ�ֵΪ'auto'���ʾ���ص����� */
    height: 'auto', /* ���ڵĸ߶ȣ�ֵΪ'auto'���ʾ���ص����� */
    bottomText: '', /* ���ڵİ�ť��ߵ����ݣ���û�а�ťʱ��������Ч */
    buttons: {'�ر�': 'ok'}, /* ���ڵİ�ť */
    buttonsFocus: 0, /* ��ʾ�ڼ�����ťΪĬ�ϰ�ť��������0��ʼ */
    loaded: function (h) {
    }, /* ���ڼ�����ɺ�ִ�еĺ�������Ҫע����ǣ������ajax��iframeҲ��Ҫ�ȼ�����http������㴰�ڼ�����ɣ�
     ����h��ʾ�������ݵ�jQuery���� */
    submit: function (v, h, f) {
        return true;
    },
    /* ������ڰ�ť��Ļص�����������trueʱ��ʾ�رմ��ڣ�
     ������������v��ʾ����İ�ť�ķ���ֵ��h��ʾ�������ݵ�jQuery����f��ʾ�����������form����ֵ */
    closed: function () {
    } /* ���ڹرպ�ִ�еĺ��� */
});


jQuery.fn.extend({
    autoComplete: function (url) {
        var self = this;
        $.ajax({
            type: "GET",
            contentType: "application/json",
            url: url,
            dataType: "json",
            success: function (datas) {
                $(self).autocomplete({
                    lookup: datas,
                    onSelect: function (suggestion) {
                        var flag = "-auto-complete";
                        var delName = $(self).attr("name");
                        var name = delName;
                        var idx = delName.indexOf(flag);
                        if (idx != -1) {
                            name = delName.substring(0, idx);
                        }
                        $(':hidden[name="' + name + '"]').remove();
                        $(self).after($(self).clone().attr('name', name).attr('type', 'hidden').val(suggestion.data));
                        $(self).attr("name", name + flag);
                    }
                });
            }
        });
        return this;
    }
});

/**
 * autoComplete("#autocomplete", "${ctx}/crm/erpCountry/getAllList")
 * $('#autocomplete').autoComplete("${ctx}/crm/erpCountry/getAllList");
 * ֱ����input text��ǩ ��������Լ��ɣ�<input type="text" data-autocomplate-url="${ctx}/crm/erpCountry/getAllList"/>
 */
(function () {

    $(function () {
        // auto completeӦ������Щ��ǩ��input:text

        $(':text[data-autocomplete-view]').each(function (i, n) {
            var view = $(this).data('autocomplete-view');
            $(this).autoComplete(ctx + '/autoComplete?viewName=' + view);
        });
    });

})();


function clearIptDateRange(evt){
    var e = evt || window.event;
    e.stopPropagation();
    e.preventDefault();
    document.getElementById('startTime').value='';
    document.getElementById('endTime').value='';
    return false;
}