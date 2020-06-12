package com.fy.erp.modules.iot.dao

import com.fy.erp.common.persistence.CrudDao
import com.fy.erp.common.persistence.annotation.MyBatisDao
import com.fy.erp.modules.iot.entity.IotWatermeterRepair

/**
 * 水表维修记录DAO接口
 * @author 杨超
 * @version 2017-12-06
 */
@MyBatisDao
interface IotWatermeterRepairDao: CrudDao<IotWatermeterRepair> {

// ========================================================================================
}