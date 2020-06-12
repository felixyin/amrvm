/**
 *
 */
package com.fy.erp.common.persistence;

import java.util.HashMap;

/**
 * ��ѯ������
 * @author ThinkGem
 * @version 2013-8-23
 */
public class Parameter extends HashMap<String, Object> {
	
	private static final long serialVersionUID = 1L;
	
	/**
	 * �����࣬����new Parameter(id, parentIds)
	 * @param values ����ֵ
	 */
	public Parameter(Object... values) {
		if (values != null){
			for (int i=0; i<values.length; i++){
				put("p"+(i+1), values[i]);
			}
		}
	}
	
	/**
	 * �����࣬����new Parameter(new Object[][]{{"id", id}, {"parentIds", parentIds}})
	 * @param parameters ������ά����
	 */
	public Parameter(Object[][] parameters) {
		if (parameters != null){
			for (Object[] os : parameters){
				if (os.length == 2){
					put((String)os[0], os[1]);
				}
			}
		}
	}
	
}
