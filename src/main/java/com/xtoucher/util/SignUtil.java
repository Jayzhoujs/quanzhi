package com.xtoucher.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;

public class SignUtil {
	// 与微信配置中的的Token一致
	private static String token = "quanzhi";

	public static boolean checkSignature(String signature, String timestamp,
			String nonce) {
		String[] arra = new String[] { token, timestamp, nonce };
		// 将signature,timestamp,nonce组成数组进行字典排序
		Arrays.sort(arra);
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < arra.length; i++) {
			sb.append(arra[i]);
		}
		MessageDigest md = null;
		String stnStr = null;
		try {
			md = MessageDigest.getInstance("SHA-1");
			byte[] digest = md.digest(sb.toString().getBytes());
			stnStr = byteToStr(digest);
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 释放内存
		sb = null;
		// 将sha1加密后的字符串与signature对比，标识该请求来源于微信
		return stnStr != null ? stnStr.equals(signature.toUpperCase()) : false;
	}

	/**
	 * 将字节数组转换成十六进制字符串
	 * 
	 * @param digestArra
	 * @return
	 */
	private static String byteToStr(byte[] digestArra) {
		// TODO Auto-generated method stub
		String digestStr = "";
		for (int i = 0; i < digestArra.length; i++) {
			digestStr += byteToHexStr(digestArra[i]);
		}
		return digestStr;
	}

	/**
	 * 将字节转换成为十六进制字符串
	 */
	private static String byteToHexStr(byte dByte) {
		// TODO Auto-generated method stub
		char[] Digit = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A',
				'B', 'C', 'D', 'E', 'F' };
		char[] tmpArr = new char[2];
		tmpArr[0] = Digit[(dByte >>> 4) & 0X0F];
		tmpArr[1] = Digit[dByte & 0X0F];
		String s = new String(tmpArr);
		return s;
	}

	

}
