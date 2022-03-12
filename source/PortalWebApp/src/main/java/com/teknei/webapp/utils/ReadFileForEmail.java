package com.teknei.webapp.utils;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

import org.apache.log4j.Logger;

public class ReadFileForEmail {

	
	private static final Logger LOGGER = Logger.getLogger(ReadFileForEmail.class);
	
	public static final String EMAIL = "/mail-confirma-cuenta.html";

	public static final String URLBG_MDL = "/megadealer/megadealer-bg.png";
	public static final String URLBG_TOY = "/megadealer/toyota-bg.png";
	public static final String URLBG_MIT = "/megadealer/mitsubishi-bg.png";
	
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
