package com.fy.erp.modules.iot.service

import com.fy.erp.BaseJunit
import com.fy.erp.modules.iot.entity.IotWatermeter
import org.junit.After
import org.junit.Before
import org.junit.Test

import org.junit.Assert.*
import javax.annotation.Resource

class IotWatermeterFlowServiceTest : BaseJunit() {


    @Resource
    lateinit var iotWatermeterFlowService: IotWatermeterFlowService

    @Before
    fun setUp() {
    }

    @After
    fun tearDown() {
    }

    @Test
    fun exportXls() {
        val outputPath = "/Users/fy/workspace/project/amrvm/amrvm/src/main/kotlin/xls-template/report1-op.xlsx"
        iotWatermeterFlowService.exportXls(IotWatermeter(),outputPath)
    }

}