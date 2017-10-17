package com.xtoucher.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xtoucher.model.AccountModel;
import com.xtoucher.model.DogModel;
import com.xtoucher.model.PoliceApprovalModel;
import com.xtoucher.model.ProgressHistoryModel;
import com.xtoucher.service.PoliceService;
import com.xtoucher.util.Constant;
import com.xtoucher.util.Des3;

@Controller
@RequestMapping("/wx/police")
public class WXPoliceController {
	private static Logger logger = Logger.getLogger(WXPoliceController.class);

	@Autowired
	private PoliceService policeService;

	// Poluce端首页
	@RequestMapping("police_index")
	public String index() {
		return "wx/police/police_index";
	}

	// 登录
	@RequestMapping("login")
	public ModelAndView login(HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView mav = new ModelAndView();
		String view = "";
		Map<String, Object> map = new HashMap<String, Object>();
		String account = request.getParameter("account");
		try {
			String password = Des3.encode(request.getParameter("password")
					.trim());
			JSONObject json=new JSONObject();
			String info="";
			String status="";
			AccountModel accountModel = policeService.login(account, password);
			if (accountModel != null) {
				if (1 == accountModel.getIsAvailable()) {
					// 登录成功，跳转页面
					view = "redirect:/wx/police/police_main";

					// 保存Cookie
					Cookie cookie = new Cookie("police",
							accountModel.getAccount() + ":"
									+ accountModel.getPwd());
					cookie.setPath(request.getContextPath());
					cookie.setMaxAge(3600 * 24 * 7);// 7天内有效
					response.addCookie(cookie);
					// 保存session

					request.getSession().setAttribute("police", accountModel);
				} else {
					view = "wx/police/police_index";
					info="账号已被禁用，请联系你的直属领导";
					status="error";
				}
			} else {
				view = "wx/police/police_index";
				info="用户名和密码不匹配";
				status="error";
			}
			json.put("status", status);
			json.put("info", info);
			map.put(Constant.DATA, json);
			mav.addObject("mapResult", map);
		} catch (Exception e) {
			e.printStackTrace();
		}// 加密
		mav.setViewName(view);
		return mav;
	}

	// Police注销
	@RequestMapping("police_logout")
	public String policeLogout(HttpServletRequest request,
			HttpServletResponse response) {
		if (request.getSession(false) != null) {
			request.getSession().invalidate();
			// 删除自动登录 cookie
			Cookie cookie = new Cookie("police", "");
			cookie.setPath(request.getContextPath());
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		return "wx/police/police_index";
	}

	// 主页
	@RequestMapping("police_main")
	public ModelAndView policeMain(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String view = "wx/police/police_main";
		Map<String, Object> map = new HashMap<String, Object>();
		AccountModel accountModel = (AccountModel) request.getSession()
				.getAttribute("police");
		accountModel.setPwd(null);// 敏感信息置空
		map.put("accountModel", accountModel);
		mav.addObject(Constant.DATA, map);
		mav.setViewName(view);
		return mav;
	}

	// 设置页面
	@RequestMapping("police_setting")
	public ModelAndView policeSetting(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String view = "wx/police/police_setting";
		Map<String, Object> map = new HashMap<String, Object>();
		AccountModel accountModel = (AccountModel) request.getSession()
				.getAttribute("police");
		accountModel.setPwd(null);// 敏感信息置空
		map.put("accountModel", accountModel);
		mav.addObject(Constant.DATA, map);
		mav.setViewName(view);
		return mav;
	}

	// 修改密码页面
	@RequestMapping("police_update_index")
	public String updateIndex(HttpServletRequest request) {
		return "wx/police/police_update_index";
	}

	// 修改密码
	@RequestMapping("police_update")
	public ModelAndView updatePwd(HttpServletRequest request, String oldPwd,
			String newPwd) {
		ModelAndView mav = new ModelAndView();
		String view = "wx/police/update_error";
		String info = "原密码不对";
		AccountModel accountModel = (AccountModel) request.getSession()
				.getAttribute("police");
		try {
			oldPwd = Des3.encode(oldPwd);
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		AccountModel temp = new AccountModel();
		temp = policeService.login(accountModel.getAccount(), oldPwd);
		if (temp != null && temp.getPwd().equals(oldPwd)) {
			AccountModel account = new AccountModel();
			account.setId(accountModel.getId());
			String pwd;
			try {
				pwd = Des3.encode(newPwd);
				account.setPwd(pwd);
			} catch (Exception e) {
				e.printStackTrace();
			}
			policeService.update(account);
			view = "wx/success";// 返回成功
			info = "修改成功";
		}
		mav.setViewName(view);
		mav.addObject(Constant.INFO, info);
		return mav;
	}

	// 未审核页面
	@RequestMapping("police_to_approval")
	public ModelAndView toApprovalIndex(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		String view = "wx/police/police_to_approval";
		AccountModel accountModel = (AccountModel) request.getSession()
				.getAttribute("police");
		if (accountModel != null) {
			List<PoliceApprovalModel> list = policeService
					.getToApprovalList(accountModel.getBranchId());// 待审核列表，默认20条记录，不做分页
			for (PoliceApprovalModel temp : list) {
				String tempIDNum;
				try {
					tempIDNum = Des3.decode(temp.getIDNum());
					tempIDNum = tempIDNum.substring(0, 10) + "****"
							+ tempIDNum.substring(14, 18);
					temp.setIDNum(tempIDNum);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}
			mav.addObject("list", list);
		}
		mav.setViewName(view);
		return mav;
	}

	// 未审核-关键字搜索
	@RequestMapping(value = "police_to_approval_search", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> toApprovalSearch(HttpServletRequest request,
			String IDNum, String realName) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			AccountModel accountModel = (AccountModel) request.getSession()
					.getAttribute("police");
			if (accountModel != null) {
				List<PoliceApprovalModel> list = policeService
						.toApprovalSearch(accountModel.getBranchId(), IDNum,
								realName);// 待审核列表，搜索
				for (PoliceApprovalModel temp : list) {
					String tempIDNum = Des3.decode(temp.getIDNum());
					tempIDNum = tempIDNum.substring(0, 10) + "****"
							+ tempIDNum.substring(14, 18);
					temp.setIDNum(tempIDNum);
				}
				map.put("list", list);
			}
			map.put(Constant.STATUS, Constant.STATUS_OK);
		} catch (Exception e) {
			map.put(Constant.STATUS, Constant.STATUS_ERROR);
			e.printStackTrace();
		}
		return map;
	}

	// 已审核页面
	@RequestMapping("police_approvaled")
	public String approvaledIndex() {
		return "wx/police/police_approvaled";
	}

	// 已审核-关键字搜索
	@RequestMapping(value = "police_to_approvaled_search", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> approvaledSearch(HttpServletRequest request,
			String IDNum, String realName) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			AccountModel accountModel = (AccountModel) request.getSession()
					.getAttribute("police");
			if (accountModel != null) {
				List<PoliceApprovalModel> list = policeService
						.approvaledSearch(accountModel.getBranchId(), IDNum,
								realName);
				for (PoliceApprovalModel temp : list) {
					String tempIDNum = Des3.decode(temp.getIDNum());
					tempIDNum = tempIDNum.substring(0, 10) + "****"
							+ tempIDNum.substring(14, 18);
					temp.setIDNum(tempIDNum);
				}
				map.put("list", list);
			}
			map.put(Constant.STATUS, Constant.STATUS_OK);
		} catch (Exception e) {
			map.put(Constant.STATUS, Constant.STATUS_ERROR);
			e.printStackTrace();
		}
		return map;
	}

	// 审核页面
	@RequestMapping("police_approval_index")
	public ModelAndView approvalIndex(HttpServletRequest request, String id) {
		ModelAndView mav = new ModelAndView();
		String view = "wx/police/police_approval_index";
		AccountModel accountModel = (AccountModel) request.getSession()
				.getAttribute("police");
		if (accountModel != null) {
			PoliceApprovalModel policeApprovalModel = policeService
					.getApprovalById(accountModel.getBranchId(), id);
			try {
				String tempIDNum = Des3.decode(policeApprovalModel.getIDNum());
				tempIDNum = tempIDNum.substring(0, 10) + "****"
						+ tempIDNum.substring(14, 18);
				policeApprovalModel.setIDNum(tempIDNum);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			mav.addObject("policeApproval", policeApprovalModel);
		}
		mav.setViewName(view);
		return mav;
	}

	// 不通过初始化页面
	@RequestMapping("police_approval_not_index")
	public ModelAndView approvalNotIndex(HttpServletRequest request, String id) {
		ModelAndView mav = new ModelAndView();
		String view = "wx/police/police_approval_not_index";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("approvalId", id);
		mav.setViewName(view);
		mav.addObject(Constant.DATA, map);
		return mav;
	}

	// 审核
	@RequestMapping(value = "police_approval", method = RequestMethod.POST)
	public ModelAndView approval(HttpServletRequest request, String id,
			String status, String remark) {
		ModelAndView mav = new ModelAndView();
		String view = "wx/error";
		AccountModel accountModel = (AccountModel) request.getSession()
				.getAttribute("police");
		ProgressHistoryModel progressHistoryModel = new ProgressHistoryModel();
		progressHistoryModel
				.setAccountId(Integer.toString(accountModel.getId()));
		progressHistoryModel.setApprovalId(id);
		progressHistoryModel.setRemark(remark);
		if(policeService.approval(id, status, progressHistoryModel)){
			view = "wx/success";
		}
		else{
			mav.addObject(Constant.INFO, "这个申报已经审核过了，请勿重复审核");
		}
		mav.setViewName(view);
		return mav;
	}

	// 进入查询犬只证首页
	@RequestMapping(value = "police_dog_index")
	public ModelAndView dogIndex(ModelAndView modelAndView) {
		modelAndView.setViewName("wx/police/police_dog_index");
		return modelAndView;
	}

	// 查询犬证
	@RequestMapping(value = "police_dog_info")
	public ModelAndView dogInfo(ModelAndView mav, String IDNum,
			String registrationNum) {
		DogModel dogModel = policeService.getDogInfoByKeyWord(IDNum,
				registrationNum);
		if (dogModel == null) {
			mav.setViewName("wx/no_result");// 没有犬只信息
		} else {
			mav.setViewName("wx/search_result");
			mav.addObject("dog", dogModel);
		}
		return mav;
	}

}
