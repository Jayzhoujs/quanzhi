package com.xtoucher.controller;

/**
 * 后台管理——审批 Contorller
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

import com.xtoucher.model.AccountModel;
import com.xtoucher.model.ApproModel;
import com.xtoucher.model.HistoryModel;

import com.xtoucher.model.ProgressHistoryModel;
import com.xtoucher.service.ExamineSystemService;
import com.xtoucher.service.PoliceService;
import com.xtoucher.util.Constant;


@Controller
@RequestMapping("/common")
public class ApprovalController {
	@Autowired
	private ExamineSystemService examineSystemService;
	@Autowired
	private PoliceService policeService;

	// 查询全部列表
	@RequestMapping(value = "/approval_list")
	public ModelAndView branch(ModelAndView modelAndView,
			HttpServletRequest request) {
		AccountModel accountModel = (AccountModel) request.getSession()
				.getAttribute("accountModel");
		String branchId = "";
		if (accountModel.getBranchId() == null) {
			branchId = "";
		} else {
			branchId = Integer.toString(accountModel.getBranchId());
		}
		List<ApproModel> list = examineSystemService
				.getListByNranchId(branchId);
		modelAndView.addObject("list", list);
		modelAndView.setViewName("system/approval_list");
		return modelAndView;
	}

	// 查询审核详情
	@RequestMapping(value = "/approval_detail")
	public ModelAndView approvalDetail(ModelAndView modelAndView,
			HttpServletRequest request, String id) {
		AccountModel accountModel = (AccountModel) request.getSession()
				.getAttribute("accountModel");
		String branchId = "";
		if (accountModel.getBranchId() == null) {
			branchId = "";
		} else {
			branchId = Integer.toString(accountModel.getBranchId());
		}
		ApproModel approModel = examineSystemService.approvalDetail(branchId,
				id);
		modelAndView.addObject("approModel", approModel);
		modelAndView.setViewName("system/approval_detail");
		return modelAndView;
	}

	// 查询审核记录
	@RequestMapping(value = "/approval_history")
	public ModelAndView approvalHistory(ModelAndView modelAndView,
			HttpServletRequest request, String id) {
		AccountModel accountModel = (AccountModel) request.getSession()
				.getAttribute("accountModel");
		String branchId = "";
		if (accountModel.getBranchId() == null) {
			branchId = "";
		} else {
			branchId = Integer.toString(accountModel.getBranchId());
		}
		HistoryModel historyModel = examineSystemService.approvalHistory(branchId,
				id);
		modelAndView.addObject("historyModel", historyModel);
		modelAndView.setViewName("system/approval_history");
		return modelAndView;
	}
	//审核
	//status 0:通过；1：不通过
	@RequestMapping(value = "approval", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> approval(HttpServletRequest request, String id,
			String status, String remark) {
		Map<String, Object> map = new HashMap<String, Object>();
		String info="";
		AccountModel accountModel = (AccountModel) request.getSession()
				.getAttribute("accountModel");
		ProgressHistoryModel progressHistoryModel = new ProgressHistoryModel();
		progressHistoryModel
				.setAccountId(Integer.toString(accountModel.getId()));
		progressHistoryModel.setApprovalId(id);
		progressHistoryModel.setRemark(remark);
		if(policeService.approval(id, status, progressHistoryModel)){
			info = "成功";
		}
		else{
			info = "这个申报已经审核过了，请勿重复审核";
		}
		map.put(Constant.INFO, info);
		return map;
	}

}
