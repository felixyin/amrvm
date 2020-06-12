/**
 *
 */
package com.fy.erp.modules.sys.dao;

import com.fy.erp.common.persistence.annotation.MyBatisDao;
import com.fy.erp.modules.sys.entity.Office;
import com.fy.erp.common.persistence.TreeDao;

/**
 * ����DAO�ӿ�
 * @author ThinkGem
 * @version 2014-05-16
 */
@MyBatisDao
public interface OfficeDao extends TreeDao<Office> {
	
}
