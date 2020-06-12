package com.fy.erp.modules.iot.service

import com.fy.erp.BaseJunit
import com.fy.erp.common.persistence.Page
import com.fy.erp.modules.iot.entity.IotWatermeter
import org.junit.After
import org.junit.Before
import org.junit.Test

import org.junit.Assert.*
import javax.annotation.Resource

class IotWatermeterServiceTest : BaseJunit() {

    @Resource
    lateinit var iotWatermeterService:IotWatermeterFlowService


    @Before
    fun setUp() {
    }

    @After
    fun tearDown() {
    }

    @Test
    fun findWatermeterReportList() {
        val iotWatermeter  = IotWatermeter()
        iotWatermeter.ids = ""
        iotWatermeter.datename = "0"
        iotWatermeter.startTime = "2017-12-01"
        iotWatermeter.endTime = "2017-12-03"

        val list = iotWatermeterService.findWatermeterReportList(iotWatermeter)
        list.forEach(::println)



    }

    @Test
    fun findWatermeterReportFlowList() {
        val iotWatermeter  = IotWatermeter()
        iotWatermeter.ids = ""
        iotWatermeter.datename = "0"
        iotWatermeter.startTime = "2017-12-01"
        iotWatermeter.endTime = "2017-12-03"
        iotWatermeter.id = "359a2327b29e46d8afe01c36b09b7979"
        val pages = Page<IotWatermeter>()
        val page = iotWatermeterService.findWatermeterReportFlowList(pages,iotWatermeter)
        page.list.forEach(::println)



    }


}