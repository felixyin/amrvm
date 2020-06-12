package com.fy.erp.modules.iot.entity

import com.fy.erp.modules.sys.entity.Office
import org.hibernate.validator.constraints.Length
import com.fy.erp.common.persistence.DataEntity

/**
 * 视频监控设置Entity
 * @author 尹彬
 * @version 2017-12-06
 */
class IotVideoMonitor: DataEntity<IotVideoMonitor> {

	var office: Office? = null 		// 猪场名
	@get:Length(min=0, max=25, message="账号长度必须介于 0 和 25 之间")
	var account: String? = null // 账号
	@get:Length(min=0, max=25, message="密码长度必须介于 0 和 25 之间")
	var password: String? = null 		// 密码
	@get:Length(min=0, max=25, message="服务器地址长度必须介于 0 和 25 之间")
	var ip: String? = null 		// 服务器地址
	@get:Length(min=0, max=10, message="设备端口长度必须介于 0 和 10 之间")
	var devicePort: String? = null // 设备端口
	@get:Length(min=0, max=10, message="网络端口长度必须介于 0 和 10 之间")
	var httpPort: String? = null // 网络端口
	var windowCount: Int? = 2// 窗口分割数

	constructor() : super() {}

    constructor(id: String) : super(id) {}


// ========================================================================================

}