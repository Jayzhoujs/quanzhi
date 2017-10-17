package com.xtoucher.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Calendar;

import org.apache.log4j.Logger;

import sun.misc.BASE64Decoder;

/**
 * 文件相关的Controlelr
 * 
 * @author so123
 * 
 */
public class FileUtil {
	private static Logger logger = Logger.getLogger(FileUtil.class);

	public static String generateImage(String imgStr) { // 对字节数组字符串进行Base64解码并生成图片
		if (imgStr == null) // 图像数据为空
			return "";
		try {
			Calendar cal = Calendar.getInstance();
			int day = cal.get(Calendar.DATE);
			int month = cal.get(Calendar.MONTH) + 1;
			int year = cal.get(Calendar.YEAR);
			String filename = Constant.getImageAddress() + ".jpg";
			String uri = "/upload/quanzhi/" + Integer.toString(year) + "/"
					+ Integer.toString(month) + "/" + Integer.toString(day)
					+ "/";// 按照年月日进行组织文件目录
			String filePath = uri + filename;// 文件名称为/年/月/日/文件名
			File file = new File(uri);
			try {
				if (!file.exists()) {
					file.mkdirs();
				}
				File file2 = new File(uri, filename);
				if (!file2.exists()) {
					file2.createNewFile();
				}
				// Base64解码
				BASE64Decoder decoder = new BASE64Decoder();
				byte[] b = decoder.decodeBuffer(imgStr);
				for (int i = 0; i < b.length; ++i) {
					if (b[i] < 0) {// 调整异常数据
						b[i] += 256;
					}
				}
				// 生成jpeg图片
				OutputStream out = new FileOutputStream(file2);
				out.write(b);
				out.flush();
				out.close();
				return filePath;

			} catch (SecurityException e) {
				logger.debug("写入文件错误");

				e.printStackTrace();
				return "";
			} catch (IOException e) {
				e.printStackTrace();
				return "";
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}

}
