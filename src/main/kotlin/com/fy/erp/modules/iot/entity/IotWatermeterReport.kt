package com.fy.erp.modules.iot.entity

import com.fy.erp.common.persistence.DataEntity
import java.util.*

/**
 * ˮ��������ϢEntity
 * ����ͼ�� �������ݵķ�װ�� ��������ת��Ϊjson��
 * @author ����
 * @version 2017-12-05
 */
class IotWatermeterReport : DataEntity<IotWatermeterReport> {

//    ----------------------------------------------------- ����json���
    /**
     * x �� ʱ���������
     */
    var dateNames: List<String> = listOf<String>()

    /**
     * �������{�������ƣ����������}
     * map                   <name,    datas>
     */
    var legends: Map<String, MutableList<Int>> = mapOf<String, MutableList<Int>>()


    constructor() : super() {}

    constructor(id: String) : super(id) {}


// ========================================================================================

}

/**
 * ͼ���ѯ������װ��
 */
class IotEchartsParam {

//    ----------------------------------------------------- ��ѯ����
    /**
     * ���� id
     */
    var idsSqlIn: String? = null

    /**
     * ͳ������
     */
    var statisticsType: Int = 1

    /**
     * ͳ��ʱ��
     */
    var dateNameType: Int = 1

    /**
     * ��ʼʱ��
     */
    var startTime: String? = null

    /**
     * ����ʱ��
     */
    var endTime: String? = null

    /*
    iw.watermeter_type AS legendNameId,
            iwf.collect_cw AS dateNamz,
            SUM ( iwf.flow_week ) AS valuz
     */
    var columnStatisticsType: String = "watermeter_type"
    var columnDateNameType: String = "collect_cw"
    var columnFlowWeek: String = "flow_week"

}

/**
 * ͼ�����ݿ����ݷ�װ��
 */
class IotEchartsDbRow {
    /**
     * �������� ���ֵ���ж�Ӧ��id
     */
    var legendNameId: String = ""

    /**
     * ���ݷ����ѯ����ĳһ�������͵� ֵ
     */
    var valuz: Int = 0

    /**
     * �������ͣ��ա��ܡ��¡������꣩��Ӧ���ַ������磺��3�ܡ�2017-12��2017
     */
    var dateNamz: String = ""
}
