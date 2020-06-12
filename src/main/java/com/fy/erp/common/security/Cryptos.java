/**
 * Copyright (c) 2005-2012 springside.org.cn
 */
package com.fy.erp.common.security;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.security.SecureRandom;
import java.util.Arrays;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.Mac;
import javax.crypto.SecretKey;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import com.fy.erp.common.utils.Encodes;
import com.fy.erp.common.utils.Exceptions;

/**
 * ֧��HMAC-SHA1��Ϣǩ�� �� DES/AES�ԳƼ��ܵĹ�����.
 * 
 * ֧��Hex��Base64���ֱ��뷽ʽ.
 * 
 * @author calvin
 */
public class Cryptos {

	private static final String AES = "AES";
	private static final String AES_CBC = "AES/CBC/PKCS5Padding";
	private static final String HMACSHA1 = "HmacSHA1";

	private static final String DEFAULT_URL_ENCODING = "UTF-8";
	private static final int DEFAULT_HMACSHA1_KEYSIZE = 160; //RFC2401
	private static final int DEFAULT_AES_KEYSIZE = 128;
	private static final int DEFAULT_IVSIZE = 16;
	
	private static final byte[] DEFAULT_KEY = new byte[]{-97,88,-94,9,70,-76,126,25,0,3,-20,113,108,28,69,125}; 

	private static SecureRandom random = new SecureRandom();

	//-- HMAC-SHA1 funciton --//
	/**
	 * ʹ��HMAC-SHA1������Ϣǩ��, �����ֽ�����,����Ϊ20�ֽ�.
	 * 
	 * @param input ԭʼ�����ַ�����
	 * @param key HMAC-SHA1��Կ
	 */
	public static byte[] hmacSha1(byte[] input, byte[] key) {
		try {
			SecretKey secretKey = new SecretKeySpec(key, HMACSHA1);
			Mac mac = Mac.getInstance(HMACSHA1);
			mac.init(secretKey);
			return mac.doFinal(input);
		} catch (GeneralSecurityException e) {
			throw Exceptions.unchecked(e);
		}
	}

	/**
	 * У��HMAC-SHA1ǩ���Ƿ���ȷ.
	 * 
	 * @param expected �Ѵ��ڵ�ǩ��
	 * @param input ԭʼ�����ַ���
	 * @param key ��Կ
	 */
	public static boolean isMacValid(byte[] expected, byte[] input, byte[] key) {
		byte[] actual = hmacSha1(input, key);
		return Arrays.equals(expected, actual);
	}

	/**
	 * ����HMAC-SHA1��Կ,�����ֽ�����,����Ϊ160λ(20�ֽ�).
	 * HMAC-SHA1�㷨����Կ������Ҫ��, RFC2401�������ٳ���Ϊ160λ(20�ֽ�).
	 */
	public static byte[] generateHmacSha1Key() {
		try {
			KeyGenerator keyGenerator = KeyGenerator.getInstance(HMACSHA1);
			keyGenerator.init(DEFAULT_HMACSHA1_KEYSIZE);
			SecretKey secretKey = keyGenerator.generateKey();
			return secretKey.getEncoded();
		} catch (GeneralSecurityException e) {
			throw Exceptions.unchecked(e);
		}
	}

	//-- AES funciton --//

	/**
	 * ʹ��AES����ԭʼ�ַ���.
	 * 
	 * @param input ԭʼ�����ַ�����
	 */
	public static String aesEncrypt(String input) {
		try {
			return Encodes.encodeHex(aesEncrypt(input.getBytes(DEFAULT_URL_ENCODING), DEFAULT_KEY));
		} catch (UnsupportedEncodingException e) {
			return "";
		}
	}
	
	/**
	 * ʹ��AES����ԭʼ�ַ���.
	 * 
	 * @param input ԭʼ�����ַ�����
	 * @param key ����AESҪ�����Կ
	 */
	public static String aesEncrypt(String input, String key) {
		try {
			return Encodes.encodeHex(aesEncrypt(input.getBytes(DEFAULT_URL_ENCODING), Encodes.decodeHex(key)));
		} catch (UnsupportedEncodingException e) {
			return "";
		}
	}
	
	/**
	 * ʹ��AES����ԭʼ�ַ���.
	 * 
	 * @param input ԭʼ�����ַ�����
	 * @param key ����AESҪ�����Կ
	 */
	public static byte[] aesEncrypt(byte[] input, byte[] key) {
		return aes(input, key, Cipher.ENCRYPT_MODE);
	}

	/**
	 * ʹ��AES����ԭʼ�ַ���.
	 * 
	 * @param input ԭʼ�����ַ�����
	 * @param key ����AESҪ�����Կ
	 * @param iv ��ʼ����
	 */
	public static byte[] aesEncrypt(byte[] input, byte[] key, byte[] iv) {
		return aes(input, key, iv, Cipher.ENCRYPT_MODE);
	}

	/**
	 * ʹ��AES�����ַ���, ����ԭʼ�ַ���.
	 * 
	 * @param input Hex����ļ����ַ���
	 */
	public static String aesDecrypt(String input) {
		try {
			return new String(aesDecrypt(Encodes.decodeHex(input), DEFAULT_KEY), DEFAULT_URL_ENCODING);
		} catch (UnsupportedEncodingException e) {
			return "";
		}
	}
	
	/**
	 * ʹ��AES�����ַ���, ����ԭʼ�ַ���.
	 * 
	 * @param input Hex����ļ����ַ���
	 * @param key ����AESҪ�����Կ
	 */
	public static String aesDecrypt(String input, String key) {
		try {
			return new String(aesDecrypt(Encodes.decodeHex(input), Encodes.decodeHex(key)), DEFAULT_URL_ENCODING);
		} catch (UnsupportedEncodingException e) {
			return "";
		}
	}
	
	/**
	 * ʹ��AES�����ַ���, ����ԭʼ�ַ���.
	 * 
	 * @param input Hex����ļ����ַ���
	 * @param key ����AESҪ�����Կ
	 */
	public static byte[] aesDecrypt(byte[] input, byte[] key) {
		return aes(input, key, Cipher.DECRYPT_MODE);
	}

	/**
	 * ʹ��AES�����ַ���, ����ԭʼ�ַ���.
	 * 
	 * @param input Hex����ļ����ַ���
	 * @param key ����AESҪ�����Կ
	 * @param iv ��ʼ����
	 */
	public static byte[] aesDecrypt(byte[] input, byte[] key, byte[] iv) {
		return aes(input, key, iv, Cipher.DECRYPT_MODE);
	}

	/**
	 * ʹ��AES���ܻ�����ޱ����ԭʼ�ֽ�����, �����ޱ�����ֽ�������.
	 * 
	 * @param input ԭʼ�ֽ�����
	 * @param key ����AESҪ�����Կ
	 * @param mode Cipher.ENCRYPT_MODE �� Cipher.DECRYPT_MODE
	 */
	private static byte[] aes(byte[] input, byte[] key, int mode) {
		try {
			SecretKey secretKey = new SecretKeySpec(key, AES);
			Cipher cipher = Cipher.getInstance(AES);
			cipher.init(mode, secretKey);
			return cipher.doFinal(input);
		} catch (GeneralSecurityException e) {
			throw Exceptions.unchecked(e);
		}
	}

	/**
	 * ʹ��AES���ܻ�����ޱ����ԭʼ�ֽ�����, �����ޱ�����ֽ�������.
	 * 
	 * @param input ԭʼ�ֽ�����
	 * @param key ����AESҪ�����Կ
	 * @param iv ��ʼ����
	 * @param mode Cipher.ENCRYPT_MODE �� Cipher.DECRYPT_MODE
	 */
	private static byte[] aes(byte[] input, byte[] key, byte[] iv, int mode) {
		try {
			SecretKey secretKey = new SecretKeySpec(key, AES);
			IvParameterSpec ivSpec = new IvParameterSpec(iv);
			Cipher cipher = Cipher.getInstance(AES_CBC);
			cipher.init(mode, secretKey, ivSpec);
			return cipher.doFinal(input);
		} catch (GeneralSecurityException e) {
			throw Exceptions.unchecked(e);
		}
	}

	/**
	 * ����AES��Կ,�����ֽ�����, Ĭ�ϳ���Ϊ128λ(16�ֽ�).
	 */
	public static String generateAesKeyString() {
		return Encodes.encodeHex(generateAesKey(DEFAULT_AES_KEYSIZE));
	}
	
	/**
	 * ����AES��Կ,�����ֽ�����, Ĭ�ϳ���Ϊ128λ(16�ֽ�).
	 */
	public static byte[] generateAesKey() {
		return generateAesKey(DEFAULT_AES_KEYSIZE);
	}

	/**
	 * ����AES��Կ,��ѡ����Ϊ128,192,256λ.
	 */
	public static byte[] generateAesKey(int keysize) {
		try {
			KeyGenerator keyGenerator = KeyGenerator.getInstance(AES);
			keyGenerator.init(keysize);
			SecretKey secretKey = keyGenerator.generateKey();
			return secretKey.getEncoded();
		} catch (GeneralSecurityException e) {
			throw Exceptions.unchecked(e);
		}
	}

	/**
	 * �����������,Ĭ�ϴ�СΪcipher.getBlockSize(), 16�ֽ�.
	 */
	public static byte[] generateIV() {
		byte[] bytes = new byte[DEFAULT_IVSIZE];
		random.nextBytes(bytes);
		return bytes;
	}
}