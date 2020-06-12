/**
 *
 */
package com.fy.erp.common.supcan.annotation.treelist;

import java.lang.annotation.ElementType;
import java.lang.annotation.Inherited;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import com.fy.erp.common.supcan.annotation.common.fonts.SupFont;
import com.fy.erp.common.supcan.annotation.common.properties.SupProperties;
import com.fy.erp.common.supcan.annotation.treelist.cols.SupGroup;

/**
 * ˶��TreeListע��
 * @author WangZhen
 * @version 2013-11-12
 * @see ���������ע�⣬Ӧ��ʵ����

@SupTreeList(
	properties=@SupProperties(headerFontIndex="2", curSelBgColor="#ccddcc",
		displayMask="backColor=if(name='����Ա', '#ff0000', transparent)",
		expresses={
			@SupExpress(text="total=round(price*num, 2)"),
			@SupExpress(text="price=round(total/num, 4)")
	}),
	fonts={
		@SupFont(faceName="����", weight="400"),
		@SupFont(faceName="����", weight="700", height="-12"),
		@SupFont(faceName="����", weight="400", height="-12")}, 
	groups={
		@SupGroup(id="date", name="����", headerFontIndex="1", sort=50),
		@SupGroup(id="date2", name="����2", headerFontIndex="2", sort=60, parentId="date"),
		@SupGroup(id="date3", name="����3", headerFontIndex="2", sort=70, parentId="date")
})

 */
@Target({ ElementType.TYPE })
@Retention(RetentionPolicy.RUNTIME)
@Inherited
public @interface SupTreeList {
	
	/**
	 * ���Զ���
	 */
	SupProperties properties() default @SupProperties;

	/**
	 * �������
	 */
	SupFont[] fonts() default {};
	
	/**
	 * �б�ͷ��
	 */
	SupGroup[] groups() default {};
	
}
