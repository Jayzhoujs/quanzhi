package com.xtoucher.controller;

/**
 * 疫苗医院的Controller
 */
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

import com.xtoucher.model.HospitalModel;
import com.xtoucher.model.StreetModel;
import com.xtoucher.service.HandleService;
import com.xtoucher.service.HospitalService;
import com.xtoucher.util.Constant;

@Controller
@RequestMapping("/wx/")
public class WXHospitalController {
	private static Logger logger = Logger.getLogger(WXHospitalController.class);

	@Autowired
	private HospitalService hospitalService;
	@Autowired
	private HandleService handleService;

	// 宠物医院首页
	@RequestMapping("hospital_index")
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView();
		String view = "wx/hospital_index";
		Map<String, Object> map = new HashMap<String, Object>();
		List<HospitalModel> hospitalList = hospitalService.getList();
		List<StreetModel> areaList = handleService.getAllArea();
		map.put("areaList", areaList);
		map.put("hospitalList", hospitalList);
		mav.addObject(Constant.DATA, map);
		mav.setViewName(view);
		return mav;
	}

	// 查询
	@RequestMapping(value = "hospital_search", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> hospitalSearch(HttpServletRequest request,
			String name, String area) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			if("".equals(name)){
				name=null;
			}
			List<HospitalModel> hospitalList = hospitalService.getListByKeyword(name,area);
			map.put("hospitalList", hospitalList);
			map.put(Constant.STATUS, Constant.STATUS_OK);
		} catch (Exception e) {
			map.put(Constant.STATUS, Constant.STATUS_ERROR);
			e.printStackTrace();
		}
		return map;
	}
	
	// 宠物医院详情
		@RequestMapping("hospital_detail")
		public ModelAndView detail(String id) {
			ModelAndView mav = new ModelAndView();
			String view = "wx/hospital_detail";
			Map<String, Object> map = new HashMap<String, Object>();
			HospitalModel hospitalModel = hospitalService.getInfoById(id);
			map.put("hospital", hospitalModel);
			mav.addObject(Constant.DATA, map);
			mav.setViewName(view);
			return mav;
		}

}
