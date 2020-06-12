/**
 *
 */
package com.fy.erp.common.persistence.dialect.db;

import com.fy.erp.common.persistence.dialect.Dialect;

/**
 * MSSQLServer ���ݿ�ʵ�ַ�ҳ����
 *
 * @author poplar.yfyang
 * @version 1.0 2010-10-10 ����12:31
 * @since JDK 1.5
 */
public class SQLServerDialect implements Dialect {

    public boolean supportsLimit() {
        return true;
    }

    static int getAfterSelectInsertPoint(String sql) {
        int selectIndex = sql.toLowerCase().indexOf("select");
        final int selectDistinctIndex = sql.toLowerCase().indexOf("select distinct");
        return selectIndex + (selectDistinctIndex == selectIndex ? 15 : 6);
    }

    public String getLimitString(String sql, int offset, int limit) {
        return getLimit(sql, offset, limit);
    }

    /**
     * ��sql��ɷ�ҳsql���,�ṩ��offset��limitʹ��ռλ����(placeholder)�滻.
     * <pre>
     * ��mysql
     * dialect.getLimitString("select * from user", 12, ":offset",0,":limit") ������
     * select * from user limit :offset,:limit
     * </pre>
     *
     * @param sql    ʵ��SQL���
     * @param offset ��ҳ��ʼ��¼����
     * @param limit  ��ҳÿҳ��ʾ��¼����
     * @return ����ռλ���ķ�ҳsql
     */
    public String getLimit(String sql, int offset, int limit) {
        if (offset > 0) {
            throw new UnsupportedOperationException("sql server has no offset");
        }
        return new StringBuffer(sql.length() + 8)
                .append(sql)
                .insert(getAfterSelectInsertPoint(sql), " top " + limit)
                .toString();
    }


}
