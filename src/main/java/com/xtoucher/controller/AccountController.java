package com.xtoucher.controller;

/**
 * 后台管理——账号 Contorller
 */

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xtoucher.model.AccountBranchModel;
import com.xtoucher.model.AccountModel;
import com.xtoucher.model.BranchModel;
import com.xtoucher.service.ExamineSystemService;
import com.xtoucher.service.PoliceService;
import com.xtoucher.util.Constant;
import com.xtoucher.util.Des3;

@Controller
@RequestMapping("/common")
public class AccountController {
	@Autowired
	private ExamineSystemService examineSystemService;
	@Autowired
	private PoliceService policeService;

	// 查询全部列表
	@RequestMapping(value = "/account_list")
	public ModelAndView accountList(ModelAndView modelAndView,
			HttpServletRequest request) {
		AccountModel accountModel = (AccountModel) request.getSession()
				.getAttribute("accountModel");
		String branchId = "";
		if (accountModel.getBranchId() == null) {
			branchId = "";
		} else {
			branchId = Integer.toString(accountModel.getBranchId());
		}
		List<AccountBranchModel> list = policeService
				.getAccountListByBranchId(branchId);
		modelAndView.addObject("list", list);
		modelAndView.setViewName("system/account_list");
		return modelAndView;
	}

	// 启用、禁用账号
	@RequestMapping(value = "account_status_change", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> accountStatusChange(HttpServletRequest request,
			String id, String status) {
		Map<String, Object> map = new HashMap<String, Object>();
		String info = "";
		AccountModel accountModel = (AccountModel) request.getSession()
				.getAttribute("accountModel");
		String branchId = "";
		if (accountModel.getBranchId() == null) {
			branchId = "";
		} else {
			branchId = Integer.toString(accountModel.getBranchId());
		}
		if (policeService.accountStatusChange(id, status, branchId) == 1) {
			map.put(Constant.STATUS, Constant.STATUS_OK);
		} else {
			map.put(Constant.STATUS, Constant.STATUS_ERROR);
			info = "没有权限";
		}
		map.put(Constant.INFO, info);
		return map;
	}

	// 初始化新增用户页面
	@RequestMapping(value = "/account_add_index")
	public ModelAndView accountAddIndex(ModelAndView modelAndView,
			HttpServletRequest request, String id) {
		AccountModel accountModel = (AccountModel) request.getSession()
				.getAttribute("accountModel");
		String branchId = "";
		Map<String, Object> map = new HashMap<String, Object>();
		List<BranchModel> list;
		if (accountModel.getBranchId() == null
				|| "".equals(accountModel.getBranchId())) {
			// 管理员
			// 初始化网点列表
			list = policeService.getBranchListAll();
		} else {
			// 分局和派出所领导
			// 初始化网点列表，只有一个branchId,从session取
			branchId = Integer.toString(accountModel.getBranchId());
			list = policeService.getBranchById(branchId);
		}
		map.put("branchList", list);
		map.put("accountModel", accountModel);
		modelAndView.addObject(Constant.DATA, map);
		modelAndView.setViewName("system/account_add_index");
		return modelAndView;
	}

	// 新增账号
	@RequestMapping(value = "account_add", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> accountAdd(AccountModel accountModel) {
		int i = 0;
		Map<String, Object> map = new HashMap<String, Object>();
		String info = "";
		i = policeService.accountAdd(accountModel);
		if (i == 1) {
			map.put(Constant.STATUS, Constant.STATUS_OK);
		} else {
			map.put(Constant.STATUS, Constant.STATUS_ERROR);
			info = "账号重复";
		}
		map.put(Constant.INFO, info);
		return map;
	}

	// 初始化修改用户页面
	@RequestMapping(value = "/account_update_index")
	public ModelAndView accountListww(ModelAndView modelAndView, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		AccountModel tempAccount;
		if (id != null && !"".equals(id)) {
			// 修改，返回账号基本信息
			tempAccount = policeService.getAccountById(id);
			try {
				tempAccount.setPwd(Des3.decode(tempAccount.getPwd()));// 解密
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			map.put("tempAccount", tempAccount);
		}
		modelAndView.addObject(Constant.DATA, map);
		modelAndView.setViewName("system/account_update_index");
		return modelAndView;
	}

	// 编辑账号
	@RequestMapping(value = "account_update", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> accountUpdate(AccountModel accountModel) {
		int i = 0;
		Map<String, Object> map = new HashMap<String, Object>();
		String info = "";
		i = policeService.accountUpdate(accountModel);
		if (i == 1) {
			map.put(Constant.STATUS, Constant.STATUS_OK);
		} else {
			map.put(Constant.STATUS, Constant.STATUS_ERROR);
			info = "账号重复";
		}
		map.put(Constant.INFO, info);
		return map;
	}

	// 根据角色查询网点
	@RequestMapping(value = "getBranchList", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getBranchList(String rank) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<BranchModel> list = policeService.getBranchList(rank);
		map.put("list", list);
		return map;
	}

}
