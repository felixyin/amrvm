package com.fy.erp.modules.iot.entity

import org.hibernate.validator.constraints.Length
import com.fy.erp.common.persistence.DataEntity

/**
 * ˮ��������ֵEntity
 * @author ����
 * @version 2017-12-06
 */
class IotWatermeterVpt: DataEntity<IotWatermeterVpt> {

	var minFlow: Float? = null 		// ��Сֵ
	var maxFlow: Float? = null 		// ���ֵ
	var dateName: String? = null 		// ���ڷ�Χ

	constructor() : super() {}

    constructor(id: String) : super(id) {}


// ========================================================================================

}