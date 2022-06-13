package com.teknei.util;

import java.util.Calendar;
import java.util.Date;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;
import org.apache.log4j.Logger;

public class Util {
	
	private static final Logger LOGGER = Logger.getLogger(Util.class); 
	
	public static Date calculaFecha(Date fechaInicio, Integer dias) {
		
		Date resp = null;
		try {
			Calendar referencia = Calendar.getInstance();
			referencia.setTime(fechaInicio);
			
			Calendar calendario = Calendar.getInstance();
			calendario.setTime(fechaInicio);
			calendario.add(Calendar.DAY_OF_YEAR, dias);
			
			if(calendario.get(Calendar.MONTH) != referencia.get(Calendar.MONTH)) {
				if(calendario.get(Calendar.YEAR) < referencia.get(Calendar.YEAR)) {
					//año anterior se envia el primer dia del mes
					calendario.set(Calendar.YEAR, referencia.get(Calendar.YEAR));
					calendario.set(Calendar.MONTH, referencia.get(Calendar.MONTH));
					calendario.set(Calendar.DAY_OF_MONTH, referencia.getActualMinimum(Calendar.DAY_OF_MONTH));
				}else if(calendario.get(Calendar.YEAR) < referencia.get(Calendar.YEAR)) {
					//año siguiente se envia ultimo dia del mes
					calendario.set(Calendar.YEAR, referencia.get(Calendar.YEAR));
					calendario.set(Calendar.MONTH, referencia.get(Calendar.MONTH));
					calendario.set(Calendar.DAY_OF_MONTH, referencia.getActualMaximum(Calendar.DAY_OF_MONTH));
				}else {
					//mismo año evaluamos mes
					if(calendario.get(Calendar.MONTH) < referencia.get(Calendar.MONTH)) {
						//mes menos se envia al primer dia del mes
						calendario.set(Calendar.MONTH, referencia.get(Calendar.MONTH));
						calendario.set(Calendar.DAY_OF_MONTH, referencia.getActualMinimum(Calendar.DAY_OF_MONTH));
					}else {
						//mes mayor se envia al ultimo dia del mes
						calendario.set(Calendar.MONTH, referencia.get(Calendar.MONTH));
						calendario.set(Calendar.DAY_OF_MONTH, referencia.getActualMaximum(Calendar.DAY_OF_MONTH));
					}
				}
			}
				
			resp = calendario.getTime();
		} catch (Exception e) {
			LOGGER.error("Ocurrio un error al obtener la fecha			error:", e);
		}
		return resp;
	}
	
	public static String encrypt(String value, String key, String initVector) {
		try {
			IvParameterSpec iv = new IvParameterSpec(initVector.getBytes("UTF-8"));
			SecretKeySpec skeySpec = new SecretKeySpec(key.getBytes("UTF-8"), "AES");

			Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5PADDING");
			cipher.init(Cipher.ENCRYPT_MODE, skeySpec, iv);

			byte[] encrypted = cipher.doFinal(value.getBytes());

			return Base64.encodeBase64String(encrypted);
		} catch (Exception ex) {
			ex.printStackTrace();
			return value;
		}

	}

	public static String decrypt(String encrypted, String key, String initVector) {
		try {
			IvParameterSpec iv = new IvParameterSpec(initVector.getBytes("UTF-8"));
			SecretKeySpec skeySpec = new SecretKeySpec(key.getBytes("UTF-8"), "AES");

			Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5PADDING");
			cipher.init(Cipher.DECRYPT_MODE, skeySpec, iv);

			byte[] original = cipher.doFinal(Base64.decodeBase64(encrypted));

			return new String(original);
		} catch (Exception ex) {
			ex.printStackTrace();
			return encrypted;
		}

	}
	
	public static int aniosCumplidos(Date inicio, Date fin) {
		
		Calendar cal = Calendar.getInstance(); 
		cal.setTime(fin);
		int currYear = cal.get(Calendar.YEAR);
		int currMonth = cal.get(Calendar.MONTH);
		int currDay = cal.get(Calendar.DAY_OF_MONTH);
		cal.setTime(inicio); 
		int years = currYear - cal.get(Calendar.YEAR);
		int initMonth = cal.get(Calendar.MONTH);
		if (initMonth == currMonth) {
			return cal.get(Calendar.DAY_OF_MONTH) <= currDay ? years : years - 1;
		}else {
			return initMonth < currMonth ?  years:years - 1 ;
		}
	}
	
	public static String idToString(Integer id) {
		try {
			String encriptado = StringEncrypt.encrypt(StringEncrypt.KEY, StringEncrypt.IV, id+"");
			return encriptado.replaceAll("/", "").replaceAll("=", "");
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	public static String getTmpPwd(int length) {
		  StringBuilder pwd = new StringBuilder();
		  String key = Constants.NUMEROS + Constants.MINUSCULAS + Constants.MAYUSCULAS;
		  for (int i = 0; i < length; i++) {
		    pwd.append(key.charAt((int)(Math.random() * key.length())));
		  }

		  return pwd.toString();
		}


}
