/**
 *
 */
package com.fy.erp.common.persistence.dialect;

/**
 * ����hibernate��Dialect,��ֻ�������ҳ����
 *
 * @author poplar.yfyang
 * @version 1.0 2011-11-18 ����12:31
 * @since JDK 1.5
 */
public interface Dialect {

    /**
     * ���ݿⱾ���Ƿ�֧�ַ�ҳ��ǰ�ķ�ҳ��ѯ��ʽ
     * ������ݿⲻ֧�ֵĻ����򲻽������ݿ��ҳ
     *
     * @return true��֧�ֵ�ǰ�ķ�ҳ��ѯ��ʽ
     */
    public boolean supportsLimit();

    /**
     * ��sqlת��Ϊ��ҳSQL���ֱ���÷�ҳsql
     *
     * @param sql    SQL���
     * @param offset ��ʼ����
     * @param limit  ÿҳ��ʾ���ټ�¼����
     * @return ��ҳ��ѯ��sql
     */
    public String getLimitString(String sql, int offset, int limit);

}
