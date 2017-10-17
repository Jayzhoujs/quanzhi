package com.xtoucher.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.UUID;
/**
 * 地址工具类
 * @author so123
 *
 */
public class AddressUtil {
	public static String getImageAddress() {
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
		String address = df.format(new Date());
		String imageAddress = UUID.randomUUID().toString().substring(3, 21)
				+ address + new Random().nextInt(100);
		return imageAddress;
	}

}
