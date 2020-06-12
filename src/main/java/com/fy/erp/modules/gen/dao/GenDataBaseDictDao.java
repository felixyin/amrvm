/**
 *
 */
package com.fy.erp.modules.gen.dao;

import java.util.List;

import com.fy.erp.common.persistence.CrudDao;
import com.fy.erp.common.persistence.annotation.MyBatisDao;
import com.fy.erp.modules.gen.entity.GenTable;
import com.fy.erp.modules.gen.entity.GenTableColumn;

/**
 * ҵ����ֶ�DAO�ӿ�
 * @author ThinkGem
 * @version 2013-10-15
 */
@MyBatisDao
public interface GenDataBaseDictDao extends CrudDao<GenTableColumn> {

	/**
	 * ��ѯ���б�
	 * @param genTable
	 * @return
	 */
	List<GenTable> findTableList(GenTable genTable);

	/**
	 * ��ȡ���ݱ��ֶ�
	 * @param genTable
	 * @return
	 */
	List<GenTableColumn> findTableColumnList(GenTable genTable);
	
	/**
	 * ��ȡ���ݱ�����
	 * @param genTable
	 * @return
	 */
	List<String> findTablePK(GenTable genTable);
	
}
