package com.fy.erp.modules.iot.web

import com.fy.erp.alias.*
import com.fy.erp.common.config.Global
import com.fy.erp.common.mapper.JsonMapper
import com.fy.erp.common.persistence.Page
import com.fy.erp.common.utils.DateUtils
import com.fy.erp.modules.iot.entity.IotWatermeter
import com.fy.erp.modules.iot.entity.IotWatermeterFlow
import com.fy.erp.modules.iot.entity.IotWatermeterVpt
import com.fy.erp.modules.iot.service.IotWatermeterFlowService
import com.fy.erp.modules.iot.service.IotWatermeterService
import com.fy.erp.modules.iot.service.IotWatermeterVptService
import org.apache.commons.lang3.StringUtils.isNoneBlank
import org.springframework.util.FileCopyUtils
import org.springframework.web.util.UriUtils
import java.io.*


/**
 * ˮ��������ϢController
 * @author ����
 * @version 2017-12-05
 */
@C
@RM("\${adminPath}/iot/iotWatermeterFlow")
class IotWatermeterFlowController : BC() {

    @A
    lateinit var iotWatermeterFlowService: IotWatermeterFlowService

    @A
    lateinit var iotWatermeterVptService: IotWatermeterVptService

    @A
    lateinit var iotWatermeterService: IotWatermeterService


//    TODO ����������ط�Ҫôʹ��watermeterId��Ҫô��Flow�������Watermeter�����Ƽ�����
//	@MA
//	operator fun get(@RP(required=false) id:String?): IotWatermeterFlow {
//		return if (isNotBlank(id)) iotWatermeterFlowService.get(id!!) else IotWatermeterFlow()
//	}

    @RM("form")
    @PERM("iot:iotWatermeterFlow:form")
    fun form(iotWatermeterFlow: IotWatermeterFlow, m: M): String {
        m.addAttribute("iotWatermeterFlow", iotWatermeterFlow)
        return "modules/iot/iotWatermeterFlowForm"
    }

    @RM("view")
    @PERM("iot:iotWatermeterFlow:view")
    fun view(iotWatermeterFlow: IotWatermeterFlow, m: M): String {
        m.addAttribute("iotWatermeterFlow", iotWatermeterFlow)
        m.addAttribute("isForEdit", false)
        return "modules/iot/iotWatermeterFlowView"
    }

    @RM("save")
    @PERM("iot:iotWatermeterFlow:save")
    fun save(iotWatermeterFlow: IotWatermeterFlow, m: M, ra: RA): String {
        if (!beanValidator(m, iotWatermeterFlow)) {
            return form(iotWatermeterFlow, m)
        }
        iotWatermeterFlowService.save(iotWatermeterFlow)
        addMessage(ra, "����ˮ��������Ϣ�ɹ�")
        return "redirect:${Global.getAdminPath()}/iot/iotWatermeterFlow/?repage"
    }

    @RM("delete")
    @PERM("iot:iotWatermeterFlow:delete")
    fun delete(iotWatermeterFlow: IotWatermeterFlow, ra: RA): String {
        iotWatermeterFlowService.delete(iotWatermeterFlow)
        addMessage(ra, "ɾ��ˮ��������Ϣ�ɹ�")
        return "redirect:${Global.getAdminPath()}/iot/iotWatermeterFlow/?repage"
    }

    // ========================================================================================


    /**
     * ˮ��ͳ�Ʊ��� - �б�
     */
    @RM(*arrayOf("list", ""))
    @PERM("iot:iotWatermeterFlow:list")
    fun list(iotWatermeter: IotWatermeter, req: REQ, res: RES, m: M): String {

        val list = iotWatermeterFlowService.findWatermeterReportList(iotWatermeter)
        m.addAttribute("list", list)

//        ����
        val vptList = iotWatermeterVptService.findList(IotWatermeterVpt()).filter { it.delFlag == "0" }.map { mapOf(it.dateName to it.maxFlow) }
                .reduce { map, next -> map + next }
        m.addAttribute("vptFlow", JsonMapper.toJsonString(vptList))

//        ͨ��session�������ա��ܡ��¡��������a���ӣ��ڵ����ʱ��ֵ
        req.session.setAttribute("iotWatermeter", iotWatermeter)
        return "modules/iot/iotWatermeterReportList"
    }

    //    TODO ��ʱ��ôд�����ع����Ż��˴���
    @MA
    operator fun get(@RP(required = false) id: String?): IotWatermeter {
        return if (isNoneBlank(id)) iotWatermeterService.get(id!!) else IotWatermeter()
    }

    /**
     * ˮ��ͳ�Ʊ��� - �ա��ܡ��¡����������ȡ�б�
     */
    @PERM("iot:iotWatermeterFlow:list")
    @RM("reportDrillList")
    fun reportDrillList(iotWatermeter: IotWatermeter, req: REQ, res: RES, m: M): String {

        val iotWatermeterSession = req.session.getAttribute("iotWatermeter") as? IotWatermeter
        iotWatermeterSession!!.id = iotWatermeter.id
        iotWatermeterSession.datename = iotWatermeter.datename

        val page = iotWatermeterFlowService.findWatermeterReportFlowList(Page(req, res), iotWatermeterSession)
        m.addAttribute("page", page)

        val vptList = iotWatermeterVptService.findList(IotWatermeterVpt()).filter { it.delFlag == "0" }.map { mapOf(it.dateName to it.maxFlow) }
                .reduce { map, next -> map + next }
        m.addAttribute("vptFlow", JsonMapper.toJsonString(vptList))

        return "modules/iot/iotWatermeterReportDrillList"
    }


    /**
     * ˮ��ͳ�Ʊ��� - �б�
     */
    @RM(*arrayOf("echarts"))
    @PERM("iot:iotWatermeterFlow:echarts")
    fun echarts(iotWatermeter: IotWatermeter, req: REQ, res: RES, m: M): String {

        val list = iotWatermeterFlowService.findWatermeterReportList(iotWatermeter)
        m.addAttribute("list", list)

//
        val vptList = iotWatermeterVptService.findList(IotWatermeterVpt()).filter { it.delFlag == "0" }.map { mapOf(it.dateName to it.maxFlow) }
                .reduce { map, next -> map + next }
        m.addAttribute("vptFlow", JsonMapper.toJsonString(vptList))

//        ͨ��session�������ա��ܡ��¡��������a���ӣ��ڵ����ʱ��ֵ
        req.session.setAttribute("iotWatermeter", iotWatermeter)
        return "modules/iot/iotWatermeterEcharts"
    }


    /**
     * ˮ��ͳ�Ʊ��� - �б�
     */
    @RM(*arrayOf("exportXls"))
    @PERM("iot:iotWatermeterFlow:exportXls")
    fun exportXls(iotWatermeter: IotWatermeter, req: REQ, res: RES, m: M) {
        val date = DateUtils.getDate()
        val filename = "ˮ��ͳ������-$date.xlsx"
        val outputPath = req.session.servletContext.getRealPath("/userfiles/") + File.separator + filename

       iotWatermeterFlowService.exportXls(iotWatermeter,outputPath)

        download(req, res, filename)
    }

    /**
     * ����xlsx�ļ�
     */
    fun download(req: REQ, res: RES, filename: String) {
        var filepath = filename
        val index = filepath.indexOf(Global.USERFILES_BASE_URL)
        if (index >= 0) {
            filepath = filepath.substring(index + Global.USERFILES_BASE_URL.length)
        }
        try {
            filepath = UriUtils.decode(filepath, "UTF-8")
        } catch (e1: UnsupportedEncodingException) {
            logger.error(String.format("�����ļ�·��ʧ�ܣ�URL��ַΪ%s", filepath), e1)
        }

        val file = File(Global.getUserfilesBaseDir() + Global.USERFILES_BASE_URL + filepath)
        try {
            //1.�����ļ�ContentType���ͣ��������ã����Զ��ж������ļ�����
            res.setContentType("multipart/form-data")
            //2.�����ļ�ͷ�����һ�����������������ļ���(�������ǽ�a.pdf)
            res.setHeader("Content-Disposition", "attachment;fileName=" + filename)

            FileCopyUtils.copy(FileInputStream(file), res.getOutputStream())
            return
        } catch (e: FileNotFoundException) {
            req.setAttribute("exception", FileNotFoundException("������ļ�������"))
            req.getRequestDispatcher("/WEB-INF/views/error/404.jsp").forward(req, res)
        }
    }


}