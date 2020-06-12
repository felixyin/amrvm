package com.fy.erp.modules.iot.web

import com.fy.erp.alias.*
import com.fy.erp.common.config.Global
import com.fy.erp.common.mapper.JsonMapper
import com.fy.erp.common.persistence.Page
import com.fy.erp.common.utils.DateUtils
import com.fy.erp.modules.iot.entity.IotEchartsParam
import com.fy.erp.modules.iot.entity.IotWatermeterReport
import com.fy.erp.modules.iot.service.IotWatermeterReportService
import org.apache.commons.lang3.StringUtils.*
import org.springframework.web.bind.annotation.ResponseBody
import java.net.URLDecoder
import java.util.*

/**
 * 水表流量信息Controller
 * @author 尹彬
 * @version 2017-12-05
 */
@C
@RM("\${adminPath}/iot/iotWatermeterReport")
class IotWatermeterReportController : BC() {

    @A
    lateinit var iotWatermeterReportService: IotWatermeterReportService

    @MA
    operator fun get(@RP(required=false) id:String?): IotWatermeterReport {
        return if (isNotBlank(id)) iotWatermeterReportService.get(id!!) else IotWatermeterReport()
    }

    @RM(*arrayOf("list",""))
    @PERM("iot:iotWatermeterReport:list")
    fun list(iotWatermeterReport: IotWatermeterReport, req: REQ, res: RES, m: M): String{
        val page = iotWatermeterReportService.findPage(Page(req, res), iotWatermeterReport)
        m.addAttribute("page", page)
        return "modules/iot/iotWatermeterReportList"
    }

    @RM("form")
    @PERM("iot:iotWatermeterReport:form")
    fun form(iotWatermeterReport: IotWatermeterReport, m: M): String {
        m.addAttribute("iotWatermeterReport", iotWatermeterReport)
        return "modules/iot/iotWatermeterReportForm"
    }

    @RM("view")
    @PERM("iot:iotWatermeterReport:view")
    fun view(iotWatermeterReport: IotWatermeterReport, m: M): String {
        m.addAttribute("iotWatermeterReport", iotWatermeterReport)
        m.addAttribute("isForEdit", false)
        return "modules/iot/iotWatermeterReportView"
    }

    @RM("save")
    @PERM("iot:iotWatermeterReport:save")
    fun save(iotWatermeterReport: IotWatermeterReport, m: M, ra: RA): String {
        if (!beanValidator(m, iotWatermeterReport)) {
            return form(iotWatermeterReport, m)
        }
        iotWatermeterReportService.save(iotWatermeterReport)
        addMessage(ra, "保存水表流量信息成功")
        return "redirect:${Global.getAdminPath()}/iot/iotWatermeterReport/?repage"
    }

    @RM("delete")
    @PERM("iot:iotWatermeterReport:delete")
    fun delete(iotWatermeterReport: IotWatermeterReport, ra: RA): String {
        iotWatermeterReportService.delete(iotWatermeterReport)
        addMessage(ra, "删除水表流量信息成功")
        return "redirect:${Global.getAdminPath()}/iot/iotWatermeterReport/?repage"
    }

    // ========================================================================================

    private fun findIotWatermeterReport(iotEchartsParam: IotEchartsParam, m: M): IotWatermeterReport {
        /**
         * 如果按天统计，为防止数据量太大导致图表加载慢的问题，搜索的开始时间和结束时间的时间区间必须小于31天
         */
        fun validStartEndTime() {
            if (iotEchartsParam.dateNameType == 1) {
                val st: Date? = try {
                    DateUtils.parseDate(iotEchartsParam.startTime,"yyyy-MM-dd")
                } catch (e: Exception) {
                    null
                }
                var et: Date? = try {
                    DateUtils.parseDate(iotEchartsParam.endTime,"yyyy-MM-dd")
                } catch (e: Exception) {
                    null
                }

                if (et == null) {
                    et = Date()
                    iotEchartsParam.endTime = DateUtils.formatDate(et, "yyyy-MM-dd")
                }
                val eqT = DateUtils.addDays(et, -31)
                if (st == null || st.time < eqT.time) {
                    iotEchartsParam.startTime = DateUtils.formatDate(eqT, "yyyy-MM-dd")
                    m.addAttribute("message", "时间必填，为提高分析性能，按天统计分析的时间间隔不能超过31天")
                }
            }
        }

        validStartEndTime()

        val iotWatermeterReport = iotWatermeterReportService.findEchartsData(iotEchartsParam)
        return iotWatermeterReport
    }

    /**
     * 水表统计图表 jsp
     */
    @RM(*arrayOf("listTrend"))
    @PERM("iot:iotWatermeterReport:listTrend")
    fun listTrend(iotEchartsParam: IotEchartsParam, req: REQ, res: RES, m: M): String{

        val iotWatermeterReport = findIotWatermeterReport(iotEchartsParam, m)

        val toJsonString = JsonMapper.toJsonString(iotWatermeterReport)
        m.addAttribute("iotWatermeterReport",toJsonString )

        return "modules/iot/iotWatermeterEcharts"
    }

    /**
     * 水表统计图表 json
     */
    @ResponseBody
    @RM(*arrayOf("listTrendJson"))
    @PERM("iot:iotWatermeterReport:listTrend")
    fun listTrendJson(iotEchartsParam: IotEchartsParam, req: REQ, res: RES, m: M): Any {
        val iotWatermeterReport = findIotWatermeterReport(iotEchartsParam, m)
        return iotWatermeterReport;
    }
    /**
     * 显示水表统计图表
     */
    @RM(*arrayOf("index"))
    @PERM("iot:iotWatermeterReport:index")
    fun index(iotEchartsParam: IotEchartsParam, req: REQ, res: RES, m: M): String {
        return "modules/iot/index";
    }

    /**
     * 页面最上面的色块需要的数据
     */
    @ResponseBody
    @RM(*arrayOf("indexTopAnalyze"))
//    @PERM("iot:iotWatermeterReport:indexTopAnalyze")
    fun indexTopAnalyze(iotEchartsParam: IotEchartsParam, req: REQ, res: RES, m: M):Any {

// TODO 从数据库中查询计算得出数据

        return iotWatermeterReportService.findTopData()
        /*return mapOf<String,Int>(
                "farmCount" to 3,
                "watermeterCount" to 4,
                "totalFlow" to 328823,
                "todayTotalFlow" to 328
                )*/
    }

    /**
     * 地图需要的数据
     */
    @ResponseBody
    @RM(*arrayOf("indexMap"))
//    @PERM("iot:iotWatermeterReport:indexMap")
    fun indexMap(iotEchartsParam: IotEchartsParam, req: REQ, res: RES, m: M): Any {

        return iotWatermeterReportService.findMapData()
// TODO 从数据库中查询计算得出数据
//        return listOf( mapOf("name" to "临沭一场","value" to 22),mapOf( "name" to "临沭二场" ,"value" to 8));
    }

    /**
     * 用水类型图表需要的数据
     */
    @ResponseBody
    @RM(*arrayOf("indexArea"))
//    @PERM("iot:iotWatermeterReport:indexArea")
    fun indexArea(iotEchartsParam: IotEchartsParam,@RP(required=false)farmName: String?, req: REQ, res: RES, m: M): Any{
        val farmNameDecode = URLDecoder.decode(farmName,"UTF-8")
        println(farmNameDecode)

// TODO 从数据库中查询计算得出数据
        return iotWatermeterReportService.indexArea(farmNameDecode)
        /*return mapOf(
                "legend" to listOf("产房","待转舍","配种"),
                "data" to listOf(
                        mapOf("name" to "产房","value" to 23),
                        mapOf("name" to "待转舍","value" to 31),
                        mapOf("name" to "配种","value" to 15)
                    )
                )*/
    }

    /**
     * 底部的柱状图需要的数据
     */
    @ResponseBody
    @RM(*arrayOf("indexBar"))
//    @PERM("iot:iotWatermeterReport:indexBar")
    fun indexBar(iotEchartsParam: IotEchartsParam,@RP(required=false) farmName: String?,@RP(required=false) watermeterType: String?, req: REQ, res: RES, m: M): Any{
        var farmNameDecode = ""
        var watermeterTypeDecode = ""
        if(isNotBlank(farmName)){
            farmNameDecode = URLDecoder.decode(URLDecoder.decode(farmName,"UTF-8"),"UTF-8")
        }
        if(isNotBlank(watermeterType)){
            watermeterTypeDecode = URLDecoder.decode(watermeterType,"UTF-8")
        }
        return iotWatermeterReportService.indexBar(watermeterTypeDecode,farmNameDecode)
// TODO 从数据库中查询计算得出数据
        /*return mapOf(
            "xAxis" to listOf("产房1", "产房2", "待转舍1", "待转舍2", "配种1", "配种2"),
            "series" to listOf(10, 52, 200, 334, 390, 330)
        );*/
    }

    /**
     * 底部的柱状图需要的数据
     */
    @ResponseBody
    @RM(*arrayOf("indexBarLlj"))
//    @PERM("iot:iotWatermeterReport:indexBar")
    fun indexBarLlj(iotEchartsParam: IotEchartsParam,@RP(required=false) farmName: String?,@RP(required=false) watermeterType: String?, req: REQ, res: RES, m: M): Any{
        var farmNameDecode = ""
        var watermeterTypeDecode = ""
        if(isNotBlank(farmName)){
            farmNameDecode = URLDecoder.decode(URLDecoder.decode(farmName,"UTF-8"),"UTF-8")
        }
        if(isNotBlank(watermeterType)){
            watermeterTypeDecode = URLDecoder.decode(watermeterType,"UTF-8")
        }
        return iotWatermeterReportService.indexBarLlj(watermeterTypeDecode,farmNameDecode)
// TODO 从数据库中查询计算得出数据
        /*return mapOf(
            "xAxis" to listOf("产房1", "产房2", "待转舍1", "待转舍2", "配种1", "配种2"),
            "series" to listOf(10, 52, 200, 334, 390, 330)
        );*/
    }







}