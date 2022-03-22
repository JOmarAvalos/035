package com.teknei.webapp.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.math.MathContext;
import java.math.RoundingMode;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.teknei.util.StringEncrypt;

public class Main {
	
	public static void main(String[] args) {
		try  {  
//			compareDates();
//			encriptaPwd();
			compareContrasenia();

		}  
		catch(Exception e)  {  
			e.printStackTrace();  
		}  
	}
	
	private static void encriptaPwd(){
		 BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		 String pwd = passwordEncoder.encode("Mexico1987*");
		 System.out.println(pwd);
	}
	
	private static void compareContrasenia() {
//		String encoded = "$2a$10$C0If2Mg1hpoqEIliV7qJauesutIYnr.PWMC/zJKTS4O";
		String encoded = "$2a$10$C0If2Mg1hpoqEIliV7qJauesutIYnr.PWMC/zJKTS4Obl1FiYmN1q";
		String decoded = "30048412891";
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		
		if(passwordEncoder.matches(decoded, encoded)) {
			System.out.println("coinciden");
		}else {
			System.out.println("verga");
		}

	}
	
	private static void compareDates() {
		try {
			DateFormat dateF = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
			Date fecha123 = new Date();
			Date inicio2010 = dateF.parse("27/02/2022 00:00:00");
			
			System.out.println(fecha123.compareTo(inicio2010));
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

	
	private static void subdir() {
		String[] filePaths = "/recursos/01.123.zip".split("/");
		String subdirName = filePaths[filePaths.length - 2];
		System.out.println(subdirName);
	}
	
	private static void readCSVFile() {
		
		System.out.println("iniciando");
		String file = "/Users/mmartinez/Documents/usuarios.csv";
		BufferedReader br = null;
		String line = "";
		String cvsSplitBy = ",";
		
		
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		try {
			
			File adjunto = new File("/Users/mmartinez/Documents/usuariosContraseña.csv");
			PrintWriter writer = new PrintWriter(adjunto);
			writer.write("ID_USUARIO,USUARIO,CONTRASEÑA,ID_ESTATUS_USUARIO,ID_EMPRESA,ID_USUARIO_CREACION,NSS\n");
			br = new BufferedReader(new FileReader(file));
			int i = 1;
            while ((line = br.readLine()) != null) {

                String[] registro = line.split(cvsSplitBy);
                
    			String idUsuario = registro[0];
    			String usuario = registro[1];
    			String idEstatus = registro[3];
    			String idEmpresa = registro[4];
    			String idUsuarioCrea = registro[5];
    			String nss = registro[6];
                String pwd = passwordEncoder.encode(nss);
                
                StringBuilder sb = new StringBuilder();
                sb.append(idUsuario);
                sb.append(",");
                sb.append(usuario);
                sb.append(",");
                sb.append(pwd);
                sb.append(",");
                sb.append(idEstatus);
                sb.append(",");
                sb.append(idEmpresa);
                sb.append(",");
                sb.append(idUsuarioCrea);
                sb.append(",");
                sb.append(nss);
                sb.append("\n");
                writer.write(sb.toString());
                System.out.println(i);
    			i++;
            }
			
			writer.flush();
			writer.close();

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
            if (br != null) {
                try {
                    br.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
	}
	
	private static void generaContrasenia() {
		
		//$2a$10$WZVG6u44MZNjtG.x4OPeJ.i..dA08FywH23Asr4gxa1IUpBRRSms.
		String decoded = "12345";
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		System.out.println(passwordEncoder.encode(decoded));
	}
	
	private static void rellenaBlancos() {
		
		String nombre = "[{X}] Pregunta rellenar [{X}] fase";
		List<String> auxPregunta = new ArrayList<String>();

		String[] nombreSplit = nombre.split(" ");
		StringBuilder frase = new StringBuilder();
		
		for(String palabra: nombreSplit) {
			if(palabra.equalsIgnoreCase("[{X}]")) {
				if(!frase.toString().isEmpty()) {
					auxPregunta.add(frase.toString());
					frase = new StringBuilder();
					auxPregunta.add(palabra);
				}else {
					auxPregunta.add(palabra);
				}
			}else {
				frase.append(palabra);
				frase.append(" ");
			}
		}
		
		if(!frase.toString().isEmpty()) {
			auxPregunta.add(frase.toString());
		}
		
		for(String cadena: auxPregunta) {
			
			System.out.println(cadena);
			
		}
	}
	
	private static void stringComplejo() {
		
		try {
			String file = "/Users/mmartinez/Documents/carpetas3.txt";
			BufferedReader br = new BufferedReader(new FileReader(file));
			String line = "";
			List<String> directorios = new ArrayList<String>();
			List<String> nombres = new ArrayList<String>();
			while ((line = br.readLine()) != null) {
				String[] registro = line.split("/");
				StringBuilder sb = new StringBuilder();
				sb.append("/");
				for(String doc: registro) {
						sb.append(doc);
						sb.append("/");
						if(!directorios.contains(sb.toString())) {
							directorios.add(sb.toString());
							nombres.add(doc);
						}
				}
			}
			
			
			for(String directorio: directorios) {
				System.out.println(directorio.substring(0, directorio.length() - 1));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	private static void stringComplejo2() {
		
		try {
			String file = "/Users/mmartinez/Documents/carpetascompleto.txt";
			BufferedReader br = new BufferedReader(new FileReader(file));
			String line = "";
			List<String> directorios = new ArrayList<String>();
			List<String> nombres = new ArrayList<String>();
			List<String> csv = new ArrayList<String>();
			int idCarpeta = 32;
			while ((line = br.readLine()) != null) {
					File archivo = new File(line);
					System.out.println(archivo.getPath());
					System.out.println(archivo.getName());
					System.out.println(archivo.getParent());
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	private static void getSemanas() {
		try {
			String fechaInicio = "01-01-2021";
			String fechaFin = "31-01-2021";
			DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
			Calendar calendarInicio = Calendar.getInstance();
			calendarInicio.setTime(df.parse(fechaInicio));
			Calendar calendarFin = Calendar.getInstance();
			calendarFin.setTime(df.parse(fechaFin));
			
			System.out.println(calendarInicio.get(Calendar.WEEK_OF_MONTH));
			System.out.println(calendarFin.get(Calendar.WEEK_OF_MONTH));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private static void porcentaje() {
		
		String url = "https://audiarotraining.com/LMS/?param=AA";
		if(url.contains("audiarotraining")) {
			System.out.println("Lo tiene");
		}
	}
	
	private static void formateaFecha() {
		String fecha = "Jul 17, 2021 7:41:18 PM";
		DateFormat dateF = new SimpleDateFormat("MMM dd, yyyy h:mm:ss a");
		Date fechaUno = new Date();
		Date fechaDos = null;
		
		try {
			System.out.println(dateF.parse(fecha));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	private static void testHash() {
		HashMap<String, String> mapaTecnicos = new HashMap<String, String>();
		mapaTecnicos.put("m re rh rch de","Diagnostico");
		mapaTecnicos.put("m re rh rch","Algo");
		mapaTecnicos.put("m re rh de","Otro");
		mapaTecnicos.put("m re rh rch de al","Mas");
		mapaTecnicos.put("m re rch de","Que pedo");
		
		System.out.println(mapaTecnicos.get("m re rh rch de"));
		
		
	}
	
	private static void fechaInicio() {
		try {
			DateFormat dateF = new SimpleDateFormat("dd/MM/yyyy");
			Date inicio2010 = dateF.parse("01/01/2010");
			System.out.println(inicio2010);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	private static void fechas() {
		try {
//		    DateFormat dateFDos = new SimpleDateFormat("dd/MM/yyyy hh:mm:ss");
//		    Date fechaInicio = dateFDos.parse("01/01/2020 00:00:00");
//		    Date fechaFin = dateFDos.parse("31/12/2020 23:59:59");
//		    
//		    Calendar calendarInicio = Calendar.getInstance();
//		    Calendar calendarFin = Calendar.getInstance();
//		    
//		    calendarInicio.setTime(fechaInicio);
//		    calendarFin.setTime(fechaFin);
//		    
//		    int semanaInicio = calendarInicio.get(Calendar.WEEK_OF_YEAR);
		    
		    Calendar fechaAleatoria = Calendar.getInstance();
		    
		    fechaAleatoria.set(Calendar.YEAR,2020);
		    fechaAleatoria.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
		    fechaAleatoria.set(Calendar.WEEK_OF_YEAR, 5);
		    
		    System.out.println(fechaAleatoria.getTime());
		    
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private static void generaLista() {
		
		List<String> listaUno = new ArrayList<String>();
		List<String> listaDos = new ArrayList<String>();
		List<String> listaTres = new ArrayList<String>();
		List<String[]> listaFinal = new ArrayList<String[]>();
		
		listaUno.add("String uno");
		listaUno.add("String dos");
		
		listaDos.add("String dos uno");
		listaDos.add("String dos uno");
		listaDos.add("String dos uno");
		
		listaTres.add("String dos uno");
		



		
	}
	
	private static void division() {
//		MathContext mc = new MathContext(2);
		
		BigDecimal bdMinRep = new BigDecimal(10);
		bdMinRep = bdMinRep.multiply(new BigDecimal("0.05"));
		
		bdMinRep = bdMinRep.setScale(0, RoundingMode.HALF_DOWN);
		
		Integer min = bdMinRep.intValue();
		
		if(min < 1) {
			min = 1;
			
		}

		
		System.out.println(bdMinRep);
		
		BigDecimal reparacion = new BigDecimal("1");
		reparacion = reparacion.divide(new BigDecimal(min, MathContext.DECIMAL128));
		reparacion = reparacion.multiply(new BigDecimal(5));
		reparacion = reparacion.setScale(0, RoundingMode.HALF_UP);
		
		System.out.println(reparacion);
		
		
	} 
	
	private static void encripta(Integer cadena) {
		try {
			String encriptado = StringEncrypt.encrypt(StringEncrypt.KEY, StringEncrypt.IV, cadena+"");
			System.out.println(encriptado.replaceAll("/", "").replaceAll("=", ""));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void promedio() {
		try {
			BigDecimal total = new BigDecimal("");
		} catch (Exception e) {
			// TODO: handle exception
		}
	} 
	
	
	
}
