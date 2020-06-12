package com.fy.erp.modules.iot.dao

import com.fy.erp.common.persistence.CrudDao
import com.fy.erp.common.persistence.annotation.MyBatisDao
import com.fy.erp.modules.iot.entity.IotWatermeterCollect

/**
 * 水表采集信息DAO接口
 * @author 杨超
 * @version 2017-12-09
 */
@MyBatisDao
interface IotWatermeterCollectDao: CrudDao<IotWatermeterCollect> {

// ========================================================================================

    fun findCollectList(iotWatermeterCollect: IotWatermeterCollect):List<IotWatermeterCollect>
}