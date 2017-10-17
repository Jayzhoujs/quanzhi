package com.xtoucher.util;

import java.util.HashMap;

import org.apache.log4j.Logger;

import net.sf.json.JSONObject;
import redis.clients.jedis.Jedis;

/**
 * 微信工具类
 * 
 * @author so123
 * 
 */
public class WeixinUtil {
	private static final String GRANTTYPE = "client_credential";
	private static final String APPID = "wx461eb29de33dedac";
	private static final String SECRET = "5db73fe5e2f5e45076b0a7bc11ffe55e";
	private static final String URL_TOKEN = "https://api.weixin.qq.com/cgi-bin/token";
	private static Logger logger = Logger.getLogger(WeixinUtil.class);

	public static synchronized String getToken() {
		Jedis jedis = RedisUtil.getJedis();
		if (jedis.get("accessToken") == null
				|| "".equals(jedis.get("accessToken"))) {
			// 刷新token
			HashMap<String, String> paras = new HashMap<String, String>();
			paras.put("grant_type", GRANTTYPE);
			paras.put("appid", APPID);
			paras.put("secret", SECRET);
			String result = HttpClientUtil.resultByGet(URL_TOKEN, paras);
			JSONObject json = JSONObject.fromObject(result);
			jedis.setex("accessToken", 7000, json.get("access_token")
					.toString());
			logger.debug("刷新token");
		}
		return jedis.get("accessToken");
	}

	public static String getGranttype() {
		return GRANTTYPE;
	}

	public static String getAppid() {
		return APPID;
	}

	public static String getSecret() {
		return SECRET;
	}

}
