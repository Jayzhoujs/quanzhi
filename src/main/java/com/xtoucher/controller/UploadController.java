package com.xtoucher.controller;

import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xtoucher.util.Constant;
import com.xtoucher.util.UploadUtil;

/**
 * 文件上传的Controller
 * 
 * @author so123
 * 
 */
@Controller
@RequestMapping("/wx/")
public class UploadController {
	private static Logger logger = Logger.getLogger(UploadController.class);

	/**
	 * 文件上传，返回地址
	 * 
	 * @author raochy
	 * @date 创建时间：2017年9月7日 下午7:19:48
	 * @version
	 * @parameter
	 * @since
	 * @return
	 */
	@RequestMapping(value = "upload", method = RequestMethod.POST)
	@ResponseBody
	public String upload(HttpServletRequest request) throws Exception {
		String refer = request.getHeader("referer");
		//测试
//		return "http://pica.nipic.com/2007-07-01/200771213342451_2.jpg";
		if (refer != null && refer.contains("quanzhi")) {
			// 防止非法提交
			request.setCharacterEncoding("UTF-8"); // 设置编码
			// 获得磁盘文件条目工厂
			DiskFileItemFactory factory = new DiskFileItemFactory();
			// 设置 缓存的大小，当上传文件的容量超过该缓存时，直接放到 暂时存储室
			factory.setSizeThreshold(1024 * 1024 * 50);
			// 高水平的API文件上传处理
			ServletFileUpload upload = new ServletFileUpload(factory);
			// 只能上传单个文件
			@SuppressWarnings("unchecked")
			List<FileItem> list = (List<FileItem>) upload.parseRequest(request);
			for (FileItem item : list) {
				// 提交的是文件
				if (!item.isFormField()) {
					// 获取文件后缀名
					String fileNameExtension = item.getName();
					String extention = fileNameExtension
							.substring(fileNameExtension.lastIndexOf("."));
					String filename = Constant.getImageAddress() + extention;
					InputStream in = item.getInputStream();
					String filePath = UploadUtil.save(in, filename);
					return filePath;
				} else {
					return "";
				}
			}
		} else {
			return "";
		}
		return "";
	}

}
