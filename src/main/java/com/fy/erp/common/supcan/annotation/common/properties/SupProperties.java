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
 * ˶��Propertiesע��
 * @author WangZhen
 * @version 2013-11-12
 */
@Target({ ElementType.ANNOTATION_TYPE })
@Retention(RetentionPolicy.RUNTIME)
@Inherited
public @interface SupProperties {
	
	/**
	 * Treelist��ID	��
	 */
	String id() default "";

	/**
	 * ����	��, ����<col>�������������������Զ��ŷָ�
	 */
	String key() default "";

	/**
	 * �Ƿ�����չ��	true/false
	 */
	String isTree() default "";
	
	/**
	 * �Ƿ���ʾ����	true/false
	 * 	editAble=trueʱ��isShowRuler��Ĭ��ֵ��true��������false;
	 */
	String isShowRuler() default "";

	/**
	 * �ϼ����Ƿ�̶��ڵײ���ʼ����ʾ	true/false
	 */
	String isFixTotalRow() default "";

	/**
	 * �ϼ��еı���ɫ	��ɫ��
	 */
	String totalBgColor() default "";

	/**
	 * С���еı���ɫ	��ɫ��
	 */
	String subTotalBgColor() default "";

	/**
	 * �Ƿ�������ɾ�Ĳ���	true/false
	 * editAble=trueʱ��isShowRuler��Ĭ��ֵ��true��������false;
	 */
	String editAble() default "";
	
	/**
	 * �Ƿ������û����в���	true/false
	 * ע1: ����editAble=trueʱ��Ч; ע2: ��Ӱ����ɾ�ĵ�API;
	 */
	String addRowAble() default "";

	/**
	 * ������ʽ	
	 * 		true - ʼ����ʾ�ָ���;
	 * 		false - ʼ�ղ���ʾ�ָ���;
	 * 		auto - �Զ�(����ʱ������ม�ַָ���);
	 */
	String separateBarStyle() default "";

	/**
	 * ����б����Ƿ�ִ������	true/false
	 */
	String sortAble() default "";

	/**
	 * �Ƿ��������ͷ	true/false
	 */
	String multiLayerAble() default "";

	/**
	 * ִ�� Load() ����ʱ�ĵ��뵭��Ч��	0 - 255, ��ֵԽСЧ��Խ����, �� 0 ��ʾ�رմ�Ч��
	 */
	String fadeInStep() default "";

	/**
	 * �����������ı���ɫ	��ɫ�����������Զ��ŷָ��Ķ����ɫ(����)
	 */
	String headerBgColor() default "";

	/**
	 * �����������ĸ߶�	������
	 */
	String headerHeight() default "";

	/**
	 * ���ߵı���ɫ����ɫ�����������Զ��ŷָ��Ķ����ɫ(����)
	 */
	String leftColor() default "";

	/**
	 * �и�������
	 */
	String rowHeight() default "";

	/**
	 * ��ǰ�е���ɫ����������ɫ����
	 * ��ɫ��, ֧��ARGB��ʽ������: "#10C0D0E0", ���� "10" �� alpha(͸����), "C0D0E0" �� RGB, ����, ��֧�ְ������±߿����ԣ�
	   * ����	borderWidth - �߿��߿�
	 * 	����borderColor - �߿���ɫ
	 * 	����borderRound - �߿��ߵ�Բ��ֱ��
	 * 	ʾ��: "#12FFFFFF,#22EEFFEE; borderWidth=1; borderColor=red; borderRound=8"
	 */
	String curSelBgColor() default ""; // #F5F5F5 #FFE88D
	
	/**
	 * ���еı���ɫ������ɫ���ʽ ���ʽ, ��:
	 * 		displayMask = "bgColor=if(price=0, red, transparent); textColor=if(price>2,#000022, blue)" 
	 */
	String displayMask() default "";
	
	/**
	 * ָ��������Ĭ������	<Fonts>�е�����˳��� ָ����<Fonts>�ж���������˳���, ��0��ʼ����, �ȼ�����<Properties>�е�ͬ������
	 */
	String headerFontIndex() default "";
	
	/**
	 * ���ñ���
	 */
	SupBackground packground() default @SupBackground;

	/**
	 * �����б��ʽ
	 */
	SupExpress[] expresses() default {};
	
	/**
	 * ��ӡ�������� ����
	 */
	String title() default "";

}
