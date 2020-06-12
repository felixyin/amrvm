package com.fy.erp.modules.iot.entity

import org.hibernate.validator.constraints.Length
import com.fy.erp.common.persistence.DataEntity

/**
 * 水表流量阈值Entity
 * @author 尹彬
 * @version 2017-12-06
 */
class IotWatermeterVpt: DataEntity<IotWatermeterVpt> {

	var minFlow: Float? = null 		// 最小值
	var maxFlow: Float? = null 		// 最大值
	var dateName: String? = null 		// 日期范围

	constructor() : super() {}

    constructor(id: String) : super(id) {}


// ========================================================================================

}