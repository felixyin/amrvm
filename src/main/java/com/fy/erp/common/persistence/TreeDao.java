/**
 *
 */
package com.fy.erp.common.persistence;

import java.util.List;

/**
 * DAO֧����ʵ��
 * @author ThinkGem
 * @version 2014-05-16
 * @param <T>
 */
public interface TreeDao<T extends TreeEntity<T>> extends CrudDao<T> {

	/**
	 * �ҵ������ӽڵ�
	 * @param entity
	 * @return
	 */
	public List<T> findByParentIdsLike(T entity);

	/**
	 * �������и��ڵ��ֶ�
	 * @param entity
	 * @return
	 */
	public int updateParentIds(T entity);
	
}