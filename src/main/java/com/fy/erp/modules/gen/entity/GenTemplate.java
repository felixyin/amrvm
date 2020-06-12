/**
 *
 */
package com.fy.erp.modules.gen.entity;

import java.util.List;

import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

import org.hibernate.validator.constraints.Length;

import com.google.common.collect.Lists;
import com.fy.erp.common.persistence.DataEntity;
import com.fy.erp.common.utils.StringUtils;

/**
 * ���ɷ���Entity
 * @author ThinkGem
 * @version 2013-10-15
 */
@XmlRootElement(name="template")
public class GenTemplate extends DataEntity<GenTemplate> {
	
	private static final long serialVersionUID = 1L;
	private String name; 	// ����
	private String category;		// ����
	private String filePath;		// �����ļ�·��
	private String fileName;		// �ļ���
	private String content;		// ����

	public GenTemplate() {
		super();
	}

	public GenTemplate(String id){
		super(id);
	}
	
	@Length(min=1, max=200)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
	
	@XmlTransient
	public List<String> getCategoryList() {
		if (category == null){
			return Lists.newArrayList();
		}else{
			return Lists.newArrayList(StringUtils.split(category, ","));
		}
	}

	public void setCategoryList(List<String> categoryList) {
		if (categoryList == null){
			this.category = "";
		}else{
			this.category = ","+StringUtils.join(categoryList, ",") + ",";
		}
	}
	
}

