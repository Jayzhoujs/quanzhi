package com.xtoucher.controller;

/**
 * 下面为警务用户管理的增删改查 Contorller
 */
import java.util.List;

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
@RequestMapping("/office")
public class PcOfficePoliceController {
	@Autowired
	private PoliceSystemService policeSystemService;

	// 查询所有警员帐号
	@RequestMapping(value = "/branchSelect")
	public ModelAndView accountSelect(ModelAndView modelAndView, HttpSession session) {
		AccountModel accountModel = (AccountModel) session.getAttribute("accountModel");
		List<AccountModel> listAccount = policeSystemService.queryAccount(accountModel.getBranchId() + "");
		List<BranchModel> listBranch = policeSystemService.queryBranchList();
		modelAndView.addObject("listBranch", listBranch);
		modelAndView.addObject("listAccount", listAccount);
		modelAndView.setViewName("system/appPoliceUserList");
		return modelAndView;
	}

	// 一个帐号查询进行禁用
	@RequestMapping(value = "/Disable")
	public ModelAndView upAccountUserDisable(ModelAndView modelAndView, String id, HttpSession session) {
		AccountModel accountModel = (AccountModel) session.getAttribute("accountModel");
		String status = policeSystemService.accountUserDisable(id, accountModel.getBranchId() + "");
		modelAndView.addObject("status", status);
		modelAndView.setViewName("redirect:branchSelect");
		return modelAndView;
	}

	// 一个帐号查询进行激活
	@RequestMapping(value = "/Allow")
	public ModelAndView accountAllow(ModelAndView modelAndView, String id, HttpSession session) {
		AccountModel accountModel = (AccountModel) session.getAttribute("accountModel");
		String status = policeSystemService.accountAllow(id, accountModel.getBranchId() + "");
		modelAndView.addObject("status", status);
		modelAndView.setViewName("redirect:branchSelect");
		return modelAndView;
	}

	// 进入修改页面
	@RequestMapping(value = "/updatePolice")
	public ModelAndView updatePolice(ModelAndView modelAndView, String id, HttpSession session) {
		AccountModel accountModel = (AccountModel) session.getAttribute("accountModel");
		AccountModel accountModelId = policeSystemService.queryAccountUser(id, accountModel.getBranchId() + "");
		modelAndView.addObject("am", accountModelId);
		List<BranchModel> list = policeSystemService.queryBranchList();
		modelAndView.addObject("list", list);
		modelAndView.setViewName("system/appPoliceUpdate");
		return modelAndView;
	}

	// 修改帐号信息
	@RequestMapping(value = "/updateUser")
	public ModelAndView upUser(ModelAndView modelAndView, AccountModel accountModel) {
		policeSystemService.updateCurrent(accountModel);
		modelAndView.setViewName("redirect:branchSelect");
		return modelAndView;
	}

	// 进入警务帐号添加页面
	@RequestMapping(value = "/addUserJsp")
	public ModelAndView addPoliceUser(ModelAndView modelAndView, HttpSession session) {
		AccountModel accountModel = (AccountModel) session.getAttribute("accountModel");
		BranchModel branchModel = policeSystemService.qeuryId(accountModel.getBranchId() + "");
		modelAndView.addObject("bm", branchModel);
		modelAndView.setViewName("system/newUser");
		return modelAndView;
	}
	// 添加新用户
	@RequestMapping(value = "/addPoliceUser", method = RequestMethod.POST)
	public ModelAndView addPoliceUser(ModelAndView modelAndView, AccountModel accountModel) {

		if (accountModel.getAccount().replaceAll(" ", "").equals("")
				|| accountModel.getPwd().replaceAll(" ", "").equals("")) {
			modelAndView.addObject("status", "请重新登录");
			modelAndView.setViewName("redirect:addUserJsp");
			return modelAndView;
		} else {

			String account = policeSystemService.queryAcc(accountModel.getAccount());
			if (account == null) {
				account = "";
			}
			if (account.replaceAll(" ", "").equals(accountModel.getAccount())) {
				modelAndView.addObject("status", "已有账号");
				modelAndView.setViewName("system/newUser");
				return modelAndView;
			} else {
				String passWord = null;
				try {
					passWord = Des3.encode(accountModel.getPwd());
					accountModel.setPwd(passWord);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				policeSystemService.addPoliceUser(accountModel);
				modelAndView.setViewName("redirect:addUserJsp");
				return modelAndView;
			}

		}
	}

	// 进入查询所有地区页面
	@RequestMapping(value = "/queryAllBranch")
	public ModelAndView queryAllBranch(ModelAndView modelAndView) {
		List<BranchModel> listAll = policeSystemService.queryBranchList();
		modelAndView.addObject("listAll", listAll);
		modelAndView.setViewName("system/testAdd");
		return modelAndView;
	}

	// 进入地区添加更新页面
	@RequestMapping(value = "/Branch")
	public ModelAndView saveBranch(ModelAndView modelAndView, String id) {
		if ("".equals(id.replaceAll(" ", ""))) {
			modelAndView.setViewName("system/testAdd");
			return modelAndView;
		} else {
			BranchModel branchModel = policeSystemService.qeuryId(id);
			modelAndView.addObject("branch", branchModel);
			modelAndView.setViewName("system/testAdd");
			return modelAndView;
		}
	}

	// 添加地区
	@RequestMapping(value = "/addBranch", method = RequestMethod.POST)
	public ModelAndView addBranch(ModelAndView modelAndView, BranchModel branchModel) {
		policeSystemService.addBranch(branchModel);
		modelAndView.addObject("success", "添加成功");
		modelAndView.setViewName("redirect:queryAllBranch");
		return modelAndView;
	}

	// 进入更改地区页面
	@RequestMapping(value = "/updateBranch", method = RequestMethod.POST)
	public ModelAndView updateBranch(ModelAndView modelAndView, BranchModel branchModel) {
		policeSystemService.updateBranch(branchModel);
		modelAndView.addObject("success", "添加成功");
		modelAndView.setViewName("redirect:queryAllBranch");
		return modelAndView;
	}
	// 删除地区

}
