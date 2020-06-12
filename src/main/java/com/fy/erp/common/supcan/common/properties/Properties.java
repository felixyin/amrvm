/**
 *
 */
package com.fy.erp.common.supcan.common.properties;

import java.util.List;

import com.fy.erp.common.supcan.annotation.common.properties.SupProperties;
import com.google.common.collect.Lists;
import com.fy.erp.common.supcan.annotation.common.properties.SupExpress;
import com.fy.erp.common.utils.ObjectUtils;
import com.thoughtworks.xstream.annotations.XStreamAlias;
import com.thoughtworks.xstream.annotations.XStreamAsAttribute;

/**
 * ˶��TreeList Properties
 * @author WangZhen
 * @version 2013-11-04
 */
@XStreamAlias("Properties")
public class Properties {
	
	/**
	 * Treelist��ID	��
	 */
	@XStreamAsAttribute
	private String id;

	/**
	 * ����	��, ����<col>�������������������Զ��ŷָ�
	 */
	@XStreamAsAttribute
	private String key;

	/**
	 * �Ƿ�����չ��	true/false
	 */
	@XStreamAsAttribute
	private String isTree = "false";
	
	/**
	 * �Ƿ���ʾ����	true/false
	 * 	editAble=trueʱ��isShowRuler��Ĭ��ֵ��true��������false;
	 */
	@XStreamAsAttribute
	private String isShowRuler = "false";

	/**
	 * �ϼ����Ƿ�̶��ڵײ���ʼ����ʾ	true/false
	 */
	@XStreamAsAttribute
	private String isFixTotalRow = "false";

	/**
	 * �ϼ��еı���ɫ	��ɫ��
	 */
	@XStreamAsAttribute
	private String totalBgColor = "#FFFFCC";

	/**
	 * С���еı���ɫ	��ɫ��
	 */
	@XStreamAsAttribute
	private String subTotalBgColor = "#FFFFCC";

	/**
	 * �Ƿ�������ɾ�Ĳ���	true/false
	 * editAble=trueʱ��isShowRuler��Ĭ��ֵ��true��������false;
	 */
	@XStreamAsAttribute
	private String editAble = "false";
	
	/**
	 * �Ƿ������û����в���	true/false
	 * ע1: ����editAble=trueʱ��Ч; ע2: ��Ӱ����ɾ�ĵ�API;
	 */
	@XStreamAsAttribute
	private String addRowAble = "true";
	
	/**
	 * ������ʽ	
	 * 		true - ʼ����ʾ�ָ���;
	 * 		false - ʼ�ղ���ʾ�ָ���;
	 * 		auto - �Զ�(����ʱ������ม�ַָ���);
	 */
	@XStreamAsAttribute
	private String separateBarStyle = "false";

	/**
	 * ����б����Ƿ�ִ������	true/false
	 */
	@XStreamAsAttribute
	private String sortAble = "true";

	/**
	 * �Ƿ��������ͷ	true/false
	 */
	@XStreamAsAttribute
	private String multiLayerAble = "false";

	/**
	 * ִ�� Load() ����ʱ�ĵ��뵭��Ч��	0 - 255, ��ֵԽСЧ��Խ����, �� 0 ��ʾ�رմ�Ч��
	 */
	@XStreamAsAttribute
	private String fadeInStep = "0";

	/**
	 * �����������ı���ɫ	��ɫ�����������Զ��ŷָ��Ķ����ɫ(����)
	 */
	@XStreamAsAttribute
	private String headerBgColor = "#FDFDFD,#F0F1EF";

	/**
	 * �����������ĸ߶�	������
	 */
	@XStreamAsAttribute
	private String headerHeight = "28";

	/**
	 * ���ߵı���ɫ����ɫ�����������Զ��ŷָ��Ķ����ɫ(����)
	 */
	@XStreamAsAttribute
	private String leftColor = "#F0F1EF,#FDFDFD";

	/**
	 * �и�������
	 */
	@XStreamAsAttribute
	private String rowHeight = "28";

	/**
	 * ��ǰ�е���ɫ����������ɫ����
	 * ��ɫ��, ֧��ARGB��ʽ������: "#10C0D0E0", ���� "10" �� alpha(͸����), "C0D0E0" �� RGB, ����, ��֧�ְ������±߿����ԣ�
	   * ����	borderWidth - �߿��߿�
	 * 	����borderColor - �߿���ɫ
	 * 	����borderRound - �߿��ߵ�Բ��ֱ��
	 * 	ʾ��: "#12FFFFFF,#22EEFFEE; borderWidth=1; borderColor=red; borderRound=8"
	 */
	@XStreamAsAttribute
	private String curSelBgColor = "#F5F5F5,#EDEDED"; // #F5F5F5 #FFE88D
	
	/**
	 * ���еı���ɫ������ɫ���ʽ ���ʽ, ��:
	 * 		displayMask = "bgColor=if(price=0, red, transparent); textColor=if(price>2,#000022, blue)" 
	 */
	@XStreamAsAttribute
	private String displayMask;
	
	/**
	 * ָ��������Ĭ������	<Fonts>�е�����˳���
	 */
	@XStreamAsAttribute
	private String headerFontIndex;
	
	/**
	 * ���ñ���
	 */
	@XStreamAlias("Background")
	private Background packground = new Background();

	/**
	 * �����б��ʽ
	 */
	@XStreamAlias("Expresses")
	private List<Express> expresses;
	
	/**
	 * ��ӡ�������� ����
	 */
	@XStreamAsAttribute
	private String title;
	
	public Properties() {
		
	}

	public Properties(SupProperties supProperties) {
		this();
		ObjectUtils.annotationToObject(supProperties, this);
		if (supProperties.packground() != null){
			this.packground = new Background(supProperties.packground());
		}
		if (supProperties.expresses() != null){
			for (SupExpress supExpress : supProperties.expresses()){
				if (this.expresses == null){
					this.expresses = Lists.newArrayList();
				}
				this.expresses.add(new Express(supExpress));
			}
		}
	}
	
	public Properties(String id) {
		this();
		this.id = id;
	}

	public Properties(String id, String key) {
		this(id);
		this.key = key;
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getIsTree() {
		return isTree;
	}

	public void setIsTree(String isTree) {
		this.isTree = isTree;
	}

	public String getIsShowRuler() {
		return isShowRuler;
	}

	public void setIsShowRuler(String isShowRuler) {
		this.isShowRuler = isShowRuler;
	}

	public String getIsFixTotalRow() {
		return isFixTotalRow;
	}

	public void setIsFixTotalRow(String isFixTotalRow) {
		this.isFixTotalRow = isFixTotalRow;
	}

	public String getTotalBgColor() {
		return totalBgColor;
	}

	public void setTotalBgColor(String totalBgColor) {
		this.totalBgColor = totalBgColor;
	}

	public String getSubTotalBgColor() {
		return subTotalBgColor;
	}

	public void setSubTotalBgColor(String subTotalBgColor) {
		this.subTotalBgColor = subTotalBgColor;
	}

	public String getEditAble() {
		return editAble;
	}

	public void setEditAble(String editAble) {
		this.editAble = editAble;
	}

	public String getSeparateBarStyle() {
		return separateBarStyle;
	}

	public void setSeparateBarStyle(String separateBarStyle) {
		this.separateBarStyle = separateBarStyle;
	}

	public String getSortAble() {
		return sortAble;
	}

	public void setSortAble(String sortAble) {
		this.sortAble = sortAble;
	}

	public String getMultiLayerAble() {
		return multiLayerAble;
	}

	public void setMultiLayerAble(String multiLayerAble) {
		this.multiLayerAble = multiLayerAble;
	}

	public String getFadeInStep() {
		return fadeInStep;
	}

	public void setFadeInStep(String fadeInStep) {
		this.fadeInStep = fadeInStep;
	}

	public String getHeaderBgColor() {
		return headerBgColor;
	}

	public void setHeaderBgColor(String headerBgColor) {
		this.headerBgColor = headerBgColor;
	}

	public String getHeaderHeight() {
		return headerHeight;
	}

	public void setHeaderHeight(String headerHeight) {
		this.headerHeight = headerHeight;
	}

	public String getLeftColor() {
		return leftColor;
	}

	public void setLeftColor(String leftColor) {
		this.leftColor = leftColor;
	}

	public String getRowHeight() {
		return rowHeight;
	}

	public void setRowHeight(String rowHeight) {
		this.rowHeight = rowHeight;
	}

	public String getCurSelBgColor() {
		return curSelBgColor;
	}

	public void setCurSelBgColor(String curSelBgColor) {
		this.curSelBgColor = curSelBgColor;
	}

	public String getHeaderFontIndex() {
		return headerFontIndex;
	}

	public void setHeaderFontIndex(String headerFontIndex) {
		this.headerFontIndex = headerFontIndex;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Background getPackground() {
		return packground;
	}

	public void setPackground(Background packground) {
		this.packground = packground;
	}

	public List<Express> getExpresses() {
		return expresses;
	}

	public void setExpresses(List<Express> expresses) {
		this.expresses = expresses;
	}

	public String getDisplayMask() {
		return displayMask;
	}

	public void setDisplayMask(String displayMask) {
		this.displayMask = displayMask;
	}

	public String getAddRowAble() {
		return addRowAble;
	}

	public void setAddRowAble(String addRowAble) {
		this.addRowAble = addRowAble;
	}
	
}
