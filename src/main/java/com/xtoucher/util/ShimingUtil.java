package com.xtoucher.util;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.security.MessageDigest;
import java.util.Iterator;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;

import org.json.JSONException;
import org.json.JSONObject;

/**
 * 实名核身的工具类
 * 
 * @author so123
 * 
 */
public class ShimingUtil {
	public static final String URL_AUTH = "https://iauth-test.wecity.qq.com/new/cgi-bin/auth.php";
	public static final String URL_GETDETECTINFO = "https://iauth-test.wecity.qq.com/new/cgi-bin/getdetectinfo.php";
	public static String APPID = "4447";
	public static String Secretkey = "bce8e96f6d69e1734cc0d13290147aaf";
	public static int EXPIRED_SECONDS = 600;
	public static String REDIRECT = Constant.getBASE_HOST() + "/wx/callback";
	public static String RESULTKEY = "181f8d38528b261217e3fb86c3630d44";
	private static String URL = "https://iauth-test.wecity.qq.com/new/cgi-bin/";
	private static String ENDPOINT = ".php";

	public static String getSignature(String method) {
		StringBuffer mySign = new StringBuffer("");
		appSign(APPID, method, Secretkey, EXPIRED_SECONDS, mySign);
		return mySign.toString();
	}

	public static int appSign(String appId, String method, String secret_key,
			long expired, StringBuffer mySign) {
		return appSignBase(appId, method, secret_key, expired, mySign);
	}

	private static int appSignBase(String appId, String method,
			String secret_key, long expired, StringBuffer mySign) {

		if (empty(appId) || empty(secret_key)) {
			return -1;
		}

		long now = System.currentTimeMillis() / 1000;

		String plain_text = "a=" + appId + "&m=" + method + "&t=" + now + "&e="
				+ expired;

		byte[] bin = hashHmac(plain_text, secret_key);

		byte[] all = new byte[bin.length + plain_text.getBytes().length];
		System.arraycopy(bin, 0, all, 0, bin.length);
		System.arraycopy(plain_text.getBytes(), 0, all, bin.length,
				plain_text.getBytes().length);
		mySign.append(Base64Utils.encode(all));
		return 0;
	}

	public static boolean empty(String s) {
		return s == null || s.trim().equals("") || s.trim().equals("null");
	}

	private static byte[] hashHmac(String plain_text, String accessKey) {

		try {
			return HMACSHA1.getSignature(plain_text, accessKey);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public static String MD5(Map<String, Object> params) {
		String input = getParams(params);
		return MD5(input);
	}

	private static String getParams(Map<String, Object> data) {
		StringBuilder params = new StringBuilder();
		if (data != null && data.size() > 0) {
			Iterator<Object> values = data.values().iterator();
			Object value;
			while (values.hasNext()) {
				value = values.next();
				params.append(value);
				params.append('-');
			}
			params.append("authkey");
		}
		return params.toString();
	}

	public static String MD5(String input) {
		try {
			MessageDigest mdInst = MessageDigest.getInstance("MD5");
			mdInst.update(input.getBytes("utf-8"));
			byte[] md = mdInst.digest();
			StringBuffer hexString = new StringBuffer();
			for (int i = 0; i < md.length; i++) {
				String shaHex = Integer.toHexString(md[i] & 0xFF);
				if (shaHex.length() < 2) {
					hexString.append(0);
				}
				hexString.append(shaHex);
			}
			return hexString.toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	public static String getPostParams(Map<String, Object> data) {
		StringBuilder params = new StringBuilder("");
		if (data != null && data.size() > 0) {
			Iterator<String> keys = data.keySet().iterator();
			String key;
			while (keys.hasNext()) {
				key = keys.next();
				params.append(key);
				params.append('=');
				params.append(data.get(key));
				params.append('&');
			}
			params.deleteCharAt(params.length() - 1);
		}

		return params.toString();
	}
	public static JSONObject SendHttpsRequest(Map<String, Object> map, String method) {
		String postData=getPostParams(map);
		int errorCode = 0;
		JSONObject rspJson = null;
		HttpsURLConnection connection = null;
		DataOutputStream out = null;
		BufferedReader reader = null;
		try {
			URL url = new URL(URL + method + ENDPOINT);

			connection = (HttpsURLConnection) url.openConnection();

			// set header
			connection.setRequestMethod("POST");
			connection.setRequestProperty("accept", "*/*");
			// connection.setRequestProperty("user-agent", HTTP_USER_AGENT);
			connection.setRequestProperty("Connection", "Keep-Alive");
			if (method.equals("getdetectinfo") || method.startsWith("api_")) {
				connection.setRequestProperty("signature", getSignature(method));
			}

			connection.setConnectTimeout(5000);
			connection.setReadTimeout(30000);

			connection.setDoOutput(true);
			connection.setDoInput(true);
			connection.setUseCaches(false);
			connection.setInstanceFollowRedirects(true);
			connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
			byte[] postContent = postData.getBytes("utf-8");

			connection.setRequestProperty("Content-Length", String.valueOf(postContent.length));
			connection.connect();

			// POST����
			out = new DataOutputStream(connection.getOutputStream());

			out.write(postContent);
			out.flush();
			out.close();
			out = null;

			errorCode = connection.getResponseCode();
			System.out.println("errorCode="+errorCode);
			if (errorCode == 200) { // ����Ӧ����
				// ��ȡ��Ӧ
				InputStream isss = connection.getInputStream();
				reader = new BufferedReader(new InputStreamReader(isss));
				String lines;
				StringBuffer resposeBuffer = new StringBuffer("");
				while ((lines = reader.readLine()) != null) {
					lines = new String(lines.getBytes(), "utf-8");
					resposeBuffer.append(lines);
				}
				reader.close();
				reader = null;
				System.out.println(resposeBuffer.toString());
				// �Ͽ�����
				connection.disconnect();
				connection = null;
				// ��������
				rspJson = new JSONObject(resposeBuffer.toString());
				return rspJson;
			}
		} catch (Exception e) {
			e.printStackTrace();

		} finally {
			try {
				if (out != null) {
					out.close();
				}
				if (reader != null) {
					reader.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}

			// �Ͽ�����
			if (connection != null) {
				connection.disconnect();
				connection = null;
			}
		}

		// ��������ͨ��JSONObject�ķ�ʽ���ݳ�ȥ
		try {
			rspJson = new JSONObject();
			rspJson.put("errorcode", errorCode);
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return rspJson;
	}
	
	
	
}