package com.fy.erp.modules.iot.entity

import org.hibernate.validator.constraints.Length
import com.fy.erp.common.persistence.DataEntity
import java.util.*

/**
 * ˮ��������ϢEntity
 * @author ����
 * @version 2017-12-05
 */
class IotWatermeterFlow: DataEntity<IotWatermeterFlow> {

	var watermeterNum: String? = null 		// ˮ����
	var countCd: Float? = null 		// �ն���
	var collectCd: String? = null 		// ����
	var flowDay: Float? = null 		// ������
	var countCw: Float? = null 		// �ܶ���
	var collectCw: String? = null 		// ��
	var flowWeek: Float? = null 		// ������
	var countCm: Float? = null 		// �¶���
	var collectCm: String? = null 		// �·�
	var flowMonth: Float? = null 		// ������
	var countCq: Float? = null 		// ������
	var collectCq: String? = null 		// ����
	var flowQuarter: Float? = null 		// ������
	var countCy: Float? = null 		// �����
	var collectCy: String? = null 		// ���
	var flowYear: Float? = null 		// ������

	constructor() : super() {}

    constructor(id: String) : super(id) {}


// ========================================================================================

	var collect : String? = null // ����
	var flow : Float? = null	 // ����
    var colorFlowPair : Map<String,Any> = mapOf() // ������ɫ������
}