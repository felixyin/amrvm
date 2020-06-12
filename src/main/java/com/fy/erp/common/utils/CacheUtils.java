/**
 *
 */
package com.fy.erp.common.utils;

import java.util.Iterator;
import java.util.Set;

import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Cache������
 * @author ThinkGem
 * @version 2013-5-29
 */
public class CacheUtils {
	
	private static Logger logger = LoggerFactory.getLogger(CacheUtils.class);
	private static CacheManager cacheManager = SpringContextHolder.getBean(CacheManager.class);
	
	private static final String SYS_CACHE = "sysCache";

	/**
	 * ��ȡSYS_CACHE����
	 * @param key
	 * @return
	 */
	public static Object get(String key) {
		return get(SYS_CACHE, key);
	}
	
	/**
	 * ��ȡSYS_CACHE����
	 * @param key
	 * @param defaultValue
	 * @return
	 */
	public static Object get(String key, Object defaultValue) {
		Object value = get(key);
		return value != null ? value : defaultValue;
	}
	
	/**
	 * д��SYS_CACHE����
	 * @param key
	 * @return
	 */
	public static void put(String key, Object value) {
		put(SYS_CACHE, key, value);
	}
	
	/**
	 * ��SYS_CACHE�������Ƴ�
	 * @param key
	 * @return
	 */
	public static void remove(String key) {
		remove(SYS_CACHE, key);
	}
	
	/**
	 * ��ȡ����
	 * @param cacheName
	 * @param key
	 * @return
	 */
	public static Object get(String cacheName, String key) {
		return getCache(cacheName).get(getKey(key));
	}
	
	/**
	 * ��ȡ����
	 * @param cacheName
	 * @param key
	 * @param defaultValue
	 * @return
	 */
	public static Object get(String cacheName, String key, Object defaultValue) {
		Object value = get(cacheName, getKey(key));
		return value != null ? value : defaultValue;
	}
	
	/**
	 * д�뻺��
	 * @param cacheName
	 * @param key
	 * @param value
	 */
	public static void put(String cacheName, String key, Object value) {
		getCache(cacheName).put(getKey(key), value);
	}

	/**
	 * �ӻ������Ƴ�
	 * @param cacheName
	 * @param key
	 */
	public static void remove(String cacheName, String key) {
		getCache(cacheName).remove(getKey(key));
	}

	/**
	 * �ӻ������Ƴ�����
	 * @param cacheName
	 */
	public static void removeAll(String cacheName) {
		Cache<String, Object> cache = getCache(cacheName);
		Set<String> keys = cache.keys();
		for (Iterator<String> it = keys.iterator(); it.hasNext();){
			cache.remove(it.next());
		}
		logger.info("�����棺 {} => {}", cacheName, keys);
	}
	
	/**
	 * ��ȡ���������������Դ����������Դ����ǰ׺
	 * @param key
	 * @return
	 */
	private static String getKey(String key){
//		String dsName = DataSourceHolder.getDataSourceName();
//		if (StringUtils.isNotBlank(dsName)){
//			return dsName + "_" + key;
//		}
		return key;
	}
	
	/**
	 * ���һ��Cache��û������ʾ��־��
	 * @param cacheName
	 * @return
	 */
	private static Cache<String, Object> getCache(String cacheName){
		Cache<String, Object> cache = cacheManager.getCache(cacheName);
		if (cache == null){
			throw new RuntimeException("��ǰϵͳ��û�ж��塰"+cacheName+"��������档");
		}
		return cache;
	}

}
