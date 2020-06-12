package com.fy.erp.modules.iot.web

import com.fy.erp.alias.*
import com.fy.erp.common.config.Global
import com.fy.erp.common.persistence.Page
import org.apache.commons.lang3.StringUtils.*
import com.fy.erp.modules.iot.entity.IotWatermeterVpt
import com.fy.erp.modules.iot.service.IotWatermeterVptService

/**
 * 水表流量阈值Controller
 * @author 尹彬
 * @version 2017-12-06
 */
@C
@RM("\${adminPath}/iot/iotWatermeterVpt")
class IotWatermeterVptController : BC() {

	@A
	lateinit var iotWatermeterVptService: IotWatermeterVptService
	
	@MA
	operator fun get(@RP(required=false) id:String?): IotWatermeterVpt {
		return if (isNotBlank(id)) iotWatermeterVptService.get(id!!) else IotWatermeterVpt()
	}
	
	@RM(*arrayOf("list", ""))
	@PERM("iot:iotWatermeterVpt:list")
	fun list(iotWatermeterVpt: IotWatermeterVpt, req: REQ, res: RES, m: M): String{
		val page = iotWatermeterVptService.findPage(Page(req, res), iotWatermeterVpt)
        m.addAttribute("page", page)
		return "modules/iot/iotWatermeterVptList"
	}

    @RM("form")
	@PERM("iot:iotWatermeterVpt:form")
    fun form(iotWatermeterVpt: IotWatermeterVpt, m: M): String {
        m.addAttribute("iotWatermeterVpt", iotWatermeterVpt)
		return "modules/iot/iotWatermeterVptForm"
    }

    @RM("view")
    @PERM("iot:iotWatermeterVpt:view")
    fun view(iotWatermeterVpt: IotWatermeterVpt, m: M): String {
        m.addAttribute("iotWatermeterVpt", iotWatermeterVpt)
        m.addAttribute("isForEdit", false)
        return "modules/iot/iotWatermeterVptView"
    }

    @RM("save")
    @PERM("iot:iotWatermeterVpt:save")
    fun save(iotWatermeterVpt: IotWatermeterVpt, m: M, ra: RA): String {
//        if (!beanValidator(m, iotWatermeterVpt)) {
//            return form(iotWatermeterVpt, m)
//        }
        iotWatermeterVptService.save(iotWatermeterVpt)
        addMessage(ra, "保存水表流量阈值成功")
        return "redirect:${Global.getAdminPath()}/iot/iotWatermeterVpt/?repage"
    }

    @RM("delete")
    @PERM("iot:iotWatermeterVpt:delete")
    fun delete(iotWatermeterVpt: IotWatermeterVpt, ra: RA): String {
        iotWatermeterVptService.delete(iotWatermeterVpt)
        addMessage(ra, "删除水表流量阈值成功")
        return "redirect:${Global.getAdminPath()}/iot/iotWatermeterVpt/?repage"
    }

    // ========================================================================================

    @RM("switchFlag")
    @PERM("iot:iotWatermeterVpt:switchFlag")
    fun switchFlag(iotWatermeterVpt: IotWatermeterVpt, ra: RA): String {
        iotWatermeterVptService.switchFlag(iotWatermeterVpt)
        addMessage(ra, "设置水表流量阈值成功")
        return "redirect:${Global.getAdminPath()}/iot/iotWatermeterVpt/?repage"
    }


}