/**
 *
 */
package com.fy.erp.common.persistence;

import javax.validation.constraints.NotNull;

import com.fy.erp.common.utils.Reflections;
import com.fy.erp.common.utils.StringUtils;
import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.annotation.JsonBackReference;

/**
 * ����Entity��
 *
 * @author ThinkGem
 * @version 2014-05-16
 */
public abstract class TreeEntity<T> extends DataEntity<T> {

    private static final long serialVersionUID = 1L;

    protected T parent;    // �������
    protected String parentIds; // ���и������
    protected String name;    // ��������
    protected Integer sort;        // ����

    public TreeEntity() {
        super();
        this.sort = 30;
    }

    public TreeEntity(String id) {
        super(id);
    }

    /**
     * ������ֻ��ͨ������ʵ�֣�����ʵ��mybatis�޷���ȡ
     *
     * @return
     */
    @JsonBackReference
    @NotNull
    public  abstract T getParent();

    /**
     * ������ֻ��ͨ������ʵ�֣�����ʵ��mybatis�޷���ȡ
     *
     * @return
     */
    public abstract void setParent(T parent);

    public String getParentIds() {
        return parentIds;
    }

    public void setParentIds(String parentIds) {
        this.parentIds = parentIds;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public String getParentId() {
        String id = null;
        if (parent != null) {
            id = (String) Reflections.getFieldValue(parent, "id");
        }
        return StringUtils.isNotBlank(id) ? id : "0";
    }

}
