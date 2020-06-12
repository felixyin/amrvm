package com.fy.erp.modules.iot.web

import com.fy.erp.alias.*
import com.fy.erp.common.config.Global
import com.fy.erp.common.persistence.Page
import com.fy.erp.modules.iot.entity.IotWatermeter
import org.apache.commons.lang3.StringUtils.*
import com.fy.erp.modules.iot.entity.IotWatermeterCollect
import com.fy.erp.modules.iot.service.IotWatermeterCollectService

/**
 * 水表采集信息Controller
 * @author 杨超
 * @version 2017-12-09
 */
@C
@RM("\${adminPath}/iot/iotWatermeterCollect")
class IotWatermeterCollectController : BC() {

	@A
	lateinit var iotWatermeterCollectService: IotWatermeterCollectService
	
	@MA
	operator fun get(@RP(required=false) id:String?): IotWatermeterCollect {
		return if (isNotBlank(id)) iotWatermeterCollectService.get(id!!) else IotWatermeterCollect()
	}
	


    /*@RM("form")
	@PERM("iot:iotWatermeterCollect:form")
    fun form(iotWatermeterCollect: IotWatermeterCollect, m: M): String {
        m.addAttribute("iotWatermeterCollect", iotWatermeterCollect)
		return "modules/iot/iotWatermeterCollectForm"
    }

    @RM("view")
    @PERM("iot:iotWatermeterCollect:view")
    fun view(iotWatermeterCollect: IotWatermeterCollect, m: M): String {
        m.addAttribute("iotWatermeterCollect", iotWatermeterCollect)
        m.addAttribute("isForEdit", false)
        return "modules/iot/iotWatermeterCollectView"
    }

    @RM("save")
    @PERM("iot:iotWatermeterCollect:save")
    fun save(iotWatermeterCollect: IotWatermeterCollect, m: M, ra: RA): String {
        if (!beanValidator(m, iotWatermeterCollect)) {
            return form(iotWatermeterCollect, m)
        }
        iotWatermeterCollectService.save(iotWatermeterCollect)
        addMessage(ra, "保存水表采集信息成功")
        return "redirect:${Global.getAdminPath()}/iot/iotWatermeterCollect/?repage"
    }

    @RM("delete")
    @PERM("iot:iotWatermeterCollect:delete")
    fun delete(iotWatermeterCollect: IotWatermeterCollect, ra: RA): String {
        iotWatermeterCollectService.delete(iotWatermeterCollect)
        addMessage(ra, "删除水表采集信息成功")
        return "redirect:${Global.getAdminPath()}/iot/iotWatermeterCollect/?repage"
    }*/

    // ========================================================================================

    @RM(*arrayOf("list", ""))
    fun list(iotWatermeterCollect: IotWatermeterCollect, req: REQ, res: RES, m: M): String{
        val iotWatermeterSession = req.session.getAttribute("iotWatermeter") as IotWatermeter
        iotWatermeterCollect.iotWatermeter.id = iotWatermeterSession.id
        val page = iotWatermeterCollectService.findPage(Page(req, res), iotWatermeterCollect)
        m.addAttribute("page", page)
        return "modules/iot/iotWatermeterCollectList"
    }
}