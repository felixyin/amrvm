/**
 *
 */
package com.fy.erp.common.filter;

import com.fy.erp.common.utils.SpringContextHolder;
import net.sf.ehcache.CacheManager;
import net.sf.ehcache.constructs.web.filter.SimplePageCachingFilter;

/**
 * ҳ����ٻ��������
 * @author ThinkGem
 * @version 2013-8-5
 */
public class PageCachingFilter extends SimplePageCachingFilter {

	private CacheManager cacheManager = SpringContextHolder.getBean(CacheManager.class);
	
	@Override
	protected CacheManager getCacheManager() {
		return cacheManager;
	}
	
}
