package com.xtoucher.controller;

/**
 * 在线办理相关的controller
 */
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xtoucher.model.AuthModel;
import com.xtoucher.model.BranchModel;
import com.xtoucher.model.DogBreedModel;
import com.xtoucher.model.DogColorModel;
import com.xtoucher.model.DogModel;
import com.xtoucher.model.StreetModel;
import com.xtoucher.model.UserModel;
import com.xtoucher.service.HandleService;
import com.xtoucher.util.Constant;
import com.xtoucher.util.Des3;
import com.xtoucher.util.ShimingUtil;

@Controller
@RequestMapping("/wx/")
public class WXHandleController {
	private static Logger logger = Logger.getLogger(WXHandleController.class);

	@Autowired
	private HandleService handleService;

	// 进入办理引导页面-用户填写身份证号验证是否申报过
	@RequestMapping("guide")
	public String guide() {
		return "wx/guide";
	}

	// 验证
	@RequestMapping(value = "verify", method = RequestMethod.POST)
	public ModelAndView verify(ModelAndView mav, String IDNum) {
		String viewName = "";
		try {
			if ("".equals(IDNum)) {
				viewName = "wx/error";
				mav.setViewName(viewName);
				mav.addObject(Constant.INFO, "请输入有效身份证号码");
				return mav;
			}
			String temp = Des3.encode(IDNum);
			if (handleService.userInfoCheck(temp) > 0) {
				viewName = "wx/repeat_submit";// 重复提交申报提示页面
			} else {
				// post提交到腾讯实名
				viewName = "redirect:/wx/guide2";
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		mav.setViewName(viewName);
		return mav;
	}

	@RequestMapping(value = "guide2")
	public ModelAndView guide2(ModelAndView mav, HttpServletRequest request) {
		String refer = request.getHeader("referer");
		String viewName = "wx/guide";
		// if (refer != null && refer.contains("quanzhi")) {
		if (true) {
			String signature = ShimingUtil.getSignature("auth");
			String uid = UUID.randomUUID().toString();
			AuthModel authModel = new AuthModel();
			authModel.setAppid(ShimingUtil.APPID);
			authModel.setRedirect(ShimingUtil.REDIRECT);
			authModel.setUid(uid);
			authModel.setSignature(signature);
			authModel.setType("0");
			authModel.setUrl(ShimingUtil.URL_AUTH);
			Map<String, Object> data = new LinkedHashMap<String, Object>();
			data.put("appid", ShimingUtil.APPID);
			data.put("signature", signature);
			data.put("redirect", ShimingUtil.REDIRECT);
			data.put("uid", uid);
			data.put("type", 0);
			String sig = ShimingUtil.MD5(data);
			authModel.setSig(sig);
			mav.addObject(Constant.DATA, authModel);
			viewName = "wx/guide2";
		}
		mav.setViewName(viewName);
		return mav;
	}

	// 实名核身回调地址
	@RequestMapping(value = "callback")
	public ModelAndView callback(String token, String uid, ModelAndView mav) {
		String viewName = "wx/error";
		Map<String, Object> map = new HashMap<String, Object>();
		try {

			System.out.println(token);
			UserModel user = new UserModel();
			// 通过Token获取用户数据
			if (!"".equals(token)) {
				user = handleService.getUserInfoByToken(token, uid);
				// 判断user是否为空进行跳转
				if (user == null) {
					viewName = "wx/error";
					mav.setViewName(viewName);
					return mav;
				}
				viewName = "wx/user_info";
				map.put("user", user);
				List<StreetModel> areaList = handleService.getAllArea();
				map.put("areaList", areaList);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 显示到页面
		mav.setViewName(viewName);
		mav.addObject(Constant.DATA, map);
		return mav;
	}

	// 用户提交个人信息，个别敏感信息由腾讯公司的实名核身提供(新增用户)，此接口提交的信息只做update用户信息
	/**
	 * 
	 * @author raochy
	 * @date 创建时间：2017年9月11日 下午5:49:57
	 * @version
	 * @parameter type:0:个人业务；1：单位业务
	 * @since
	 * @return
	 */
	@RequestMapping(value = "user_info_upload", method = RequestMethod.POST)
	public ModelAndView userInfoUpload(ModelAndView mav, UserModel user,
			String type) {
		String viewName = "";
		try {
			int i = handleService.userInfoUpload(user);
			if (i == 1) {
				viewName = "wx/dog_info";// 进入犬只信息页面
				Map<String, Object> map = new HashMap<String, Object>();
				List<DogBreedModel> breedList = handleService.breed();
				map.put("breedList", breedList);
				List<DogColorModel> colorList = handleService.color();
				map.put("colorList", colorList);
				map.put("userId", user.getUserId());
				map.put("type", type);// 业务类型
				mav.addObject(Constant.DATA, map);
			} else {
				viewName = "wx/error";
			}

		} catch (Exception e) {
			viewName = "wx/error";
			e.printStackTrace();
		}
		mav.setViewName(viewName);
		return mav;
	}

	// 根据区域查询下面的街道
	@RequestMapping("street")
	@ResponseBody
	public Map<String, Object> street(String parentId) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			List<StreetModel> streetList = handleService.street(parentId);
			map.put("streetList", streetList);
			map.put(Constant.STATUS, Constant.STATUS_OK);
		} catch (Exception e) {
			map.put(Constant.STATUS, Constant.STATUS_ERROR);
			e.printStackTrace();
		}
		return map;
	}

	// 查询犬种
	@RequestMapping("dog_breed")
	@ResponseBody
	public Map<String, Object> breed() {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			List<DogBreedModel> list = handleService.breed();
			map.put("breedList", list);
			map.put(Constant.STATUS, Constant.STATUS_OK);
		} catch (Exception e) {
			map.put(Constant.STATUS, Constant.STATUS_ERROR);
			e.printStackTrace();
		}
		return map;
	}

	// 查询颜色
	@RequestMapping("dog_color")
	@ResponseBody
	public Map<String, Object> color() {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			List<DogColorModel> list = handleService.color();
			map.put("colorList", list);
			map.put(Constant.STATUS, Constant.STATUS_OK);
		} catch (Exception e) {
			map.put(Constant.STATUS, Constant.STATUS_ERROR);
			e.printStackTrace();
		}
		return map;
	}

	// 提交犬只信息，发起申报
	/**
	 * 
	 * @author raochy
	 * @date 创建时间：2017年9月8日 下午2:12:00
	 * @version
	 * @parameter userId为UUID，branchId为网点id,type:0个人业务，1：单位业务
	 * @since
	 * @return
	 */
	@RequestMapping(value = "declare", method = RequestMethod.POST)
	public ModelAndView declare(ModelAndView mav, DogModel dog, String userId,
			String type,String branchId) {
		String viewName = "wx/error";

		if (handleService.declare(dog, userId, type,branchId)) {
			viewName = "wx/success";
		} else {
			viewName = "wx/error";
		}
		mav.setViewName(viewName);
		return mav;
	}

	@RequestMapping(value = "test")
	public String test() {
		return "wx/dog_info";
	}

	// 查询颜色
	@RequestMapping("branch_search")
	@ResponseBody
	public Map<String, Object> branchSearch(String type,String keyWord) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			List<BranchModel> list = handleService.branchSearch(type,keyWord.trim());
			map.put("branchList", list);
			map.put(Constant.STATUS, Constant.STATUS_OK);
		} catch (Exception e) {
			map.put(Constant.STATUS, Constant.STATUS_ERROR);
			e.printStackTrace();
		}
		return map;
	}

}
