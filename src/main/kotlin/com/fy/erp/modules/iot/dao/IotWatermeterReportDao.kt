package com.fy.erp.modules.iot.dao

import com.fy.erp.common.persistence.CrudDao
import com.fy.erp.common.persistence.annotation.MyBatisDao
import com.fy.erp.modules.iot.entity.IotEchartsDbRow
import com.fy.erp.modules.iot.entity.IotEchartsParam
import com.fy.erp.modules.iot.entity.IotWatermeterReport
import org.apache.ibatis.annotations.Param

/**
 * 水表流量信息DAO接口
 * @author 尹彬
 * @version 2017-12-05
 */
@MyBatisDao
interface IotWatermeterReportDao : CrudDao<IotWatermeterReport> {

    // ========================================================================================
    fun findWatermeterFlowList(date: String?): List<IotWatermeterReport>

    //    fun updateByWatermeterNum(iotWatermeterFlow: IotWatermeterFlow)
    fun deleteByDate(date: String?): Int

    fun findMaxCountByWatermeter(watermeterNumOld: String?): String

    fun findEchartsData(iotEchartsParam: IotEchartsParam): List<IotEchartsDbRow>


    fun findMapData(): List<Map<String, Int>>

    fun findTopFarmData(): Int
    fun findTopWatermeterData(): Int
    fun findTopCountFlowData(): Int
    fun findTopTodayFlowData(): Int
    fun findAreaData(@Param("farmNameDecode")farmNameDecode: String): List<Map<String, Int>>
    fun findBarData(@Param("watermeterTypeDecode")watermeterTypeDecode: String,@Param("farmNameDecode")farmNameDecode: String): List<Map<String, Int>>
    fun findBarLljData(@Param("watermeterTypeDecode")watermeterTypeDecode: String,@Param("farmNameDecode")farmNameDecode: String): List<Map<String, Int>>

}