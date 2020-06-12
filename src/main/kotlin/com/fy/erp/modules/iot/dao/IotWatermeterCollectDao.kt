package com.fy.erp.modules.iot.dao

import com.fy.erp.common.persistence.CrudDao
import com.fy.erp.common.persistence.annotation.MyBatisDao
import com.fy.erp.modules.iot.entity.IotWatermeterCollect

/**
 * ˮ��ɼ���ϢDAO�ӿ�
 * @author �
 * @version 2017-12-09
 */
@MyBatisDao
interface IotWatermeterCollectDao: CrudDao<IotWatermeterCollect> {

// ========================================================================================

    fun findCollectList(iotWatermeterCollect: IotWatermeterCollect):List<IotWatermeterCollect>
}