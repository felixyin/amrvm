/*!
 * Copyright &copy; 2012-2013 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */

// ����ղ�
function addFavorite(sURL, sTitle){
	if(!sTitle){sTitle = document.title;}
    try{
    	window.external.addFavorite(sURL, sTitle);
    }catch (e){
        try{
        	window.sidebar.addPanel(sTitle, sURL, "");
        }catch (e){
        	alert("�����ղ�ʧ�ܣ���ʹ��Ctrl+D�������");
        }
    }
}

// �Զ�������setInterval("autoScroll('.jcarousellite')",3000);
function autoScroll(obj){
	var height = $(obj).find("ul:first li:first").height()+3;
    $(obj).find("ul:first").animate({marginTop:"-" + height + "px"},'slow',function(){
    		$(this).css({marginTop:"0px"}).find("li:first").appendTo(this);
    });
}