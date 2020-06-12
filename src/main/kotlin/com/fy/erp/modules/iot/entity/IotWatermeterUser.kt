package com.fy.erp.modules.iot.entity

import com.fy.erp.modules.sys.entity.User
import org.hibernate.validator.constraints.Length
import com.fy.erp.common.persistence.DataEntity

/**
 * 管理员和猪场中间表Entity
 * @author 杨超
 * @version 2017-12-05
 */
class IotWatermeterUser: DataEntity<IotWatermeterUser> {

	var user: User? = null 		// 用户ID
	var iotWatermeter: IotWatermeter? = null 		// 猪场

	constructor() : super() {}

    constructor(id: String) : super(id) {}


// ========================================================================================

	constructor(user: User) : super() {
		this.user = user
	}

	constructor(user: User?, iotWatermeter: IotWatermeter):super(){
		this.user = user
		this.iotWatermeter = iotWatermeter
	}

    constructor(user: User?, iotWatermeter: IotWatermeter, s: String):super(){
		this.user = user
		this.iotWatermeter = iotWatermeter
		this.remarks = s
	}

}