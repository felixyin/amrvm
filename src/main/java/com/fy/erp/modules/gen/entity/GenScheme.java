/**
 *
 */
package com.fy.erp.modules.gen.entity;

import org.hibernate.validator.constraints.Length;

import com.fy.erp.common.persistence.DataEntity;

/**
 * ���ɷ���Entity
 * @author ThinkGem
 * @version 2013-10-15
 */
public class GenScheme extends DataEntity<GenScheme> {
	
	private static final long serialVersionUID = 1L;
	private String name; 	// ����
	private String category;		// ����
	private String packageName;		// ���ɰ�·��
	private String moduleName;		// ����ģ����
	private String subModuleName;		// ������ģ����
	private String functionName;		// ���ɹ�����
	private String functionNameSimple;		// ���ɹ���������д��
	private String functionAuthor;		// ���ɹ�������
	private GenTable genTable;		// ҵ�����
	
	private String flag; 	// 0�����淽���� 1�����淽�������ɴ���
	
	private Boolean replaceFile;	// �Ƿ��滻�����ļ�    0�����滻��1���滻�ļ�

	public GenScheme() {
		super();
	}

	public GenScheme(String id){
		super(id);
	}
	
	@Length(min=1, max=200)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPackageName() {
		return packageName;
	}

	public void setPackageName(String packageName) {
		this.packageName = packageName;
	}

	public String getModuleName() {
		return moduleName;
	}

	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}

	public String getSubModuleName() {
		return subModuleName;
	}

	public void setSubModuleName(String subModuleName) {
		this.subModuleName = subModuleName;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getFunctionName() {
		return functionName;
	}

	public void setFunctionName(String functionName) {
		this.functionName = functionName;
	}

	public String getFunctionNameSimple() {
		return functionNameSimple;
	}

	public void setFunctionNameSimple(String functionNameSimple) {
		this.functionNameSimple = functionNameSimple;
	}

	public String getFunctionAuthor() {
		return functionAuthor;
	}

	public void setFunctionAuthor(String functionAuthor) {
		this.functionAuthor = functionAuthor;
	}

	public GenTable getGenTable() {
		return genTable;
	}

	public void setGenTable(GenTable genTable) {
		this.genTable = genTable;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public Boolean getReplaceFile() {
		return replaceFile;
	}

	public void setReplaceFile(Boolean replaceFile) {
		this.replaceFile = replaceFile;
	}
	
}


