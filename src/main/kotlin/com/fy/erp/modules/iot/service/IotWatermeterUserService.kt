package com.fy.erp.modules.iot.service

import com.fy.erp.common.service.CrudService
import com.fy.erp.modules.iot.dao.IotWatermeterDao
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional

import com.fy.erp.modules.iot.entity.IotWatermeterUser
import com.fy.erp.modules.iot.dao.IotWatermeterUserDao
import com.fy.erp.modules.iot.entity.IotWatermeter
import com.fy.erp.modules.sys.entity.User
import org.apache.commons.lang3.StringUtils
import org.springframework.beans.factory.annotation.Autowired

/**
 * ����Ա�����м��Service
 * @author �
 * @version 2017-12-05
 */
@Service
@Transactional(readOnly = true)
class IotWatermeterUserService : CrudService<IotWatermeterUserDao, IotWatermeterUser>() {

    @Autowired
    lateinit var iotWatermeterDao: IotWatermeterDao

    // ========================================================================================
    fun getIotWatermeterUserByUser(iotWatermeterUser: IotWatermeterUser): IotWatermeterUser {
        return dao.getIotWatermeterUserByUser(iotWatermeterUser)
    }

    @Transactional(readOnly = false)
    fun saveWatermeterUser(iotWatermeterUser: IotWatermeterUser) {
        val ids = iotWatermeterUser.iotWatermeter!!.id!!.split(",")

        //  ����ѡ�е�ˮ���id���ҵ����еĸ��ڵ��id
        val idsInSql = ids.joinToString("','", "'", "'")
        println(idsInSql)
        val parentIds = iotWatermeterDao.findParentIdsByIds(ids = idsInSql)

        //  ����ĳ���û�������ˮ��Ȩ��
        this.deleteByUser(iotWatermeterUser.user)

        //  Ϊĳ���û���������µ�Ȩ��
        ids.forEach {
            if(StringUtils.isNotBlank(it)){
                this.save(IotWatermeterUser(iotWatermeterUser.user, IotWatermeter(it),"1"))
            }
        }
        parentIds.map { it.split(",") }.flatMap{it.asIterable()}.distinct().forEach {
            if(StringUtils.isNotBlank(it)){
                this.save(IotWatermeterUser(iotWatermeterUser.user, IotWatermeter(it),"2"))
            }
        }
    }

    @Transactional(readOnly = false)
    fun deleteByUser(user: User?) {
        this.dao.deleteByUser(user)
    }

    fun findLeafList(user: User): IotWatermeterUser {
        return if (this.findList(IotWatermeterUser(user)).size <= 0) {
            IotWatermeterUser(user)
        } else {
            val list = this.findListByUserAndLeaf(IotWatermeterUser(user))

            val iotWatermeter = IotWatermeter()
            iotWatermeter.name = list.map { it.iotWatermeter!!.name }.joinToString(",")
            iotWatermeter.id = list.map { it.iotWatermeter!!.id }.joinToString(",")

            val iotWatermeterUser = IotWatermeterUser(user)
            iotWatermeterUser.iotWatermeter = iotWatermeter
            iotWatermeterUser
        }
    }

    fun findListByUserAndLeaf(iotWatermeterUser: IotWatermeterUser): List<IotWatermeterUser> {
        return this.dao.findListByUserAndLeaf(iotWatermeterUser)
    }

}