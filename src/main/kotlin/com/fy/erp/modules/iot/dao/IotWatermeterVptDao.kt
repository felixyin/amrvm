package com.fy.erp.modules.iot.dao

import com.fy.erp.common.persistence.CrudDao
import com.fy.erp.common.persistence.annotation.MyBatisDao
import com.fy.erp.modules.iot.entity.IotWatermeterVpt

/**
 * 水表流量阈值DAO接口
 * @author 尹彬
 * @version 2017-12-06
 */
@MyBatisDao
interface IotWatermeterVptDao: CrudDao<IotWatermeterVpt> {

// ========================================================================================
}