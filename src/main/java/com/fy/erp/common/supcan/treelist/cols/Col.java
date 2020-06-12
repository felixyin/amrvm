/**
 *
 */
package com.fy.erp.common.supcan.treelist.cols;

import com.fy.erp.common.supcan.annotation.treelist.cols.SupCol;
import com.fy.erp.common.utils.ObjectUtils;
import com.thoughtworks.xstream.annotations.XStreamAlias;
import com.thoughtworks.xstream.annotations.XStreamAsAttribute;
import com.thoughtworks.xstream.annotations.XStreamConverter;
import com.thoughtworks.xstream.annotations.XStreamOmitField;
import com.thoughtworks.xstream.converters.extended.ToAttributedValueConverter;

/**
 * ˶��TreeList Cols Col
 * @author WangZhen
 * @version 2013-11-04
 */
@XStreamAlias("Col")
@XStreamConverter(value = ToAttributedValueConverter.class, strings = {"text"})
public class Col {

	///////////////////////////////////// ��Ҫ //////////////////////////////////////
	/**
	 * ���� ��, �൱���ֶ��� 
	 */
	@XStreamAsAttribute
	private String name;

	/**
	 * �����Ƿ������ظ� true/false 
	 */
	@XStreamAsAttribute
	private String isUnique = "false";
	
	/**
	 * �Ƿ�����Ϊ�� true/false 
	 */
	@XStreamAsAttribute
	private String nullAble = "true";

	/**
	 * Ĭ��ֵ ��, �����²����в���ʱ�ĳ�ʼ, ֧���� "=" ��ͷ�ı��ʽ������ defaultValue="=now( )", ��ʾ��������Ĭ��ֵ��Ϊ���� (��)   
	 * 		ע: �����²��������Ч 
	 */
	@XStreamAsAttribute
	private String defaultValue;

	/**
	 * �������� �� string / int / double / bool / date / datetime �⼸�� 
	 */
	@XStreamAsAttribute
	private String dataType;
	
	/**
	 * С��λ�� -1��8, ������ double �͡� -1��ʾС��λ����ȷ��, ������0λ��8λ֮�������������, Ĭ�ϣ� 2 
	 */
	@XStreamAsAttribute
	private String decimal;
	
	/**
	 * �Ƿ������� true/false false 
	 */
	@XStreamAsAttribute
	private String isHyperlink;

	/**
	 * �Ƿ�����, true - ����;
	 * 	false - ��ʾ;
	 * 	absHide �� absTrue - �������أ����ᱻ����Ҽ��˵�ѡ��;
	 * 	absShow �� absFalse - ������ʾ�����ᱻ����Ҽ��˵�ѡ��; 
	 */
	@XStreamAsAttribute
	private String isHide;
	
	/**
	 * ����б����Ƿ�ִ������ true/false ,Ĭ�ϣ�true   
	 * 	ע: ���<Properties>�е�sortAble��Ϊfalse, ��sortAble��Ч(false) 
	 */
	@XStreamAsAttribute
	private String sortAble;
	
	/**
	 * �Ƿ������е��϶����� ,Ĭ�ϣ�true   
	 * 	ע: ���<Properties>�е�moveAble��Ϊfalse, ��moveAble��Ч(false) 
	 */
	@XStreamAsAttribute
	private String moveAble;
	
	/**
	 * �Ƿ�����ճ�� ,Ĭ�ϣ�supcan.xml
	 * 	true - ����;
	 * 	false - ������;
	 * 	supcan.xml - ͨ�����������ǵ��в��ɱ༭ʱ(��������ʱ)������supcan.xml�е� <pasteAbleWhenUnEditAble> ���趨Ϊ׼;
	 */
	@XStreamAsAttribute
	private String pasteAble;

	/**
	 * ָ����һ�е���������ʾ�����ݴ���ڸ����У������� key-value�� �ļ����ֵ�������
	 */
	@XStreamAsAttribute
	private String textId;
	
	///////////////////////////////////// ��� //////////////////////////////////////
	
	/**
	 * �Ƿ���ǧλ���ָ���ʾ true/false Ĭ�ϣ�true   
	 * 	ע: ������ datatype Ϊ int �� double ʱ 
	 */
	@XStreamAsAttribute
	private String isThousandSeparat;
	
	/**
	 * �п� ���� - ���Կ�� (��λ:������);
	 * 	�ٷֱ� - ���ڿ�ȵİٷֱ�, �磺20%;
	 * 	ΪС��1�ķ��� - �������ӣ����ڷ���ʣ��Ŀ��, ��0.2;
	 * 	fitHeader �� header - �Զ���չ����ʹ��ͷ�����ܹ�������ʾ; 
	 */
	@XStreamAsAttribute
	private String width;
	
	/**
	 * �е���С��� ������ 10 
	 */
	@XStreamAsAttribute
	private String minWidth;
	
	/**
	 * ˮƽ���� left / center / right 
	 */
	@XStreamAsAttribute
	private String align;
	
	/**
	 * ��ֱ���� top / vcenter(��middle) / bottom vcenter 
	 */
	@XStreamAsAttribute
	private String vAlign;
	
	/**
	 * �б������ֵĶ��� left / center / right center 
	 */
	@XStreamAsAttribute
	private String alignHeader;
	
	/**
	 * ���õ����� ���֣�ָ����<Fonts>�ж���������˳���, ��0��ʼ����, �ȼ�����<Properties>�е�ͬ������ -1 
	 */
	@XStreamAsAttribute
	private String fontIndex;
	
	/**
	 * �б�����õ����� ���֣�ָ����<Fonts>�ж���������˳���, ��0��ʼ����, �ȼ�����<Properties>�е�ͬ������ -1 
	 */
	@XStreamAsAttribute
	private String headerFontIndex;
	
	/**
	 * �б���������ɫ ��ɫ�� #000000 
	 */
	@XStreamAsAttribute
	private String headerTextColor;
	
	/**
	 * �б����Աߵ�Сͼ�� ������ͼ���URL, Ҳ���������¸�ʽ�Ĵ�: 
	 *	����url=[?];pos=[?]
	 *	pos����ָ��ͼ���λ��, ��ˮƽ(left/right)�� ��ֱ(top/middle/bottom)��������. ��������:
	 *	����url=../ac.png;pos=right,bottom
	 *	�������png��ico����͸����ͼƬ 
	 */
	@XStreamAsAttribute
	private String headerIcon;
	
	/**
	 * ���������Сͼ��ʱ��������ʾ���� ���ִ�, ���������������������Сͼ��ʱ������Clicked�¼� 
	 */
	@XStreamAsAttribute
	private String headerIconTip;

	/**
	 * ������ʾ�ĸ�ʽ������ʽ ���ʽ�����ݰ�����ʾ���ݡ� ����ɫ�� ����ɫ�� ��ͼ�� ��ͼ. �����Treelist�����ĵ���"3.������Ҫ������" 
	 * 	formatDate(data,'YYYY-MM-DD')
	 * 	=if(data=='1','�ر�',if(data=='2','�����',if(data=='3','δ����','������')))
	 */
	@XStreamAsAttribute
	private String displayMask;
	
	/**
	 * λ�ڶ���ͷ�Ĳ�λ�� ���֣���0��ʼ 
	 */
	@XStreamAsAttribute
	private String atLayer;
	
	/**
	 * λ�ڶ���ͷ�Ĳ�λ�� ���֣���0��ʼ 
	 */
	@XStreamAsAttribute
	private String extentRows;
	
	/**
	 * ������(droplis, droptreelist)��Ԫ���������ʾ��ʽ 0 - ����ʾ���ֲ���;
	 * 	1 - ����ʾ��ֵ(��key)����;
	 * 	2 - ��ֵ+" - "+����; 
	 */
	@XStreamAsAttribute
	private String dropDisplayType;
	
	/**
	 * �����е����ݷָ��� ��������"/", ���������������ڼ������ݺ󣬳��򽫰�����ָ����Զ��Ը������ݽ��д���ʹ�俴��ȥ���ֶ��е�Ч��������, �����������򡢺��������������ͬ�����ݣ����Զ������ݡ���ĺϲ�Ч�� (��)  
	 * 	ע1: ���ı���ʾЧ���������ı�����;
	 * 	ע2: VColSep����������ƣ�����ֻ������string�͡�������Ϊ���������еȵ�;
	 */
	@XStreamAsAttribute
	private String VColSep;
	
	/**
	 * VColSepStyle �����еĺϲ���ʽ row - ֻ������еĴ�ֱ�ϲ�;
	 * col - ֻ������еĺ���ϲ�;
	 * row,col - ���С������Զ��ϲ�; 
	 */
	@XStreamAsAttribute
	private String VColSepStyle;
	
	/**
	 * �ϼƱ��ʽ
	 */
	@XStreamAsAttribute
	private String totalExpress;

	/**
	 * С�Ʊ��ʽ
	 */
	@XStreamAsAttribute
	private String subTotalExpress;
	
	/**
	 * �е���ʾ����
	 */
	private String text;
	
	/**
	 * ������ID
	 */
	@XStreamOmitField
	private String groupId;
	
	/**
	 * �ֶ�����ע�ⶨ��ʱ��Ч
	 */
	@XStreamOmitField
	private int sort;
	
	public Col() {
		
	}

	public Col(String name) {
		this.name = name;
	}
	
	public Col(String name, String text) {
		this(name);
		this.text = text;
	}
	
	public Col(SupCol supCol){
		ObjectUtils.annotationToObject(supCol, this);
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIsUnique() {
		return isUnique;
	}

	public void setIsUnique(String isUnique) {
		this.isUnique = isUnique;
	}

	public String getNullAble() {
		return nullAble;
	}

	public void setNullAble(String nullAble) {
		this.nullAble = nullAble;
	}

	public String getDefaultValue() {
		return defaultValue;
	}

	public void setDefaultValue(String defaultValue) {
		this.defaultValue = defaultValue;
	}

	public String getDataType() {
		return dataType;
	}

	public void setDataType(String dataType) {
		this.dataType = dataType;
	}

	public String getDecimal() {
		return decimal;
	}

	public void setDecimal(String decimal) {
		this.decimal = decimal;
	}

	public String getIsHyperlink() {
		return isHyperlink;
	}

	public void setIsHyperlink(String isHyperlink) {
		this.isHyperlink = isHyperlink;
	}

	public String getIsHide() {
		return isHide;
	}

	public void setIsHide(String isHide) {
		this.isHide = isHide;
	}

	public String getSortAble() {
		return sortAble;
	}

	public void setSortAble(String sortAble) {
		this.sortAble = sortAble;
	}

	public String getMoveAble() {
		return moveAble;
	}

	public void setMoveAble(String moveAble) {
		this.moveAble = moveAble;
	}

	public String getPasteAble() {
		return pasteAble;
	}

	public void setPasteAble(String pasteAble) {
		this.pasteAble = pasteAble;
	}

	public String getTextId() {
		return textId;
	}

	public void setTextId(String textId) {
		this.textId = textId;
	}

	public String getIsThousandSeparat() {
		return isThousandSeparat;
	}

	public void setIsThousandSeparat(String isThousandSeparat) {
		this.isThousandSeparat = isThousandSeparat;
	}

	public String getWidth() {
		return width;
	}

	public void setWidth(String width) {
		this.width = width;
	}

	public String getMinWidth() {
		return minWidth;
	}

	public void setMinWidth(String minWidth) {
		this.minWidth = minWidth;
	}

	public String getAlign() {
		return align;
	}

	public void setAlign(String align) {
		this.align = align;
	}

	public String getvAlign() {
		return vAlign;
	}

	public void setvAlign(String vAlign) {
		this.vAlign = vAlign;
	}

	public String getAlignHeader() {
		return alignHeader;
	}

	public void setAlignHeader(String alignHeader) {
		this.alignHeader = alignHeader;
	}

	public String getFontIndex() {
		return fontIndex;
	}

	public void setFontIndex(String fontIndex) {
		this.fontIndex = fontIndex;
	}

	public String getHeaderFontIndex() {
		return headerFontIndex;
	}

	public void setHeaderFontIndex(String headerFontIndex) {
		this.headerFontIndex = headerFontIndex;
	}

	public String getHeaderTextColor() {
		return headerTextColor;
	}

	public void setHeaderTextColor(String headerTextColor) {
		this.headerTextColor = headerTextColor;
	}

	public String getHeaderIcon() {
		return headerIcon;
	}

	public void setHeaderIcon(String headerIcon) {
		this.headerIcon = headerIcon;
	}

	public String getHeaderIconTip() {
		return headerIconTip;
	}

	public void setHeaderIconTip(String headerIconTip) {
		this.headerIconTip = headerIconTip;
	}

	public String getDisplayMask() {
		return displayMask;
	}

	public void setDisplayMask(String displayMask) {
		this.displayMask = displayMask;
	}

	public String getAtLayer() {
		return atLayer;
	}

	public void setAtLayer(String atLayer) {
		this.atLayer = atLayer;
	}

	public String getExtentRows() {
		return extentRows;
	}

	public void setExtentRows(String extentRows) {
		this.extentRows = extentRows;
	}

	public String getDropDisplayType() {
		return dropDisplayType;
	}

	public void setDropDisplayType(String dropDisplayType) {
		this.dropDisplayType = dropDisplayType;
	}

	public String getVColSep() {
		return VColSep;
	}

	public void setVColSep(String vColSep) {
		VColSep = vColSep;
	}

	public String getVColSepStyle() {
		return VColSepStyle;
	}

	public void setVColSepStyle(String vColSepStyle) {
		VColSepStyle = vColSepStyle;
	}

	public String getTotalExpress() {
		return totalExpress;
	}

	public void setTotalExpress(String totalExpress) {
		this.totalExpress = totalExpress;
	}

	public String getSubTotalExpress() {
		return subTotalExpress;
	}

	public void setSubTotalExpress(String subTotalExpress) {
		this.subTotalExpress = subTotalExpress;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public int getSort() {
		return sort;
	}

	public void setSort(int sort) {
		this.sort = sort;
	}

	public String getGroupId() {
		return groupId;
	}

	public void setGroupId(String groupId) {
		this.groupId = groupId;
	}
	
}
