package com.xtoucher.controller;

/**
 * 处理微信接口相关的Controller
 */
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xtoucher.service.WeixinService;
import com.xtoucher.util.SignUtil;

@Controller
@RequestMapping("/weixin")
public class WeixinController {
	private static Logger logger = Logger.getLogger(WeixinController.class);

	@Autowired
	private WeixinService weixinService;

	/**
	 * 微信测试我们的服务器是否可用
	 * @author  raochy 
	 * @date 创建时间：2017年9月7日 上午10:33:53 
	 * @version  
	 * @parameter  
	 * @since  
	 * @return
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
	@ResponseBody 
	public String check(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("接口测试开始！！！");
		// 微信加密签名
		String signature = request.getParameter("signature");
		// 时间戳
		String timestamp = request.getParameter("timestamp");
		// 随机数
		String nonce = request.getParameter("nonce");
		// 随机字符串
		String echostr = request.getParameter("echostr");
		// 通过校验signature对请求进行校验，若校验成功则原样返回echostr，表示接入成功，否则接入失败
		if (SignUtil.checkSignature(signature, timestamp, nonce)) {
			return echostr;
		}
		else{
			return "";
		}
	}
	/**
	 * 处理来自微信推送的消息或者事件
	 * @author  raochy 
	 * @date 创建时间：2017年9月7日 上午10:36:41 
	 * @version  
	 * @parameter  
	 * @since  
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping(value = "/", method = RequestMethod.POST)
	@ResponseBody 
	public String process(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		//消息的接受、处理、响应 
		 request.setCharacterEncoding("UTF8");
		 response.setCharacterEncoding("UTF8"); 
		 response.setHeader("Content-type", "text/html;charset=UTF-8");
		 //调用核心业务类型接受消息、处理消息 
		 String respMessage = weixinService.processRequest(request); 
		 respMessage=new String(respMessage.getBytes(), "iso8859-1");
		 logger.debug("回复微信消息："+respMessage);
		 return respMessage;
	}
}
