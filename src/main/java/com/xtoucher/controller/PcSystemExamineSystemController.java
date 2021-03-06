package com.xtoucher.controller;
/**
 * 后台管理——审批 Contorller
 */

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.xtoucher.model.AccountModel;
import com.xtoucher.model.ApprovalHistoryModel;

import com.xtoucher.model.ExamineModel;

import com.xtoucher.service.ExamineSystemService;


@Controller
@RequestMapping("/system")
public class PcSystemExamineSystemController {
	@Autowired
	private ExamineSystemService examineSystemService;


	// 查询未审批单据
	@RequestMapping(value = "/branchAndUnApporval")
	public ModelAndView branch(ModelAndView modelAndView) {
		List<ExamineModel> listEx = examineSystemService.listExBranchAll();
		modelAndView.addObject("exb", listEx);
		modelAndView.setViewName("system/appNotPassList");
		return modelAndView;
	}

	// 根据id查询未审批的记录
	@RequestMapping(value = "/aExaminePass")
	public ModelAndView aExaminePass(ModelAndView modelAndView, String id,HttpSession session) {
		
		ExamineModel examineModel = examineSystemService.queryExamine(id,"");
		modelAndView.addObject("examineModel", examineModel);
		modelAndView.setViewName("system/appNotPassListPersto");
		return modelAndView;
	}

	// 审批

	@RequestMapping(value = "/ExamineSubmit", method = RequestMethod.POST)
	public ModelAndView ExamineSubmit(ModelAndView modelAndView, String id, String status, String des,
			HttpSession session) {
		if (des == null) {
			des = "";
		}
		ApprovalHistoryModel approvalHistoryModel = new ApprovalHistoryModel();
		AccountModel accountModel;
		accountModel = (AccountModel) session.getAttribute("accountModel");
		String accId = accountModel.getId() + "";
		if (status.equals("1")) {
			if ("".equals(des.replaceAll(" ", ""))) {
				des = "审核通过";
				approvalHistoryModel.setRemark(des);
				examineSystemService.updateApproval(id, status);
			} else {
				approvalHistoryModel.setRemark(des);
				examineSystemService.updateApproval(id, status);
			}
		} else if (status.equals("2")) {
			approvalHistoryModel.setRemark(des);
			examineSystemService.updateApproval(id, status);
		}
		approvalHistoryModel.setApprovalId(id);
		approvalHistoryModel.setAccountId(accId);
		examineSystemService.addApprovalH(approvalHistoryModel);
		modelAndView.setViewName("redirect:all");
		return modelAndView;
	}

	// 查询所有审批单据
	@RequestMapping(value = "/all")
	public ModelAndView all(ModelAndView modelAndView, Integer currentPage) {
		if (currentPage == null) {
			currentPage = 0;
		}
		List<ExamineModel> list = examineSystemService.queryList(currentPage);
		modelAndView.addObject("listExamin", list);
		modelAndView.setViewName("system/appAll");
		return modelAndView;
	}

	// 根据id查询单个审批单据（已或未通过）
	@RequestMapping(value = "/aExamine")
	public ModelAndView aExamine(ModelAndView modelAndView, String id,HttpSession session) {

		ExamineModel examineModel = examineSystemService.queryExamine(id,"");
		String approvalId = examineModel.getId();
		List<ApprovalHistoryModel> approvalHistoryModel = examineSystemService.queryAh(approvalId);
		String accountId;
		List<AccountModel> list = new ArrayList<AccountModel>();
		for (ApprovalHistoryModel ahm : approvalHistoryModel) {
			accountId = ahm.getAccountId();
			list.add(examineSystemService.queryPoliceUser(accountId));
		}

		modelAndView.addObject("examineModel", examineModel);
		modelAndView.addObject("approvalH", approvalHistoryModel);
		modelAndView.addObject("account", list);
		modelAndView.setViewName("system/appPassListAll");
		return modelAndView;
	}

	// 查询所有审批的单据
	@RequestMapping(value = "/statusA")
	public ModelAndView statusA(ModelAndView modelAndView, String i) {
		if (i == null) {
			i = "";
		}
		if ("notPass".equals(i.replaceAll(" ", ""))) {
			String status = "2";
			List<ExamineModel> list = examineSystemService.queryStatus(status);
			modelAndView.addObject("listExamin", list);
			modelAndView.setViewName("system/appNotPass");
			return modelAndView;
		} else {
			i = "1";
			List<ExamineModel> list = examineSystemService.queryStatus(i);
			modelAndView.addObject("listExamin", list);
			modelAndView.setViewName("system/appPassList");
			return modelAndView;
		}
	}
}
