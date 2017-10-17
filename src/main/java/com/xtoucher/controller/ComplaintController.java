package com.xtoucher.controller;

/**
 * 投诉相关Controller
 */
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.xtoucher.model.ComplaintModel;
import com.xtoucher.service.ComplaintService;
import com.xtoucher.util.Constant;

@Controller
@RequestMapping("/wx/")
public class ComplaintController {
	private static Logger logger = Logger.getLogger(ComplaintController.class);

	@Autowired
	private ComplaintService complaintService;

	// 进入投诉首页
	@RequestMapping("complaint_index")
	public ModelAndView complaint(int currentPage) {
		ModelAndView mav = new ModelAndView();
		String view = "wx/complaint_index";// 页面
		mav.setViewName(view);
		mav.addObject(Constant.DATA,
				complaintService.getComplaintList(currentPage));
		return mav;
	}

	// 我要举报页面
	@RequestMapping("complaint_init")
	public ModelAndView complaintInit() {
		ModelAndView mav = new ModelAndView();
		String view = "wx/complaint_init";// 页面
		mav.setViewName(view);
		return mav;
	}

	// 提交举报
	@RequestMapping(value = "complaint_commit", method = RequestMethod.POST)
	public ModelAndView complaintCommit(ComplaintModel complaintModel) {
		ModelAndView mav = new ModelAndView();
		String view = "wx/  ";// 页面
		mav.setViewName(view);
		
		mav.addObject(Constant.DATA,
				complaintService.complaintCommit(complaintModel));
		return mav;
	}
}
