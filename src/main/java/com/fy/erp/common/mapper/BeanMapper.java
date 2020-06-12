/**
 * Copyright (c) 2005-2012 springside.org.cn
 */
package com.fy.erp.common.mapper;

import java.util.Collection;
import java.util.List;

import org.dozer.DozerBeanMapper;

import com.google.common.collect.Lists;

/**
 * �򵥷�װDozer, ʵ�����ת��Bean<->Bean��Mapper.ʵ��:
 *  
 * 1. ����Mapper�ĵ���. 
 * 2. ����ֵ����ת��.
 * 3. ����ת��Collection�е����ж���.
 * 4. ���ִ����µ�B�����뽫����Aֵ���Ƶ��Ѵ��ڵ�B�������ֺ���.
 * 
 * @author calvin
 * @version 2013-01-15
 */
public class BeanMapper {

	/**
	 * ����Dozer����, �����ظ�����DozerMapper������Դ.
	 */
	private static DozerBeanMapper dozer = new DozerBeanMapper();

	/**
	 * ����Dozerת�����������.
	 */
	public static <T> T map(Object source, Class<T> destinationClass) {
		return dozer.map(source, destinationClass);
	}

	/**
	 * ����Dozerת��Collection�ж��������.
	 */
	@SuppressWarnings("rawtypes")
	public static <T> List<T> mapList(Collection sourceList, Class<T> destinationClass) {
		List<T> destinationList = Lists.newArrayList();
		for (Object sourceObject : sourceList) {
			T destinationObject = dozer.map(sourceObject, destinationClass);
			destinationList.add(destinationObject);
		}
		return destinationList;
	}

	/**
	 * ����Dozer������A��ֵ����������B��.
	 */
	public static void copy(Object source, Object destinationObject) {
		dozer.map(source, destinationObject);
	}
}