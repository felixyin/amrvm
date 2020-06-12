package com.fy.erp.modules.iot.service

import com.fy.erp.common.persistence.Page
import com.fy.erp.common.service.CrudService
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional

import com.fy.erp.modules.iot.entity.IotWatermeterCollect
import com.fy.erp.modules.iot.dao.IotWatermeterCollectDao

/**
 * 水表采集信息Service
 * @author 杨超
 * @version 2017-12-09
 */
@Service
@Transactional(readOnly = true)
class IotWatermeterCollectService: CrudService<IotWatermeterCollectDao, IotWatermeterCollect>() {

// ========================================================================================


    fun findCollectList(page: Page<IotWatermeterCollect>, iotWatermeterCollect: IotWatermeterCollect): Page<IotWatermeterCollect> {
        // 总条数
        iotWatermeterCollect.page = page
        page.list = dao.findCollectList(iotWatermeterCollect)
        return page
    }


}