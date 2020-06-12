package com.fy.erp.modules.iot.web

import com.fy.erp.alias.*
import com.fy.erp.common.config.Global
import com.fy.erp.common.mapper.JsonMapper
import com.fy.erp.common.persistence.Page
import org.apache.commons.lang3.StringUtils.*
import com.fy.erp.modules.iot.entity.IotVideoMonitor
import com.fy.erp.modules.iot.service.IotVideoMonitorService

/**
 * ��Ƶ�������Controller
 * @author ����
 * @version 2017-12-06
 */
@C
@RM("\${adminPath}/iot/iotVideoMonitor")
class IotVideoMonitorController : BC() {

    @A
    lateinit var iotVideoMonitorService: IotVideoMonitorService

    @MA
    operator fun get(@RP(required = false) id: String?): IotVideoMonitor {
        return if (isNotBlank(id)) iotVideoMonitorService.get(id!!) else IotVideoMonitor()
    }

    @RM(*arrayOf("list", ""))
    @PERM("iot:iotVideoMonitor:list")
    fun list(iotVideoMonitor: IotVideoMonitor, req: REQ, res: RES, m: M): String {
        val page = iotVideoMonitorService.findPage(Page(req, res), iotVideoMonitor)
        m.addAttribute("page", page)
        return "modules/iot/iotVideoMonitorList"
    }

    @RM("form")
    @PERM("iot:iotVideoMonitor:form")
    fun form(iotVideoMonitor: IotVideoMonitor, m: M): String {
        m.addAttribute("iotVideoMonitor", iotVideoMonitor)
        return "modules/iot/iotVideoMonitorForm"
    }

    @RM("view")
    @PERM("iot:iotVideoMonitor:view")
    fun view(iotVideoMonitor: IotVideoMonitor, m: M): String {
        m.addAttribute("iotVideoMonitor", iotVideoMonitor)
        m.addAttribute("isForEdit", false)
        return "modules/iot/iotVideoMonitorView"
    }

    @RM("save")
    @PERM("iot:iotVideoMonitor:save")
    fun save(iotVideoMonitor: IotVideoMonitor, m: M, ra: RA): String {
        if (!beanValidator(m, iotVideoMonitor)) {
            return form(iotVideoMonitor, m)
        }
        iotVideoMonitorService.save(iotVideoMonitor)
        addMessage(ra, "������Ƶ��سɹ�")
        return "redirect:${Global.getAdminPath()}/iot/iotVideoMonitor/?repage"
    }

    @RM("delete")
    @PERM("iot:iotVideoMonitor:delete")
    fun delete(iotVideoMonitor: IotVideoMonitor, ra: RA): String {
        iotVideoMonitorService.delete(iotVideoMonitor)
        addMessage(ra, "ɾ����Ƶ��سɹ�")
        return "redirect:${Global.getAdminPath()}/iot/iotVideoMonitor/?repage"
    }

    // ========================================================================================

    /**
     * ��Ƶ��ز鿴 - �б�
     */
    @RM(*arrayOf("listVM"))
    @PERM("iot:iotVideoMonitor:listVM")
    fun listVM(iotVideoMonitor: IotVideoMonitor, req: REQ, res: RES, m: M): String {
        val page = iotVideoMonitorService.findPage(Page(req, res), iotVideoMonitor)
        m.addAttribute("page", page)
        return "modules/iot/iotVideoMonitorListVM"
    }

    /**
     * ��Ƶ��ز鿴 - ���ҳ��
     */
    @RM("viewVm")
    @PERM("iot:iotVideoMonitor:viewVm")
    fun viewVm(iotVideoMonitor: IotVideoMonitor, m: M): String {
        m.addAttribute("iotVideoMonitor", JsonMapper.toJsonString(iotVideoMonitor))
        m.addAttribute("isForEdit", false)
        return "modules/iot/iotVideoMonitorViewVM"
    }

}