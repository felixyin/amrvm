/**
 *
 */
package com.fy.erp.common.persistence.dialect.db;

import com.fy.erp.common.persistence.dialect.Dialect;

/**
 * A dialect compatible with the H2 database.
 *
 * @author poplar.yfyang
 * @version 1.0 2010-10-10 ����12:31
 * @since JDK 1.5
 */
public class H2Dialect implements Dialect {

    public boolean supportsLimit() {
        return true;
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
     * @param limit             ��ҳÿҳ��ʾ��¼����
     * @param limitPlaceholder  ��ҳ��¼����ռλ����
     * @return ����ռλ���ķ�ҳsql
     */
    private String getLimitString(String sql, int offset, String offsetPlaceholder, int limit, String limitPlaceholder) {
        return sql + ((offset > 0) ? " limit " + limitPlaceholder + " offset "
                + offsetPlaceholder : " limit " + limitPlaceholder);
    }

    @Override
    public String getLimitString(String sql, int offset, int limit) {
        return getLimitString(sql, offset, Integer.toString(offset), limit, Integer.toString(limit));
    }
}