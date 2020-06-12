/**
 *
 */
package com.fy.erp.common.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.fy.erp.common.persistence.TreeDao;
import com.fy.erp.common.persistence.TreeEntity;
import com.fy.erp.common.utils.Reflections;
import com.fy.erp.common.utils.StringUtils;

/**
 * Service����
 * @author ThinkGem
 * @version 2014-05-16
 */
@Transactional(readOnly = true)
public abstract class TreeService<D extends TreeDao<T>, T extends TreeEntity<T>> extends CrudService<D, T> {
	
	@Transactional(readOnly = false)
	public int save(T entity) {
		
		@SuppressWarnings("unchecked")
		Class<T> entityClass = Reflections.getClassGenricType(getClass(), 1);
		
		// ���û�����ø��ڵ㣬�����Ϊ���ڵ㣬�����ȡ���ڵ�ʵ��
		if (entity.getParent() == null || StringUtils.isBlank(entity.getParentId()) 
				|| "0".equals(entity.getParentId())){
			entity.setParent(null);
		}else{
			entity.setParent(super.get(entity.getParentId()));
		}
		if (entity.getParent() == null){
			T parentEntity = null;
			try {
				parentEntity = entityClass.getConstructor(String.class).newInstance("0");
			} catch (Exception e) {
				throw new ServiceException(e);
			}
			entity.setParent(parentEntity);
			entity.getParent().setParentIds(StringUtils.EMPTY);
		}
		
		// ��ȡ�޸�ǰ��parentIds�����ڸ����ӽڵ��parentIds
		String oldParentIds = entity.getParentIds(); 
		
		// �����µĸ��ڵ㴮
		entity.setParentIds(entity.getParent().getParentIds()+entity.getParent().getId()+",");
		
		// ��������ʵ��
		super.save(entity);
		
		// �����ӽڵ� parentIds
		T o = null;
		try {
			o = entityClass.newInstance();
		} catch (Exception e) {
			throw new ServiceException(e);
		}
		o.setParentIds("%,"+entity.getId()+",%");
		List<T> list = dao.findByParentIdsLike(o);
		for (T e : list){
			if (e.getParentIds() != null && oldParentIds != null){
				e.setParentIds(e.getParentIds().replace(oldParentIds, entity.getParentIds()));
				preUpdateChild(entity, e);
				dao.updateParentIds(e);
			}
		}

		return 0;
	}
	
	/**
	 * Ԥ���ӿڣ��û������ӽ�ǰ����
	 * @param childEntity
	 */
	protected void preUpdateChild(T entity, T childEntity) {
		
	}

}
