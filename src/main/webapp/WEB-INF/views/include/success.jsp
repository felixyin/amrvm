<%@ page contentType="text/html;charset=GBK" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp" %>
<html>
<head>
    <title>±£´æ³É¹¦</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript">
        closeLoading();
        showTip('${messages}');
        setTimeout(function () {
            try{
                top.$.jBox.getOpener().location.reload(true);
            }catch (e){
            }
            top.$.jBox.close();
        }, 2000);
    </script>
</head>
<body>

</body>
</html>