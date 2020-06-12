/**
 *
 */
package com.fy.erp.common.supcan.annotation.common.fonts;

import java.lang.annotation.ElementType;
import java.lang.annotation.Inherited;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * ˶��Fontע��
 * @author WangZhen
 * @version 2013-11-12
 */
@Target({ ElementType.ANNOTATION_TYPE })
@Retention(RetentionPolicy.RUNTIME)
@Inherited
public @interface SupFont {
	
	/**
	 * ��������   ΢���ź�  ����
	 */
	String faceName() default "";

	/**
	 * �ַ��� 134
	 */
	String charSet() default "";

	/**
	 * Height(��size)������ĳߴ磬��λ��������߼���λ��ͨ������С��0�����֣�
	 * �������0����߶Ȳ��������ֵ��ڲ��о�(internal-leading)��
	 * ���õĳߴ���-8, -9, -10, -11, -12, -14, -16, -18, -20, -22, -24, -26, -28, -36, -48, -72() ;
	 */
	String height() default "";
	
	/**
	 * ����Ӵ� weight=400/700 ��Ӧ �Ǵ���/���壻
	 */
	String weight() default "";

	/**
	 * ������
	 */
	String width() default "";
	
	/**
	 * ����б��
	 */
	String italic() default "";
	
	/**
	 * �����»���
	 */
	String underline() default "";

}
