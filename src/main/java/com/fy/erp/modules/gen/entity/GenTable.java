/**
 *
 */
package com.fy.erp.modules.gen.entity;

import java.util.List;

import com.fy.erp.common.persistence.DataEntity;
import com.fy.erp.common.utils.StringUtils;
import org.hibernate.validator.constraints.Length;

import com.google.common.collect.Lists;

/**
 * ҵ���Entity
 * @author ThinkGem
 * @version 2013-10-15
 */
public class GenTable extends DataEntity<GenTable> {
	
	private static final long serialVersionUID = 1L;
	private String name; 	// ����
	private String comments;		// ����
	private String className;		// ʵ��������
	private String parentTable;		// ��������
	private String parentTableFk;		// �����������

	private List<GenTableColumn> columnList = Lists.newArrayList();	// ����

	private String nameLike; 	// ������ģ����ѯ
	
	private List<String> pkList; // ��ǰ�������б�
	
	private GenTable parent;	// �������
	private List<GenTable> childList = Lists.newArrayList();	// �ӱ��б�
	
	public GenTable() {
		super();
	}

	public GenTable(String id){
		super(id);
	}

	@Length(min=1, max=200)
	public String getName() {
		return StringUtils.lowerCase(name);
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getParentTable() {
		return StringUtils.lowerCase(parentTable);
	}

	public void setParentTable(String parentTable) {
		this.parentTable = parentTable;
	}

	public String getParentTableFk() {
		return StringUtils.lowerCase(parentTableFk);
	}

	public void setParentTableFk(String parentTableFk) {
		this.parentTableFk = parentTableFk;
	}

	public List<String> getPkList() {
		return pkList;
	}

	public void setPkList(List<String> pkList) {
		this.pkList = pkList;
	}

	public String getNameLike() {
		return nameLike;
	}

	public void setNameLike(String nameLike) {
		this.nameLike = nameLike;
	}

	public GenTable getParent() {
		return parent;
	}

	public void setParent(GenTable parent) {
		this.parent = parent;
	}

	public List<GenTableColumn> getColumnList() {
		return columnList;
	}

	public void setColumnList(List<GenTableColumn> columnList) {
		this.columnList = columnList;
	}

	public List<GenTable> getChildList() {
		return childList;
	}

	public void setChildList(List<GenTable> childList) {
		this.childList = childList;
	}
	
	/**
	 * ��ȡ������˵��
	 * @return
	 */
	public String getNameAndComments() {
		return getName() + (comments == null ? "" : "  :  " + comments);
	}

	/**
	 * ��ȡ�����������ַ���
	 * @return
	 */
	public List<String> getImportList(){
		List<String> importList = Lists.newArrayList(); // �����б�
		for (GenTableColumn column : getColumnList()){
			if (column.getIsNotBaseField() || ("1".equals(column.getIsQuery()) && "between".equals(column.getQueryType())
							&& ("createDate".equals(column.getSimpleJavaField()) || "updateDate".equals(column.getSimpleJavaField())))){
				// ���������������� ��������а�����.��������Ҫ�������á�
				if (StringUtils.indexOf(column.getJavaType(), ".") != -1 && !importList.contains(column.getJavaType())){
					importList.add(column.getJavaType());
				}
			}
			if (column.getIsNotBaseField()){
				// ����JSR303��Json��������
				for (String ann : column.getAnnotationList()){
					if (!importList.contains(StringUtils.substringBeforeLast(ann, "("))){
						importList.add(StringUtils.substringBeforeLast(ann, "("));
					}
				}
			}
		}
		// ������ӱ�����Ҫ����List�������
		if (getChildList() != null && getChildList().size() > 0){

			if (!importList.contains("java.util.List")){
//				FIXME java��������ҪҪ������ע�ͣ�kotlin����Ҫ
//				importList.add("java.util.List");
			}
			if (!importList.contains("com.google.common.collect.Lists")){
				importList.add("com.google.common.collect.Lists");
			}
		}
		return importList;
	}
	
	/**
	 * �Ƿ���ڸ���
	 * @return
	 */
	public Boolean getParentExists(){
		return parent != null && StringUtils.isNotBlank(parentTable) && StringUtils.isNotBlank(parentTableFk);
	}

	/**
	 * �Ƿ����create_date��
	 * @return
	 */
	public Boolean getCreateDateExists(){
		for (GenTableColumn c : columnList){
			if ("create_date".equals(c.getName())){
				return true;
			}
		}
		return false;
	}
	
	/**
	 * �Ƿ����update_date��
	 * @return
	 */
	public Boolean getUpdateDateExists(){
		for (GenTableColumn c : columnList){
			if ("update_date".equals(c.getName())){
				return true;
			}
		}
		return false;
	}

	/**
	 * �Ƿ����del_flag��
	 * @return
	 */
	public Boolean getDelFlagExists(){
		for (GenTableColumn c : columnList){
			if ("del_flag".equals(c.getName())){
				return true;
			}
		}
		return false;
	}
}


