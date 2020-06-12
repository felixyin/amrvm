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
 * ˶��Colע��
 * @author WangZhen
 * @version 2013-11-12
 * @see ��get���������ע�⣬Ӧ��ʵ����
 * 
 * 		@SupCol(text="������˾", sort = 10)
 */
@Target({ ElementType.METHOD })
@Retention(RetentionPolicy.RUNTIME)
@Inherited
public @interface SupCol {

	///////////////////////////////////// ��Ҫ //////////////////////////////////////
	
	/**
	 * ������Ĭ�ϵ�ǰ�ֶ�����
	 */
	String name() default "";

	/**
	* �����Ƿ������ظ� true/false 
	*/
	String isUnique() default "";
	
	/**
	* �Ƿ�����Ϊ�� true/false 
	*/
	String nullAble() default "";
	
	/**
	* Ĭ��ֵ ��, �����²����в���ʱ�ĳ�ʼ, ֧���� "=" ��ͷ�ı��ʽ������ defaultValue="=now( )", ��ʾ��������Ĭ��ֵ��Ϊ���� (��)   
	* 		ע: �����²��������Ч 
	*/
	String defaultValue() default "";
	
	/**
	* �������� �� string / int / double / bool / date / datetime �⼸�� 
	*/
	String dataType() default "";
	
	/**
	* С��λ�� -1��8, ������ double �͡� -1��ʾС��λ����ȷ��, ������0λ��8λ֮�������������, Ĭ�ϣ� 2 
	*/
	String decimal() default "";
	
	/**
	* �Ƿ������� true/false false 
	*/
	String isHyperlink() default "";
	
	/**
	* �Ƿ�����, true - ����() default "";
	* 	false - ��ʾ() default "";
	* 	absHide �� absTrue - �������أ����ᱻ����Ҽ��˵�ѡ��() default "";
	* 	absShow �� absFalse - ������ʾ�����ᱻ����Ҽ��˵�ѡ��() default ""; 
	*/
	String isHide() default "";
	
	/**
	* ����б����Ƿ�ִ������ true/false ,Ĭ�ϣ�true   
	* 	ע: ���<Properties>�е�sortAble��Ϊfalse, ��sortAble��Ч(false) 
	*/
	String sortAble() default "";
	
	/**
	* �Ƿ������е��϶����� ,Ĭ�ϣ�true   
	* 	ע: ���<Properties>�е�moveAble��Ϊfalse, ��moveAble��Ч(false) 
	*/
	String moveAble() default "";
	
	/**
	* �Ƿ�����ճ�� ,Ĭ�ϣ�supcan.xml
	* 	true - ����() default "";
	* 	false - ������() default "";
	* 	supcan.xml - ͨ�����������ǵ��в��ɱ༭ʱ(��������ʱ)������supcan.xml�е� <pasteAbleWhenUnEditAble> ���趨Ϊ׼() default "";
	*/
	String pasteAble() default "";
	
	/**
	* ָ����һ�е���������ʾ�����ݴ���ڸ����У������� key-value�� �ļ����ֵ�������
	*/
	String textId() default "";
	
	///////////////////////////////////// ��� //////////////////////////////////////
	
	/**
	* �Ƿ���ǧλ���ָ���ʾ true/false Ĭ�ϣ�true   
	* 	ע: ������ datatype Ϊ int �� double ʱ 
	*/
	String isThousandSeparat() default "";
	
	/**
	* �п� ���� - ���Կ�� (��λ:������)() default "";
	* 	�ٷֱ� - ���ڿ�ȵİٷֱ�, �磺20%() default "";
	* 	ΪС��1�ķ��� - �������ӣ����ڷ���ʣ��Ŀ��, ��0.2() default "";
	* 	fitHeader �� header - �Զ���չ����ʹ��ͷ�����ܹ�������ʾ() default ""; 
	*/
	String width() default "";
	
	/**
	* �е���С��� ������ 10 
	*/
	String minWidth() default "";
	
	/**
	* ˮƽ���� left / center / right 
	*/
	String align() default "";
	
	/**
	* ��ֱ���� top / vcenter(��middle) / bottom vcenter 
	*/
	String vAlign() default "";
	
	/**
	* �б������ֵĶ��� left / center / right center 
	*/
	String alignHeader() default "";
	
	/**
	* ���õ����� ���֣�ָ����<Fonts>�ж���������˳���, ��0��ʼ����, �ȼ�����<Properties>�е�ͬ������ -1 
	*/
	String fontIndex() default "";
	
	/**
	* �б�����õ����� ���֣�ָ����<Fonts>�ж���������˳���, ��0��ʼ����, �ȼ�����<Properties>�е�ͬ������ -1 
	*/
	String headerFontIndex() default "";
	
	/**
	* �б���������ɫ ��ɫ�� #000000 
	*/
	String headerTextColor() default "";
	
	/**
	* �б����Աߵ�Сͼ�� ������ͼ���URL, Ҳ���������¸�ʽ�Ĵ�: 
	*	����url=[?]() default "";pos=[?]
	*	pos����ָ��ͼ���λ��, ��ˮƽ(left/right)�� ��ֱ(top/middle/bottom)��������. ��������:
	*	����url=../ac.png() default "";pos=right,bottom
	*	�������png��ico����͸����ͼƬ 
	*/
	String headerIcon() default "";
	
	/**
	* ���������Сͼ��ʱ��������ʾ���� ���ִ�, ���������������������Сͼ��ʱ������Clicked�¼� 
	*/
	String headerIconTip() default "";
	
	/**
	* ������ʾ�ĸ�ʽ������ʽ ���ʽ�����ݰ�����ʾ���ݡ� ����ɫ�� ����ɫ�� ��ͼ�� ��ͼ. �����Treelist�����ĵ���"3.������Ҫ������" 
	* 	formatDate(data,'YYYY-MM-DD')
	* 	=if(data=='1','�ر�',if(data=='2','�����',if(data=='3','δ����','������')))
	*/
	String displayMask() default "";
	
	/**
	* λ�ڶ���ͷ�Ĳ�λ�� ���֣���0��ʼ 
	*/
	String atLayer() default "";
	
	/**
	* λ�ڶ���ͷ�Ĳ�λ�� ���֣���0��ʼ 
	*/
	String extentRows() default "";
	
	/**
	* ������(droplis, droptreelist)��Ԫ���������ʾ��ʽ 0 - ����ʾ���ֲ���() default "";
	* 	1 - ����ʾ��ֵ(��key)����() default "";
	* 	2 - ��ֵ+" - "+����() default ""; 
	*/
	String dropDisplayType() default "";
	
	/**
	* �����е����ݷָ��� ��������"/", ���������������ڼ������ݺ󣬳��򽫰�����ָ����Զ��Ը������ݽ��д���ʹ�俴��ȥ���ֶ��е�Ч��������, �����������򡢺��������������ͬ�����ݣ����Զ������ݡ���ĺϲ�Ч�� (��)  
	* 	ע1: ���ı���ʾЧ���������ı�����() default "";
	* 	ע2: VColSep����������ƣ�����ֻ������string�͡�������Ϊ���������еȵ�() default "";
	*/
	String VColSep() default "";
	
	/**
	* VColSepStyle �����еĺϲ���ʽ row - ֻ������еĴ�ֱ�ϲ�() default "";
	* col - ֻ������еĺ���ϲ�() default "";
	* row,col - ���С������Զ��ϲ�() default ""; 
	*/
	String VColSepStyle() default "";
	
	/**
	* �ϼƱ��ʽ
	*/
	String totalExpress() default "";
	
	/**
	* С�Ʊ��ʽ
	*/
	String subTotalExpress() default "";
	
	/**
	 * �е���ʾ����
	 */
	String text() default "";
	
	/**
	 * ������ID
	 */
	String groupId() default "";

	/**
	 * ��������
	 */
	int sort() default 0;
}
