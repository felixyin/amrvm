package com.fy.erp.modules.iot.entity

import org.hibernate.validator.constraints.Length
import java.util.Date
import com.fasterxml.jackson.annotation.JsonFormat
import com.fy.erp.common.persistence.DataEntity

/**
 * 水表采集信息Entity
 * @author 杨超
 * @version 2017-12-09
 */
class IotWatermeterCollect: DataEntity<IotWatermeterCollect> {

	var watermeterNum: String? = null 		// 水表编号
	var collectTime: Date? = null 		// 采集时间
	var totalFlow: Double? = null 		// 水表读数

	constructor() : super() {}

    constructor(id: String) : super(id) {}


// ========================================================================================

	var iotWatermeter:IotWatermeter = IotWatermeter()

}