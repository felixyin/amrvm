/**
 *
 */
package com.fy.erp.common.utils;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

/**
 * MAC��ַ����
 * 
 * @author ThinkGem
 * @version 2013-12-21
 */
public class MacUtils {

	/**
	 * ��ȡ��ǰ����ϵͳ����. return ����ϵͳ���� ����:windows,Linux,Unix��.
	 */
	public static String getOSName() {
		return System.getProperty("os.name").toLowerCase();
	}

	/**
	 * ��ȡUnix������mac��ַ.
	 * 
	 * @return mac��ַ
	 */
	public static String getUnixMACAddress() {
		String mac = null;
		BufferedReader bufferedReader = null;
		Process process = null;
		try {
			/**
			 * Unix�µ����һ��ȡeth0��Ϊ���������� ��ʾ��Ϣ�а�����mac��ַ��Ϣ
			 */
			process = Runtime.getRuntime().exec("ifconfig eth0");
			bufferedReader = new BufferedReader(new InputStreamReader(
					process.getInputStream()));
			String line = null;
			int index = -1;
			while ((line = bufferedReader.readLine()) != null) {
				/**
				 * Ѱ�ұ�ʾ�ַ���[hwaddr]
				 */
				index = line.toLowerCase().indexOf("hwaddr");
				/**
				 * �ҵ���
				 */
				if (index != -1) {
					/**
					 * ȡ��mac��ַ��ȥ��2�߿ո�
					 */
					mac = line.substring(index + "hwaddr".length() + 1).trim();
					break;
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (bufferedReader != null) {
					bufferedReader.close();
				}
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			bufferedReader = null;
			process = null;
		}

		return mac;
	}

	/**
	 * ��ȡLinux������mac��ַ.
	 * 
	 * @return mac��ַ
	 */
	public static String getLinuxMACAddress() {
		String mac = null;
		BufferedReader bufferedReader = null;
		Process process = null;
		try {
			/**
			 * linux�µ����һ��ȡeth0��Ϊ���������� ��ʾ��Ϣ�а�����mac��ַ��Ϣ
			 */
			process = Runtime.getRuntime().exec("ifconfig eth0");
			bufferedReader = new BufferedReader(new InputStreamReader(
					process.getInputStream()));
			String line = null;
			int index = -1;
			while ((line = bufferedReader.readLine()) != null) {
				index = line.toLowerCase().indexOf("Ӳ����ַ");
				/**
				 * �ҵ���
				 */
				if (index != -1) {
					/**
					 * ȡ��mac��ַ��ȥ��2�߿ո�
					 */
					mac = line.substring(index + 4).trim();
					break;
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (bufferedReader != null) {
					bufferedReader.close();
				}
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			bufferedReader = null;
			process = null;
		}
		
		// ȡ����������Unixȡ��
		if (mac == null){
			return getUnixMACAddress();
		}

		return mac;
	}

	/**
	 * ��ȡwidnows������mac��ַ.
	 * 
	 * @return mac��ַ
	 */
	public static String getWindowsMACAddress() {
		String mac = null;
		BufferedReader bufferedReader = null;
		Process process = null;
		try {
			/**
			 * windows�µ������ʾ��Ϣ�а�����mac��ַ��Ϣ
			 */
			process = Runtime.getRuntime().exec("ipconfig /all");
			bufferedReader = new BufferedReader(new InputStreamReader(process.getInputStream()));
			String line = null;
			int index = -1;
			while ((line = bufferedReader.readLine()) != null) {
				/**
				 * Ѱ�ұ�ʾ�ַ���[physical address]
				 */
//				index = line.toLowerCase().indexOf("physical address");
//				if (index != -1) {
				if (line.split("-").length == 6){
					index = line.indexOf(":");
					if (index != -1) {
						/**
						 * ȡ��mac��ַ��ȥ��2�߿ո�
						 */
						mac = line.substring(index + 1).trim();
					}
					break;
				}
				index = line.toLowerCase().indexOf("�����ַ");
				if (index != -1) {
					index = line.indexOf(":");
					if (index != -1) {
						/**
						 * ȡ��mac��ַ��ȥ��2�߿ո�
						 */
						mac = line.substring(index + 1).trim();
					}
					break;
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (bufferedReader != null) {
					bufferedReader.close();
				}
			} catch (IOException e1) {
				e1.printStackTrace();
			}
			bufferedReader = null;
			process = null;
		}

		return mac;
	}

	public static String getMac(){
		String os = getOSName();
		String mac;
		if (os.startsWith("windows")) {
			mac = getWindowsMACAddress();
		} else if (os.startsWith("linux")) {
			mac = getLinuxMACAddress();
		} else {
			mac = getUnixMACAddress();
		}
		return mac == null ? "" : mac;
	}
	
	/**
	 * �����õ�main����.
	 * 
	 * @param argc ���в���.
	 */
	public static void main(String[] argc) {
		String os = getOSName();
		System.out.println("os: " + os);
		if (os.startsWith("windows")) {
			String mac = getWindowsMACAddress();
			System.out.println("mac: " + mac);
		} else if (os.startsWith("linux")) {
			String mac = getLinuxMACAddress();
			System.out.println("mac: " + mac);
		} else {
			String mac = getUnixMACAddress();
			System.out.println("mac: " + mac);
		}
	}

}