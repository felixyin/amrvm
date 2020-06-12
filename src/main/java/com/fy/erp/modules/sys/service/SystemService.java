/**
 *
 */
package com.fy.erp.modules.sys.service;

import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import com.fy.erp.common.config.Global;
import com.fy.erp.common.persistence.Page;
import com.fy.erp.common.security.shiro.session.SessionDAO;
import com.fy.erp.common.service.BaseService;
import com.fy.erp.common.utils.StringUtils;
import com.fy.erp.common.web.Servlets;
import com.fy.erp.modules.sys.dao.RoleDao;
import com.fy.erp.modules.sys.dao.UserDao;
import com.fy.erp.modules.sys.entity.Office;
import com.fy.erp.modules.sys.entity.Role;
import com.fy.erp.modules.sys.entity.User;
import com.fy.erp.modules.sys.security.SystemAuthorizingRealm;
import com.fy.erp.modules.sys.utils.UserUtils;
import org.apache.shiro.session.Session;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fy.erp.common.security.Digests;
import com.fy.erp.common.service.ServiceException;
import com.fy.erp.common.utils.CacheUtils;
import com.fy.erp.common.utils.Encodes;
import com.fy.erp.modules.sys.dao.MenuDao;
import com.fy.erp.modules.sys.entity.Menu;
import com.fy.erp.modules.sys.utils.LogUtils;

/**
 * ϵͳ������ȫ���ʵ��Ĺ�����,�����û�����ɫ���˵�.
 * @author ThinkGem
 * @version 2013-12-05
 */
@Service
@Transactional(readOnly = true)
public class SystemService extends BaseService implements InitializingBean {
	
	public static final String HASH_ALGORITHM = "SHA-1";
	public static final int HASH_INTERATIONS = 1024;
	public static final int SALT_SIZE = 8;
	
	@Autowired
	private UserDao userDao;
	@Autowired
	private RoleDao roleDao;
	@Autowired
	private MenuDao menuDao;
	@Autowired
	private SessionDAO sessionDao;
	@Autowired
	private SystemAuthorizingRealm systemRealm;
	
	public SessionDAO getSessionDao() {
		return sessionDao;
	}

	//-- User Service --//
	
	/**
	 * ��ȡ�û�
	 * @param id
	 * @return
	 */
	public User getUser(String id) {
		return UserUtils.get(id);
	}

	/**
	 * ���ݵ�¼����ȡ�û�
	 * @param loginName
	 * @return
	 */
	public User getUserByLoginName(String loginName) {
		return UserUtils.getByLoginName(loginName);
	}
	
	public Page<User> findUser(Page<User> page, User user) {
		// ��������Ȩ�޹���������dsfΪdataScopeFilter�ļ�д����xml��ʹ�� ${sqlMap.dsf}����Ȩ��SQL��
		user.getSqlMap().put("dsf", dataScopeFilter(user.getCurrentUser(), "o", "a"));
		// ���÷�ҳ����
		user.setPage(page);
		// ִ�з�ҳ��ѯ
		page.setList(userDao.findList(user));
		return page;
	}
	
	/**
	 * �޷�ҳ��ѯ��Ա�б�
	 * @param user
	 * @return
	 */
	public List<User> findUser(User user){
		// ��������Ȩ�޹���������dsfΪdataScopeFilter�ļ�д����xml��ʹ�� ${sqlMap.dsf}����Ȩ��SQL��
		user.getSqlMap().put("dsf", dataScopeFilter(user.getCurrentUser(), "o", "a"));
		List<User> list = userDao.findList(user);
		return list;
	}

	/**
	 * ͨ������ID��ȡ�û��б��������û�id��name������ѯ�û�ʱ�ã�
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<User> findUserByOfficeId(String officeId) {
		List<User> list = (List<User>)CacheUtils.get(UserUtils.USER_CACHE, UserUtils.USER_CACHE_LIST_BY_OFFICE_ID_ + officeId);
		if (list == null){
			User user = new User();
			user.setOffice(new Office(officeId));
			list = userDao.findUserByOfficeId(user);
			CacheUtils.put(UserUtils.USER_CACHE, UserUtils.USER_CACHE_LIST_BY_OFFICE_ID_ + officeId, list);
		}
		return list;
	}
	
	@Transactional(readOnly = false)
	public void saveUser(User user) {
		if (StringUtils.isBlank(user.getId())){
			user.preInsert();
			userDao.insert(user);
		}else{
			// ���ԭ�û������û�����
			User oldUser = userDao.get(user.getId());
			if (oldUser.getOffice() != null && oldUser.getOffice().getId() != null){
				CacheUtils.remove(UserUtils.USER_CACHE, UserUtils.USER_CACHE_LIST_BY_OFFICE_ID_ + oldUser.getOffice().getId());
			}
			// �����û�����
			user.preUpdate();
			userDao.update(user);
		}
		if (StringUtils.isNotBlank(user.getId())){
			// �����û����ɫ����
			userDao.deleteUserRole(user);
			if (user.getRoleList() != null && user.getRoleList().size() > 0){
				userDao.insertUserRole(user);
			}else{
				throw new ServiceException(user.getLoginName() + "û�����ý�ɫ��");
			}
			// ����û�����
			UserUtils.clearCache(user);
//			// ���Ȩ�޻���
//			systemRealm.clearAllCachedAuthorizationInfo();
		}
	}
	
	@Transactional(readOnly = false)
	public void updateUserInfo(User user) {
		user.preUpdate();
		userDao.updateUserInfo(user);
		// ����û�����
		UserUtils.clearCache(user);
//		// ���Ȩ�޻���
//		systemRealm.clearAllCachedAuthorizationInfo();
	}
	
	@Transactional(readOnly = false)
	public void deleteUser(User user) {
		userDao.delete(user);
		// ����û�����
		UserUtils.clearCache(user);
//		// ���Ȩ�޻���
//		systemRealm.clearAllCachedAuthorizationInfo();
	}
	
	@Transactional(readOnly = false)
	public void updatePasswordById(String id, String loginName, String newPassword) {
		User user = new User(id);
		user.setPassword(entryptPassword(newPassword));
		userDao.updatePasswordById(user);
		// ����û�����
		user.setLoginName(loginName);
		UserUtils.clearCache(user);
//		// ���Ȩ�޻���
//		systemRealm.clearAllCachedAuthorizationInfo();
	}
	
	@Transactional(readOnly = false)
	public void updateUserLoginInfo(User user) {
		// �����ϴε�¼��Ϣ
		user.setOldLoginIp(user.getLoginIp());
		user.setOldLoginDate(user.getLoginDate());
		// ���±��ε�¼��Ϣ
		user.setLoginIp(StringUtils.getRemoteAddr(Servlets.getRequest()));
		user.setLoginDate(new Date());
		userDao.updateLoginInfo(user);
	}
	
	/**
	 * ���ɰ�ȫ�����룬���������16λsalt������1024�� sha-1 hash
	 */
	public static String entryptPassword(String plainPassword) {
		String plain = Encodes.unescapeHtml(plainPassword);
		byte[] salt = Digests.generateSalt(SALT_SIZE);
		byte[] hashPassword = Digests.sha1(plain.getBytes(), salt, HASH_INTERATIONS);
		return Encodes.encodeHex(salt)+Encodes.encodeHex(hashPassword);
	}
	
	/**
	 * ��֤����
	 * @param plainPassword ��������
	 * @param password ��������
	 * @return ��֤�ɹ�����true
	 */
	public static boolean validatePassword(String plainPassword, String password) {
		String plain = Encodes.unescapeHtml(plainPassword);
		byte[] salt = Encodes.decodeHex(password.substring(0,16));
		byte[] hashPassword = Digests.sha1(plain.getBytes(), salt, HASH_INTERATIONS);
		return password.equals(Encodes.encodeHex(salt)+Encodes.encodeHex(hashPassword));
	}
	
	/**
	 * ��û�Ự
	 * @return
	 */
	public Collection<Session> getActiveSessions(){
		return sessionDao.getActiveSessions(false);
	}
	
	//-- Role Service --//
	
	public Role getRole(String id) {
		return roleDao.get(id);
	}

	public Role getRoleByName(String name) {
		Role r = new Role();
		r.setName(name);
		return roleDao.getByName(r);
	}
	
	public Role getRoleByEnname(String enname) {
		Role r = new Role();
		r.setEnname(enname);
		return roleDao.getByEnname(r);
	}
	
	public List<Role> findRole(Role role){
		return roleDao.findList(role);
	}
	
	public List<Role> findAllRole(){
		return UserUtils.getRoleList();
	}
	
	@Transactional(readOnly = false)
	public void saveRole(Role role) {
		if (StringUtils.isBlank(role.getId())){
			role.preInsert();
			roleDao.insert(role);
		}else{
			role.preUpdate();
			roleDao.update(role);
		}
		// ���½�ɫ��˵�����
		roleDao.deleteRoleMenu(role);
		if (role.getMenuList().size() > 0){
			roleDao.insertRoleMenu(role);
		}
		// ���½�ɫ�벿�Ź���
		roleDao.deleteRoleOffice(role);
		if (role.getOfficeList().size() > 0){
			roleDao.insertRoleOffice(role);
		}
		// ����û���ɫ����
		UserUtils.removeCache(UserUtils.CACHE_ROLE_LIST);
//		// ���Ȩ�޻���
//		systemRealm.clearAllCachedAuthorizationInfo();
	}

	@Transactional(readOnly = false)
	public void deleteRole(Role role) {
		roleDao.delete(role);
		// ����û���ɫ����
		UserUtils.removeCache(UserUtils.CACHE_ROLE_LIST);
//		// ���Ȩ�޻���
//		systemRealm.clearAllCachedAuthorizationInfo();
	}
	
	@Transactional(readOnly = false)
	public Boolean outUserInRole(Role role, User user) {
		List<Role> roles = user.getRoleList();
		for (Role e : roles){
			if (e.getId().equals(role.getId())){
				roles.remove(e);
				saveUser(user);
				return true;
			}
		}
		return false;
	}
	
	@Transactional(readOnly = false)
	public User assignUserToRole(Role role, User user) {
		if (user == null){
			return null;
		}
		List<String> roleIds = user.getRoleIdList();
		if (roleIds.contains(role.getId())) {
			return null;
		}
		user.getRoleList().add(role);
		saveUser(user);
		return user;
	}

	//-- Menu Service --//
	
	public Menu getMenu(String id) {
		return menuDao.get(id);
	}

	public List<Menu> findAllMenu(){
		return UserUtils.getMenuList();
	}
	
	@Transactional(readOnly = false)
	public void saveMenu(Menu menu) {
		
		// ��ȡ���ڵ�ʵ��
		menu.setParent(this.getMenu(menu.getParent().getId()));
		
		// ��ȡ�޸�ǰ��parentIds�����ڸ����ӽڵ��parentIds
		String oldParentIds = menu.getParentIds(); 
		
		// �����µĸ��ڵ㴮
		menu.setParentIds(menu.getParent().getParentIds()+menu.getParent().getId()+",");

		// ��������ʵ��
		if (StringUtils.isBlank(menu.getId())){
			menu.preInsert();
			menuDao.insert(menu);
		}else{
			menu.preUpdate();
			menuDao.update(menu);
		}
		
		// �����ӽڵ� parentIds
		Menu m = new Menu();
		m.setParentIds("%,"+menu.getId()+",%");
		List<Menu> list = menuDao.findByParentIdsLike(m);
		for (Menu e : list){
			e.setParentIds(e.getParentIds().replace(oldParentIds, menu.getParentIds()));
			menuDao.updateParentIds(e);
		}
		// ����û��˵�����
		UserUtils.removeCache(UserUtils.CACHE_MENU_LIST);
//		// ���Ȩ�޻���
//		systemRealm.clearAllCachedAuthorizationInfo();
		// �����־��ػ���
		CacheUtils.remove(LogUtils.CACHE_MENU_NAME_PATH_MAP);
	}

	@Transactional(readOnly = false)
	public void updateMenuSort(Menu menu) {
		menuDao.updateSort(menu);
		// ����û��˵�����
		UserUtils.removeCache(UserUtils.CACHE_MENU_LIST);
//		// ���Ȩ�޻���
//		systemRealm.clearAllCachedAuthorizationInfo();
		// �����־��ػ���
		CacheUtils.remove(LogUtils.CACHE_MENU_NAME_PATH_MAP);
	}

	@Transactional(readOnly = false)
	public void deleteMenu(Menu menu) {
		menuDao.delete(menu);
		// ����û��˵�����
		UserUtils.removeCache(UserUtils.CACHE_MENU_LIST);
//		// ���Ȩ�޻���
//		systemRealm.clearAllCachedAuthorizationInfo();
		// �����־��ػ���
		CacheUtils.remove(LogUtils.CACHE_MENU_NAME_PATH_MAP);
	}
	
	/**
	 * ��ȡKey������Ϣ
	 */
	public static boolean printKeyLoadMessage(){
		StringBuilder sb = new StringBuilder();
		sb.append("\r\n======================================================================\r\n");
		sb.append("\r\n    ��ӭʹ�� "+ Global.getConfig("productName")+"  - Powered By http://gowants.com\r\n");
		sb.append("\r\n======================================================================\r\n");
		System.out.println(sb.toString());
		return true;
	}

	@Override
	public void afterPropertiesSet() throws Exception {

	}
}
