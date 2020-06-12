/**
 *
 */
package com.fy.erp.common.supcan.annotation.common.properties;

import java.lang.annotation.ElementType;
import java.lang.annotation.Inherited;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * ˶��Expressע��
 * @author WangZhen
 * @version 2013-11-12
 */
@Target({ ElementType.ANNOTATION_TYPE })
@Retention(RetentionPolicy.RUNTIME)
@Inherited
public @interface SupExpress {
	
	/**
	 * �Ƿ��Զ����е����ù�ϵ�Ż�����˳��  Ĭ��ֵtrue
	 */
	String isOpt() default "";
	
	/**
	 * �ı�
	 */
	String text() default "";

}
