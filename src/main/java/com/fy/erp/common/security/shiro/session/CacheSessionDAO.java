/**
 *
 */
package com.fy.erp.common.security.shiro.session;

import java.io.Serializable;
import java.util.Collection;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import com.fy.erp.common.config.Global;
import com.fy.erp.common.utils.DateUtils;
import com.fy.erp.common.utils.StringUtils;
import com.fy.erp.common.web.Servlets;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.UnknownSessionException;
import org.apache.shiro.session.mgt.eis.EnterpriseCacheSessionDAO;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.support.DefaultSubjectContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.google.common.collect.Sets;

/**
 * ϵͳ��ȫ��֤ʵ����
 * @author ThinkGem
 * @version 2014-7-24
 */
public class CacheSessionDAO extends EnterpriseCacheSessionDAO implements SessionDAO {

	private Logger logger = LoggerFactory.getLogger(getClass());
	
    public CacheSessionDAO() {
        super();
    }

    @Override
    protected void doUpdate(Session session) {
    	if (session == null || session.getId() == null) {  
            return;
        }
    	
    	HttpServletRequest request = Servlets.getRequest();
		if (request != null){
			String uri = request.getServletPath();
			// ����Ǿ�̬�ļ����򲻸���SESSION
			if (Servlets.isStaticFile(uri)){
				return;
			}
			// �������ͼ�ļ����򲻸���SESSION
			if (StringUtils.startsWith(uri, Global.getConfig("web.view.prefix"))
					&& StringUtils.endsWith(uri, Global.getConfig("web.view.suffix"))){
				return;
			}
			// �ֶ����Ʋ�����SESSION
			String updateSession = request.getParameter("updateSession");
			if (Global.FALSE.equals(updateSession) || Global.NO.equals(updateSession)){
				return;
			}
		}
    	super.doUpdate(session);
    	logger.debug("update {} {}", session.getId(), request != null ? request.getRequestURI() : "");
    }

    @Override
    protected void doDelete(Session session) {
    	if (session == null || session.getId() == null) {  
            return;
        }
    	
    	super.doDelete(session);
    	logger.debug("delete {} ", session.getId());
    }

    @Override
    protected Serializable doCreate(Session session) {
		HttpServletRequest request = Servlets.getRequest();
		if (request != null){
			String uri = request.getServletPath();
			// ����Ǿ�̬�ļ����򲻴���SESSION
			if (Servlets.isStaticFile(uri)){
		        return null;
			}
		}
		super.doCreate(session);
		logger.debug("doCreate {} {}", session, request != null ? request.getRequestURI() : "");
    	return session.getId();
    }

    @Override
    protected Session doReadSession(Serializable sessionId) {
		return super.doReadSession(sessionId);
    }
    
    @Override
    public Session readSession(Serializable sessionId) throws UnknownSessionException {
    	try{
    		Session s = null;
    		HttpServletRequest request = Servlets.getRequest();
    		if (request != null){
    			String uri = request.getServletPath();
    			// ����Ǿ�̬�ļ����򲻻�ȡSESSION
    			if (Servlets.isStaticFile(uri)){
    				return null;
    			}
    			s = (Session)request.getAttribute("session_"+sessionId);
    		}
    		if (s != null){
    			return s;
    		}

    		Session session = super.readSession(sessionId);
    		logger.debug("readSession {} {}", sessionId, request != null ? request.getRequestURI() : "");
    		
    		if (request != null && session != null){
    			request.setAttribute("session_"+sessionId, session);
    		}
    		
    		return session;
    	}catch (UnknownSessionException e) {
			return null;
		}
    }

    /**
	 * ��ȡ��Ự
	 * @param includeLeave �Ƿ�������ߣ�������ʱ�����3����Ϊ���߻Ự��
	 * @return
	 */
	@Override
	public Collection<Session> getActiveSessions(boolean includeLeave) {
		return getActiveSessions(includeLeave, null, null);
	}
    
    /**
	 * ��ȡ��Ự
	 * @param includeLeave �Ƿ�������ߣ�������ʱ�����3����Ϊ���߻Ự��
	 * @param principal ���ݵ�¼�߶����ȡ��Ự
	 * @param filterSession ��Ϊ�գ�����˵���������������Ự��
	 * @return
	 */
	@Override
	public Collection<Session> getActiveSessions(boolean includeLeave, Object principal, Session filterSession) {
		// ����������ߣ����޵�¼��������
		if (includeLeave && principal == null){
			return getActiveSessions();
		}
		Set<Session> sessions = Sets.newHashSet();
		for (Session session : getActiveSessions()){
			boolean isActiveSession = false;
			// ���������߲�����������ʱ��С�ڵ���3����������
			if (includeLeave || DateUtils.pastMinutes(session.getLastAccessTime()) <= 3){
				isActiveSession = true;
			}
			// ���ϵ�½��������
			if (principal != null){
				PrincipalCollection pc = (PrincipalCollection)session.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY);
				if (principal.toString().equals(pc != null ? pc.getPrimaryPrincipal().toString() : StringUtils.EMPTY)){
					isActiveSession = true;
				}
			}
			// ���˵���SESSION
			if (filterSession != null && filterSession.getId().equals(session.getId())){
				isActiveSession = false;
			}
			if (isActiveSession){
				sessions.add(session);
			}
		}
		return sessions;
	}
	
}
