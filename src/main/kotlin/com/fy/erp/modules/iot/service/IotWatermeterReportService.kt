package com.fy.erp.modules.iot.service

import com.fy.erp.common.service.CrudService
import com.fy.erp.modules.iot.dao.IotWatermeterReportDao
import com.fy.erp.modules.iot.entity.IotEchartsDbRow
import com.fy.erp.modules.iot.entity.IotEchartsParam
import com.fy.erp.modules.iot.entity.IotWatermeterReport
import com.fy.erp.modules.sys.utils.DictUtils.getDictLabel
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional

/**
 * 水表流量信息Service
 * @author 尹彬
 * @version 2017-12-05
 */
@Service
@Transactional(readOnly = true)
class IotWatermeterReportService : CrudService<IotWatermeterReportDao, IotWatermeterReport>() {


// ========================================================================================

    fun findMaxCountByWatermeter(watermeterNumOld: String?): String {
        return dao.findMaxCountByWatermeter(watermeterNumOld)
    }

    /**
     * 分析计算 得出图表需要的数据
     */
    fun findEchartsData(iotEchartsParam: IotEchartsParam): IotWatermeterReport {

        /**
         * 计算mybatis中sql的“参数”
         */
        fun calParams(iotEchartsParam: IotEchartsParam): IotEchartsParam {
            iotEchartsParam.columnStatisticsType = when (iotEchartsParam.statisticsType) {
                1 -> "watermeter_type"
                2 -> "device_type"
                3 -> "farm_name"
                4 -> "concentrator_name"
                5 -> "house_name"
                else -> "watermeter_type"
            }
            val columns = when (iotEchartsParam.dateNameType) {
                1 -> "collect_cd" to "flow_day"
                2 -> "collect_cw" to "flow_day"
                3 -> "collect_cm" to "flow_day"
                4 -> "collect_cq" to "flow_day"
                5 -> "collect_cy" to "flow_day"
                else -> "collect_cw" to "flow_day"
            }
            iotEchartsParam.columnDateNameType = columns.first
            iotEchartsParam.columnFlowWeek = columns.second
            return iotEchartsParam
        }

        val dbRowList = dao.findEchartsData(calParams(iotEchartsParam))

        /**
         * 计算图表需要的json数据
         */
        fun calResult(iotEchartsParam: IotEchartsParam, dbRowList: List<IotEchartsDbRow>): IotWatermeterReport {
            val iotWatermeterReport = IotWatermeterReport()
            val legends = mutableMapOf<String, MutableList<Int>>()

            val dateNameList = mutableListOf<String>()
            dbRowList.forEach {
                dateNameList.add(it.dateNamz.trim())
                val legendName = when (iotEchartsParam.statisticsType) {
                    1 -> getDictLabel(it.legendNameId.toString(), "enum_watermeter_type", "")
                    2 -> getDictLabel(it.legendNameId.toString(), "enmu_device_type", "")
                    3 -> it.legendNameId
                    4 -> it.legendNameId
                    5 -> it.legendNameId
                    else -> "watermeter_type"
                }
                var datas = legends[legendName]
                if (datas == null) {
                    datas = mutableListOf<Int>()
                }
                datas.add(it.valuz)
                legends.put(legendName, datas)
            }

            iotWatermeterReport.dateNames = dateNameList.distinct()
            iotWatermeterReport.legends = legends
            return iotWatermeterReport
        }

        return calResult(iotEchartsParam, dbRowList);
    }


    fun findMapData():List<Map<String,Int>>{
        return dao.findMapData()
    }
    fun findTopData():Map<String,Int>{
        return mapOf(
                "farmCount" to dao.findTopFarmData(),
                "watermeterCount" to dao.findTopWatermeterData(),
                "totalFlow" to dao.findTopCountFlowData(),
                "todayTotalFlow" to dao.findTopTodayFlowData()
        )
    }
    fun indexArea(farmNameDecode: String):Map<String,Any>{
        var legendList = mutableListOf<String>()
        val list = dao.findAreaData(farmNameDecode)
        list.forEach {
            legendList.add(it["name"].toString())
        }

        return mapOf(
                "legend" to legendList,
                "data" to list
        )
    }

    fun indexBar(watermeterTypeDecode: String, farmNameDecode: String):Map<String,Any>{
        /*return mapOf(
           "xAxis" to listOf("产房1", "产房2", "待转舍1", "待转舍2", "配种1", "配种2"),
           "series" to listOf(10, 52, 200, 334, 390, 330)
       );*/
        var xAxisList = mutableListOf<String>()
        var seriesList = mutableListOf<String>()
        val list = dao.findBarData(watermeterTypeDecode,farmNameDecode)
        list.forEach {
            xAxisList.add(it["name"].toString())
            seriesList.add(it["value"].toString())
        }

        return mapOf(
                "xAxis" to xAxisList,
                "series" to seriesList
        )
    }

    fun indexBarLlj(watermeterTypeDecode: String, farmNameDecode: String):Map<String,Any>{
        /*return mapOf(
           "xAxis" to listOf("产房1", "产房2", "待转舍1", "待转舍2", "配种1", "配种2"),
           "series" to listOf(10, 52, 200, 334, 390, 330)
       );*/
        var yAxisList = mutableListOf<String>()
        var seriesList = mutableListOf<String>()
        val list = dao.findBarLljData(watermeterTypeDecode,farmNameDecode)
        list.forEach {
            yAxisList.add(it["name"].toString())
            seriesList.add(it["value"].toString())
        }

        return mapOf(
                "yAxis" to yAxisList,
                "series" to seriesList
        )
    }



}