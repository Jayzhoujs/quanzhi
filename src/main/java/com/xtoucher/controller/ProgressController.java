package com.xtoucher.controller;

/**
 * 进度相关Controller
 */
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.xtoucher.model.ProgressModel;
import com.xtoucher.service.ProgressService;
import com.xtoucher.util.Constant;

@Controller
@RequestMapping("/wx/")
public class ProgressController {
	private static Logger logger = Logger.getLogger(ProgressController.class);

	@Autowired
	private ProgressService processService;

	// 进度查询首页
	@RequestMapping("progress_index")
	public String progressIndex() {
		return "wx/progress_index";
	}

	// 查询进度
	/**
	 * 
	 * @author raochy
	 * @date 创建时间：2017年9月8日 下午4:36:25
	 * @version
	 * @parameter search:关键词，身份证号或者用户电话都可以
	 * @since
	 * @return
	 */
	@RequestMapping(value = "progress_search", method = RequestMethod.POST)
	public ModelAndView progressSearch(String IDNum,String phone) {
		ModelAndView mav = new ModelAndView();
		String viewName = "wx/progress_result";// 页面
		ProgressModel progressModel= processService.progressSearch(IDNum,phone);
		if(progressModel!=null){
			viewName="wx/progress_result";
		}
		else{
			viewName="wx/no_result";
		}
		mav.setViewName(viewName);
		mav.addObject(Constant.DATA, progressModel);
		return mav;
	}

	// 查询审批意见
	/**
	 * 
	 * @author raochy
	 * @date 创建时间：2017年9月8日 下午4:37:21
	 * @version
	 * @parameter approvalId申报id
	 * @since
	 * @return
	 */
	@RequestMapping("progress_histoty")
	public ModelAndView progressHistory(String approvalId) {
		ModelAndView mav = new ModelAndView();
		String view = "wx/progress_histoty";// 页面
		mav.setViewName(view);
		mav.addObject(Constant.DATA, processService.progressHistory(approvalId));
		return mav;
	}

}
