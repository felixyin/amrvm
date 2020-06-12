/**
 *
 */
package com.fy.erp.common.supcan.common;

import java.util.List;

import com.fy.erp.common.supcan.common.properties.Properties;
import com.fy.erp.common.utils.IdGen;
import com.google.common.collect.Lists;
import com.fy.erp.common.supcan.common.fonts.Font;
import com.thoughtworks.xstream.annotations.XStreamAlias;

/**
 * ˶��Common
 * @author WangZhen
 * @version 2013-11-04
 */
public class Common {

	/**
	 * ���Զ���
	 */
	@XStreamAlias("Properties")
	protected Properties properties;
	
	/**
	 * �������
	 */
	@XStreamAlias("Fonts")
	protected List<Font> fonts;

	public Common() {
		properties = new Properties(IdGen.uuid());
		fonts = Lists.newArrayList(
				new Font("����", "134", "-12"),
				new Font("����", "134", "-13", "700"));
	}
	
	public Common(Properties properties) {
		this();
		this.properties = properties;
	}
	
	public Properties getProperties() {
		return properties;
	}

	public void setProperties(Properties properties) {
		this.properties = properties;
	}

	public List<Font> getFonts() {
		return fonts;
	}

	public void setFonts(List<Font> fonts) {
		this.fonts = fonts;
	}

}
