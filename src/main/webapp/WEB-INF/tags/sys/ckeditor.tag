<%@ tag language="java" pageEncoding="GBK"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<%@ attribute name="replace" type="java.lang.String" required="true" description="��Ҫ�滻��textarea���"%>
<%@ attribute name="uploadPath" type="java.lang.String" required="false" description="�ļ��ϴ�·����·�����Զ������ݡ�����ָ������༭�������ϴ��ļ�"%>
<%@ attribute name="height" type="java.lang.String" required="false" description="�༭���߶�"%>
<script type="text/javascript">include('ckeditor_lib','${ctxStatic}/ckeditor/',['ckeditor.js']);</script>
<script type="text/javascript">
        var ${replace}Ckeditor = CKEDITOR.replace("${replace}");
        ${replace}Ckeditor.config.height = "${height}";//<c:if test="${not empty uploadPath}">
        ${replace}Ckeditor.config.ckfinderPath="${ctxStatic}/ckfinder";
        var date = new Date(), year = date.getFullYear(), month = (date.getMonth()+1)>9?date.getMonth()+1:"0"+(date.getMonth()+1);
        ${replace}Ckeditor.config.ckfinderUploadPath="${uploadPath}/"+year+"/"+month+"/";//</c:if>
</script>