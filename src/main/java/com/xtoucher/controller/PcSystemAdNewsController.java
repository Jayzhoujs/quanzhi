package com.xtoucher.controller;

import java.text.SimpleDateFormat;
/**
 * 权限为管理员
 * 管理员下的广告新闻Controller
 */
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xtoucher.model.AdModel;
import com.xtoucher.model.NewsModel;
import com.xtoucher.model.ProcessModel;
import com.xtoucher.model.RegulationModel;
import com.xtoucher.service.AdService;
import com.xtoucher.service.BaseDataService;
import com.xtoucher.util.Constant;

@Controller
@RequestMapping("/system")
public class PcSystemAdNewsController {
	@Autowired
	private AdService adService;
	@Autowired
	private BaseDataService baseDataService;

	// 查询所有广告
	@RequestMapping("/allAd")
	public ModelAndView queryList(ModelAndView modelAndView) {
		List<AdModel> list = adService.queryList();
		modelAndView.addObject("listAd", list);
		modelAndView.setViewName("system/adSelect");
		return modelAndView;
	}

	// 进入添加广告页面
	@RequestMapping(value = "/saveAd")
	public ModelAndView SaveAd(ModelAndView modelAndView) {
		modelAndView.setViewName("system/addAd");
		return modelAndView;
	}

	
	// 添加新广告
	@RequestMapping(value = "/addAd", method = RequestMethod.POST)
	public ModelAndView addAd(ModelAndView modelAndView, AdModel adModel) {
		String createTime = (new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new Date());
		adModel.setCreateTime(createTime);
		adService.addAd(adModel);
		modelAndView.setViewName("redirect:/system/allAd");
		return modelAndView;
	}

	// id查询广告
	@RequestMapping("/queryAd")
	public ModelAndView queryAd(ModelAndView modelAndView, String id) {
		AdModel adModel = adService.adModel(id);
		modelAndView.addObject("adModel", adModel);
		modelAndView.setViewName("system/adUpdate");
		return modelAndView;
	}

	// 更新旧广告
	@RequestMapping(value = "/updateAd", method = RequestMethod.POST)
	public ModelAndView updateAd(ModelAndView modelAndView, AdModel adModel) {
		String createTime = (new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"))
				.format(new Date());
		adModel.setCreateTime(createTime);
		adService.updateAd(adModel);
		modelAndView.addObject("success", "广告更新成功");
		modelAndView.setViewName("redirect:all");
		return modelAndView;
	}

	// 删除旧广告
	@RequestMapping(value = "/deleteAd")
	public ModelAndView deleteAd(ModelAndView modelAndView, String id) {
		adService.deleteAd(id);
		modelAndView.addObject("success", "广告删除成功");
		modelAndView.setViewName("redirect:allAd");
		return modelAndView;
	}

	// 查询所有新闻
	@RequestMapping("/newsAll")
	public ModelAndView newsAll(ModelAndView modelAndView) {
		List<NewsModel> list = adService.queryNews();
		modelAndView.addObject("listNews", list);
		modelAndView.setViewName("system/appNews");
		return modelAndView;
	}

	// 进入添加新闻页面
	@RequestMapping(value = "/SaveNews")
	public ModelAndView SaveNews(ModelAndView modelAndView) {
		modelAndView.setViewName("system/appNewsAdd");
		return modelAndView;
	}

	// 添加新闻
	@RequestMapping(value = "/addNews", method = RequestMethod.POST)
	public ModelAndView addNews(ModelAndView modelAndView, NewsModel newsModel) {
		adService.addNews(newsModel);
		modelAndView.setViewName("redirect:newsAll");
		return modelAndView;
	}

	// id查询新闻
	@RequestMapping(value = "/newsSelect")
	public ModelAndView newsSelect(ModelAndView modelAndView, String id) {
		NewsModel newsModel = adService.newsModel(id);
		modelAndView.addObject("newsModel", newsModel);
		modelAndView.setViewName("system/appNewsUpdate");
		return modelAndView;
	}
	

	// 更新旧新闻
	@RequestMapping(value = "/updateNews", method = RequestMethod.POST)
	public ModelAndView updateNews(ModelAndView modelAndView,NewsModel newsModel) {
		adService.updateNews(newsModel);
		modelAndView.addObject("success", "新闻更新成功");
		modelAndView.setViewName("redirect:newsAll");
		return modelAndView;
	}

	// 删除旧新闻
	@RequestMapping(value = "/deleteNews")
	public ModelAndView deleteNews(ModelAndView modelAndView, String id) {
		adService.deleteNews(id);
		modelAndView.addObject("success", "新闻删除成功");
		modelAndView.setViewName("redirect:newsAll");
		return modelAndView;
	}


	/**
	 * 
	 * @param modelAndView
	 *            管理条例查询与更新
	 */
	// 查询管理条例
	@RequestMapping("/getRegulation")
	public ModelAndView getRegulation(ModelAndView modelAndView) {
		RegulationModel regulationModel = baseDataService.getRegulation();
		modelAndView.addObject("rm", regulationModel);
		modelAndView.setViewName("system/regulations");
		return modelAndView;
	}

	// 更新管理条例
	@RequestMapping(value = "/updateRegulation", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateRegulation(RegulationModel regulationModel) {
		Map<String, Object> map = new HashMap<String, Object>();
		String status = "error";
		try {
			int i = baseDataService.updateRegulation(regulationModel);
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

	// 查询办理流程
	@RequestMapping("/getProcess")
	public ModelAndView getProcess(ModelAndView modelAndView) {
		ProcessModel processModel = baseDataService.getProcess();
		modelAndView.addObject("rm", processModel);
		modelAndView.setViewName("system/getProcess");
		return modelAndView;
	}

	// 更新办理流程
	@RequestMapping(value = "/updateProcess", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateProcess(ProcessModel processModel) {
		Map<String, Object> map = new HashMap<String, Object>();
		String status = "error";
		try {
			int i = baseDataService.updateProcess(processModel);
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
}
