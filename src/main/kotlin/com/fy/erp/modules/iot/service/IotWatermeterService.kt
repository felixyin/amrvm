package com.fy.erp.modules.iot.service

import com.fy.erp.common.persistence.Page
import com.fy.erp.common.service.TreeService
import com.fy.erp.common.utils.StringUtils
import com.fy.erp.modules.iot.dao.IotWatermeterCollectDao
import com.fy.erp.modules.iot.dao.IotWatermeterDao
import com.fy.erp.modules.iot.entity.IotWatermeter
import com.fy.erp.modules.iot.entity.IotWatermeterCollect
import com.fy.erp.modules.iot.entity.IotWatermeterFlow
import com.fy.erp.modules.sys.utils.UserUtils
import org.apache.commons.lang3.StringUtils.isNotBlank
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional
import java.lang.reflect.InvocationTargetException
import javax.annotation.Resource

// 常量
const val ZERO = 0.0F

/**
 * 水表管理Service
 * @author 杨超
 * @version 2017-12-04
 */
@Service
@Transactional(readOnly = true)
class IotWatermeterService : TreeService<IotWatermeterDao, IotWatermeter>() {

    // ========================================================================================


/*
    fun findWatermeterList(iotWatermeter: IotWatermeter): List<IotWatermeter> {
        val user = UserUtils.getUser() // 获取当前登录用户
        if (!user.isAdmin) {  // 不是系统管理员 就查询相应的权限
            iotWatermeter.sqlMap["dsf"] = user.id
        }
        if (StringUtils.isNotBlank(iotWatermeter.parentIds)) {
            iotWatermeter.parentIds = "," + iotWatermeter.parentIds + ","
        }
        return this.dao.findWatermeterList(iotWatermeter)
    }*/


    @Transactional(readOnly = false)
    @Throws(InvocationTargetException::class, IllegalAccessException::class)
    fun saveOrderNum(iotWatermeterList: List<IotWatermeter>): Boolean {
        for (iotWatermeter in iotWatermeterList) {
//            val iotWatermeter2 = this.get(iotWatermeter.id)
//            iotWatermeter2.orderNo = iotWatermeter.orderNo
//            this.save(iotWatermeter2)
            println(iotWatermeter.id + "   " + iotWatermeter.orderNo)
            dao.updateOrderNo(iotWatermeter.id, iotWatermeter.orderNo)
        }
        return true
    }

}