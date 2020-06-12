/**
 *
 */
package com.fy.erp.modules.sys.dao;

import java.util.List;

import com.fy.erp.common.persistence.CrudDao;
import com.fy.erp.common.persistence.annotation.MyBatisDao;
import com.fy.erp.modules.sys.entity.User;

/**
 * �û�DAO�ӿ�
 * @author ThinkGem
 * @version 2014-05-16
 */
@MyBatisDao
public interface UserDao extends CrudDao<User> {
	
	/**
	 * ���ݵ�¼���Ʋ�ѯ�û�
	 * @param loginName
	 * @return
	 */
	public User getByLoginName(User user);

	/**
	 * ͨ��OfficeId��ȡ�û��б��������û�id��name������ѯ�û�ʱ�ã�
	 * @param user
	 * @return
	 */
	public List<User> findUserByOfficeId(User user);
	
	/**
	 * ��ѯȫ���û���Ŀ
	 * @return
	 */
	public long findAllCount(User user);
	
	/**
	 * �����û�����
	 * @param user
	 * @return
	 */
	public int updatePasswordById(User user);
	
	/**
	 * ���µ�¼��Ϣ���磺��¼IP����¼ʱ��
	 * @param user
	 * @return
	 */
	public int updateLoginInfo(User user);

	/**
	 * ɾ���û���ɫ��������
	 * @param user
	 * @return
	 */
	public int deleteUserRole(User user);
	
	/**
	 * �����û���ɫ��������
	 * @param user
	 * @return
	 */
	public int insertUserRole(User user);
	
	/**
	 * �����û���Ϣ
	 * @param user
	 * @return
	 */
	public int updateUserInfo(User user);

}
