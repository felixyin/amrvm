package com.fy.erp.modules.iot.service

import com.fy.erp.common.persistence.Page
import com.fy.erp.common.service.CrudService
import com.fy.erp.common.utils.ExportXlsUtil
import com.fy.erp.modules.iot.dao.IotWatermeterFlowDao
import com.fy.erp.modules.iot.entity.IotWatermeter
import com.fy.erp.modules.iot.entity.IotWatermeterFlow
import com.fy.erp.modules.sys.utils.DictUtils
import com.fy.erp.modules.sys.utils.UserUtils
import org.apache.commons.lang3.StringUtils
import org.jxls.area.XlsArea
import org.jxls.common.CellRef
import org.jxls.common.Context
import org.jxls.util.TransformerFactory
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional
import java.io.File
import java.io.FileInputStream
import java.io.FileOutputStream
import javax.annotation.Resource


/**
 * ˮ��������ϢService
 * @author ����
 * @version 2017-12-05
 */
@Service
@Transactional(readOnly = true)
class IotWatermeterFlowService : CrudService<IotWatermeterFlowDao, IotWatermeterFlow>() {


    // ========================================================================================
    @Resource
    lateinit var iotWatermeterUserService: IotWatermeterUserService
    @Resource
    lateinit var iotWatermeterVptService: IotWatermeterVptService

    fun findMaxCountByWatermeter(watermeterNumOld: String?): String {
        return dao.findMaxCountByWatermeter(watermeterNumOld)
    }


    /**
     * ˮ������б�
     * �����ҳ
     */
    fun findTreeList(iotWatermeter: IotWatermeter): List<IotWatermeter> {
//        TODO ����Ҫ���û���Ϣһ����Ϊkey��һ���֣���Ϊ�������������������ͬ�����������õ�����Ȩ�޲�ͬ�����Բ�Ӧ������ͬ������
//        val cacheKey = iotWatermeter.returnCacheKey()
//        val cache = CacheUtils.get(cacheKey)
//        if (cache != null) return cache as List<IotWatermeter>

        val user = UserUtils.getUser() // ��ȡ��ǰ��¼�û�
        if (!user.isAdmin) {  // ����ϵͳ����Ա �Ͳ�ѯ��Ӧ��Ȩ��
            iotWatermeter.sqlMap["dsf"] = user.id
        }
        if (com.fy.erp.common.utils.StringUtils.isNotBlank(iotWatermeter.parentIds)) {
            iotWatermeter.parentIds = "," + iotWatermeter.parentIds + ","
        }


//        ��ѯlevelTypeΪ4��ˮ�������������������ݣ�������
        val watermeterList = dao.findTreeList(iotWatermeter)


//        ����Ҷ�ӽڵ��Ӧ�ĸ���list��Ŀ¼�ڵ㣩
        val watermeterParentList = if (watermeterList.isNotEmpty()) {

//            ����Ҷ�ӽڵ����ݵ�parentId��ƴ��Ϊsql in
            val idsSqlIn = watermeterList.map { it.parentIds }.distinct()
                    .map { it.split(",") }.reduce { acc, list -> acc + list }.distinct()
                    .filterNot { it == "" }.joinToString("','", "'", "'")

            this.dao.findWatermeterParentList(idsSqlIn)
        } else listOf<IotWatermeter>()

//        �ϲ�Ҷ�ӽڵ��Ŀ¼�ڵ�
        var i = 0
        val list = watermeterList.plus(watermeterParentList)

        list.forEach {
            it.seq = ++i
        }

        return list.sortedBy { it.orderNo }
    }


    fun findWatermeterReportList(iotWatermeter: IotWatermeter): List<IotWatermeter> {
        processIotWatermeter(iotWatermeter)

        // Ҷ�ӽڵ��list
        val watermeterList = this.dao.findWatermeterReportList(iotWatermeter)
        watermeterList.map { it.iotWatermeterFlow }.filter { it != null }.map { it.countCd }

        //        hashMapOf<Pair<�ڵ�����,������>,ֵ>()
        val map = hashMapOf<Pair<String, String>, Float>()
        watermeterList.forEach { watermeter ->


            if (watermeter.parentIds != null) {
                val pIdList = watermeter.parentIds.split(",")
                pIdList.forEach {
                    val countCdKey = Pair(it, "countCd")
                    val oldCountCd = map[countCdKey] ?: ZERO
                    val newCountCd = watermeter.iotWatermeterFlow?.countCd?.toFloat() ?: ZERO
                    map[countCdKey] = oldCountCd + newCountCd

                    val flowDayKey = Pair(it, "flowDay")
                    val oldFlowDay = map[flowDayKey] ?: ZERO
                    val newFlowDay = watermeter.iotWatermeterFlow?.flowDay?.toFloat() ?: ZERO
                    map[flowDayKey] = oldFlowDay + newFlowDay

                    val flowWeekKey = Pair(it, "flowWeek")
                    val oldFlowWeek = map[flowWeekKey] ?: ZERO
                    val newFlowWeek = watermeter.iotWatermeterFlow?.flowWeek?.toFloat() ?: ZERO
                    map[flowWeekKey] = oldFlowWeek + newFlowWeek

                    val flowMonthKey = Pair(it, "flowMonth")
                    val oldFlowMonth = map[flowMonthKey] ?: ZERO
                    val newFlowMonth = watermeter.iotWatermeterFlow?.flowMonth?.toFloat() ?: ZERO
                    map[flowMonthKey] = oldFlowMonth + newFlowMonth

                    val flowQuarterKey = Pair(it, "flowQuarter")
                    val oldFlowQuarter = map[flowQuarterKey] ?: ZERO
                    val newFlowQuarter = watermeter.iotWatermeterFlow?.flowQuarter?.toFloat() ?: ZERO
                    map[flowQuarterKey] = oldFlowQuarter + newFlowQuarter

                    val flowYearKey = Pair(it, "flowYear")
                    val oldFlowYear = map[flowYearKey] ?: ZERO
                    val newFlowYear = watermeter.iotWatermeterFlow?.flowYear?.toFloat() ?: ZERO
                    map[flowYearKey] = oldFlowYear + newFlowYear
                }
            }
        }

        fun getOrZeroNull(id: String, datename: String): Float? {
            return if (map[Pair(id, datename)] == 0.0F) null else map[Pair(id, datename)]
        }

        // ����Ҷ�ӽڵ��Ӧ�ĸ���list
        val watermeterParentList = if (watermeterList.isNotEmpty()) {
            val idsSqlIn = watermeterList.map { it.parentIds }.distinct()
                    .map { it.split(",") }.reduce { acc, list -> acc + list }.distinct()
                    .filterNot { it == "" }.joinToString("','", "'", "'")
            val parentList = this.dao.findWatermeterParentList(idsSqlIn)

            for (p in parentList) {
                val f = IotWatermeterFlow()
                f.countCd = getOrZeroNull(p.id, "countCd")
                f.flowDay = getOrZeroNull(p.id, "flowDay")
                f.flowWeek = getOrZeroNull(p.id, "flowWeek")
                f.flowMonth = getOrZeroNull(p.id, "flowMonth")
                f.flowQuarter = getOrZeroNull(p.id, "flowQuarter")
                f.flowYear = getOrZeroNull(p.id, "flowYear")
                p.iotWatermeterFlow = f
            }

            parentList
        } else listOf<IotWatermeter>()

        return (watermeterList + watermeterParentList).sortedBy { it.orderNo }
    }


    fun findWatermeterReportListForExport(iotWatermeter: IotWatermeter): List<IotWatermeter> {
        processIotWatermeter(iotWatermeter)

        // Ҷ�ӽڵ��list
        val watermeterList = this.dao.findWatermeterReportList(iotWatermeter)
        watermeterList.map { it.iotWatermeterFlow }.filter { it != null }.map { it.countCd }

        //        hashMapOf<Pair<�ڵ�����,������>,ֵ>()
        val map = hashMapOf<Pair<String, String>, Float>()
        watermeterList.forEach { watermeter ->


            if (watermeter.parentIds != null) {
                val pIdList = watermeter.parentIds.split(",")
                pIdList.forEach {
                    val countCdKey = Pair(it, "countCd")
                    val oldCountCd = map[countCdKey] ?: ZERO
                    val newCountCd = watermeter.iotWatermeterFlow?.countCd?.toFloat() ?: ZERO
                    map[countCdKey] = oldCountCd + newCountCd

                    val flowDayKey = Pair(it, "flowDay")
                    val oldFlowDay = map[flowDayKey] ?: ZERO
                    val newFlowDay = watermeter.iotWatermeterFlow?.flowDay?.toFloat() ?: ZERO
                    map[flowDayKey] = oldFlowDay + newFlowDay

                    val flowWeekKey = Pair(it, "flowWeek")
                    val oldFlowWeek = map[flowWeekKey] ?: ZERO
                    val newFlowWeek = watermeter.iotWatermeterFlow?.flowWeek?.toFloat() ?: ZERO
                    map[flowWeekKey] = oldFlowWeek + newFlowWeek

                    val flowMonthKey = Pair(it, "flowMonth")
                    val oldFlowMonth = map[flowMonthKey] ?: ZERO
                    val newFlowMonth = watermeter.iotWatermeterFlow?.flowMonth?.toFloat() ?: ZERO
                    map[flowMonthKey] = oldFlowMonth + newFlowMonth

                    val flowQuarterKey = Pair(it, "flowQuarter")
                    val oldFlowQuarter = map[flowQuarterKey] ?: ZERO
                    val newFlowQuarter = watermeter.iotWatermeterFlow?.flowQuarter?.toFloat() ?: ZERO
                    map[flowQuarterKey] = oldFlowQuarter + newFlowQuarter

                    val flowYearKey = Pair(it, "flowYear")
                    val oldFlowYear = map[flowYearKey] ?: ZERO
                    val newFlowYear = watermeter.iotWatermeterFlow?.flowYear?.toFloat() ?: ZERO
                    map[flowYearKey] = oldFlowYear + newFlowYear
                }
            }

            watermeter.watermeterType = DictUtils.getDictLabel(watermeter.watermeterType, "enum_watermeter_type", "")
            watermeter.deviceType = DictUtils.getDictLabel(watermeter.deviceType, "enmu_device_type", "")
            watermeter.watermeterStatus = DictUtils.getDictLabel(watermeter.watermeterStatus, "enmu_watermeter_status", "")
        }

        fun getOrZeroNull(id: String, datename: String): Float? {
            return if (map[Pair(id, datename)] == 0.0F) null else map[Pair(id, datename)]
        }

        // ����Ҷ�ӽڵ��Ӧ�ĸ���list
        val watermeterParentList = if (watermeterList.isNotEmpty()) {
            val idsSqlIn = watermeterList.map { it.parentIds }.distinct()
                    .map { it.split(",") }.reduce { acc, list -> acc + list }.distinct()
                    .filterNot { it == "" }.joinToString("','", "'", "'")
            val parentList = this.dao.findWatermeterParentList(idsSqlIn)

            for (p in parentList) {
                val f = IotWatermeterFlow()
                f.countCd = getOrZeroNull(p.id, "countCd")
                f.flowDay = getOrZeroNull(p.id, "flowDay")
                f.flowWeek = getOrZeroNull(p.id, "flowWeek")
                f.flowMonth = getOrZeroNull(p.id, "flowMonth")
                f.flowQuarter = getOrZeroNull(p.id, "flowQuarter")
                f.flowYear = getOrZeroNull(p.id, "flowYear")
                p.iotWatermeterFlow = f
            }

            parentList
        } else listOf<IotWatermeter>()

        return (watermeterList + watermeterParentList).sortedBy { it.orderNo }
    }

    fun findWatermeterTypeReportListForExport(iotWatermeter: IotWatermeter): List<IotWatermeter> {
        processIotWatermeter(iotWatermeter)

        // Ҷ�ӽڵ��list
        val watermeterList = this.dao.findWatermeterTypeReportList(iotWatermeter)
        watermeterList.map {
            it.watermeterType = DictUtils.getDictLabel(it.watermeterType, "enum_watermeter_type", "")
//            it.deviceType = DictUtils.getDictLabel(it.deviceType, "enmu_device_type", "")
//            it.watermeterStatus = DictUtils.getDictLabel(it.watermeterStatus, "enmu_watermeter_status", "")

            it
        }
//        watermeterList.map { it.iotWatermeterFlow }.filter { it != null }.map { it.countCd }
        return watermeterList
    }

    private fun processIotWatermeter(iotWatermeter: IotWatermeter) {
        val user = UserUtils.getUser() // ��ȡ��ǰ��¼�û�
        if (!user.isAdmin) {  // ����ϵͳ����Ա �Ͳ�ѯ��Ӧ��Ȩ��
            iotWatermeter.sqlMap["dsf"] = user.id
        }

        // ���Ƽ���
        val ids = iotWatermeter.ids?.split(",")?.distinct()
                ?.filterNot { it == "" }?.joinToString("','", "'", "'")
        iotWatermeter.idsSqlIn = if (ids == "''") null else ids

        // ��ˮ���ͼ���
        val watermeterType = iotWatermeter.watermeterType?.split(",")?.distinct()
                ?.filterNot { it == "" }?.joinToString("','", "'", "'")

        iotWatermeter.watermeterTypeSqlIn =
                if (StringUtils.isBlank(watermeterType) || watermeterType!!.contains("'-1'"))
                    null else watermeterType
    }

    /**
     *
     */
    fun findWatermeterReportFlowList(page: Page<IotWatermeter>, iotWatermeter: IotWatermeter): Page<IotWatermeter> {
        // ˮ��������ֵmap
        val vptMap = iotWatermeterVptService.findVptMap()

        // ������
        iotWatermeter.page = page

        page.list = dao.findWatermeterReportFlowList(iotWatermeter).map {
            //   ��ֵ                              ���ݿ��ѯ��������                -               ������ֵ���õ��������ֵ
            val overFlow = (it.iotWatermeterFlow.flow?.toDouble() ?: 0.0) - (vptMap[it.datename]?.toDouble() ?: 0.0)

            //            ������ɫ
            it.iotWatermeterFlow.colorFlowPair = if (overFlow > 0) mapOf("color" to "red", "flow" to overFlow) else mapOf()
            it
        }

        return page
    }

    /**
     *
     */
    fun exportXls(iotWatermeter: IotWatermeter, outputPath: String) {
        val list = this.findWatermeterReportListForExport(iotWatermeter)
        val wtList = this.findWatermeterTypeReportListForExport(iotWatermeter)

//        val dateTimeForList = list.filter { it.watermeterNum != null }[0]
        val dateTimeForWtList = wtList[0]

        val lastDate = list.map { it.iotWatermeterFlow.collectCd }.distinct()[0]

        val templatePath = ExportXlsUtil::class.java.classLoader.getResource("xls-template")!!.path
        val template = File(templatePath, "report1.xlsx")

        val map = hashMapOf<String, Any?>()
        map["list"] = list
        map["wtList"] = wtList
        map["lastDate"] = lastDate
//        map["dateTimeForList"] = dateTimeForList
        map["dateTimeForWtList"] = dateTimeForWtList

        ExportXlsUtil.exportExcel(FileInputStream(template), FileOutputStream(outputPath), map)

//        val transformer = TransformerFactory.createTransformer(FileInputStream(template), FileOutputStream(outputPath))
//
//        val context1 = Context()
//        context1.putVar("lastDate", lastDate ?: "-----")
//        context1.putVar("list", list)
//        val sheet1Area = XlsArea("123!A1:N4", transformer)
//        sheet1Area.applyAt(CellRef("123!A5"), context1)
//
//        val context2 = Context()
//        context2.putVar("lastDate", lastDate ?: "-----")
//        context2.putVar("wtList", wtList)
//        val sheet2Area = XlsArea("234!A1:C3", transformer)
//        sheet2Area.applyAt(CellRef("234!A1"), context2)
//
//        sheet1Area.processFormulas()
//        sheet2Area.processFormulas()
//        transformer.write()
    }

}