<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<section id="user_section">
    <header>
        <nav class="left">
            <a href="#" data-icon="previous" data-target="back">����</a>
        </nav>
        <h1 class="title">�û��б�</h1>
    </header>
    <article class="active">
    	<div style="line-height:50px;padding:10px;">
    		�ֻ��˹���û�п�������������ơ�<br/>
    		������бȽϺõ��뷨����չ��Ҳϣ����������Լ���һ�ݴ��롣
    		����ϵ thinkgem@163.com лл��<br/>
    	</div>
    </article>
    <script type="text/javascript">
	$('body').delegate('#user_section','pageinit',function(){
	});
	$('body').delegate('#user_section','pageshow',function(){
        var hash = J.Util.parseHash(location.hash);
        console.log(hash.param);
	});
	</script>
</section>