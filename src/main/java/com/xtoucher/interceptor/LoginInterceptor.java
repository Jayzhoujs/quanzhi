package com.xtoucher.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.xtoucher.model.AccountModel;

public class LoginInterceptor implements HandlerInterceptor {
	private static Logger logger = Logger.getLogger(LoginInterceptor.class);

	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
	}

	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {

	}

	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object arg2) throws Exception {
		String url = request.getRequestURI();

		if (url.indexOf("/login/signIn") >= 0
				|| url.indexOf("/login/action") >= 0) {
			return true;
		} else if (request.getSession().getAttribute("accountModel") != null) {
			return true;

		}
		request.getRequestDispatcher("/").forward(request, response);
		return false;

	}

}
