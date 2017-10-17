package com.xtoucher.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Arrays;

/**
 * 微信签名验证的工具类
 * 
 * @author so123
 * 
 */
public class WeixinAuthUtil {
	private static final String TOKEN = "";

	/**
	 * 
	 * @author raochy
	 * @date 创建时间：2017年8月25日 下午12:03:06
	 * @version
	 * @parameter signature:签名；timestamp：时间戳，秒；nonce：随机数；echostr：随机字符串
	 * @since
	 * @return
	 */
	public static boolean Auth(String signature, String timestamp,
			String nonce, String echostr) {
		ArrayList<String> array = new ArrayList<String>();
		array.add(signature);
		array.add(timestamp);
		array.add(nonce);

		// 排序
		String sortString = sort(TOKEN, timestamp, nonce);
		// 加密
		String mytoken = SHA1(sortString);
		// 校验签名
		if (mytoken != null && mytoken != "" && mytoken.equals(signature)) {
			return true;
		} else {
			return false;
		}
	}

	public static String sort(String token, String timestamp, String nonce) {
		String[] strArray = { token, timestamp, nonce };
		Arrays.sort(strArray);
		StringBuilder sbuilder = new StringBuilder();
		for (String str : strArray) {
			sbuilder.append(str);
		}
		return sbuilder.toString();
	}

	public static String SHA1(String decript) {
		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-1");
			digest.update(decript.getBytes());
			byte messageDigest[] = digest.digest();
			// Create Hex String
			StringBuffer hexString = new StringBuffer();
			// 字节数组转换为 十六进制 数
			for (int i = 0; i < messageDigest.length; i++) {
				String shaHex = Integer.toHexString(messageDigest[i] & 0xFF);
				if (shaHex.length() < 2) {
					hexString.append(0);
				}
				hexString.append(shaHex);
			}
			return hexString.toString();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return "";
	}

}
