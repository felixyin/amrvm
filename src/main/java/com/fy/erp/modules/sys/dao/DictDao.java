/**
 *
 */
package com.fy.erp.modules.sys.dao;

import java.util.List;

import com.fy.erp.common.persistence.CrudDao;
import com.fy.erp.common.persistence.annotation.MyBatisDao;
import com.fy.erp.modules.sys.entity.Dict;

/**
 * �ֵ�DAO�ӿ�
 * @author ThinkGem
 * @version 2014-05-16
 */
@MyBatisDao
public interface DictDao extends CrudDao<Dict> {

	public List<String> findTypeList(Dict dict);
	
}
