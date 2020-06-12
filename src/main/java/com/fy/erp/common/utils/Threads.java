/**
 * Copyright (c) 2005-2012 springside.org.cn
 */
package com.fy.erp.common.utils;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.TimeUnit;

/**
 * �߳���ع�����.
 * @author calvin
 * @version 2013-01-15
 */
public class Threads {

	/**
	 * sleep�ȴ�,��λΪ����,����InterruptedException.
	 */
	public static void sleep(long millis) {
		try {
			Thread.sleep(millis);
		} catch (InterruptedException e) {
			// Ignore.
			return;
		}
	}

	/**
	 * sleep�ȴ�,����InterruptedException.
	 */
	public static void sleep(long duration, TimeUnit unit) {
		try {
			Thread.sleep(unit.toMillis(duration));
		} catch (InterruptedException e) {
			// Ignore.
			return;
		}
	}

	/**
	 * ����ExecutorService JavaDocʾ�������д��Graceful Shutdown����.
	 * ��ʹ��shutdown, ֹͣ���������񲢳�����������Ѵ�������.
	 * �����ʱ, �����shutdownNow, ȡ����workQueue��Pending������,���ж�������������.
	 * ������˳��r���t�����˳�.
	 * �����shutdownʱ�̱߳��������ж����˴���.
	 */
	public static void gracefulShutdown(ExecutorService pool, int shutdownTimeout, int shutdownNowTimeout,
			TimeUnit timeUnit) {
		pool.shutdown(); // Disable new tasks from being submitted
		try {
			// Wait a while for existing tasks to terminate
			if (!pool.awaitTermination(shutdownTimeout, timeUnit)) {
				pool.shutdownNow(); // Cancel currently executing tasks
				// Wait a while for tasks to respond to being cancelled
				if (!pool.awaitTermination(shutdownNowTimeout, timeUnit)) {
					System.err.println("Pool did not terminated");
				}
			}
		} catch (InterruptedException ie) {
			// (Re-)Cancel if current thread also interrupted
			pool.shutdownNow();
			// Preserve interrupt status
			Thread.currentThread().interrupt();
		}
	}

	/**
	 * ֱ�ӵ���shutdownNow�ķ���, ��timeout����.ȡ����workQueue��Pending������,���ж�������������.
	 */
	public static void normalShutdown(ExecutorService pool, int timeout, TimeUnit timeUnit) {
		try {
			pool.shutdownNow();
			if (!pool.awaitTermination(timeout, timeUnit)) {
				System.err.println("Pool did not terminated");
			}
		} catch (InterruptedException ie) {
			Thread.currentThread().interrupt();
		}
	}

}
