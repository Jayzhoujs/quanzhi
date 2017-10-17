package com.xtoucher.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.xtoucher.model.ComplaintModel;
import com.xtoucher.service.ComplaintService;

/**
 * Pc端 投诉相关Controller
 */
@Controller
@RequestMapping("/system")
public class PcSystemComplaintController {
	private static Logger logger = Logger.getLogger(ComplaintController.class);

	@Autowired
	private ComplaintService complaintService;

	// 查询所有投诉
	@RequestMapping("/qeuryList")
	public ModelAndView qeuryList(ModelAndView modelAndView) {
		List<ComplaintModel> List = complaintService.queryList();
		modelAndView.addObject("complaintList", List);
		modelAndView.setViewName("allComplaint");
		return modelAndView;
	}

	// 根据id查询投诉
	@RequestMapping("/queryComplaint")
	public ModelAndView queryComplaint(ModelAndView modelAndView, String id) {
		ComplaintModel complaintModel = complaintService.queryComplaint(id);
		modelAndView.addObject("CPM", complaintModel);
		modelAndView.setViewName("openComplaintView");
		return modelAndView;
	}

	// 根据id开放投诉
	@RequestMapping("/openComplaint")
	public ModelAndView openComplaint(ModelAndView modelAndView, String id) {
		complaintService.openComplaint(id);
		modelAndView.addObject("CPMS", "打开成功");
		modelAndView.setViewName("redirect:qeuryList");
		return modelAndView;
	}

}
