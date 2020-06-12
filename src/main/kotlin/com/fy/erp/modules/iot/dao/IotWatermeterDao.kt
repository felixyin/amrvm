package com.fy.erp.modules.iot.dao

import com.fy.erp.common.persistence.TreeDao
import com.fy.erp.common.persistence.annotation.MyBatisDao
import com.fy.erp.modules.iot.entity.IotWatermeter
import com.fy.erp.modules.iot.entity.IotWatermeterCollect
import com.fy.erp.modules.iot.entity.IotWatermeterFlow
import org.apache.ibatis.annotations.Param

/**
 * 水表管理DAO接口
 * @author 杨超
 * @version 2017-12-04
 */
@MyBatisDao
interface IotWatermeterDao : TreeDao<IotWatermeter> {


    // ========================================================================================
    /**
     *
     */
    fun findParentIdsByIds(@Param("ids") ids: String): List<String>

    fun findNewWatermeterFromSqlServer(): List<IotWatermeter>
    fun findWatermeterList(iotWatermeter: IotWatermeter): List<IotWatermeter>
    fun deleteAll()
    fun updateOrderNo(@Param("id") id: String?, @Param("orderNo") orderNo: Int?)
    fun findAllOrderNo():List<IotWatermeter>


}
