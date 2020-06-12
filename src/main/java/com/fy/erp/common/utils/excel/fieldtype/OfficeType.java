/**
 *
 */
package com.fy.erp.common.utils.excel.fieldtype;

import com.fy.erp.common.utils.StringUtils;
import com.fy.erp.modules.sys.entity.Office;
import com.fy.erp.modules.sys.utils.UserUtils;

/**
 * �ֶ�����ת��
 * @author ThinkGem
 * @version 2013-03-10
 */
public class OfficeType {

	/**
	 * ��ȡ����ֵ�����룩
	 */
	public static Object getValue(String val) {
		for (Office e : UserUtils.getOfficeList()){
			if (StringUtils.trimToEmpty(val).equals(e.getName())){
				return e;
			}
		}
		return null;
	}

	/**
	 * ���ö���ֵ��������
	 */
	public static String setValue(Object val) {
		if (val != null && ((Office)val).getName() != null){
			return ((Office)val).getName();
		}
		return "";
	}
}
