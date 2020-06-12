package com.fy.erp.modules.job

import com.fy.erp.common.utils.IdGen
import com.fy.erp.modules.iot.dao.IotWatermeterDao
import com.fy.erp.modules.iot.dao.IotWatermeterFlowDao
import com.fy.erp.modules.iot.entity.IotWatermeter
import com.fy.erp.modules.sys.dao.OfficeDao
import com.fy.erp.modules.sys.entity.Office
import com.fy.erp.modules.sys.utils.DictUtils
import com.fy.erp.modules.sys.utils.UserUtils
import org.apache.commons.lang3.StringUtils
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.context.annotation.Lazy
import org.springframework.scheduling.annotation.Scheduled
import org.springframework.stereotype.Service
import java.text.SimpleDateFormat
import java.util.*

@Service
@Lazy(true)
class TableReworkService {

    @Autowired
    lateinit var officeDao: OfficeDao

    @Autowired
    lateinit var iotWatermeterDao: IotWatermeterDao

    @Autowired
    lateinit var iotWatermeterFlowDao: IotWatermeterFlowDao

/*
    @Autowired
    lateinit var iotWatermeterService: IotWatermeterService

    @Autowired
    lateinit var iotWatermeterFlowService: IotWatermeterFlowService
*/

    /**
     * FIXME 暂时不考虑多个猪场，同时处理性能问题，因为部署第二个猪场，此逻辑将会作废，部署前不要忘了配置cron参数
     * 系统完全会重新开发这块逻辑，并且硬件也会换成自己的硬件
     */
    fun watermeterRework() {

//        找到所有猪场名称和编号 以备可以通过水表猪场信息可快速得到对应公司的uuid
        val officeList = officeDao.findAllList(Office()).filter { it.type == "2" /*顶级的部门：公司*/ }
                .map { mapOf(it.name to it.id) }
                .reduce { map, next -> map + next }

        val insertWatermeterList = iotWatermeterDao.findNewWatermeterFromSqlServer()// TODO  sqlServerWatermeterList - iotWatermeterList

// 2、 如果A的记录数大于0，
        if (insertWatermeterList.isNotEmpty()) {
            val oldWatermeterList = iotWatermeterDao.findAllOrderNo()

            val farmNameUuidMap = hashMapOf<String, String>()
            val houseNameUuidMap = hashMapOf<String, String>()
            val watermeterList = mutableListOf<IotWatermeter>()


            insertWatermeterList.forEach {

                val officeId = officeList[it.farmName]
                println(it.watermeterType)

                val wt = it.watermeterType
                if (wt == "水帘") {

                    if (farmNameUuidMap[it.farmName].isNullOrBlank()) {
                        val id = IdGen.uuid()
                        farmNameUuidMap[it.farmName] = id

                        val iotWatermeter = IotWatermeter()
                        iotWatermeter.id = id
                        iotWatermeter.name = it.farmName
                        iotWatermeter.farmName = it.farmName
                        iotWatermeter.parent = IotWatermeter("0")
                        iotWatermeter.parentIds = "0"
                        iotWatermeter.levelType = "1"
                        iotWatermeter.office = Office(officeId)

                        watermeterList.add(iotWatermeter)
                    }
                    if (houseNameUuidMap["水帘"].isNullOrBlank()) {
                        val id = IdGen.uuid()
                        houseNameUuidMap["水帘"] = id

                        val iotWatermeter = IotWatermeter()
                        iotWatermeter.id = id
                        iotWatermeter.name = "水帘"
                        iotWatermeter.farmName = it.farmName
                        iotWatermeter.concentratorName = it.concentratorName
                        iotWatermeter.concentratorNum = it.concentratorNum
                        iotWatermeter.houseName = "水帘"

                        val farmUuid = farmNameUuidMap[it.farmName]!!
                        iotWatermeter.parent = IotWatermeter(farmUuid)
                        iotWatermeter.parentIds = arrayListOf<String>("0", farmUuid).joinToString(",")
                        iotWatermeter.levelType = "2"
                        iotWatermeter.office = Office(officeId)

                        watermeterList.add(iotWatermeter)
                    }

                    val id = IdGen.uuid()
                    it.id = id
                    it.name = it.roomName
                    val farmUuid = farmNameUuidMap[it.farmName]!!
                    val houseUuid = houseNameUuidMap["水帘"]!!
                    it.parent = IotWatermeter(houseUuid)
                    it.parentIds = arrayListOf<String>("0", farmUuid, /*concentratorUuid,*/ houseUuid).joinToString(",")
                    it.levelType = "3"
                    it.watermeterType = DictUtils.getDictValue(wt, "enum_watermeter_type", "0")
                    it.watermeterStatus = DictUtils.getDictValue(it.watermeterStatus, "enmu_watermeter_status", "0")
                    it.office = Office(officeId)

                    watermeterList.add(it)

                } else { // 非水帘 ，水表

                    if (farmNameUuidMap[it.farmName].isNullOrBlank()) {
                        val id = IdGen.uuid()
                        farmNameUuidMap[it.farmName] = id

                        val iotWatermeter = IotWatermeter()
                        iotWatermeter.id = id
                        iotWatermeter.name = it.farmName
                        iotWatermeter.farmName = it.farmName
                        iotWatermeter.parent = IotWatermeter("0")
                        iotWatermeter.parentIds = "0"
                        iotWatermeter.levelType = "1"
                        iotWatermeter.office = Office(officeId)

                        watermeterList.add(iotWatermeter)
                    }
                    if (houseNameUuidMap[it.houseName].isNullOrBlank()) {
                        val id = IdGen.uuid()
                        houseNameUuidMap[it.houseName] = id

                        val iotWatermeter = IotWatermeter()
                        iotWatermeter.id = id
                        iotWatermeter.name = it.houseName
                        iotWatermeter.farmName = it.farmName
                        iotWatermeter.concentratorName = it.concentratorName
                        iotWatermeter.concentratorNum = it.concentratorNum
                        iotWatermeter.houseName = it.houseName

                        val farmUuid = farmNameUuidMap[it.farmName]!!
                        iotWatermeter.parent = IotWatermeter(farmUuid)
                        iotWatermeter.parentIds = arrayListOf<String>("0", farmUuid).joinToString(",")
                        iotWatermeter.levelType = "2"
                        iotWatermeter.office = Office(officeId)

                        watermeterList.add(iotWatermeter)
                    }

                    val id = IdGen.uuid()
                    it.id = id
                    it.name = it.roomName
                    val farmUuid = farmNameUuidMap[it.farmName]!!
                    val houseUuid = houseNameUuidMap[it.houseName]!!
                    it.parent = IotWatermeter(houseUuid)
                    it.parentIds = arrayListOf<String>("0", farmUuid, /*concentratorUuid,*/ houseUuid).joinToString(",")
                    it.levelType = "3"
                    it.watermeterType = DictUtils.getDictValue(it.watermeterType, "enum_watermeter_type", "0")
                    it.watermeterStatus = DictUtils.getDictValue(it.watermeterStatus, "enmu_watermeter_status", "0")
                    it.office = Office(officeId)

                    watermeterList.add(it)
                }
            }

            println("-----------------------")

//            iotWatermeterDao.deleteAll()

            watermeterList.forEach {
                val user = UserUtils.getUser()
                if (StringUtils.isNotBlank(user.id)) {
                    it.updateBy = user
                    it.createBy = user
                }
                it.updateDate = Date()
                it.createDate = it.updateDate


                val filter = oldWatermeterList.filter { xx ->
                    xx.watermeterNum == it.watermeterNum && xx.houseName == it.houseName
                }
                if (filter.isNotEmpty()) { // 更新
                    val ww = filter[0]
                    it.id = ww.id
                    it.parent = IotWatermeter(ww.parent.id)
                    it.parentIds = ww.parentIds
                    it.orderNo = ww.orderNo
                    iotWatermeterDao.update(it)
                } else { // 插入
                    iotWatermeterDao.insert(it)
                }
            }

        }

    }


    fun watermeterFlowRework() {

// 3、 查询v_watermeter_all_flow_v1水表流量视图，条件是：所有水表当天的数据，得出要更新的数据
        val date = Date()
        val sdf = SimpleDateFormat("yyyy-MM-dd")
        var now = sdf.format(date)
//        now = null

        val flowList = iotWatermeterFlowDao.findWatermeterFlowList(now)

// 4、 如果A的记录数大于0，根据日期、水表编号，更新流量记录
        if (flowList.isNotEmpty()) {

//            val oldFlowList = iotWatermeterFlowDao.selectByDate(now)

// 4.1、 清除当前统计数据
            val deleteCount = iotWatermeterFlowDao.deleteByDate(now)
            println("deleteFlowCount:" + deleteCount)

// 4.2、 保存当天统计数据
            flowList.forEach {
                val user = UserUtils.getUser()
                if (StringUtils.isNotBlank(user.id)) {
                    it.updateBy = user
                    it.createBy = user
                }
                it.updateDate = Date()
                it.createDate = it.updateDate

//                val filter = oldFlowList.filter { xx ->
//                    xx.watermeterNum == it.watermeterNum
//                }
//                if (filter.isNotEmpty()) { // 更新
//                    val ww = filter[0]
//                    it.id = ww.id
//                    iotWatermeterFlowDao.update(it)
//                } else { // 插入
                it.id = IdGen.uuid()
                iotWatermeterFlowDao.insert(it)
//                }
            }
        }

    }


    /**
     * 凌晨1点执行
     */
    @Scheduled(cron = "0 0 1 * * ?")
    fun allRework() {
        watermeterRework()
        watermeterFlowRework()
    }

    /**
     * 下午1点执行
     */
    @Scheduled(cron = "0 0 13 * * ?")
    fun allRework2() {
        watermeterRework()
        watermeterFlowRework()
    }

}