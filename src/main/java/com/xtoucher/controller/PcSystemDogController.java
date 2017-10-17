package com.xtoucher.controller;

/**
 * 权限为管理员
 * 下面为犬种与犬颜色的增删改查 Contorller
 */
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xtoucher.model.AreaModel;
import com.xtoucher.model.DogBreedModel;
import com.xtoucher.model.DogColorModel;
import com.xtoucher.model.DogForbiddenModel;
import com.xtoucher.model.HospitalModel;
import com.xtoucher.service.AreaService;
import com.xtoucher.service.HospitalService;
import com.xtoucher.service.PoliceSystemService;
import com.xtoucher.util.Constant;

@Controller
@RequestMapping("/system")
public class PcSystemDogController {
	public final static String PHONE_PATTERN = "^[0][1-9]{2,3}-[0-9]{5,10}$";
	@Autowired
	private PoliceSystemService policeSystemService;
	@Autowired
	private HospitalService hospitalService;
	@Autowired
	private AreaService areaService;

	/**
	 * 犬种
	 */
	// 点击犬种按钮查询犬种信息
	@RequestMapping(value = "/dogBreed")
	public ModelAndView dogBreed(ModelAndView modelAndView) {
		List<DogBreedModel> list = policeSystemService.queryDogBreed();
		modelAndView.addObject("list", list);
		modelAndView.setViewName("system/appDogUserList");
		return modelAndView;
	}

	// 添加页面
	@RequestMapping(value = "/SaveJsp")
	public ModelAndView SaveJsp(ModelAndView modelAndView) {
		modelAndView.setViewName("system/addDog");
		return modelAndView;
	}

	// 添加犬种信息
	@RequestMapping(value = "/dogBreedSave", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> dogBreedSave(ModelAndView modelAndView, DogBreedModel dogBreedModel) {
		Map<String, Object> map = new HashMap<String, Object>();
		String status = "error";
		try {
			int i = policeSystemService.saveDogBreed(dogBreedModel);
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

	// 删除犬种信息
	@RequestMapping(value = "/dogBreedDelete")
	@ResponseBody
	public Map<String, Object> dogBreedDelete(ModelAndView modelAndView, Integer id) {

		Map<String, Object> map = new HashMap<String, Object>();
		String status = "error";
		try {
			int i = policeSystemService.deleteDogBreed(id);
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

	/**
	 * 犬颜色
	 */
	// 点击犬颜色按钮查询犬类颜色
	@RequestMapping(value = "/dogColour")
	public ModelAndView dogColour(ModelAndView modelAndView) {
		List<DogColorModel> list = policeSystemService.queryDogColor();
		modelAndView.addObject("list", list);
		modelAndView.setViewName("system/appDogSkinList");
		return modelAndView;
	}

	// 删除犬颜色信息
	@RequestMapping(value = "/dogColorDelete")
	@ResponseBody
	public Map<String, Object> dogColorDelete(ModelAndView modelAndView, Integer id) {

		Map<String, Object> map = new HashMap<String, Object>();
		String status = "error";
		try {
			int i = policeSystemService.deleteDogColor(id);
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

	// 添加页面
	@RequestMapping(value = "/SaveColorJsp")
	public ModelAndView SaveColorJsp(ModelAndView modelAndView) {
		modelAndView.setViewName("system/addDogSkin");
		return modelAndView;
	}

	// 添加犬颜色信息
	@RequestMapping(value = "/dogColorSave", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> dogColorSave(ModelAndView modelAndView, DogColorModel dogColorModel) {

		Map<String, Object> map = new HashMap<String, Object>();
		String status = "error";
		try {
			int i = policeSystemService.saveDogColor(dogColorModel);
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

	/**
	 * 疫苗网点管理
	 */
	// 疫苗网点查询
	@RequestMapping(value = "/dogHospital")
	public ModelAndView dogHospital(ModelAndView modelAndView) {
		List<HospitalModel> queryHospital = hospitalService.getList();
		modelAndView.addObject("qh", queryHospital);
		modelAndView.setViewName("system/appHospitalAll");
		return modelAndView;
	}

	// 疫苗网点id查询进入更新页面
	@RequestMapping(value = "/qeuryHospital")

	public ModelAndView qeuryHospital(ModelAndView modelAndView, String id) {
		HospitalModel hospitalModel = hospitalService.getInfoById(id);
		List<AreaModel> list = hospitalService.querListPar();
		modelAndView.addObject("area", list);
		modelAndView.addObject("hm", hospitalModel);
		modelAndView.setViewName("system/appHospitalUpdate");
		return modelAndView;
	}

	// 修改网点
	@RequestMapping(value = "/updateHospital", method = RequestMethod.POST)
	public ModelAndView updateHospital(ModelAndView modelAndView, HospitalModel hospitalModel) {
		 hospitalService.updateHospital(hospitalModel);
		 modelAndView.setViewName("redirect:dogHospital");
		 return modelAndView;
		// modelAndView.setViewName("redirect:dogHospital");
	}

	// 进入疫苗网点添加页面
	@RequestMapping(value = "/addHospital")
	public ModelAndView addHospital(ModelAndView modelAndView,String status) {
		if (status==null) {
			List<AreaModel> list = hospitalService.querListPar();
			modelAndView.addObject("area", list);
			modelAndView.setViewName("system/appHospitalAdd");
			return modelAndView;
		}else{
			List<AreaModel> list = hospitalService.querListPar();
			modelAndView.addObject("area", list);
			modelAndView.addObject("status", status);
			modelAndView.setViewName("system/appHospitalAdd");
			return modelAndView;
		}
		
	}

	// 疫苗网点添加
	@RequestMapping(value = "/saveHospital", method = RequestMethod.POST)

	public ModelAndView saveHospital(ModelAndView modelAndView, HospitalModel hospitalModel) {
			hospitalService.addHospital(hospitalModel);
			modelAndView.setViewName("redirect:dogHospital");
			return modelAndView;

	}

	// 疫苗网点删除
	@RequestMapping(value = "/deleteHospital")
	@ResponseBody
	public Map<String, Object> deleteHospital(ModelAndView modelAndView, String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		String status = "error";
		try {
			int i = hospitalService.deleteHospital(id);
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

	/**
	 * 地区管理
	 */
	// 查询所有大区街道
	@RequestMapping(value = "/queryArea")
	public ModelAndView queryArea(ModelAndView modelAndView) {
		List<AreaModel> list = areaService.queryArea();
		modelAndView.addObject("list", list);
		modelAndView.setViewName("system/appAreaAll");
		return modelAndView;
	}

	// 进入添加大区县页面
	@RequestMapping(value = "/saveArea")
	public ModelAndView saveArea(ModelAndView modelAndView, String id) {
		if (id == null) {
			modelAndView.setViewName("system/appAreaAdd");
		} else {
			List<AreaModel> list = areaService.queryArea();
			modelAndView.addObject("list", list);
			modelAndView.setViewName("system/appAreaAddB");
		}
		return modelAndView;
	}

	// 添加街道地区
	@RequestMapping(value = "/addArea")
	public ModelAndView addArea(ModelAndView modelAndView, AreaModel areaModel) {
		areaService.addArea(areaModel);
		modelAndView.setViewName("redirect:queryArea");
		return modelAndView;
	}

	// 进入修改页面
	@RequestMapping(value = "/upArea")
	public ModelAndView upArea(ModelAndView modelAndView, String id, String A) {
		AreaModel areaModel = areaService.queryAreaModel(id);
		if (A == null) {

			modelAndView.addObject("areaModel", areaModel);
			modelAndView.setViewName("system/appAreaUpdate");
		} else {
			List<AreaModel> list = areaService.queryArea();
			modelAndView.addObject("list", list);
			modelAndView.addObject("areaModel", areaModel);
			modelAndView.setViewName("system/appAreaUpdateB");
		}
		return modelAndView;
	}

	// 修改
	@RequestMapping(value = "/updateArea")
	public ModelAndView updateArea(ModelAndView modelAndView, AreaModel areaModel) {
		areaService.updateArea(areaModel);
		modelAndView.setViewName("redirect:queryArea");
		return modelAndView;
	}
	// 删除

	@RequestMapping(value = "/deleteArea")
	@ResponseBody
	public Map<String, Object> deleteArea(ModelAndView modelAndView, String id) {

		Map<String, Object> map = new HashMap<String, Object>();
		String status = "error";
		try {
			int i = areaService.deleteArea(id);
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

	/**
	 * 禁养
	 */
	// 查询所有禁养犬

	@RequestMapping(value = "/allDogForbidden")
	public ModelAndView DogForbidden(ModelAndView modelAndView) {
		DogForbiddenModel dogForbiddenModel = policeSystemService.queryDogForbidden();
		modelAndView.addObject("dfm", dogForbiddenModel);
		modelAndView.setViewName("system/appDogForbidList");
		return modelAndView;
	}

	// 更新禁养品种
	@RequestMapping(value = "/updateDogFor", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> updateDogFor(DogForbiddenModel dogForbiddenModel) {
		Map<String, Object> map = new HashMap<String, Object>();
		String status = "error";
		try {
			int i = policeSystemService.updateDogFor(dogForbiddenModel);
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
