package com.fy.erp.modules.iot.entity

import org.hibernate.validator.constraints.Length
import java.util.Date
import com.fasterxml.jackson.annotation.JsonFormat
import com.fy.erp.common.persistence.DataEntity
import com.fy.erp.modules.sys.entity.User

/**
 * 水表维修记录Entity
 * @author 杨超
 * @version 2017-12-06
 */
class IotWatermeterRepair: DataEntity<IotWatermeterRepair> {

	var watermeterNumNew: String? = null 		// 新水表编号
	var watermeterNumOld: String? = null 		// 老水表编号
	var countOld: String? = null 		// 老水表读数
	var repairBy: User? = null 		// 维修人
	@get:JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	var repairTime: Date? = null 		// 维修时间
	var repairType: String = "2"		// 维修类型
	var repairPhoto: String? = null 		// 维修照片
	var faultType: String? = null 		// 故障类型
	var repairDesc: String? = null 		// 维修描述
	var faultDesc: String? = null 		// 故障描述
	var watermeterNumForSelect: String? = null 		// 查询冗余字段

	constructor() : super() {}

    constructor(id: String) : super(id) {}


// ========================================================================================

	var iotWatermeterId : String? = null // 传值用
}