<%@ tag language="java" pageEncoding="GBK" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<%@ attribute name="id" type="java.lang.String" required="true" description="���" %>
<%@ attribute name="name" type="java.lang.String" required="true" description="���������" %>
<%@ attribute name="value" type="java.lang.String" required="true" description="�����ֵ" %>
<i id="${id}Icon"
   class="icon-${not empty value?value:' hide'}"></i>&nbsp;<label id="${id}IconLabel">${not empty value?value:'��'}</label>&nbsp;
<input id="${id}" name="${name}" type="hidden" value="${value}"/><a id="${id}Button" href="javascript:"
                                                                    class="btn">ѡ��</a>&nbsp;&nbsp;
<script type="text/javascript">
    $("#${id}Button").click(function () {
        top.$.jBox.open("iframe:${ctx}/tag/iconselect?value=" + $("#${id}").val(), "ѡ��ͼ��", 700, $(top.document).height() - 180, {
            buttons: {"ȷ��": "ok", "���": "clear", "�ر�": true}, submit: function (v, h, f) {
                if (v == "ok") {
                    var icon = h.find("iframe")[0].contentWindow.$("#icon").val();
                    if (icon.indexOf('.') != -1) { // ���ݰ���ͼ���
                        icon = $.trim(icon).substr(6);
                        $("#${id}Icon").attr("class", "icon iconfont icon-" + icon);
                        $("#${id}IconLabel").text(icon);
                        $("#${id}").val(icon +" icon iconfont ");
                    } else {
                        icon = $.trim(icon).substr(5);
                        $("#${id}Icon").attr("class", "icon-" + icon);
                        $("#${id}IconLabel").text(icon);
                        $("#${id}").val(icon);
                    }
                } else if (v == "clear") {
                    $("#${id}Icon").attr("class", "icon- hide");
                    $("#${id}IconLabel").text("��");
                    $("#${id}").val("");
                }
            }, loaded: function (h) {
                $(".jbox-content", top.document).css("overflow-y", "hidden");
            }
        });
    });
</script>
