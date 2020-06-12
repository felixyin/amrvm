/**
 *
 */
package com.fy.erp.common.web;

import java.beans.PropertyEditorSupport;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolationException;
import javax.validation.ValidationException;
import javax.validation.Validator;

import com.fy.erp.common.mapper.JsonMapper;
import org.apache.commons.lang3.StringEscapeUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.validation.BindException;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fy.erp.common.beanvalidator.BeanValidators;
import com.fy.erp.common.utils.DateUtils;

/**
 * ������֧����
 * @author ThinkGem
 * @version 2013-3-23
 */
public abstract class BaseController {

	/**
	 * ��־����
	 */
	protected Logger logger = LoggerFactory.getLogger(getClass());

	/**
	 * �������·��
	 */
	@Value("${adminPath}")
	protected String adminPath;
	
	/**
	 * ǰ�˻���·��
	 */
	@Value("${frontPath}")
	protected String frontPath;
	
	/**
	 * ǰ��URL��׺
	 */
	@Value("${urlSuffix}")
	protected String urlSuffix;
	
	/**
	 * ��֤Beanʵ������
	 */
	@Autowired
	protected Validator validator;

	/**
	 * ����˲�����Ч����֤
	 * @param object ��֤��ʵ�����
	 * @param groups ��֤��
	 * @return ��֤�ɹ�������true������ʧ�ܣ���������Ϣ��ӵ� message ��
	 */
	protected boolean beanValidator(Model model, Object object, Class<?>... groups) {
		try{
			BeanValidators.validateWithException(validator, object, groups);
		}catch(ConstraintViolationException ex){
			List<String> list = BeanValidators.extractPropertyAndMessageAsList(ex, ": ");
			list.add(0, "������֤ʧ�ܣ�");
			addMessage(model, list.toArray(new String[]{}));
			return false;
		}
		return true;
	}
	
	/**
	 * ����˲�����Ч����֤
	 * @param object ��֤��ʵ�����
	 * @param groups ��֤��
	 * @return ��֤�ɹ�������true������ʧ�ܣ���������Ϣ��ӵ� flash message ��
	 */
	protected boolean beanValidator(RedirectAttributes redirectAttributes, Object object, Class<?>... groups) {
		try{
			BeanValidators.validateWithException(validator, object, groups);
		}catch(ConstraintViolationException ex){
			List<String> list = BeanValidators.extractPropertyAndMessageAsList(ex, ": ");
			list.add(0, "������֤ʧ�ܣ�");
			addMessage(redirectAttributes, list.toArray(new String[]{}));
			return false;
		}
		return true;
	}
	
	/**
	 * ����˲�����Ч����֤
	 * @param object ��֤��ʵ�����
	 * @param groups ��֤�飬������˲���ʱ��ͬ@Validע����֤
	 * @return ��֤�ɹ�������ִ�У���֤ʧ�ܣ��׳��쳣��ת400ҳ�档
	 */
	protected void beanValidator(Object object, Class<?>... groups) {
		BeanValidators.validateWithException(validator, object, groups);
	}
	
	/**
	 * ���Model��Ϣ
	 * @param message
	 */
	protected void addMessage(Model model, String... messages) {
		StringBuilder sb = new StringBuilder();
		for (String message : messages){
			sb.append(message).append(messages.length>1?"<br/>":"");
		}
		model.addAttribute("message", sb.toString());
	}
	
	/**
	 * ���Flash��Ϣ
	 * @param message
	 */
	protected void addMessage(RedirectAttributes redirectAttributes, String... messages) {
		StringBuilder sb = new StringBuilder();
		for (String message : messages){
			sb.append(message).append(messages.length>1?"<br/>":"");
		}
		redirectAttributes.addFlashAttribute("message", sb.toString());
	}
	
	/**
	 * �ͻ��˷���JSON�ַ���
	 * @param response
	 * @param object
	 * @return
	 */
	protected String renderString(HttpServletResponse response, Object object) {
		return renderString(response, JsonMapper.toJsonString(object), "application/json");
	}
	
	/**
	 * �ͻ��˷����ַ���
	 * @param response
	 * @param string
	 * @return
	 */
	protected String renderString(HttpServletResponse response, String string, String type) {
		try {
			response.reset();
	        response.setContentType(type);
	        response.setCharacterEncoding("utf-8");
			response.getWriter().print(string);
			return null;
		} catch (IOException e) {
			return null;
		}
	}

	/**
	 * �������쳣
	 */
	@ExceptionHandler({BindException.class, ConstraintViolationException.class, ValidationException.class})
    public String bindException() {  
        return "error/400";
    }
	
	/**
	 * ��Ȩ��¼�쳣
	 */
	@ExceptionHandler({AuthenticationException.class})
    public String authenticationException() {  
        return "error/403";
    }
	
	/**
	 * ��ʼ�����ݰ�
	 * 1. �����д��ݽ�����String����HTML���룬��ֹXSS����
	 * 2. ���ֶ���Date����ת��ΪString����
	 */
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		// String����ת���������д��ݽ�����String����HTML���룬��ֹXSS����
		binder.registerCustomEditor(String.class, new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) {
				setValue(text == null ? null : StringEscapeUtils.escapeHtml4(text.trim()));
			}
			@Override
			public String getAsText() {
				Object value = getValue();
				return value != null ? value.toString() : "";
			}
		});
		// Date ����ת��
		binder.registerCustomEditor(Date.class, new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) {
				setValue(DateUtils.parseDate(text));
			}
//			@Override
//			public String getAsText() {
//				Object value = getValue();
//				return value != null ? DateUtils.formatDateTime((Date)value) : "";
//			}
		});
	}
	
}
