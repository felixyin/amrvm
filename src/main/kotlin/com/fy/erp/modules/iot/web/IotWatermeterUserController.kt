package com.fy.erp.modules.iot.web

import com.fy.erp.alias.*
import com.fy.erp.common.config.Global
import com.fy.erp.common.persistence.Page
import com.fy.erp.modules.iot.entity.IotWatermeter
import org.apache.commons.lang3.StringUtils.*
import com.fy.erp.modules.iot.entity.IotWatermeterUser
import com.fy.erp.modules.iot.service.IotWatermeterUserService
import com.fy.erp.modules.sys.entity.User
import com.fy.erp.modules.sys.service.SystemService

/**
 * 管理员和猪场中间表Controller
 * @author 杨超
 * @version 2017-12-05
 */
@C
@RM("\${adminPath}/iot/iotWatermeterUser")
class IotWatermeterUserController : BC() {

	@A
	lateinit var iotWatermeterUserService: IotWatermeterUserService
    @A
    lateinit var systemService: SystemService
	
	@MA
	operator fun get(@RP(required=false) id:String?): IotWatermeterUser {
        // id 是用户ID
        val user = systemService.getUser(id)
		return if (isNotBlank(id)) {
            iotWatermeterUserService.findLeafList(user)
        } else IotWatermeterUser(user)
	}




    @RM("form")
	@PERM("iot:iotWatermeterUser:form")
    fun form(iotWatermeterUser: IotWatermeterUser, m: M): String {
        m.addAttribute("iotWatermeterUser", iotWatermeterUser)
		return "modules/iot/iotWatermeterUserForm"
    }

    @RM("save")
    @PERM("iot:iotWatermeterUser:save")
    fun save(iotWatermeterUser: IotWatermeterUser, m: M, ra: RA): String {
        if (!beanValidator(m, iotWatermeterUser)) {
            return form(iotWatermeterUser, m)
        }
        iotWatermeterUserService.saveWatermeterUser(iotWatermeterUser)
        addMessage(ra, "保存"+iotWatermeterUser.user!!.name+"的职责成功")
        m.addAttribute("messages","保存"+iotWatermeterUser.user!!.name+"的职责成功")
        return "include/success"
    }

    @RM("delete")
    @PERM("iot:iotWatermeterUser:delete")
    fun delete(iotWatermeterUser: IotWatermeterUser, ra: RA): String {
        iotWatermeterUserService.delete(iotWatermeterUser)
        addMessage(ra, "删除管理员和猪场中间表成功")
        return "redirect:${Global.getAdminPath()}/iot/iotWatermeterUser/?repage"
    }

    // ========================================================================================
}