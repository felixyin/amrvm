package com.fy.erp.modules.iot.dao

import com.fy.erp.common.persistence.CrudDao
import com.fy.erp.common.persistence.annotation.MyBatisDao
import com.fy.erp.modules.iot.entity.IotWatermeterUser
import com.fy.erp.modules.sys.entity.User

/**
 * ����Ա�����м��DAO�ӿ�
 * @author �
 * @version 2017-12-05
 */
@MyBatisDao
interface IotWatermeterUserDao: CrudDao<IotWatermeterUser> {

// ========================================================================================

    fun getIotWatermeterUserByUser(iotWatermeterUser : IotWatermeterUser): IotWatermeterUser

    fun deleteByUser(user: User?)

    fun findListByUserAndLeaf(iotWatermeterUser: IotWatermeterUser): List<IotWatermeterUser>
}