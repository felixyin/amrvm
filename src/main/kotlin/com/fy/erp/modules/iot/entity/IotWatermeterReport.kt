package com.fy.erp.modules.iot.entity

import com.fy.erp.common.persistence.DataEntity
import java.util.*

/**
 * 水表流量信息Entity
 * 分析图表 所需数据的封装类 （最终需转换为json）
 * @author 尹彬
 * @version 2017-12-05
 */
class IotWatermeterReport : DataEntity<IotWatermeterReport> {

//    ----------------------------------------------------- 返回json结果
    /**
     * x 轴 时间相关数据
     */
    var dateNames: List<String> = listOf<String>()

    /**
     * 分类对象：{分类名称，分类的数据}
     * map                   <name,    datas>
     */
    var legends: Map<String, MutableList<Int>> = mapOf<String, MutableList<Int>>()


    constructor() : super() {}

    constructor(id: String) : super(id) {}


// ========================================================================================

}

/**
 * 图表查询参数封装类
 */
class IotEchartsParam {

//    ----------------------------------------------------- 查询参数
    /**
     * 名称 id
     */
    var idsSqlIn: String? = null

    /**
     * 统计类型
     */
    var statisticsType: Int = 1

    /**
     * 统计时间
     */
    var dateNameType: Int = 1

    /**
     * 开始时间
     */
    var startTime: String? = null

    /**
     * 结束时间
     */
    var endTime: String? = null

    /*
    iw.watermeter_type AS legendNameId,
            iwf.collect_cw AS dateNamz,
            SUM ( iwf.flow_week ) AS valuz
     */
    var columnStatisticsType: String = "watermeter_type"
    var columnDateNameType: String = "collect_cw"
    var columnFlowWeek: String = "flow_week"

}

/**
 * 图表数据库数据封装类
 */
class IotEchartsDbRow {
    /**
     * 分类名称 在字典表中对应的id
     */
    var legendNameId: String = ""

    /**
     * 根据分类查询出的某一日期类型的 值
     */
    var valuz: Int = 0

    /**
     * 日期类型（日、周、月、季、年）对应的字符串，如：第3周、2017-12、2017
     */
    var dateNamz: String = ""
}
