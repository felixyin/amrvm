package com.fy.erp.common.security.shiro.session;

import java.util.Collection;

import org.apache.shiro.session.Session;

public interface SessionDAO extends org.apache.shiro.session.mgt.eis.SessionDAO {

	/**
	 * ��ȡ��Ự
	 * @param includeLeave �Ƿ�������ߣ�������ʱ�����3����Ϊ���߻Ự��
	 * @return
	 */
	public Collection<Session> getActiveSessions(boolean includeLeave);
	
	/**
	 * ��ȡ��Ự
	 * @param includeLeave �Ƿ�������ߣ�������ʱ�����3����Ϊ���߻Ự��
	 * @param principal ���ݵ�¼�߶����ȡ��Ự
	 * @param filterSession ��Ϊ�գ�����˵���������������Ự��
	 * @return
	 */
	public Collection<Session> getActiveSessions(boolean includeLeave, Object principal, Session filterSession);
	
}
