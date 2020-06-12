/**
 *
 */
package com.fy.erp.common.service;

import java.lang.reflect.Field;
import java.util.List;

import com.fy.erp.common.persistence.CrudDao;
import com.fy.erp.common.persistence.Page;
import com.fy.erp.common.service.enu.NextOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.fy.erp.common.persistence.DataEntity;

import static com.fy.erp.common.persistence.BaseEntity.DEL_FLAG_NORMAL;
import static org.apache.commons.lang3.StringUtils.isBlank;

/**
 * Service����
 *
 * @author ThinkGem
 * @version 2014-05-16
 */
@Transactional(readOnly = true)
public abstract class CrudService<D extends CrudDao<T>, T extends DataEntity<T>> extends BaseService {

    /**
     * �־ò����
     */
    @Autowired
    protected D dao;

    /**
     * ��ȡ��������
     *
     * @param id
     * @return
     */
    public T get(String id) {
        return dao.get(id);
    }

    /**
     * ��ȡ��������
     *
     * @param entity
     * @return
     */
    public T get(T entity) {
        return dao.get(entity);
    }

    /**
     * ��ѯ�б�����
     *
     * @param entity
     * @return
     */
    public List<T> findList(T entity) {
        return dao.findList(entity);
    }


    /**
     * ��ѯ��ҳ����
     *
     * @param page   ��ҳ����
     * @param entity
     * @return
     */
    public Page<T> findPage(Page<T> page, T entity) {
        entity.setPage(page);
        page.setList(dao.findList(entity));
        return page;
    }

    /**
     * �������ݣ��������£�
     *
     * @param entity
     */
    @Transactional(readOnly = false)
    public int save(T entity) {
        if (entity.getIsNewRecord()) {
            entity.preInsert();
            return dao.insert(entity);
        } else {
            entity.preUpdate();
            return dao.update(entity);
        }
    }

    /**
     * ɾ������
     *
     * @param entity
     */
    @Transactional(readOnly = false)
    public int delete(T entity) {
        return dao.delete(entity);
    }

    /**
     * ʵ�������Բ�Ϊ�յ����ɲ������
     *
     * @param entity
     * @return
     */
    public int insertSelective(T entity) {
        return dao.insertSelective(entity);
    }

    /**
     * ʵ�������Բ�Ϊ�յ�����update set���
     *
     * @param entity
     * @return
     */
    public int updateSelective(T entity) {
        return dao.updateSelective(entity);
    }


    /**
     * ѭ������ת��, ��ȡ����� DeclaredField
     *
     * @param clazz     : �������
     * @param fieldName : �����е�������
     * @return �����е����Զ���
     */

    protected static Field getDeclaredField(Class<?> clazz, String fieldName) {
        Field field = null;
        for (; clazz != Object.class; clazz = clazz.getSuperclass()) {
            try {
                field = clazz.getDeclaredField(fieldName);
                field.setAccessible(true);
                return field;
            } catch (Exception e) {
                //������ô����Ҫ��������������쳣��������д�������׳�ȥ��
                //���������쳣��ӡ���������ף���Ͳ���ִ��clazz = clazz.getSuperclass(),���Ͳ�����뵽��������
            }
        }
        return null;
    }

    public NextOperation getNextOperation(Object child) throws NoSuchFieldException, IllegalAccessException {
        Class<?> aClass = child.getClass();

        Field idField = getDeclaredField(aClass, "id");
        String id = String.valueOf(idField.get(child));

        Field delFlagField = getDeclaredField(aClass, "delFlag");
        String delFlag = String.valueOf(delFlagField.get(child));

        if (DEL_FLAG_NORMAL.equals(delFlag)) {
            if (isBlank(id)) { // ��������
                return NextOperation.INSERT;
            } else {  // ���µ����
                return NextOperation.UPDATE;
            }
        } else {
            //ɾ�������
            return NextOperation.DELETE;
        }
    }

}
