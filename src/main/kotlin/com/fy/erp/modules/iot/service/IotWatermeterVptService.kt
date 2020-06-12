package com.fy.erp.modules.iot.service

import com.fy.erp.common.service.CrudService
import com.fy.erp.common.utils.CacheUtils
import com.fy.erp.modules.iot.dao.IotWatermeterVptDao
import com.fy.erp.modules.iot.entity.IotWatermeterVpt
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional

const val CACHE_VPT_MAP = "CACHE_VPT_MAP"

/**
 * ˮ��������ֵService
 * @author ����
 * @version 2017-12-06
 */
@Service
@Transactional(readOnly = true)
class IotWatermeterVptService : CrudService<IotWatermeterVptDao, IotWatermeterVpt>() {

// ========================================================================================

    @Transactional(readOnly = false)
    fun switchFlag(iotWatermeterVpt: IotWatermeterVpt) {

        iotWatermeterVpt.delFlag = if (iotWatermeterVpt.delFlag == "0") "1" else "0"
        dao.update(iotWatermeterVpt)

//        需要在修改、禁用、启用后，立即清理缓存
        CacheUtils.remove(CACHE_VPT_MAP)
    }


    override fun save(entity: IotWatermeterVpt?): Int {
        return super.save(entity).let {

            //        需要在修改、禁用、启用后，立即清理缓存
            CacheUtils.remove(CACHE_VPT_MAP)
            it
        }
    }


    /**
     * 返回系统配置的流量阈值map
     */
    fun findVptMap(): Map<String?, Float?> {

        val cache = CacheUtils.get(CACHE_VPT_MAP)
        if (cache != null) return cache as Map<String?, Float?>

        return this.findList(IotWatermeterVpt())
                .filter { it.delFlag == "0" }
                .map { mapOf(it.dateName to it.maxFlow) }
                .reduce { map, next -> map + next }
                .let {
                    CacheUtils.put(CACHE_VPT_MAP, it)
                    it
                }
    }
}