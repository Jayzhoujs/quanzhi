package com.xtoucher.controller;

/**
 * 个人相关的Controller
 */
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.xtoucher.model.DogModel;
import com.xtoucher.model.UserModel;
import com.xtoucher.service.PersonalService;
import com.xtoucher.util.Constant;
import com.xtoucher.util.HttpClientUtil;
import com.xtoucher.util.WeixinUtil;

@Controller
@RequestMapping("/wx/")
public class PersonalController {
	private static Logger logger = Logger.getLogger(PersonalController.class);

	@Autowired
	private PersonalService personalService;

	// 个人中心入口，重定向到微信获取个人信息
	// @RequestMapping(value = "/redirect_personal_info", method =
	// RequestMethod.GET)
	// public String weixinRedirect() {
	// String url =
	// "redirect:https://open.weixin.qq.com/connect/oauth2/authorize?appid=APPID&redirect_uri=REDIRECT_URI?response_type=code&scope=snsapi_base&state=1&#wechat_redirect"
	// .replace("APPID", WeixinUtil.getAppid()).replace(
	// "REDIRECT_URI",
	// Constant.getBASE_HOST() + "/wx/personal_index");
	// return url;
	// }

	// 进入个人首页
	// @RequestMapping(value = "personal_index")
	// public ModelAndView index(HttpServletRequest request,
	// HttpServletResponse response, ModelAndView mav) {
	// // 得到code
	// String CODE = request.getParameter("code");
	// // 换取access_token 其中包含了openid
	// String url =
	// "https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code"
	// .replace("APPID", WeixinUtil.getAppid())
	// .replace("SECRET", WeixinUtil.getSecret())
	// .replace("CODE", CODE);
	// String jsonStr = HttpClientUtil.resultByGet(url);
	// JSONObject jsonObj = JSONObject.fromObject(jsonStr);
	// String openid = jsonObj.get("openid").toString();
	// String accessToken = jsonObj.get("access_token").toString();
	// String url2 =
	// "https://api.weixin.qq.com/cgi-bin/user/info?access_token=ACCESS_TOKEN&openid=OPENID&lang=zh_CN"
	// .replace("ACCESS_TOKEN", accessToken).replace("OPENID", openid);
	// String temp = HttpClientUtil.resultByGet(url2);
	// JSONObject jsonTemp = JSONObject.fromObject(temp);
	// String nickName = jsonTemp.get("nickname").toString();// 获取微信昵称
	// String headImgUrl = jsonTemp.get("headimgurl").toString();// 获取微信头像
	// UserModel user = new UserModel();
	// user.setHeadImgUrl(headImgUrl);
	// user.setRealName(nickName);
	// mav.addObject(Constant.DATA, user);
	// mav.setViewName("wx/personal_index");
	// return mav;
	// }
	@RequestMapping(value = "personal_index")
	public ModelAndView personIndex(ModelAndView modelAndView) {
		modelAndView.setViewName("wx/user/personal_index");
		return modelAndView;
	}

	// 进入查询犬证首页
	@RequestMapping(value = "personal_dog_index")
	public ModelAndView dogIndex(ModelAndView modelAndView) {
		modelAndView.setViewName("wx/user/personal_dog_index");
		return modelAndView;
	}

	// 查询犬证
	/**
	 * 
	 * @author raochy
	 * @date 创建时间：2017年9月8日 下午7:54:17
	 * @version
	 * @parameter keyWord:支持犬主身份证以及犬只登记证号
	 * @since
	 * @return
	 */
	@RequestMapping(value = "personal_dog_info")
	public ModelAndView dogInfo(ModelAndView mav, String IDNum,
			String registrationNum) {
		DogModel dogModel = personalService.getDogInfoByKeyWord(IDNum,
				registrationNum);
		if (dogModel == null) {
			mav.setViewName("wx/no_result");// 没有犬只信息
		} else {
			mav.setViewName("wx/search_result");
			mav.addObject("dog", dogModel);
		}
		return mav;
	}

	// 进入注销犬证搜索页面
	@RequestMapping(value = "zhuxiao_search")
	public String dogSearchIndex() {
		return "wx/user/zhuxiao_search";
	}

	// 注销犬证页面
	/**
	 * 
	 * @author raochy
	 * @date 创建时间：2017年9月8日 下午7:54:17
	 * @version
	 * @parameter keyWord:支持犬主身份证以及犬只登记证号
	 * @since
	 * @return
	 */
	@RequestMapping(value = "log_off_index")
	public ModelAndView logOffIndex(ModelAndView mav, String IDNum,
			String registrationNum) {
		Map<String, Object> map = new HashMap<String, Object>();
		DogModel dogModel = personalService.getDogInfoByKeyWord(IDNum,
				registrationNum);
		if (dogModel == null) {
			mav.setViewName("wx/no_result");// 没有犬只信息
		} else {
			mav.setViewName("wx/user/person_search_result");
			map.put("IDNum", IDNum);
			map.put("registrationNum", registrationNum);
			map.put("dog", dogModel);
			mav.addObject(Constant.DATA, map);
		}
		return mav;
	}

	// 注销犬证
	@RequestMapping(value = "log_off")
	public ModelAndView logOff(ModelAndView mav, String IDNum,
			String registrationNum, String dogId, String reason) {
		if (personalService.logOff(IDNum, registrationNum, dogId, reason) > 0) {
			mav.setViewName("wx/success");// 没有犬只信息
		} else {
			mav.setViewName("wx/error");
		}
		return mav;
	}

}
