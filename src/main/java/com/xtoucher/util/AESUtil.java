package com.xtoucher.util;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.security.Security;
import java.util.Map;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

public class AESUtil {

	public static String encrypt(byte[] contentBytes, byte[] keyBytes) {
		try {
			fixKeyLength();
			Security.addProvider(new org.bouncycastle.jce.provider.BouncyCastleProvider());
			SecretKeySpec key = new SecretKeySpec(keyBytes, "AES");

			Cipher cipher = Cipher.getInstance("AES/ECB/PKCS7Padding", "BC");
			cipher.init(Cipher.ENCRYPT_MODE, key);
			byte[] tmp = cipher.doFinal(contentBytes);

			return new String(Base64Util.encode(tmp, Base64Util.DEFAULT));

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}

	public static String decrypt(byte[] contentBytes, byte[] keyBytes) {
		try {
			fixKeyLength();
			Security.addProvider(new org.bouncycastle.jce.provider.BouncyCastleProvider());
			SecretKeySpec key = new SecretKeySpec(keyBytes, "AES");

			Cipher cipher = Cipher.getInstance("AES/ECB/PKCS7Padding", "BC");
			cipher.init(Cipher.DECRYPT_MODE, key);

			byte[] tmp = cipher.doFinal(contentBytes);
			return new String(tmp, "utf-8");

		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}

	public static void fixKeyLength() {
		String errorString = "Failed manually overriding key-length permissions.";
		int newMaxKeyLength;
		try {
			if ((newMaxKeyLength = Cipher.getMaxAllowedKeyLength("AES")) < 256) {
				Class c = Class.forName("javax.crypto.CryptoAllPermissionCollection");
				Constructor con = c.getDeclaredConstructor();
				con.setAccessible(true);
				Object allPermissionCollection = con.newInstance();
				Field f = c.getDeclaredField("all_allowed");
				f.setAccessible(true);
				f.setBoolean(allPermissionCollection, true);

				c = Class.forName("javax.crypto.CryptoPermissions");
				con = c.getDeclaredConstructor();
				con.setAccessible(true);
				Object allPermissions = con.newInstance();
				f = c.getDeclaredField("perms");
				f.setAccessible(true);
				((Map) f.get(allPermissions)).put("*", allPermissionCollection);

				c = Class.forName("javax.crypto.JceSecurityManager");
				f = c.getDeclaredField("defaultPolicy");
				f.setAccessible(true);
				Field mf = Field.class.getDeclaredField("modifiers");
				mf.setAccessible(true);
				mf.setInt(f, f.getModifiers() & ~Modifier.FINAL);
				f.set(null, allPermissions);

				newMaxKeyLength = Cipher.getMaxAllowedKeyLength("AES");
			}
		} catch (Exception e) {
			throw new RuntimeException(errorString, e);
		}
		if (newMaxKeyLength < 256)
			throw new RuntimeException(errorString); // hack failed
	}
}
