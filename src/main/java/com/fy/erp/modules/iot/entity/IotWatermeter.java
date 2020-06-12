/**
 * Copyright &copy; 2012-2016 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.fy.erp.modules.iot.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fy.erp.common.persistence.TreeEntity;
import com.fy.erp.modules.sys.entity.Area;
import com.fy.erp.modules.sys.entity.Office;


/**
 * ˮ�����Entity
 *
 * @author �
 * @version 2017-12-04
 */
public class IotWatermeter extends TreeEntity<IotWatermeter> {

    private static final long serialVersionUID = 1L;

    private String name;        // ����
    private Office office;        // ����
    private String farmName;        // ����
    private String concentratorName;        // �ɼ�����
    private String concentratorNum;        // �ɼ������
    private String houseName;        // ������
    private String roomName;        // ���ڷ���
    private String watermeterType;        // ��ˮ����
    private String watermeterNum;        // ˮ����
    private String deviceType = "1";        // �豸����
    private String watermeterStatus;        // ˮ��״̬
    private String installedTime;        // ��װ����
    private Integer orderNo;        // �б�����
    private IotWatermeter parent;        // �ϼ�ID
    private String levelType;        // �㼶
    private String parentIds;        // �����ϼ�ID
    private Integer sort;        // ����


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

    private String datename = "0"; // ���ڷ�Χ �����ѯ��
    private String startTime = null; //�������� ��ʼʱ��  �����ѯ��
    private String endTime = null;//�������� ����ʱ��  �����ѯ��

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

    private String idsSqlIn;        // ����
    private String watermeterTypeSqlIn;        // ��ˮ����

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

    private String ids;        // ���ƶ�ѡ

    public String getIds() {
        return ids;
    }

    public void setIds(String ids) {
        this.ids = ids;
    }


    /**
     * �����������ֶε�ֵƴ�ӵ��ַ�������Ϊcache��key
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


// ͳ��ͼ��ģ����õ���
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