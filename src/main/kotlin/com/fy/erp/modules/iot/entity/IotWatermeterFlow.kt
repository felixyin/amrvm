package com.fy.erp.modules.iot.entity

import org.hibernate.validator.constraints.Length
import com.fy.erp.common.persistence.DataEntity
import java.util.*

/**
 * 水表流量信息Entity
 * @author 尹彬
 * @version 2017-12-05
 */
class IotWatermeterFlow: DataEntity<IotWatermeterFlow> {

	var watermeterNum: String? = null 		// 水表编号
	var countCd: Float? = null 		// 日读数
	var collectCd: String? = null 		// 日期
	var flowDay: Float? = null 		// 日流量
	var countCw: Float? = null 		// 周读数
	var collectCw: String? = null 		// 周
	var flowWeek: Float? = null 		// 周流量
	var countCm: Float? = null 		// 月读数
	var collectCm: String? = null 		// 月份
	var flowMonth: Float? = null 		// 月流量
	var countCq: Float? = null 		// 季读数
	var collectCq: String? = null 		// 季度
	var flowQuarter: Float? = null 		// 季流量
	var countCy: Float? = null 		// 年读数
	var collectCy: String? = null 		// 年份
	var flowYear: Float? = null 		// 年流量

	constructor() : super() {}

    constructor(id: String) : super(id) {}


// ========================================================================================

	var collect : String? = null // 日期
	var flow : Float? = null	 // 流量
    var colorFlowPair : Map<String,Any> = mapOf() // 警告的顏色和流量
}