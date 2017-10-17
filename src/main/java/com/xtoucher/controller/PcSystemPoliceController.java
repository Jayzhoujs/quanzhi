package com.xtoucher.controller;

import java.util.HashMap;
/**
 * 下面为警务用户管理的增删改查 Contorller
 */
import java.util.List;
import java.util.Map;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xtoucher.model.AccountModel;
import com.xtoucher.model.AreaModel;
import com.xtoucher.model.BranchModel;

import com.xtoucher.service.HospitalService;
import com.xtoucher.service.PoliceSystemService;
import com.xtoucher.util.Constant;
import com.xtoucher.util.Des3;

@Controller
@RequestMapping("/system")
public class PcSystemPoliceController {
	@Autowired
	private PoliceSystemService policeSystemService;
	@Autowired
	private HospitalService hospitalService;

	// 进入查询所有地区页面
	@RequestMapping(value = "/queryAllBranch")
	public ModelAndView queryAllBranch(ModelAndView modelAndView) {

		List<BranchModel> policeList = policeSystemService.getPoliceOfficeList();
		List<BranchModel> list = policeSystemService.queryBranch();
		modelAndView.addObject("list", list);
		modelAndView.addObject("pl", policeList);
		modelAndView.setViewName("system/appBranchList");
		return modelAndView;
	}

	// 进入地区添加更新页面
	@RequestMapping(value = "/Branch")
	public ModelAndView saveBranch(ModelAndView modelAndView, String id) {

		if (id == null) {
			id = "add1";
		}
		if (id.replaceAll(" ", "").equals("add1")) {
			modelAndView.setViewName("system/appBranchAdd");
			return modelAndView;
		} else if (id.replaceAll(" ", "").equals("add2")) {
			List<BranchModel> list = policeSystemService.queryBranch();
			modelAndView.addObject("list", list);
			modelAndView.setViewName("system/appBranchAddB");
			return modelAndView;
		} else {
			BranchModel branchModel = policeSystemService.qeuryId(id);
			modelAndView.addObject("branch", branchModel);
			modelAndView.setViewName("system/appBranchUpdate");
			return modelAndView;
		}
	}

	// 添加分局
	@RequestMapping(value = "/addBranch", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> addBranch(ModelAndView modelAndView, BranchModel branchModel) {
		int i = 0;
		Map<String, Object> map = new HashMap<String, Object>();
		String info = "";
		if (branchModel.getName().equals("")) {
				map.put(Constant.STATUS, Constant.STATUS_ERROR);
				info = "请填写完全！";
				map.put(Constant.INFO, info);
				return map;
			}else{
				i=policeSystemService.addBranch(branchModel);
				if (i == 1) {
					map.put(Constant.STATUS, Constant.STATUS_OK);
				}else {
					map.put(Constant.STATUS, Constant.STATUS_ERROR);
					info = "有错误，请联系管理员";
				}
				map.put(Constant.INFO, info);
				return map;
			}
		//modelAndView.setViewName("redirect:queryAllBranch");
	}
//添加派出所
	@RequestMapping(value = "/addBranchB", method = RequestMethod.POST)
	public ModelAndView addBranchB(ModelAndView modelAndView,BranchModel branchModel){
		policeSystemService.addBranch(branchModel);
		modelAndView.setViewName("redirect:queryAllBranch");
		return modelAndView;
	}

	// 进入修改地区页面
	@RequestMapping(value = "/upBranch")
	public ModelAndView upBranch(ModelAndView modelAndView, String id, String A) {
		if (A == null) {
			A = "";
		}
		if (A.equals("one")) {
			List<AreaModel> listArea = hospitalService.queryArea();
			BranchModel branchModel = policeSystemService.qeuryId(id);
			modelAndView.addObject("branch", branchModel);
			modelAndView.addObject("area", listArea);
			modelAndView.setViewName("system/appBranchUpdate");
			return modelAndView;
		} else {
			BranchModel branchModel = policeSystemService.qeuryId(id);
			List<BranchModel> list = policeSystemService.queryBranch();
			modelAndView.addObject("list", list);
			modelAndView.addObject("branch", branchModel);
			modelAndView.setViewName("system/appBranchUpdatePolice");
			return modelAndView;
		}

	}
	
	// 修改地区
	@RequestMapping(value = "/updateBranch", method = RequestMethod.POST)
	public ModelAndView updateBranch(ModelAndView modelAndView, BranchModel branchModel) {
		policeSystemService.updateBranch(branchModel);
		modelAndView.setViewName("redirect:queryAllBranch");
		return modelAndView;
	}
	// 删除地区
	@RequestMapping(value = "/deleteBranch")
	@ResponseBody
	public Map<String, Object> deleteBranch(ModelAndView modelAndView, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		String status = "error";
		
		try {
			int i=policeSystemService.deleteBranch(id);
			if (i == 1) {
				status = "ok";
			}
		} catch (Exception e) {
			status = "error";
			e.printStackTrace();
		}
		map.put(Constant.STATUS, status);
		return map;
	}
	
	
	
	
	
	
	
	
	
	
	
	
//	
//	
//	// 查询所有警员帐号
//	@RequestMapping(value = "/branchSelect")
//	public ModelAndView accountSelect(ModelAndView modelAndView, HttpSession session) {
//		List<AccountModel> listAccount = policeSystemService.queryList();
//		List<BranchModel> listBranch = policeSystemService.queryBranchList();
//		modelAndView.addObject("listBranch", listBranch);
//		modelAndView.addObject("listAccount", listAccount);
//		modelAndView.setViewName("system/appPoliceUserList");
//		return modelAndView;
//	}
//
//	// 一个帐号查询进行禁用
//	@RequestMapping(value = "/Disable")
//	public ModelAndView upAccountUserDisable(ModelAndView modelAndView, String id) {
//
//		String status = policeSystemService.accountUserDisable(id, "");
//		modelAndView.addObject("status", status);
//		modelAndView.setViewName("redirect:branchSelect");
//		return modelAndView;
//	}
//
//	// 一个帐号查询进行激活
//	@RequestMapping(value = "/Allow")
//	public ModelAndView accountAllow(ModelAndView modelAndView, String id) {
//		String status = policeSystemService.accountAllow(id, "");
//		modelAndView.addObject("status", status);
//		modelAndView.setViewName("redirect:branchSelect");
//		return modelAndView;
//	}
//
//	// 进入修改页面
//	@RequestMapping(value = "/updatePolice")
//	public ModelAndView updatePolice(ModelAndView modelAndView, String id) {
//		AccountModel accountModelId = policeSystemService.queryAccountUser(id, "");
//		modelAndView.addObject("am", accountModelId);
//		List<BranchModel> list = policeSystemService.queryBranchList();
//		modelAndView.addObject("list", list);
//		modelAndView.setViewName("system/appPoliceUpdate");
//		return modelAndView;
//	}
//
//	// 修改帐号信息
//	@RequestMapping(value = "/updateUser")
//	public ModelAndView upUser(ModelAndView modelAndView, AccountModel accountModel) {
//		policeSystemService.updateCurrent(accountModel);
//		modelAndView.setViewName("redirect:branchSelect");
//		return modelAndView;
//	}
//
//	// 进入警务帐号添加页面
//	@RequestMapping(value = "/addUserJsp")
//	public ModelAndView addPoliceUser(ModelAndView modelAndView) {
//		List<BranchModel> list = policeSystemService.queryBranch();
//		List<BranchModel> policeList = policeSystemService.getPoliceOfficeList();
//		modelAndView.addObject("list", list);
//		modelAndView.addObject("pl", policeList);
//		modelAndView.setViewName("system/newUser");
//		return modelAndView;
//	}
//
//	// 添加新用户
//	@RequestMapping(value = "/addPoliceUser", method = RequestMethod.POST)
//	public ModelAndView addPoliceUser(ModelAndView modelAndView, AccountModel accountModel) {
//
//		if (accountModel.getAccount().replaceAll(" ", "").equals("")
//				|| accountModel.getPwd().replaceAll(" ", "").equals("")) {
//			modelAndView.addObject("status", "请重新登录");
//			modelAndView.setViewName("redirect:addUserJsp");
//			return modelAndView;
//		} else {
//
//			String account = policeSystemService.queryAcc(accountModel.getAccount());
//			if (account == null) {
//				account = "";
//			}
//			if (account.replaceAll(" ", "").equals(accountModel.getAccount())) {
//				modelAndView.addObject("status", "已有账号");
//				modelAndView.setViewName("system/newUser");
//				return modelAndView;
//			} else {
//				String passWord = null;
//				try {
//					passWord = Des3.encode(accountModel.getPwd());
//					accountModel.setPwd(passWord);
//				} catch (Exception e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				}
//				policeSystemService.addPoliceUser(accountModel);
//				modelAndView.setViewName("redirect:addUserJsp");
//				return modelAndView;
//			}
//
//		}
//	}

}
