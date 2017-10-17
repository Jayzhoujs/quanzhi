package com.xtoucher.util;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;

import com.xtoucher.util.entity.ViewButton;

/**
 * 微信菜单
 * 
 * @author so123
 * 
 */
public class WeiXinMenuUtil implements
		ApplicationListener<ContextRefreshedEvent> {
	private static final String URL = "https://api.weixin.qq.com/cgi-bin/menu/create?access_token=";
	private static Logger logger = Logger.getLogger(WeiXinMenuUtil.class);

	// 初始化菜单
	public static void init() {
		// 第一个菜单
		ViewButton button1 = new ViewButton();
		button1.setType("view");
		button1.setName("犬只管理");
		button1.setUrl("http://139.199.66.220/quanzhi/wx/index");// 跳转地址
		
		ViewButton button2 = new ViewButton();
		button2.setType("view");
		button2.setName("办证流程");
		button2.setUrl("http://139.199.66.220/quanzhi/wx/process");// 跳转地址

//		// 第二个菜单
//		JSONObject button2 = new JSONObject();
//		// 第一个子菜单
//		ViewButton vButton21 = new ViewButton();
//		vButton21.setType("view");
//		vButton21.setName("办证流程");
//		vButton21.setUrl("http://139.199.66.220/quanzhi/wx/process");
//		// 第二个子菜单
//		ViewButton vButton22 = new ViewButton();
//		vButton22.setType("view");
//		vButton22.setName("文明养犬");
//		vButton22.setUrl("http://139.199.66.220/quanzhi/wx/index");
//		JSONArray sub_button = new JSONArray();
//		sub_button.add(vButton21);
//		sub_button.add(vButton22);
//		// 第二个菜单
//		button2.put("name", "养犬宣传");
//		button2.put("sub_button", sub_button);

		// 第三个菜单
		JSONObject button3 = new JSONObject();
		// 第一个子菜单
		ViewButton vButton31 = new ViewButton();
		vButton31.setType("view");
		vButton31.setName("个人用户");
		vButton31.setUrl("http://139.199.66.220/quanzhi/wx/personal_index");
		// 第二个子菜单
		ViewButton vButton32 = new ViewButton();
		vButton32.setType("view");
		vButton32.setName("管理人员");
		vButton32.setUrl("http://139.199.66.220/quanzhi/wx/police/police_index");
		JSONArray sub_button2 = new JSONArray();
		sub_button2.add(vButton31);
		sub_button2.add(vButton32);
		// 第二个菜单
		button3.put("name", "个人中心");
		button3.put("sub_button", sub_button2);

		JSONArray button = new JSONArray();
		button.add(button1);
		button.add(button2);
		button.add(button3);
		JSONObject menujson = new JSONObject();
		menujson.put("button", button);
		logger.debug(menujson);
		// 调用创建菜单接口
		createMenu(menujson.toString());
	}

	public void onApplicationEvent(ContextRefreshedEvent arg0) {
		// TODO Auto-generated method stub
		init();
	}

	public static void createMenu(String menujson) {
		String url = URL + WeixinUtil.getToken();
		String resData = HttpClientUtil.resultByPost(url, menujson);
		JSONObject resJson = JSONObject.fromObject(resData);
		String errcode = resJson.get("errcode").toString(); // 对方接口请求返回结果：0成功
		if ("0".equals(errcode)) {
			logger.debug("初始化菜单成功");
			System.out.print("初始化菜单成功");
		} else {
			logger.debug("初始化菜单失败");
			System.out.print("初始化菜单失败");
		}
		logger.debug(resJson);
		 System.out.print("菜单json:"+resJson);

	}

}
