package com.fy.erp.modules.iot.service

import com.fy.erp.BaseJunit
import com.fy.erp.common.utils.ExportXlsUtil
import com.fy.erp.modules.iot.entity.IotWatermeter
import com.fy.erp.modules.iot.entity.IotWatermeterVpt
import org.junit.Test

import org.junit.Assert.*
import java.io.File
import java.io.FileInputStream
import java.io.FileOutputStream
import javax.annotation.Resource

class IotWatermeterReportServiceTest : BaseJunit() {

    @Resource
    lateinit var iotWatermeterReportService: IotWatermeterReportService

    @Resource
    lateinit var iotWatermeterFlowService: IotWatermeterFlowService

    @Resource
    lateinit var iotWatermeterVptService: IotWatermeterVptService

    @Resource
    lateinit var iotWatermeterService: IotWatermeterService

    @Test
    fun indexArea() {
        val indexArea = iotWatermeterReportService.indexArea("222")
        print(indexArea)
    }

    /**
     * µ¼³ö excel ²âÊÔ
     */
    @Test
    fun testExportExcel() {

        val list = iotWatermeterFlowService.findWatermeterReportList(IotWatermeter())

        val vptList = iotWatermeterVptService.findList(IotWatermeterVpt())
                .filter { it.delFlag == "0" }
                .map { mapOf(it.dateName to it.maxFlow) }
                .reduce { map, next -> map + next }

        val wtList = iotWatermeterFlowService.findWatermeterTypeReportListForExport(IotWatermeter())

        val map = hashMapOf<String, Any>()
        map.put("list", list)
        map.put("vptList", vptList)
        map.put("wtList", wtList)

        val template = "/Users/fy/workspace/project/amrvm/amrvm/src/main/kotlin/xls-template/report1.xlsx"
        val output = "/Users/fy/workspace/project/amrvm/amrvm/src/main/kotlin/xls-template/reportOut2.xlsx"

        ExportXlsUtil.exportExcel(FileInputStream(template), FileOutputStream(output), map)

        println("ok")

    }

}