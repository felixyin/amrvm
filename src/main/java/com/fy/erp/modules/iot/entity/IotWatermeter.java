/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.fy.erp.modules.iot.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fy.erp.common.persistence.TreeEntity;
import com.fy.erp.modules.sys.entity.Area;
import com.fy.erp.modules.sys.entity.Office;


/**
 * 水表管理Entity
 *
 * @author 杨超
 * @version 2017-12-04
 */
public class IotWatermeter extends TreeEntity<IotWatermeter> {

    private static final long serialVersionUID = 1L;

    private String name;        // 名称
    private Office office;        // 机构
    private String farmName;        // 猪场名
    private String concentratorName;        // 采集器名
    private String concentratorNum;        // 采集器编号
    private String houseName;        // 猪舍名
    private String roomName;        // 所在房间
    private String watermeterType;        // 用水类型
    private String watermeterNum;        // 水表编号
    private String deviceType = "1";        // 设备类型
    private String watermeterStatus;        // 水表状态
    private String installedTime;        // 安装日期
    private Integer orderNo;        // 列表排序
    private IotWatermeter parent;        // 上级ID
    private String levelType;        // 层级
    private String parentIds;        // 所有上级ID
    private Integer sort;        // 排序


    public IotWatermeter() {
        super();
    }

    public IotWatermeter(String id) {
        super(id);
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Office getOffice() {
        return office;
    }

    public void setOffice(Office office) {
        this.office = office;
    }

    public String getFarmName() {
        return farmName;
    }

    public void setFarmName(String farmName) {
        this.farmName = farmName;
    }

    public String getConcentratorName() {
        return concentratorName;
    }

    public void setConcentratorName(String concentratorName) {
        this.concentratorName = concentratorName;
    }

    public String getConcentratorNum() {
        return concentratorNum;
    }

    public void setConcentratorNum(String concentratorNum) {
        this.concentratorNum = concentratorNum;
    }

    public String getHouseName() {
        return houseName;
    }

    public void setHouseName(String houseName) {
        this.houseName = houseName;
    }

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    public String getWatermeterType() {
        return watermeterType;
    }

    public void setWatermeterType(String watermeterType) {
        this.watermeterType = watermeterType;
    }

    public String getWatermeterNum() {
        return watermeterNum;
    }

    public void setWatermeterNum(String watermeterNum) {
        this.watermeterNum = watermeterNum;
    }

    public String getDeviceType() {
        return deviceType;
    }

    public void setDeviceType(String deviceType) {
        this.deviceType = deviceType;
    }

    public String getWatermeterStatus() {
        return watermeterStatus;
    }

    public void setWatermeterStatus(String watermeterStatus) {
        this.watermeterStatus = watermeterStatus;
    }

    public String getInstalledTime() {
        return installedTime;
    }

    public void setInstalledTime(String installedTime) {
        this.installedTime = installedTime;
    }

    public Integer getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(Integer orderNo) {
        this.orderNo = orderNo;
    }

    @JsonBackReference
    public IotWatermeter getParent() {
        return parent;
    }

    public void setParent(IotWatermeter parent) {
        this.parent = parent;
    }

    public String getLevelType() {
        return levelType;
    }

    public void setLevelType(String levelType) {
        this.levelType = levelType;
    }

    public String getParentIds() {
        return parentIds;
    }

    public void setParentIds(String parentIds) {
        this.parentIds = parentIds;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public String getParentId() {
        return parent != null && parent.getId() != null ? parent.getId() : "0";
    }

    // ========================================================================================


    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof IotWatermeter)) return false;
        if (!super.equals(o)) return false;

        IotWatermeter that = (IotWatermeter) o;

        if (farmName != null ? !farmName.equals(that.farmName) : that.farmName != null) return false;
        if (concentratorName != null ? !concentratorName.equals(that.concentratorName) : that.concentratorName != null)
            return false;
        if (concentratorNum != null ? !concentratorNum.equals(that.concentratorNum) : that.concentratorNum != null)
            return false;
        if (houseName != null ? !houseName.equals(that.houseName) : that.houseName != null) return false;
        if (roomName != null ? !roomName.equals(that.roomName) : that.roomName != null) return false;
        if (watermeterType != null ? !watermeterType.equals(that.watermeterType) : that.watermeterType != null)
            return false;
        if (watermeterNum != null ? !watermeterNum.equals(that.watermeterNum) : that.watermeterNum != null)
            return false;
        if (deviceType != null ? !deviceType.equals(that.deviceType) : that.deviceType != null) return false;
        if (watermeterStatus != null ? !watermeterStatus.equals(that.watermeterStatus) : that.watermeterStatus != null)
            return false;
        return installedTime != null ? installedTime.equals(that.installedTime) : that.installedTime == null;
    }

    @Override
    public int hashCode() {
        int result = farmName != null ? farmName.hashCode() : 0;
        result = 31 * result + (concentratorName != null ? concentratorName.hashCode() : 0);
        result = 31 * result + (concentratorNum != null ? concentratorNum.hashCode() : 0);
        result = 31 * result + (houseName != null ? houseName.hashCode() : 0);
        result = 31 * result + (roomName != null ? roomName.hashCode() : 0);
        result = 31 * result + (watermeterType != null ? watermeterType.hashCode() : 0);
        result = 31 * result + (watermeterNum != null ? watermeterNum.hashCode() : 0);
        result = 31 * result + (deviceType != null ? deviceType.hashCode() : 0);
        result = 31 * result + (watermeterStatus != null ? watermeterStatus.hashCode() : 0);
        result = 31 * result + (installedTime != null ? installedTime.hashCode() : 0);
        return result;
    }

    private IotWatermeterFlow iotWatermeterFlow = new IotWatermeterFlow();

    public IotWatermeterFlow getIotWatermeterFlow() {
        return iotWatermeterFlow;
    }

    public void setIotWatermeterFlow(IotWatermeterFlow iotWatermeterFlow) {
        this.iotWatermeterFlow = iotWatermeterFlow;
    }

    private String datename = "0"; // 日期范围 报表查询用
    private String startTime = null; //日期区间 开始时间  报表查询用
    private String endTime = null;//日期区间 结束时间  报表查询用

    public String getDatename() {
        return datename;
    }

    public void setDatename(String datename) {
        this.datename = datename;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    private String idsSqlIn;        // 名称
    private String watermeterTypeSqlIn;        // 用水类型

    public String getIdsSqlIn() {
        return idsSqlIn;
    }

    public void setIdsSqlIn(String idsSqlIn) {
        this.idsSqlIn = idsSqlIn;
    }

    public String getWatermeterTypeSqlIn() {
        return watermeterTypeSqlIn;
    }

    public void setWatermeterTypeSqlIn(String watermeterTypeSqlIn) {
        this.watermeterTypeSqlIn = watermeterTypeSqlIn;
    }

    private String ids;        // 名称多选

    public String getIds() {
        return ids;
    }

    public void setIds(String ids) {
        this.ids = ids;
    }


    /**
     * 以搜索条件字段的值拼接的字符串，作为cache的key
     *
     * @return
     */
    public String returnCacheKey() {
        return "IotWatermeter{" +
                "name='" + name + '\'' +
                ", office=" + office +
                ", watermeterType='" + watermeterType + '\'' +
                ", watermeterNum='" + watermeterNum + '\'' +
                ", deviceType='" + deviceType + '\'' +
                ", watermeterStatus='" + watermeterStatus + '\'' +
                '}';
    }


// 统计图表模块采用的列
    private Integer statisticsType;
    private Integer datenameType;

    public Integer getStatisticsType() {
        return statisticsType;
    }

    public void setStatisticsType(Integer statisticsType) {
        this.statisticsType = statisticsType;
    }

    public Integer getDatenameType() {
        return datenameType;
    }

    public void setDatenameType(Integer datenameType) {
        this.datenameType = datenameType;
    }
}