/**
 *
 */
package com.fy.erp.modules.sys.interceptor;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.core.NamedThreadLocal;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.fy.erp.common.service.BaseService;
import com.fy.erp.common.utils.DateUtils;
import com.fy.erp.modules.sys.utils.LogUtils;

/**
 * ��־������
 * @author ThinkGem
 * @version 2014-8-19
 */
public class LogInterceptor extends BaseService implements HandlerInterceptor {

	private static final ThreadLocal<Long> startTimeThreadLocal =
			new NamedThreadLocal<Long>("ThreadLocal StartTime");
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, 
			Object handler) throws Exception {
		if (logger.isDebugEnabled()){
			long beginTime = System.currentTimeMillis();//1����ʼʱ��  
	        startTimeThreadLocal.set(beginTime);		//�̰߳󶨱�����������ֻ�е�ǰ������߳̿ɼ���  
	        logger.debug("��ʼ��ʱ: {}  URI: {}", new SimpleDateFormat("hh:mm:ss.SSS")
	        	.format(beginTime), request.getRequestURI());
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, 
			ModelAndView modelAndView) throws Exception {
		if (modelAndView != null){
			logger.info("ViewName: " + modelAndView.getViewName());
		}
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, 
			Object handler, Exception ex) throws Exception {

		// ������־ FIXME ����������򿪴�����
//		LogUtils.saveLog(request, handler, ex, null);
		
		// ��ӡJVM��Ϣ��
		if (logger.isDebugEnabled()){
			long beginTime = startTimeThreadLocal.get();//�õ��̰߳󶨵ľֲ���������ʼʱ�䣩  
			long endTime = System.currentTimeMillis(); 	//2������ʱ��  
	        logger.debug("��ʱ������{}  ��ʱ��{}  URI: {}  ����ڴ�: {}m  �ѷ����ڴ�: {}m  �ѷ����ڴ��е�ʣ��ռ�: {}m  �������ڴ�: {}m",
	        		new SimpleDateFormat("hh:mm:ss.SSS").format(endTime), DateUtils.formatDateTime(endTime - beginTime),
					request.getRequestURI(), Runtime.getRuntime().maxMemory()/1024/1024, Runtime.getRuntime().totalMemory()/1024/1024, Runtime.getRuntime().freeMemory()/1024/1024, 
					(Runtime.getRuntime().maxMemory()-Runtime.getRuntime().totalMemory()+Runtime.getRuntime().freeMemory())/1024/1024); 
	        //ɾ���̱߳����е����ݣ���ֹ�ڴ�й©
	        startTimeThreadLocal.remove();
		}
		
	}

}
