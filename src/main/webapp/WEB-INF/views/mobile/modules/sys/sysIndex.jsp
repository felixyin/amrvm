<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<section id="index_section">
	<header>
        <h1 class="title">${fns:getConfig('productName')}</h1>
        <nav class="right">
            <a data-icon="arrow-down-left-2" href="#" id="btnLogout">�˳�</a>
        </nav>
    </header>
    <article class="active" data-scroll="true">
        <div style="padding: 10px 0 20px;">
        <ul class="list inset demo-list">
            <li data-icon="next" data-selected="selected">
                <span class="icon user"></span>
                <a href="#user_section?test=abc" data-target="section">
                    <strong>�û�����</strong>
                </a>
            </li>
        </ul>
        </div>
    </article>
    <script type="text/javascript">
   		$('#btnLogout').tap(function(){
   			J.confirm('ȷ����ʾ','ȷ��Ҫ�˳���',function(){
   				$.get("${ctx}/logout", function(){
   					sessionid = '';
   					J.showToast('�˳��ɹ���', 'success');
   					J.Router.goTo('#login_section');
   				});
   			});
   		});
    </script>
</section>