package com.xtoucher.interceptor;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.xtoucher.dao.AccountDao;
import com.xtoucher.model.AccountModel;

/**
 * 移动端民警账号的拦截器
 * 
 * @author so123
 * 
 */
@Resource
public class PoliceInterceptor implements HandlerInterceptor {
	@Autowired
	private AccountDao accountDao;

	private static Logger logger = Logger.getLogger(PoliceInterceptor.class);

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
		// 登录和注销开放
		if (url.indexOf("/wx/police/police_index") >= 0
				|| url.indexOf("/wx/police/police_logout") >= 0
				|| url.indexOf("/wx/police/login") >= 0) {
			return true;
		}
		// 1.只有未登录的用户才能自动登陆
		if (request.getSession().getAttribute("police") == null) {
			// 2.只有带了自动登陆cookie的用户才能自动登陆
			Cookie[] cs = request.getCookies();
			Cookie findC = null;
			if (cs != null) {
				for (Cookie c : cs) {
					if ("police".equals(c.getName())) {
						findC = c;
						break;
					}
				}
			}
			if (findC != null) {
				// 3.自动登录Cookie中保存的用户名密码都需要是正确的才能自动登陆
				String account = findC.getValue().split(":")[0];
				String password = findC.getValue().split(":")[1];
				AccountModel accountModel = accountDao.queryLoad(account,
						password);
				if (accountModel != null
						&& accountModel.getIsAvailable()==1) {
					// 保存session
					request.getSession().setAttribute("police", accountModel);
					
					
					return true;
				} else {
					request.getRequestDispatcher("/wx/police/police_index").forward(request, response);
					return false;
				}
			}
			else{
				request.getRequestDispatcher("/wx/police/police_index").forward(request, response);
				return false;
			}
		}
		return true;
	}

}
