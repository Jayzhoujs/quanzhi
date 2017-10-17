package com.xtoucher.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xtoucher.model.AdModel;
import com.xtoucher.model.ForbiddenModel;
import com.xtoucher.model.NewsModel;
import com.xtoucher.model.ProcessModel;
import com.xtoucher.model.RegulationModel;
import com.xtoucher.service.IndexService;
import com.xtoucher.util.Constant;

@Controller
@RequestMapping("/wx/")
public class WXIndexController {
	private static Logger logger = Logger.getLogger(WXIndexController.class);

	@Autowired
	private IndexService indexService;

	// 微信端首页
	@RequestMapping("index")
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView();
		String view = "wx/index";
		Map<String, Object> map = new HashMap<String, Object>();
		List<AdModel> adList = indexService.getAdList();
		map.put("adList", adList);
		List<NewsModel> newList = indexService.getNewsList();
		map.put("newList", newList);
		mav.addObject(Constant.DATA, map);
		mav.setViewName(view);
		return mav;
	}

	// 获取更多动态新闻，分页
	@RequestMapping(value = "news_more", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getNewsMore(HttpServletRequest request,
			int currentPage) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<NewsModel> newList = new ArrayList<NewsModel>();
		try {
			newList = indexService.getNewsMore(currentPage);
			map.put("newList", newList);
			map.put(Constant.STATUS, Constant.STATUS_OK);
		} catch (Exception e) {
			map.put(Constant.STATUS, Constant.STATUS_ERROR);
			e.printStackTrace();
		}
		return map;
	}

	// 进入新闻动态详情页面
	@RequestMapping("news_detail")
	public ModelAndView getNewsDetailById(String id) {
		ModelAndView mav = new ModelAndView();
		String view = "wx/news_detail";//页面地址
		Map<String, Object> map = new HashMap<String, Object>();
		NewsModel newsModel = indexService.getNewsDetailById(id);
		map.put("newsModel", newsModel);
		mav.addObject(Constant.DATA, map);
		mav.setViewName(view);
		return mav;
	}
	
	// 进入管理条例详情页面
	@RequestMapping("regulation")
	public ModelAndView regulation() {
		ModelAndView mav = new ModelAndView();
		String view = "wx/regulation";//页面地址
		Map<String, Object> map = new HashMap<String, Object>();
		RegulationModel regulationModel=indexService.getRegulation();
		map.put("regulation", regulationModel);
		mav.addObject(Constant.DATA, map);
		mav.setViewName(view);
		return mav;
	}
	
	// 进入禁养品种详情页面
	@RequestMapping("dog_forbidden")
	public ModelAndView dogForbidden() {
		ModelAndView mav = new ModelAndView();
		String view = "wx/dog_forbidden";//页面地址
		Map<String, Object> map = new HashMap<String, Object>();
		ForbiddenModel forbiddenModel=indexService.dogForbidden();
		map.put("forbidden", forbiddenModel);
		mav.addObject(Constant.DATA, map);
		mav.setViewName(view);
		return mav;
	}
	
	// 进入办证流程详情页面
		@RequestMapping("process")
		public ModelAndView ProcessModel() {
			ModelAndView mav = new ModelAndView();
			String view = "wx/process";//页面地址
			Map<String, Object> map = new HashMap<String, Object>();
			ProcessModel processModel=indexService.process();
			map.put("process", processModel);
			mav.addObject(Constant.DATA, map);
			mav.setViewName(view);
			return mav;
		}

}
