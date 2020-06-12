package com.fy.erp.modules.iot.service

import com.fy.erp.common.service.CrudService
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional

import com.fy.erp.modules.iot.entity.IotVideoMonitor
import com.fy.erp.modules.iot.dao.IotVideoMonitorDao

/**
 *  ”∆µº‡øÿ…Ë÷√Service
 * @author “¸±Ú
 * @version 2017-12-06
 */
@Service
@Transactional(readOnly = true)
class IotVideoMonitorService: CrudService<IotVideoMonitorDao, IotVideoMonitor>() {

// ========================================================================================

}