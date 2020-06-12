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
 * ҵ����ֶ�Entity
 * @author ThinkGem
 * @version 2013-10-15
 */
public class GenTableColumn extends DataEntity<GenTableColumn> {
	
	private static final long serialVersionUID = 1L;
	private GenTable genTable;	// ������
	private String name; 		// ����
	private String comments;	// ����
	private String jdbcType;	// JDBC����
	private String javaType;	// JAVA����
	private String javaField;	// JAVA�ֶ���
	private String isPk;		// �Ƿ�������1��������
	private String isNull;		// �Ƿ��Ϊ�գ�1����Ϊ�գ�0����Ϊ�գ�
	private String isInsert;	// �Ƿ�Ϊ�����ֶΣ�1�������ֶΣ�
	private String isEdit;		// �Ƿ�༭�ֶΣ�1���༭�ֶΣ�
	private String isList;		// �Ƿ��б��ֶΣ�1���б��ֶΣ�
	private String isSort;		// �Ƿ��б��ֶ�����1���б��ֶ�����
	private String isEditable;	// �Ƿ��б��ֶα༭��1���б��ֶα༭��
	private String isQuery;		// �Ƿ��ѯ�ֶΣ�1����ѯ�ֶΣ�
	private String queryType;	// ��ѯ��ʽ�����ڡ������ڡ����ڡ�С�ڡ���Χ����LIKE����LIKE������LIKE��
	private String showType;	// �ֶ����ɷ������ı����ı��������򡢸�ѡ�򡢵�ѡ���ֵ�ѡ����Աѡ�񡢲���ѡ������ѡ��
	private String dictType;	// �ֵ�����
	private Integer sort;		// ��������

	public GenTableColumn() {
		super();
	}

	public GenTableColumn(String id){
		super(id);
	}
	
	public GenTableColumn(GenTable genTable){
		this.genTable = genTable;
	}

	public GenTable getGenTable() {
		return genTable;
	}

	public void setGenTable(GenTable genTable) {
		this.genTable = genTable;
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

	public String getJdbcType() {
		return StringUtils.lowerCase(jdbcType);
	}

	public void setJdbcType(String jdbcType) {
		this.jdbcType = jdbcType;
	}

	public String getJavaType() {
		return javaType;
	}

	public void setJavaType(String javaType) {
		this.javaType = javaType;
	}

	public String getJavaField() {
		return javaField;
	}

	public void setJavaField(String javaField) {
		this.javaField = javaField;
	}

	public String getIsPk() {
		return isPk;
	}

	public void setIsPk(String isPk) {
		this.isPk = isPk;
	}

	public String getIsNull() {
		return isNull;
	}

	public void setIsNull(String isNull) {
		this.isNull = isNull;
	}

	public String getIsInsert() {
		return isInsert;
	}

	public void setIsInsert(String isInsert) {
		this.isInsert = isInsert;
	}

	public String getIsEdit() {
		return isEdit;
	}

	public void setIsEdit(String isEdit) {
		this.isEdit = isEdit;
	}

	public String getIsList() {
		return isList;
	}

	public void setIsList(String isList) {
		this.isList = isList;
	}

	public String getIsSort() { return isSort; }

	public void setIsSort(String isSort) { this.isSort = isSort; }

	public String getIsEditable() { return isEditable; }

	public void setIsEditable(String isEditable) { this.isEditable = isEditable;}

	public String getIsQuery() {
		return isQuery;
	}

	public void setIsQuery(String isQuery) {
		this.isQuery = isQuery;
	}

	public String getQueryType() {
		return queryType;
	}

	public void setQueryType(String queryType) {
		this.queryType = queryType;
	}

	public String getShowType() {
		return showType;
	}

	public void setShowType(String showType) {
		this.showType = showType;
	}

	public String getDictType() {
		return dictType == null ? "" : dictType;
	}

	public void setDictType(String dictType) {
		this.dictType = dictType;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	/**
	 * ��ȡ������˵��
	 * @return
	 */
	public String getNameAndComments() {
		return getName() + (comments == null ? "" : "  :  " + comments);
	}
	
	/**
	 * ��ȡ�ַ�������
	 * @return
	 */
	public String getDataLength(){
		String[] ss = StringUtils.split(StringUtils.substringBetween(getJdbcType(), "(", ")"), ",");
		if (ss != null && ss.length == 1){// && "String".equals(getJavaType())){
			return ss[0];
		}
		return "0";
	}

	/**
	 * ��ȡ��дJava����
	 * @return
	 */
	public String getSimpleJavaType(){
		if ("This".equals(getJavaType())){
			return StringUtils.capitalize(genTable.getClassName());
		}
		return StringUtils.indexOf(getJavaType(), ".") != -1 
				? StringUtils.substringAfterLast(getJavaType(), ".")
						: getJavaType();
	}
	
	/**
	 * ��ȡ��дJava�ֶ�
	 * @return
	 */
	public String getSimpleJavaField(){
		return StringUtils.substringBefore(getJavaField(), ".");
	}
	
	/**
	 * ��ȡJava�ֶΣ�����Ƕ������ȡ����.��������1
	 * @return
	 */
	public String getJavaFieldId(){
		return StringUtils.substringBefore(getJavaField(), "|");
	}
	
	/**
	 * ��ȡJava�ֶΣ�����Ƕ������ȡ����.��������2
	 * @return
	 */
	public String getJavaFieldName(){
		String[][] ss = getJavaFieldAttrs();
		return ss.length>0 ? getSimpleJavaField()+"."+ss[0][0] : "";
	}
	
	/**
	 * ��ȡJava�ֶΣ�����������
	 * @return
	 */
	public String[][] getJavaFieldAttrs(){
		String[] ss = StringUtils.split(StringUtils.substringAfter(getJavaField(), "|"), "|");
		String[][] sss = new String[ss.length][2];
		if (ss!=null){
			for (int i=0; i<ss.length; i++){
				sss[i][0] = ss[i];
				sss[i][1] = StringUtils.toUnderScoreCase(ss[i]);
			}
		}
		return sss;
	}
	
	/**
	 * ��ȡ��ע���б�
	 * @return
	 */
	public List<String> getAnnotationList(){
		List<String> list = Lists.newArrayList();
		// ����Jacksonע��
		if ("This".equals(getJavaType())){
			list.add("com.fasterxml.jackson.annotation.JsonBackReference");
		}
		if ("java.util.Date".equals(getJavaType())){
			list.add("com.fasterxml.jackson.annotation.JsonFormat(pattern = \"yyyy-MM-dd HH:mm:ss\")");
		}
		// ����JSR303��֤������
		if (!"1".equals(getIsNull()) && !"String".equals(getJavaType())){
			list.add("javax.validation.constraints.NotNull(message=\""+getComments()+"����Ϊ��\")");
		}
		else if (!"1".equals(getIsNull()) && "String".equals(getJavaType()) && !"0".equals(getDataLength())){
			list.add("org.hibernate.validator.constraints.Length(min=1, max="+getDataLength()
					+", message=\""+getComments()+"���ȱ������ 1 �� "+getDataLength()+" ֮��\")");
		}
		else if ("String".equals(getJavaType()) && !"0".equals(getDataLength())){
			list.add("org.hibernate.validator.constraints.Length(min=0, max="+getDataLength()
					+", message=\""+getComments()+"���ȱ������ 0 �� "+getDataLength()+" ֮��\")");
		}
		return list;
	}
	
	/**
	 * ��ȡ��д��ע���б�
	 * @return
	 */
	public List<String> getSimpleAnnotationList(){
		List<String> list = Lists.newArrayList();
		for (String ann : getAnnotationList()){
			list.add(StringUtils.substringAfterLast(ann, "."));
		}
		return list;
	}
	
	/**
	 * �Ƿ��ǻ����ֶ�
	 * @return
	 */
	public Boolean getIsNotBaseField(){
		return !StringUtils.equals(getSimpleJavaField(), "id")
				&& !StringUtils.equals(getSimpleJavaField(), "remarks")
				&& !StringUtils.equals(getSimpleJavaField(), "createBy")
				&& !StringUtils.equals(getSimpleJavaField(), "createDate")
				&& !StringUtils.equals(getSimpleJavaField(), "updateBy")
				&& !StringUtils.equals(getSimpleJavaField(), "updateDate")
				&& !StringUtils.equals(getSimpleJavaField(), "delFlag");
	}
	
}


