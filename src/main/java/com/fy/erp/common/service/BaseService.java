/**
 *
 */
package com.fy.erp.common.service;

import java.util.List;

import com.fy.erp.common.persistence.BaseEntity;
import com.fy.erp.modules.sys.entity.Role;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.transaction.annotation.Transactional;

import com.google.common.collect.Lists;
import com.fy.erp.common.utils.StringUtils;
import com.fy.erp.modules.sys.entity.User;

/**
 * Service����
 * @author ThinkGem
 * @version 2014-05-16
 */
@Transactional(readOnly = true)
public abstract class BaseService {
	
	/**
	 * ��־����
	 */
	protected Logger logger = LoggerFactory.getLogger(getClass());

	/**
	 * ���ݷ�Χ����
	 * @param user ��ǰ�û�����ͨ����entity.getCurrentUser()����ȡ
	 * @param officeAlias ���������������á�,�����Ÿ�����
	 * @param userAlias �û������������á�,�����Ÿ��������ݿգ����Դ˲���
	 * @return ��׼������������
	 */
	public static String dataScopeFilter(User user, String officeAlias, String userAlias) {

		StringBuilder sqlString = new StringBuilder();
		
		// ����Ȩ�޹��ˣ������ɫȨ�޷�Χ֮��Ϊ���߹�ϵ��
		List<String> dataScope = Lists.newArrayList();
		
		// ��������Ա������Ȩ�޹���
		if (!user.isAdmin()){
			boolean isDataScopeAll = false;
			for (Role r : user.getRoleList()){
				for (String oa : StringUtils.split(officeAlias, ",")){
					if (!dataScope.contains(r.getDataScope()) && StringUtils.isNotBlank(oa)){
						if (Role.DATA_SCOPE_ALL.equals(r.getDataScope())){
							isDataScopeAll = true;
						}
						else if (Role.DATA_SCOPE_COMPANY_AND_CHILD.equals(r.getDataScope())){
							sqlString.append(" OR " + oa + ".id = '" + user.getCompany().getId() + "'");
							sqlString.append(" OR " + oa + ".parent_ids LIKE '" + user.getCompany().getParentIds() + user.getCompany().getId() + ",%'");
						}
						else if (Role.DATA_SCOPE_COMPANY.equals(r.getDataScope())){
							sqlString.append(" OR " + oa + ".id = '" + user.getCompany().getId() + "'");
							// ��������˾�µĲ��� ��type=1:��˾��type=2�����ţ�
							sqlString.append(" OR (" + oa + ".parent_id = '" + user.getCompany().getId() + "' AND " + oa + ".type = '2')");
						}
						else if (Role.DATA_SCOPE_OFFICE_AND_CHILD.equals(r.getDataScope())){
							sqlString.append(" OR " + oa + ".id = '" + user.getOffice().getId() + "'");
							sqlString.append(" OR " + oa + ".parent_ids LIKE '" + user.getOffice().getParentIds() + user.getOffice().getId() + ",%'");
						}
						else if (Role.DATA_SCOPE_OFFICE.equals(r.getDataScope())){
							sqlString.append(" OR " + oa + ".id = '" + user.getOffice().getId() + "'");
						}
						else if (Role.DATA_SCOPE_CUSTOM.equals(r.getDataScope())){
//							String officeIds =  StringUtils.join(r.getOfficeIdList(), "','");
//							if (StringUtils.isNotEmpty(officeIds)){
//								sqlString.append(" OR " + oa + ".id IN ('" + officeIds + "')");
//							}
							sqlString.append(" OR EXISTS (SELECT 1 FROM sys_role_office WHERE role_id = '" + r.getId() + "'");
							sqlString.append(" AND office_id = " + oa +".id)");
						}
						//else if (Role.DATA_SCOPE_SELF.equals(r.getDataScope())){
						dataScope.add(r.getDataScope());
					}
				}
			}
			// ���û��ȫ������Ȩ�ޣ����������û���������ǰȨ��Ϊ���ˣ����δ���ñ�������ǰ��Ȩ��Ϊ��ֲ��Ȩ��
			if (!isDataScopeAll){
				if (StringUtils.isNotBlank(userAlias)){
					for (String ua : StringUtils.split(userAlias, ",")){
						sqlString.append(" OR " + ua + ".id = '" + user.getId() + "'");
					}
				}else {
					for (String oa : StringUtils.split(officeAlias, ",")){
						//sqlString.append(" OR " + oa + ".id  = " + user.getOffice().getId());
						sqlString.append(" OR " + oa + ".id IS NULL");
					}
				}
			}else{
				// �������ȫ��Ȩ�ޣ���ȥ��֮ǰ��ӵ�����������������ѭ����
				sqlString = new StringBuilder();
			}
		}
		if (StringUtils.isNotBlank(sqlString.toString())){
			return " AND (" + sqlString.substring(4) + ")";
		}
		return "";
	}

	/**
	 * ���ݷ�Χ���ˣ�����ҵ����ֶβ�ͬ��ʱ��ʹ�ã�����exists������
	 * @param entity ��ǰ���˵�ʵ����
	 * @param sqlMapKey sqlMap�ļ�ֵ���������á�dsf��ʱ�����÷�����${sqlMap.sdf}
	 * @param officeWheres office����������ɣ����ű��ֶ�=ҵ���Ĳ����ֶ�
	 * @param userWheres user����������ɣ��û����ֶ�=ҵ�����û��ֶ�
	 * @example
	 * 		dataScopeFilter(user, "dsf", "id=a.office_id", "id=a.create_by");
	 * 		dataScopeFilter(entity, "dsf", "code=a.jgdm", "no=a.cjr"); // ��Ӧ��ҵ��������ͬ�ֶ�ʱʹ�ã���������Ĳ��ǻ���id��code��
	 */
	public static void dataScopeFilter(BaseEntity<?> entity, String sqlMapKey, String officeWheres, String userWheres) {

		User user = entity.getCurrentUser();
		
		// ����ǳ�������Ա���򲻹�������
		if (user.isAdmin()) {
			return;
		}

		// ���ݷ�Χ��1���������ݣ�2�����ڹ�˾���������ݣ�3�����ڹ�˾���ݣ�4�����ڲ��ż��������ݣ�5�����ڲ������ݣ�8�����������ݣ�9������ϸ���ã�
		StringBuilder sqlString = new StringBuilder();
		
		// ��ȡ����������Ȩ�޷�Χ
		String roleId = "";
		int dataScopeInteger = 8;
		for (Role r : user.getRoleList()){
			int ds = Integer.valueOf(r.getDataScope());
			if (ds == 9){
				roleId = r.getId();
				dataScopeInteger = ds;
				break;
			}else if (ds < dataScopeInteger){
				roleId = r.getId();
				dataScopeInteger = ds;
			}
		}
		String dataScopeString = String.valueOf(dataScopeInteger);
		
		// ���ɲ���Ȩ��SQL���
		for (String where : StringUtils.split(officeWheres, ",")){
			if (Role.DATA_SCOPE_COMPANY_AND_CHILD.equals(dataScopeString)){
				// ��������˾�µĲ��� ��type=1:��˾��type=2�����ţ�
				sqlString.append(" AND EXISTS (SELECT 1 FROM SYS_OFFICE");
				sqlString.append(" WHERE type='2'");
				sqlString.append(" AND (id = '" + user.getCompany().getId() + "'");
				sqlString.append(" OR parent_ids LIKE '" + user.getCompany().getParentIds() + user.getCompany().getId() + ",%')");
				sqlString.append(" AND " + where +")");
			}
			else if (Role.DATA_SCOPE_COMPANY.equals(dataScopeString)){
				sqlString.append(" AND EXISTS (SELECT 1 FROM SYS_OFFICE");
				sqlString.append(" WHERE type='2'");
				sqlString.append(" AND id = '" + user.getCompany().getId() + "'");
				sqlString.append(" AND " + where +")");
			}
			else if (Role.DATA_SCOPE_OFFICE_AND_CHILD.equals(dataScopeString)){
				sqlString.append(" AND EXISTS (SELECT 1 FROM SYS_OFFICE");
				sqlString.append(" WHERE (id = '" + user.getOffice().getId() + "'");
				sqlString.append(" OR parent_ids LIKE '" + user.getOffice().getParentIds() + user.getOffice().getId() + ",%')");
				sqlString.append(" AND " + where +")");
			}
			else if (Role.DATA_SCOPE_OFFICE.equals(dataScopeString)){
				sqlString.append(" AND EXISTS (SELECT 1 FROM SYS_OFFICE");
				sqlString.append(" WHERE id = '" + user.getOffice().getId() + "'");
				sqlString.append(" AND " + where +")");
			}
			else if (Role.DATA_SCOPE_CUSTOM.equals(dataScopeString)){
				sqlString.append(" AND EXISTS (SELECT 1 FROM sys_role_office ro123456, sys_office o123456");
				sqlString.append(" WHERE ro123456.office_id = o123456.id");
				sqlString.append(" AND ro123456.role_id = '" + roleId + "'");
				sqlString.append(" AND o123456." + where +")");
			}
		}
		// ���ɸ���Ȩ��SQL���
		for (String where : StringUtils.split(userWheres, ",")){
			if (Role.DATA_SCOPE_SELF.equals(dataScopeString)){
				sqlString.append(" AND EXISTS (SELECT 1 FROM sys_user");
				sqlString.append(" WHERE id='" + user.getId() + "'");
				sqlString.append(" AND " + where + ")");
			}
		}

//		System.out.println("dataScopeFilter: " + sqlString.toString());

		// ���õ��Զ���SQL����
		entity.getSqlMap().put(sqlMapKey, sqlString.toString());
		
	}

}
