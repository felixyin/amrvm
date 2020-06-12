package com.fy.erp.modules.job

import com.fy.erp.BaseJunit
import org.junit.After
import org.junit.Before
import org.junit.Test

import javax.annotation.Resource

class TableReworkServiceTest : BaseJunit() {

    @Resource
    lateinit var tableReworkService: TableReworkService

    @Before
    fun setUp() {
    }

    @After
    fun tearDown() {
    }

    @Test
    fun watermeterRework() {
        tableReworkService.watermeterRework()
    }

    @Test
    fun watermeterFlowRework() {
        tableReworkService.watermeterFlowRework()
    }

    @Test
    fun allRework() {
        tableReworkService.allRework()
    }


}