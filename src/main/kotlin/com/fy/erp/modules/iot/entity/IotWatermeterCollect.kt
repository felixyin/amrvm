package com.fy.erp.modules.iot.entity

import org.hibernate.validator.constraints.Length
import java.util.Date
import com.fasterxml.jackson.annotation.JsonFormat
import com.fy.erp.common.persistence.DataEntity

/**
 * ˮ��ɼ���ϢEntity
 * @author �
 * @version 2017-12-09
 */
class IotWatermeterCollect: DataEntity<IotWatermeterCollect> {

	var watermeterNum: String? = null 		// ˮ����
	var collectTime: Date? = null 		// �ɼ�ʱ��
	var totalFlow: Double? = null 		// ˮ�����

	constructor() : super() {}

    constructor(id: String) : super(id) {}


// ========================================================================================

	var iotWatermeter:IotWatermeter = IotWatermeter()

}