/**
 *
 */
package com.fy.erp.common.persistence.dialect.db;

import com.fy.erp.common.persistence.dialect.Dialect;

/**
 * Postgre Sql�ķ���ʵ��
 * @author poplar.yfyang
 * @version 1.0 2010-10-10 ����12:31
 * @since JDK 1.5
 */
public class PostgreSQLDialect implements Dialect {

    public boolean supportsLimit() {
        return true;
    }

    @Override
    public String getLimitString(String sql, int offset, int limit) {
        return getLimitString(sql, offset, Integer.toString(offset),
                Integer.toString(limit));
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
    public String getLimitString(String sql, int offset,
                                 String offsetPlaceholder, String limitPlaceholder) {
        StringBuilder pageSql = new StringBuilder().append(sql);
        pageSql = offset <= 0
                ? pageSql.append(" limit ").append(limitPlaceholder) :
                pageSql.append(" limit ").append(limitPlaceholder).append(" offset ").append(offsetPlaceholder);
        return pageSql.toString();
    }
}
