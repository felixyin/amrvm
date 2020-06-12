package com.fy.erp.modules.iot.web

import com.fy.erp.alias.*
import com.fy.erp.common.config.Global
import com.fy.erp.common.persistence.Page
import com.fy.erp.modules.iot.entity.IotWatermeter
import org.apache.commons.lang3.StringUtils.*
import com.fy.erp.modules.iot.entity.IotWatermeterRepair
import com.fy.erp.modules.iot.service.IotWatermeterFlowService
import com.fy.erp.modules.iot.service.IotWatermeterRepairService
import com.fy.erp.modules.iot.service.IotWatermeterService
import com.fy.erp.modules.sys.utils.UserUtils

/**
 * 维修水表Controller
 * @author 杨超，尹彬
 * @version 2017-12-06
 */
@C
@RM("\${adminPath}/iot/iotWatermeterRepair")
class IotWatermeterRepairController : BC() {

	@A
	lateinit var iotWatermeterRepairService: IotWatermeterRepairService

    @A
    lateinit var iotWatermeterService: IotWatermeterService

    @A
    lateinit var iotWatermeterFlowService: IotWatermeterFlowService


	@MA
	operator fun get(@RP(required=false) id:String?): IotWatermeterRepair {
		return if (isNotBlank(id)) iotWatermeterRepairService.get(id!!) else IotWatermeterRepair()
	}

    @RM("view")
    @PERM("iot:iotWatermeterRepair:view")
    fun view(@RP(required=false) iotWatermeterId:String?,iotWatermeterRepair: IotWatermeterRepair, m: M): String {
        val iotWatermeter = iotWatermeterService.get(IotWatermeter(iotWatermeterId)) // ???uuid??????
        m.addAttribute("iotWatermeter", iotWatermeter)
        m.addAttribute("iotWatermeterRepair", iotWatermeterRepair)
        m.addAttribute("isForEdit", false)
        return "modules/iot/iotWatermeterRepairView"
    }


    @RM("delete")
    @PERM("iot:iotWatermeterRepair:delete")
    fun delete(iotWatermeterRepair: IotWatermeterRepair, ra: RA): String {
        iotWatermeterRepairService.delete(iotWatermeterRepair)
        addMessage(ra, "???????????")
        return "redirect:${Global.getAdminPath()}/iot/iotWatermeterRepair/?repage"
    }

    // ========================================================================================

    /**
     * 水表管理 - 维修水表 - 列表
     */
    @RM(*arrayOf("list", ""))
    @PERM("iot:iotWatermeterRepair:list")
    fun list(@RP(required=false) iotWatermeterId:String?,iotWatermeterRepair: IotWatermeterRepair, req: REQ, res: RES, m: M, ra: RA): String{

//        维修记录列表
        val list = iotWatermeterRepairService.findList(iotWatermeterRepair)
        m.addAttribute("list", list)

//        冗余显示水表信息
        val iotWatermeter = iotWatermeterService.get(IotWatermeter(iotWatermeterId)) // ???uuid??????
        m.addAttribute("iotWatermeter", iotWatermeter)

//        session记录维修编号 FIXME ?? 有用吗
//        iotWatermeterRepair.iotWatermeterId = iotWatermeterId
//        req.session.setAttribute("iotWatermeterRepair",iotWatermeterRepair)

        return "modules/iot/iotWatermeterRepairList"
    }

    /**
     * 水表管理 - 维修水表 - 维修记录添加
     */
    @RM("form")
    @PERM("iot:iotWatermeterRepair:form")
    fun form(@RP(required=false) iotWatermeterId:String?,iotWatermeterRepair: IotWatermeterRepair, m: M): String {

        val iotWatermeter = iotWatermeterService.get(IotWatermeter(iotWatermeterId)) // ???uuid??????
        m.addAttribute("iotWatermeter", iotWatermeter)

        iotWatermeterRepair.countOld = iotWatermeterFlowService.findMaxCountByWatermeter(iotWatermeter.watermeterNum)
        iotWatermeterRepair.repairBy = UserUtils.getUser()
        iotWatermeterRepair.watermeterNumOld = iotWatermeter.watermeterNum
        m.addAttribute("iotWatermeterRepair", iotWatermeterRepair)

        return "modules/iot/iotWatermeterRepairForm"
    }

    /**
     * 水表管理 - 维修水表 - 维修记录添加 - 保存
     */
    @RM("save")
    @PERM("iot:iotWatermeterRepair:save")
    fun save(@RP(required=false) iotWatermeterId:String?,iotWatermeterRepair: IotWatermeterRepair, m: M, ra: RA): String {
        if (!beanValidator(m, iotWatermeterRepair)) {
            return form(iotWatermeterId,iotWatermeterRepair, m)
        }
        iotWatermeterRepairService.saveWatermeterRepairAndWatermeter(iotWatermeterRepair,iotWatermeterId)
        addMessage(ra, "保存维修记录成功")
        return "redirect:${Global.getAdminPath()}/iot/iotWatermeterRepair/?iotWatermeterId="+iotWatermeterId+"&watermeterNumForSelect="+iotWatermeterRepair.watermeterNumNew
    }
}