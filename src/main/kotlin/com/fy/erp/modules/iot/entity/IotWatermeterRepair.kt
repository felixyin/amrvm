package com.fy.erp.modules.iot.entity

import org.hibernate.validator.constraints.Length
import java.util.Date
import com.fasterxml.jackson.annotation.JsonFormat
import com.fy.erp.common.persistence.DataEntity
import com.fy.erp.modules.sys.entity.User

/**
 * ˮ��ά�޼�¼Entity
 * @author �
 * @version 2017-12-06
 */
class IotWatermeterRepair: DataEntity<IotWatermeterRepair> {

	var watermeterNumNew: String? = null 		// ��ˮ����
	var watermeterNumOld: String? = null 		// ��ˮ����
	var countOld: String? = null 		// ��ˮ�����
	var repairBy: User? = null 		// ά����
	@get:JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	var repairTime: Date? = null 		// ά��ʱ��
	var repairType: String = "2"		// ά������
	var repairPhoto: String? = null 		// ά����Ƭ
	var faultType: String? = null 		// ��������
	var repairDesc: String? = null 		// ά������
	var faultDesc: String? = null 		// ��������
	var watermeterNumForSelect: String? = null 		// ��ѯ�����ֶ�

	constructor() : super() {}

    constructor(id: String) : super(id) {}


// ========================================================================================

	var iotWatermeterId : String? = null // ��ֵ��
}