/**
 *
 */
package com.fy.erp.common.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fy.erp.common.config.Global;
import com.fy.erp.modules.sys.security.SystemAuthorizingRealm;
import com.fy.erp.modules.sys.utils.UserUtils;
import com.fy.erp.common.utils.FileUtils;

import com.ckfinder.connector.ConnectorServlet;

/**
 * CKFinderConnectorServlet
 * @author ThinkGem
 * @version 2014-06-25
 */
public class CKFinderConnectorServlet extends ConnectorServlet {
	
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		prepareGetResponse(request, response, false);
		super.doGet(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		prepareGetResponse(request, response, true);
		super.doPost(request, response);
	}
	
	private void prepareGetResponse(final HttpServletRequest request,
			final HttpServletResponse response, final boolean post) throws ServletException {
		SystemAuthorizingRealm.Principal principal = (SystemAuthorizingRealm.Principal) UserUtils.getPrincipal();
		if (principal == null){
			return;
		}
		String command = request.getParameter("command");
		String type = request.getParameter("type");
		// ��ʼ��ʱ�����startupPath�ļ��в����ڣ����Զ�����startupPath�ļ���
		if ("Init".equals(command)){
			String startupPath = request.getParameter("startupPath");// ��ǰ�ļ��п�ָ��Ϊģ����
			if (startupPath!=null){
				String[] ss = startupPath.split(":");
				if (ss.length==2){
					String realPath = Global.getUserfilesBaseDir() + Global.USERFILES_BASE_URL
							+ principal + "/" + ss[0] + ss[1];
					FileUtils.createDirectory(FileUtils.path(realPath));
				}
			}
		}
		// ����ϴ����Զ�������ǰ�ļ��У����ϴ�����·��
		else if ("QuickUpload".equals(command) && type!=null){
			String currentFolder = request.getParameter("currentFolder");// ��ǰ�ļ��п�ָ��Ϊģ����
			String realPath = Global.getUserfilesBaseDir() + Global.USERFILES_BASE_URL
					+ principal + "/" + type + (currentFolder != null ? currentFolder : "");
			FileUtils.createDirectory(FileUtils.path(realPath));
		}
//		System.out.println("------------------------");
//		for (Object key : request.getParameterMap().keySet()){
//			System.out.println(key + ": " + request.getParameter(key.toString()));
//		}
	}
	
}
