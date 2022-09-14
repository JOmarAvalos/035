package com.teknei.webapp.utils;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

import org.apache.log4j.Logger;

public class ReadFileForEmail {

	
	private static final Logger LOGGER = Logger.getLogger(ReadFileForEmail.class);
	
	public static final String EMAIL = "/confirmacion.html";
	public static final String EMAIL_INSTRUCCIONES = "/instrucciones.html";
	public static final String EMAIL_CUESTIONARIOS_1_15 = "/cuestionariosA.html";
	public static final String EMAIL_CUESTIONARIOS_16_MAS = "/cuestionariosB.html";
	public static final String EMAIL_RECUPERA = "/recuperaC.html";
	public static final String EMAIL_COMPRA = "/nuevaCompra.html";
	public static final String EMAIL_BASE_DATOS = "/baseDatos.html";

	public static String getFile(String file) throws IOException {
		try {
			File inFile = new File(file);
			if (!inFile.isFile()) {
				return "Parameter is not an existing file";
			}
			BufferedReader br = new BufferedReader(new FileReader(file));
			String line = null;
			String salida = "";
			while ((line = br.readLine()) != null) {
				salida += line;
			}
			br.close();
			return salida;
		} catch (FileNotFoundException ex) {
			LOGGER.error(ex);
		} catch (IOException ex) {
			LOGGER.error(ex);
			return null;
		}
		return null;

	}

}
