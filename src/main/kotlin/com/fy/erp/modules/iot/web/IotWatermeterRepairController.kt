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
 * ά��ˮ��Controller
 * @author �������
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
     * ˮ����� - ά��ˮ�� - �б�
     */
    @RM(*arrayOf("list", ""))
    @PERM("iot:iotWatermeterRepair:list")
    fun list(@RP(required=false) iotWatermeterId:String?,iotWatermeterRepair: IotWatermeterRepair, req: REQ, res: RES, m: M, ra: RA): String{

//        ά�޼�¼�б�
        val list = iotWatermeterRepairService.findList(iotWatermeterRepair)
        m.addAttribute("list", list)

//        ������ʾˮ����Ϣ
        val iotWatermeter = iotWatermeterService.get(IotWatermeter(iotWatermeterId)) // ???uuid??????
        m.addAttribute("iotWatermeter", iotWatermeter)

//        session��¼ά�ޱ�� FIXME ?? ������
//        iotWatermeterRepair.iotWatermeterId = iotWatermeterId
//        req.session.setAttribute("iotWatermeterRepair",iotWatermeterRepair)

        return "modules/iot/iotWatermeterRepairList"
    }

    /**
     * ˮ����� - ά��ˮ�� - ά�޼�¼���
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
     * ˮ����� - ά��ˮ�� - ά�޼�¼��� - ����
     */
    @RM("save")
    @PERM("iot:iotWatermeterRepair:save")
    fun save(@RP(required=false) iotWatermeterId:String?,iotWatermeterRepair: IotWatermeterRepair, m: M, ra: RA): String {
        if (!beanValidator(m, iotWatermeterRepair)) {
            return form(iotWatermeterId,iotWatermeterRepair, m)
        }
        iotWatermeterRepairService.saveWatermeterRepairAndWatermeter(iotWatermeterRepair,iotWatermeterId)
        addMessage(ra, "����ά�޼�¼�ɹ�")
        return "redirect:${Global.getAdminPath()}/iot/iotWatermeterRepair/?iotWatermeterId="+iotWatermeterId+"&watermeterNumForSelect="+iotWatermeterRepair.watermeterNumNew
    }
}