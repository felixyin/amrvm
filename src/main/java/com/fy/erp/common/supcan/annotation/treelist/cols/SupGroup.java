/**
 *
 */
package com.fy.erp.common.supcan.annotation.treelist.cols;

import java.lang.annotation.ElementType;
import java.lang.annotation.Inherited;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * ˶��Groupע��
 * @author WangZhen
 * @version 2013-11-12
 */
@Target({ ElementType.ANNOTATION_TYPE })
@Retention(RetentionPolicy.RUNTIME)
@Inherited
public @interface SupGroup {

	/**
	 * �����id�������ڼ��ز��ø�id����������XML/JSON����
	 */
	String id();
	
	/**
	 * ��ʾ������ �� 
	 */
	String name() default "";

	/**
	 * ���õ�����, ǰ�涨���<Font>����� ���� ָ����<Fonts>�ж���������˳���, ��0��ʼ����, �ȼ�����<Properties>�е�ͬ������
	 */
	String headerFontIndex() default "";

	/**
	 * ������ɫ ��ɫ�� #000000 
	 */
	String textColor() default "";
	
	/**
	 * ���ֶ��� left/center/right center 
	 */
	String align() default "";

	/**
	 * ������ID
	 */
	String parentId() default "";
	
	/**
	 * ��������
	 */
	int sort() default 0;
}
