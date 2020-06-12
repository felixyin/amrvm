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
 * ˮ��ά�޼�¼Service
 * @author �
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

        // 1.1 ��ѯ�ϱ������Ϣ
        val iotWatermeter = iotWatermeterService.get(IotWatermeter(iotWatermeterId))

        // 1.2 �޸��ϱ���ϱ�� Ϊ �������±���
        if(StringUtils.isNotEmpty(iotWatermeterRepair.watermeterNumNew)){
            iotWatermeter.watermeterNum = iotWatermeterRepair.watermeterNumNew
            iotWatermeterService.save(iotWatermeter)
        }

        // 2 ����ά�޼�¼
        iotWatermeterRepair.watermeterNumForSelect = iotWatermeterRepair.watermeterNumNew
        this.save(iotWatermeterRepair)

        // 3.1 ��ѯά�޼�¼�������ϱ���
        iotWatermeterRepair.watermeterNumForSelect = iotWatermeterRepair.watermeterNumOld
        val list = this.findList(iotWatermeterRepair)

        // 3.2 �����ϱ�άϵ��¼��� ��ѯ�����ֶΣ�select�� Ϊ �±���
        /*
            watermeterNumForSelect Ϊά���б��ѯʱ������ͨ���±��ţ����ٲ�ѯ������ά�޼�¼�����Ҹ���ʱ�䵹��
         */
        list.map {
            it.watermeterNumForSelect = iotWatermeterRepair.watermeterNumNew
            this.save(it)
        }
    }
}