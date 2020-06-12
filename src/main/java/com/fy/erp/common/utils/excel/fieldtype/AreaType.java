/**
 *
 */
package com.fy.erp.common.utils.excel.fieldtype;

import com.fy.erp.common.utils.StringUtils;
import com.fy.erp.modules.sys.utils.UserUtils;
import com.fy.erp.modules.sys.entity.Area;

/**
 * �ֶ�����ת��
 * @author ThinkGem
 * @version 2013-03-10
 */
public class AreaType {

	/**
	 * ��ȡ����ֵ�����룩
	 */
	public static Object getValue(String val) {
		for (Area e : UserUtils.getAreaList()){
			if (StringUtils.trimToEmpty(val).equals(e.getName())){
				return e;
			}
		}
		return null;
	}

	/**
	 * ��ȡ����ֵ��������
	 */
	public static String setValue(Object val) {
		if (val != null && ((Area)val).getName() != null){
			return ((Area)val).getName();
		}
		return "";
	}
}
