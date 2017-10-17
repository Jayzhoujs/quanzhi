package com.xtoucher.controller;
/**
 * pc后台管理——群众 Contorller
 */

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.xtoucher.model.DogModel;
import com.xtoucher.model.UserModel;
import com.xtoucher.service.UserService;

@Controller
@RequestMapping(value="/system")
public class PcSystemUserController {
	@Autowired
	private UserService userService;
	//查询全部群众用户
	@RequestMapping(value="/queryUser")
	public ModelAndView queryUser(ModelAndView modelAndView) {
		List<UserModel> list = userService.queryUser();
		modelAndView.addObject("listUser", list);
		modelAndView.setViewName("system/test");
		return modelAndView;
	}
	//id查询群众用户详细信息
	@RequestMapping(value="/queryUserDetailed")
	public ModelAndView queryUserDetailed(ModelAndView modelAndView,String id) {
		UserModel userModel = userService.queryUserDetailed(id);
		DogModel dogModel=userService.getDog(userModel.getDogId());
		modelAndView.addObject("UserDetailed", userModel);
		modelAndView.addObject("dog", dogModel);
		modelAndView.setViewName("system/test");
		return modelAndView;
	}
}
