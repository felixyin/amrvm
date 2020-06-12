/**
 *
 */
package com.fy.erp.common.persistence.dialect.db;

import com.fy.erp.common.persistence.dialect.Dialect;

/**
 * Oracle�ķ���ʵ��
 * @author poplar.yfyang
 * @version 1.0 2010-10-10 ����12:31
 * @since JDK 1.5
 */
public class OracleDialect implements Dialect {
    @Override
    public boolean supportsLimit() {
        return true;
    }

    @Override
    public String getLimitString(String sql, int offset, int limit) {
        return getLimitString(sql, offset, Integer.toString(offset), Integer.toString(limit));
    }

    /**
     * ��sql��ɷ�ҳsql���,�ṩ��offset��limitʹ��ռλ����(placeholder)�滻.
     * <pre>
     * ��mysql
     * dialect.getLimitString("select * from user", 12, ":offset",0,":limit") ������
     * select * from user limit :offset,:limit
     * </pre>
     *
     * @param sql               ʵ��SQL���
     * @param offset            ��ҳ��ʼ��¼����
     * @param offsetPlaceholder ��ҳ��ʼ��¼������ռλ����
     * @param limitPlaceholder  ��ҳ��¼����ռλ����
     * @return ����ռλ���ķ�ҳsql
     */
    public String getLimitString(String sql, int offset, String offsetPlaceholder, String limitPlaceholder) {
        sql = sql.trim();
        boolean isForUpdate = false;
        if (sql.toLowerCase().endsWith(" for update")) {
            sql = sql.substring(0, sql.length() - 11);
            isForUpdate = true;
        }
        StringBuilder pagingSelect = new StringBuilder(sql.length() + 100);

        if (offset > 0) {
			pagingSelect.append("select * from ( select row_.*, rownum rownum_ from ( ");
		} else {
			pagingSelect.append("select * from ( ");
		}
		pagingSelect.append(sql);
		if (offset > 0) {
			String endString = offsetPlaceholder + "+" + limitPlaceholder;
			pagingSelect.append(" ) row_ where rownum <= "+endString+") where rownum_ > ").append(offsetPlaceholder);
		} else {
			pagingSelect.append(" ) where rownum <= "+limitPlaceholder);
		}

        if (isForUpdate) {
            pagingSelect.append(" for update");
        }

        return pagingSelect.toString();
    }

}
