package com.fy.erp.modules.iot.web

import com.fy.erp.alias.*
import com.google.common.collect.Lists
import org.apache.commons.lang3.StringUtils.*
import com.fy.erp.common.config.Global
import com.fy.erp.common.mapper.JsonMapper
import com.fy.erp.common.persistence.Page

import com.fy.erp.modules.iot.entity.IotWatermeter
import com.fy.erp.modules.iot.entity.IotWatermeterCollect
import com.fy.erp.modules.iot.entity.IotWatermeterFlow
import com.fy.erp.modules.iot.entity.IotWatermeterVpt
import com.fy.erp.modules.iot.service.IotWatermeterCollectService
import com.fy.erp.modules.iot.service.IotWatermeterFlowService
import com.fy.erp.modules.iot.service.IotWatermeterService
import com.fy.erp.modules.iot.service.IotWatermeterVptService
import org.springframework.web.bind.annotation.RequestBody
import java.lang.reflect.InvocationTargetException

/**
 * 水表管理Controller
 * @author 杨超
 * @version 2017-12-04
 */
@C
@RM("\${adminPath}/iot/iotWatermeter")
class IotWatermeterController : BC() {

	@A
    lateinit var iotWatermeterService: IotWatermeterService
    @A
    lateinit var iotWatermeterVptService: IotWatermeterVptService
    @A
    lateinit var iotWatermeterFlowService: IotWatermeterFlowService
    @A
    lateinit var iotWatermeterCollectService:IotWatermeterCollectService

	
	@MA
	operator fun get(@RP(required = false) id: String?): IotWatermeter {
        return if (isNoneBlank(id)) iotWatermeterService.get(id!!) else IotWatermeter()
    }

	@PERM("iot:iotWatermeter:list")
//    @RM(*arrayOf("list", ""))
    fun list(iotWatermeter: IotWatermeter, req: REQ, res: RES, m: M): String {
        val list = iotWatermeterFlowService.findTreeList(iotWatermeter)
        val vptList = iotWatermeterVptService.findVptMap()

        m.addAttribute("vptFlow", JsonMapper.toJsonString(vptList))
        m.addAttribute("list", list)
        return "modules/iot/iotWatermeterList"
    }

	@PERM("iot:iotWatermeter:form")
    @RM("form")
    fun form(iotWatermeter: IotWatermeter, m: M): String {
        if (iotWatermeter.parent != null && isNotBlank(iotWatermeter.parent!!.id)) {
            iotWatermeter.setParent(iotWatermeterService.get(iotWatermeter.parent!!.id))
            // 获取排序号，最末节点排序号+30
            if (isBlank(iotWatermeter.id)) {
                val iotWatermeterChild = IotWatermeter()
                iotWatermeterChild.setParent(IotWatermeter(iotWatermeter.parent!!.id))
                val list = iotWatermeterService.findList(iotWatermeter)
                if (list.size > 0) {
                    iotWatermeter.sort = list[list.size - 1].sort
                    if (iotWatermeter.sort != null) {
                        iotWatermeter.sort = iotWatermeter.sort!! + 30
                    }
                }
            }
        }
        if (iotWatermeter.sort == null) {
            iotWatermeter.sort = 30
        }
        m.addAttribute("iotWatermeter", iotWatermeter)
        return "modules/iot/iotWatermeterForm"
    }

    @RM("view")
    @PERM("iot:iotWatermeter:view")
    fun view(iotWatermeter: IotWatermeter, m: M): String {
        m.addAttribute("iotWatermeter", iotWatermeter)
        m.addAttribute("isForEdit", false)
        return "modules/iot/iotWatermeterView"
    }

	@PERM("iot:iotWatermeter:save")
    @RM("save")
    fun save(iotWatermeter: IotWatermeter, m: M, ra: RA): String {
        if (!beanValidator(m, iotWatermeter)) {
            return form(iotWatermeter, m)
        }
        iotWatermeterService.save(iotWatermeter)
        addMessage(ra, "保存水表成功")
        return "redirect:${Global.getAdminPath()}/iot/iotWatermeter/?repage"
    }

	@PERM("iot:iotWatermeter:edit")
    @RM("delete")
    fun delete(iotWatermeter: IotWatermeter, ra: RA): String {
        iotWatermeterService.delete(iotWatermeter)
        addMessage(ra, "删除水表成功")
        return "redirect:${Global.getAdminPath()}/iot/iotWatermeter/?repage"
    }

	@PERM("iot:iotWatermeter:treeData")
    @RB
    @RM("treeData")
    fun treeData(@RP(required = false) extId: String?, res: RES): List<Map<String, Any>> {
        val mapList = Lists.newArrayList<Map<String, Any>>()
        val list = iotWatermeterService.findList(IotWatermeter())
        list.indices
                .map { list[it] }
                .filter { isBlank(extId) || extId != null && extId != it.id && it.parentIds!!.indexOf(",$extId,") == -1 }
                .mapTo(mapList) { mapOf("id" to it.id!!, "pId" to it.parentId, "name" to it.name!!) }
        return mapList
    }

	// ========================================================================================

    /**
     * 水表管理 - 列表
     */
    @PERM("iot:iotWatermeter:list")
    @RM(*arrayOf("list", ""))
    fun listWatermeter(iotWatermeter: IotWatermeter, m: M): String {
        val list = iotWatermeterFlowService.findTreeList(iotWatermeter)
        val vptList = iotWatermeterVptService.findVptMap()

        m.addAttribute("vptFlow", vptList.let { JsonMapper.toJsonString(it) })
        m.addAttribute("list", list)
        return "modules/iot/iotWatermeterList"
    }

    /**
     * 水表层级的目录选择树
     */
    @PERM("iot:iotWatermeter:treeData")
    @RB
    @RM("treeData2")
    fun treeData2(@RP(required = false) extId: String?, res: RES): List<Map<String, Any>> {
        val mapList = Lists.newArrayList<Map<String, Any>>()
        val list = iotWatermeterFlowService.findTreeList(IotWatermeter())
        list.indices
                .map { list[it] }
                .filter { isBlank(extId) || extId != null && extId != it.id && it.parentIds!!.indexOf(",$extId,") == -1 }
                .mapTo(mapList) {
                    if(isNotEmpty(it.watermeterNum)){
                        mapOf("id" to it.id!!, "pId" to it.parentId, "name" to it.name!!+"-"+it.watermeterNum!!)
                    }else{
                        mapOf("id" to it.id!!, "pId" to it.parentId, "name" to it.name!!)
                    }
                }
        return mapList
    }


    /**
     * 水表采集信息
     */
    @PERM("iot:iotWatermeter:reportList")
    @RM("collectList")
    fun collectList(iotWatermeterCollect: IotWatermeterCollect, req: REQ, res: RES, m: M): String {
        iotWatermeterCollect.iotWatermeter = req.session.getAttribute("iotWatermeter") as IotWatermeter
        val page = iotWatermeterCollectService.findCollectList(Page(req, res), iotWatermeterCollect)
        m.addAttribute("page", page)
        return "modules/iot/iotWatermeterCollectList"
    }

    /**
     * 保存排序
     */
    @PERM("iot:iotWatermeter:list")
    @RM("saveOrderNum")
    @RB
    @Throws(InvocationTargetException::class, IllegalAccessException::class)
    fun saveOrderNum(@RequestBody iotWatermeterList : List<IotWatermeter> ):Boolean{
        return iotWatermeterService.saveOrderNum(iotWatermeterList)
    }

}