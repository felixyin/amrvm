package com.fy.erp.modules.iot.entity

import com.fy.erp.modules.sys.entity.Office
import org.hibernate.validator.constraints.Length
import com.fy.erp.common.persistence.DataEntity

/**
 * ��Ƶ�������Entity
 * @author ����
 * @version 2017-12-06
 */
class IotVideoMonitor: DataEntity<IotVideoMonitor> {

	var office: Office? = null 		// ����
	@get:Length(min=0, max=25, message="�˺ų��ȱ������ 0 �� 25 ֮��")
	var account: String? = null // �˺�
	@get:Length(min=0, max=25, message="���볤�ȱ������ 0 �� 25 ֮��")
	var password: String? = null 		// ����
	@get:Length(min=0, max=25, message="��������ַ���ȱ������ 0 �� 25 ֮��")
	var ip: String? = null 		// ��������ַ
	@get:Length(min=0, max=10, message="�豸�˿ڳ��ȱ������ 0 �� 10 ֮��")
	var devicePort: String? = null // �豸�˿�
	@get:Length(min=0, max=10, message="����˿ڳ��ȱ������ 0 �� 10 ֮��")
	var httpPort: String? = null // ����˿�
	var windowCount: Int? = 2// ���ڷָ���

	constructor() : super() {}

    constructor(id: String) : super(id) {}


// ========================================================================================

}