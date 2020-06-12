package com.fy.erp.modules.iot.dao

import com.fy.erp.common.persistence.CrudDao
import com.fy.erp.common.persistence.annotation.MyBatisDao
import com.fy.erp.modules.iot.entity.IotWatermeter
import com.fy.erp.modules.iot.entity.IotWatermeterFlow
import org.apache.ibatis.annotations.Param

/**
 * 水表流量信息DAO接口
 * @author 尹彬
 * @version 2017-12-05
 */
@MyBatisDao
interface IotWatermeterFlowDao : CrudDao<IotWatermeterFlow> {

    // ========================================================================================

    fun findWatermeterReportList(iotWatermeter: IotWatermeter): List<IotWatermeter>

    fun findWatermeterTypeReportList(iotWatermeter: IotWatermeter): List<IotWatermeter>

    fun findWatermeterParentList(@Param("idsSqlIn")idsSqlIn: String): List<IotWatermeter>

    fun findWatermeterFlowList(@Param("date") date: String?): List<IotWatermeterFlow>

    fun findWatermeterReportFlowList(iotWatermeter: IotWatermeter): List<IotWatermeter>

    fun deleteByDate(@Param("date") date: String?):Int

    fun selectByDate(@Param("date") date: String?): List<IotWatermeterFlow>

    fun findMaxCountByWatermeter(watermeterNumOld: String?): String

    fun findTreeList(iotWatermeter: IotWatermeter): List<IotWatermeter>


}