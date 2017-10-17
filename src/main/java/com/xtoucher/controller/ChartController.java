package com.xtoucher.controller;

/**
 * 报表相关的Controller
 */
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.xtoucher.model.ChartModel;
import com.xtoucher.service.ChartService;
import com.xtoucher.util.Constant;

@Controller
@RequestMapping("/system")
public class ChartController {
	@Autowired
	private ChartService chartService;

	// 进入报表首页
	@RequestMapping("/chart_index")
	public String index() {
		return "system/chart_index";
	}

	// 账号，饼状图
	@RequestMapping("/chart_account")
	public ModelAndView queryAccountList(ModelAndView modelAndView) {
		Map<String, Object> map=new HashMap<String, Object>();
		JSONObject json=new JSONObject();
		List<ChartModel> list0 = chartService.queryAccount();
		json.put("list0", list0);
		map.put(Constant.DATA, json);
		modelAndView.addObject("mapResult", map);
		modelAndView.setViewName("system/chart_account");
		return modelAndView;
	}

	// 申报相关，折线图
	@RequestMapping("/chart_approval")
	public ModelAndView queryApprovalList(ModelAndView modelAndView) {
		Map<String, Object> map=new HashMap<String, Object>();
		JSONObject json=new JSONObject();
		List<ChartModel> list0 = chartService.queryApprovalList();// 提交的申报数量
		List<ChartModel> list1 = chartService.queryPassed();// 通过数量
		List<ChartModel> list2= chartService.queryNotPassed();// 未通过数量
		json.put("list0", list0);
		json.put("list1", list1);
		json.put("list2", list2);
		map.put(Constant.DATA, json);
		modelAndView.addObject("mapResult", map);
		modelAndView.setViewName("system/chart_approval");
		return modelAndView;
	}

	// 各个网点处理的申报数，饼状图
	@RequestMapping("/chart_branch")
	public ModelAndView queryListByBranch(ModelAndView modelAndView,
			String startDay, String endDay) {
		Map<String, Object> map=new HashMap<String, Object>();
		JSONObject json=new JSONObject();
		List<ChartModel> list0 = chartService.queryListByBranch(startDay,
				endDay);
		json.put("list0", list0);
		map.put(Constant.DATA, json);
		modelAndView.addObject("mapResult", map);
		modelAndView.setViewName("system/chart_branch");
		return modelAndView;
	}

	// 犬主分布情况，饼状图，区域
	@RequestMapping("/chart_master_distribution")
	public ModelAndView masterDistribution(ModelAndView modelAndView) {
		Map<String, Object> map=new HashMap<String, Object>();
		JSONObject json=new JSONObject();
		List<ChartModel> list0 = chartService.masteDistribution();
		json.put("list0", list0);
		map.put(Constant.DATA, json);
		modelAndView.addObject("mapResult", map);
		modelAndView.setViewName("system/chart_master_distribution");
		return modelAndView;
	}

	// 犬只数量增长情况，按照时间折线图-----系统管理员
	@RequestMapping("/chart_dog_info")
	public ModelAndView queryDogAmount(ModelAndView modelAndView) {
		Map<String, Object> map=new HashMap<String, Object>();
		JSONObject json=new JSONObject();
		List<ChartModel> list0 = chartService.queryDogAmount();
		json.put("list0", list0);
		map.put(Constant.DATA, json);
		modelAndView.addObject("mapResult", map);
		modelAndView.setViewName("system/chart_dog_info");
		return modelAndView;
	}

	// 犬只数量增长情况，按照时间折线图-----其他两个角色
	// @RequestMapping("/chart_master_distribution")
	// public ModelAndView queryListByBranch(ModelAndView modelAndView) {
	// // List<ChartModel> list0 = chartService.masteDistribution();
	// // modelAndView.addObject("list0", list0);// 各个网点处理的数量
	// modelAndView.setViewName("system/chart_master_distribution");
	// return modelAndView;
	// }

	// 其他两个角色
	// 统计网点下面民警处理的数量，折线图，选择时间，时间范围最多一个月

}
