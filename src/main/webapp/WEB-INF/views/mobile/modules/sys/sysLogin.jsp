<%@ page contentType="text/html;charset=GBK" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%><!DOCTYPE >
<html>
<head>
    <meta charset="utf-8">
    <title>${fns:getConfig('productName')}</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <link rel="stylesheet" href="${ctxStatic}/jingle/css/Jingle.css">
    <link rel="stylesheet" href="${ctxStatic}/jingle/css/app.css">
</head>
<body>
<div id="aside_container">
</div>
<div id="section_container">
    <section id="login_section" class="active">
        <header>
            <h1 class="title">${fns:getConfig('productName')}</h1>
            <!-- <nav class="right">
                <a data-target="section" data-icon="info" href="#about_section"></a>
            </nav> -->
        </header>
        <article data-scroll="true" id="login_article">
	        <div class="indented">
	            <form id="loginForm" action="${ctx}/login" method="post">
	            	<div>&nbsp;</div>
	            	<div class="input-group">
		                <div class="input-row">
		                    <label for="username">’À∫≈</label>
		                    <input type="text" name="username" id="username" placeholder="«ÎÃÓ–¥µ«¬º’À∫≈">
		                </div>
		                <div class="input-row">
		                    <label for="password">√‹¬Î</label>
		                    <input type="password" name="password" id="password" placeholder="«ÎÃÓ–¥µ«¬º√‹¬Î">
		                </div>
		            </div>
	            	<div class="input-group" id="validateCodeDiv" style="display:none;">
		                <div class="input-row">
		                    <label class="input-label mid" for="validateCode">—È÷§¬Î</label>
		                    <sys:validateCode name="validateCode" inputCssStyle="margin-bottom:0;"
		                    	imageCssStyle="padding-top:7px;"/>
		                </div>
		            </div>
	            	<div>&nbsp;</div>
	            	<input type="hidden" name="mobileLogin" value="true">
	                <button id="btn" class="submit block" data-icon="key">µ«¬º</button>
	            </form>
	        </div>
	    </article>
    </section>
</div>
<!--<script type="text/javascript" src="${ctxStatic}/jingle/js/lib/cordova.js"></script>-->
<!-- lib -->
<script type="text/javascript" src="${ctxStatic}/jingle/js/lib/zepto.js"></script>
<script type="text/javascript" src="${ctxStatic}/jingle/js/lib/iscroll.js"></script>
<%-- <script type="text/javascript" src="${ctxStatic}/jingle/js/lib/template.min.js"></script> --%>
<script type="text/javascript" src="${ctxStatic}/jingle/js/lib/Jingle.debug.js"></script>
<script type="text/javascript" src="${ctxStatic}/jingle/js/lib/zepto.touch2mouse.js"></script>
<%-- <script type="text/javascript" src="${ctxStatic}/jingle/js/lib/JChart.debug.js"></script> --%>
<!--- app --->
<script type="text/javascript">var ctx = '${ctx}';</script>
<script type="text/javascript" src="${ctxStatic}/jingle/js/app/app.js"></script>
<!--<script src="http://192.168.2.153:8080/target/target-script-min.js#anonymous"></script>-->
<script type="text/javascript">
var sessionid = '${not empty fns:getPrincipal() ? fns:getPrincipal().sessionid : ""}';
$('body').delegate('#login_section','pageinit',function(){
	$("#loginForm").submit(function(){
		if ($('#username').val() == ''){
			J.showToast('«ÎÃÓ–¥’À∫≈', 'info');
		}else if ($('#password').val() == ''){
			J.showToast('«ÎÃÓ–¥√‹¬Î', 'info');
		}else if ($('#validateCodeDiv').is(':visible') && $('#validateCode').val() == ''){
			J.showToast('«ÎÃÓ–¥—È÷§¬Î', 'info');
		}else{
			var loginForm = $("#loginForm");
			$.post(loginForm.attr('action'), loginForm.serializeArray(), function(data){
				if (data && data.sessionid){
					sessionid = data.sessionid;
					J.showToast('µ«¬º≥…π¶£°', 'success');
					J.Router.goTo('#index_section?index');
				}else{
					J.showToast(data.message, 'error');
					if (data.shiroLoginFailure == 'org.apache.shiro.authc.AuthenticationException'){
						$('#validateCodeDiv').show();
					}
					$('#validateCodeDiv a').click();
				}
				//console.log(data);
			});
		}
		return false;
	});
});
$('body').delegate('#login_section','pageshow',function(){
	if (sessionid != ''){
        var targetHash = location.hash;
        if (targetHash == '#login_section'){
    		//J.showToast('ƒ„“—æ≠µ«¬º£°', 'success');
    		J.Router.goTo('#index_section?index');
        }
	}else{
		$('#login_article').addClass('active');
	}
});
</script>
</body>
</html>