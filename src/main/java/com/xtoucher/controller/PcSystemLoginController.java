package com.xtoucher.controller;

/**
 * @author zy
 * 登录Contorller
 * 
 */

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.xtoucher.model.AccountModel;
import com.xtoucher.model.BranchModel;
import com.xtoucher.service.PoliceSystemService;
import com.xtoucher.util.Des3;

@Controller
@RequestMapping("/login")
public class PcSystemLoginController {
	@Autowired
	private PoliceSystemService policeSystemService;

	@RequestMapping(value = "/signIn")
	public String signIn() {
		return "signin";
	}
	// 判断登录帐号密码
	@RequestMapping(value = "/action", method = RequestMethod.POST)
	public ModelAndView action(ModelAndView modelAndView, String account, String pwd, HttpSession session) {
		
		if (account.replaceAll(" ", "").equals("") && pwd.replaceAll(" ", "").equals("")) {
			modelAndView.setViewName("signin");
			modelAndView.addObject("status", "帐号密码错误，请重新登录");
			return modelAndView;
		} else {
			AccountModel accountModel = policeSystemService.queryLoad(account, pwd);
			if (accountModel == null) {
				modelAndView.setViewName("signin");
				modelAndView.addObject("status", "帐号密码错误，请重新登录");
				return modelAndView;
			} else {
				// 这里添加登录后的页面数据
				if (accountModel.getIsAvailable() == 0) {
					modelAndView.setViewName("signin");
					modelAndView.addObject("status", "帐号已经被禁用");
					return modelAndView;
				} else {

					accountModel.setPwd(null);
					session.setAttribute("accountModel", accountModel);
						modelAndView.addObject("am", accountModel);
						modelAndView.setViewName("/system/index");
						return modelAndView;
					}
				}
			}
		}
	
	// 忘记密码

	// 点击主页按钮方法
	@RequestMapping(value = "/home")
	public ModelAndView home(ModelAndView modelAndView, HttpSession session) {
		AccountModel accountModel = (AccountModel) session.getAttribute("accountModel");
		if (accountModel == null) {
			modelAndView.setViewName("signin");
			modelAndView.addObject("status", "请重新登录");
			return modelAndView;
		} else {
				modelAndView.addObject("am", accountModel);
				modelAndView.setViewName("/system/index");
				return modelAndView;
			}
		}
	

	/**
	 * 当前帐号查询与修改
	 */
	// 获取当前帐号信息
	@RequestMapping(value = "/Current")
	public ModelAndView Current(ModelAndView modelAndView, HttpSession session) {
		AccountModel accountModel = (AccountModel) session.getAttribute("accountModel");
		if (accountModel == null) {
			modelAndView.setViewName("signin");
			modelAndView.addObject("status", "请重新登录");
			return modelAndView;
		} else {
			BranchModel branchModel = policeSystemService.qeuryId(accountModel.getBranchId() + "");
			String pwd = policeSystemService.queryPwd(accountModel.getAccount());
			String pwdB;
			try {
				pwdB = Des3.decode(pwd);
				modelAndView.addObject("pwdB", pwdB);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			modelAndView.addObject("bm", branchModel);
			modelAndView.addObject("aM", accountModel);
			modelAndView.setViewName("system/personalInfo");
			return modelAndView;
		}
	}

	// 修改帐号信息
	@RequestMapping(value = "/updateCurrent", method = RequestMethod.POST)
	public ModelAndView updateCurrent(ModelAndView modelAndView, AccountModel accountModel,HttpSession session) {
		policeSystemService.updateCurrent(accountModel);
		session.invalidate();
		modelAndView.addObject("status", "修改成功，请重新登录");
		modelAndView.setViewName("signin");
		return modelAndView;
	}

	// 进入修改密码页面
	@RequestMapping(value = "/password")
	public ModelAndView passWord(ModelAndView modelAndView, HttpSession session) {
		AccountModel accountModel = (AccountModel) session.getAttribute("accountModel");
		if (accountModel == null) {
			modelAndView.setViewName("signin");
			modelAndView.addObject("status", "请重新登录");
			return modelAndView;
		} else {
			String acctount = accountModel.getAccount();
			modelAndView.addObject("account", acctount);
			modelAndView.setViewName("ModifyPwd");
			return modelAndView;
		}
	}

	// 修改密码
	@RequestMapping(value = "/modifyPwd", method = RequestMethod.POST)
	public ModelAndView modifyPwd(ModelAndView modelAndView, AccountModel accountModel, String ispwd) {
		String account = accountModel.getAccount();
		// pwdA为前端获取的旧密码 pwdB为数据库中的旧密码password为新密码
		String pwdA = null;
		try {
			pwdA = Des3.encode(accountModel.getPwd());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String pwdB = policeSystemService.queryPwd(account);
		if (pwdB.equals(pwdA)) {
			policeSystemService.updatePwd(ispwd, account);
			modelAndView.addObject("status", "修改密码成功,请重新登录");
			modelAndView.setViewName("signin");
			return modelAndView;
		} else {
			modelAndView.addObject("status", "密码错误，请重新登录并修改");
			modelAndView.setViewName("signin");
			return modelAndView;
		}
	}
	
	//退出按钮
	@RequestMapping(value="/quit")
	public ModelAndView quit(ModelAndView modelAndView,HttpSession session){
	
		session.invalidate();
		modelAndView.addObject("status", "已退出登录");
		modelAndView.setViewName("signin");	
		return modelAndView;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	

}
