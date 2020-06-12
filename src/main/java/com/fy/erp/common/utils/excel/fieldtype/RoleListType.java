/**
 *
 */
package com.fy.erp.common.utils.excel.fieldtype;

import java.util.List;

import com.fy.erp.common.utils.Collections3;
import com.fy.erp.common.utils.SpringContextHolder;
import com.fy.erp.modules.sys.entity.Role;
import com.google.common.collect.Lists;
import com.fy.erp.common.utils.StringUtils;
import com.fy.erp.modules.sys.service.SystemService;

/**
 * �ֶ�����ת��
 * @author ThinkGem
 * @version 2013-5-29
 */
public class RoleListType {

	private static SystemService systemService = SpringContextHolder.getBean(SystemService.class);
	
	/**
	 * ��ȡ����ֵ�����룩
	 */
	public static Object getValue(String val) {
		List<Role> roleList = Lists.newArrayList();
		List<Role> allRoleList = systemService.findAllRole();
		for (String s : StringUtils.split(val, ",")){
			for (Role e : allRoleList){
				if (StringUtils.trimToEmpty(s).equals(e.getName())){
					roleList.add(e);
				}
			}
		}
		return roleList.size()>0?roleList:null;
	}

	/**
	 * ���ö���ֵ��������
	 */
	public static String setValue(Object val) {
		if (val != null){
			@SuppressWarnings("unchecked")
			List<Role> roleList = (List<Role>)val;
			return Collections3.extractToString(roleList, "name", ", ");
		}
		return "";
	}
	
}