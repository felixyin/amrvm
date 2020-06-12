package com.fy.erp.modules.iot.service

import com.fy.erp.alias.*
import com.fy.erp.common.service.CrudService
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional

import com.fy.erp.modules.iot.entity.IotWatermeterRepair
import com.fy.erp.modules.iot.dao.IotWatermeterRepairDao
import com.fy.erp.modules.iot.entity.IotWatermeter
import org.apache.commons.lang3.StringUtils

/**
 * 水表维修记录Service
 * @author 杨超
 * @version 2017-12-06
 */
@Service
@Transactional(readOnly = true)
class IotWatermeterRepairService: CrudService<IotWatermeterRepairDao, IotWatermeterRepair>() {

    @A
    lateinit var iotWatermeterService: IotWatermeterService

// ========================================================================================

    @Transactional(readOnly = false)
    fun saveWatermeterRepairAndWatermeter(iotWatermeterRepair: IotWatermeterRepair, iotWatermeterId: String?) {

        // 1.1 查询老表本身的信息
        val iotWatermeter = iotWatermeterService.get(IotWatermeter(iotWatermeterId))

        // 1.2 修改老表的老编号 为 更换的新表编号
        if(StringUtils.isNotEmpty(iotWatermeterRepair.watermeterNumNew)){
            iotWatermeter.watermeterNum = iotWatermeterRepair.watermeterNumNew
            iotWatermeterService.save(iotWatermeter)
        }

        // 2 保存维修记录
        iotWatermeterRepair.watermeterNumForSelect = iotWatermeterRepair.watermeterNumNew
        this.save(iotWatermeterRepair)

        // 3.1 查询维修记录，根据老表表号
        iotWatermeterRepair.watermeterNumForSelect = iotWatermeterRepair.watermeterNumOld
        val list = this.findList(iotWatermeterRepair)

        // 3.2 更新老表维系记录里的 查询冗余字段（select） 为 新表编号
        /*
            watermeterNumForSelect 为维修列表查询时，可以通过新表编号，快速查询出所有维修记录，而且根据时间倒序
         */
        list.map {
            it.watermeterNumForSelect = iotWatermeterRepair.watermeterNumNew
            this.save(it)
        }
    }
}