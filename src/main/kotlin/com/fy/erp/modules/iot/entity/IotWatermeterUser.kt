package com.fy.erp.modules.iot.entity

import com.fy.erp.modules.sys.entity.User
import org.hibernate.validator.constraints.Length
import com.fy.erp.common.persistence.DataEntity

/**
 * ����Ա�����м��Entity
 * @author �
 * @version 2017-12-05
 */
class IotWatermeterUser: DataEntity<IotWatermeterUser> {

	var user: User? = null 		// �û�ID
	var iotWatermeter: IotWatermeter? = null 		// ��

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