package com.teknei.webapp.utils;

import java.io.File;
import java.util.Calendar;
import java.util.List;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Address;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import org.apache.log4j.Logger;

public class EMailService {
	private static final Logger LOGGER = Logger.getLogger(EMailService.class);
	
	private String mailUser;
	private String password;
	private String smtp;
	private String tsl;
	private String port;
	private String login;

	public EMailService(String mailUser,String password,String smtp,String tsl,String port,String login)
	{
		this.mailUser = mailUser;
		this.password = password;
		this.smtp = smtp;
		this.tsl = tsl;
		this.port = port;
		this.login = login;
	}
	
	public void sendEmail(String fromMail, List<String> listToMail, String asunto, String body)
	{
		Properties props = new Properties();
		// Nombre del host de correo, es smtp.gmail.com
		props.setProperty("mail.smtp.host", smtp);
		// TLS si está disponible
		props.setProperty("mail.smtp.starttls.enable", tsl);
		// Puerto de gmail para envio de correos
		props.setProperty("mail.smtp.port",port);
		// Nombre del usuario
		props.setProperty("mail.smtp.user", mailUser);
		// Si requiere o no usuario y password para conectarse.
		props.setProperty("mail.smtp.auth", login);		
		
		Session session = Session.getDefaultInstance(props);

		// Para obtener un log de salida más extenso
		session.setDebug(true);
		
		MimeMessage message = new MimeMessage(session);
		
		try{

			// Quien envia el correo
			message.setFrom(new InternetAddress(fromMail));
			// A quien va dirigido
			for(String toMail : listToMail)
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(toMail));
			
			message.setSubject(asunto);
			message.setText("Texto del mensaje");		
				
		    String cuerpo = body;
		    message.setContent(cuerpo, "text/html; charset=utf-8");
		    message.setSentDate(Calendar.getInstance().getTime());
		    /*
			BodyPart adjunto = new MimeBodyPart();
			
			// Cargamos la imagen
			adjunto.setDataHandler(new DataHandler(new FileDataSource("d:/futbol.gif")));
			
			// Opcional. De esta forma transmitimos al receptor el nombre original del
			// fichero de imagen.
			adjunto.setFileName("futbol.gif");	
			
			MimeMultipart multiParte = new MimeMultipart();
			multiParte.addBodyPart(texto);
			multiParte.addBodyPart(adjunto);	 
			
			// Se mete el texto y la foto adjunta.
			message.setContent(multiParte);
		     */
		    
		    Transport t = session.getTransport("smtp");

			 // Aqui usuario y password de gmail
			 t.connect(mailUser,password);
			 t.sendMessage(message,message.getAllRecipients());
			 t.close();
			 
		}catch(MessagingException me){
			LOGGER.error("sendEmailNotification: " + me.getMessage());
		}
	}
	
	
	public void sendEmailAdjunto(String fromMail, List<String> listToMail, String asunto, String body, File attached, List<String> listCC, List<String> listBCC)
	{
		Properties props = new Properties();
		// Nombre del host de correo, es smtp.gmail.com
		props.setProperty("mail.smtp.host", smtp);
		// TLS si está disponible
		props.setProperty("mail.smtp.starttls.enable", tsl);
		// Puerto de gmail para envio de correos
		props.setProperty("mail.smtp.port",port);
		// Nombre del usuario
		props.setProperty("mail.smtp.user", mailUser);
		// Si requiere o no usuario y password para conectarse.
		props.setProperty("mail.smtp.auth", login);		
		
		Session session = Session.getDefaultInstance(props);

		// Para obtener un log de salida más extenso
		session.setDebug(true);
		
		MimeMessage message = new MimeMessage(session);
		
		try{

			// Quien envia el correo
			message.setFrom(new InternetAddress(fromMail));
			// A quien va dirigido
			InternetAddress arrayTo[] = new InternetAddress[listToMail.size()];
			int i = 0;
			for(String toMail : listToMail) {
				arrayTo[i] = new InternetAddress(toMail);
				i++;
			}
				message.addRecipients(Message.RecipientType.TO, arrayTo);
			
			InternetAddress arrayCC[] = new InternetAddress[listCC.size()];
			Integer icc = 0;
			for(String ccMail : listCC){
				arrayCC[i] = new InternetAddress(ccMail);
				icc++;
				
			}
				message.addRecipients(Message.RecipientType.CC, arrayCC);

			InternetAddress arrayBCC[] = new InternetAddress[listCC.size()];
			Integer ibcc = 0;
			for(String bccMail : listBCC) {
				arrayBCC[i] = new InternetAddress(bccMail);
				ibcc++;
				
			}
				message.addRecipients(Message.RecipientType.BCC, arrayBCC);

			message.setSubject(asunto);
			message.setText("Texto del mensaje");		
				
		    String cuerpo = body;
		    message.setContent(cuerpo, "text/html; charset=utf-8");
		    message.setSentDate(Calendar.getInstance().getTime());
			BodyPart adjunto = new MimeBodyPart();
			
			// Cargamos la imagen
			adjunto.setDataHandler(new DataHandler(new FileDataSource(attached)));
			
			// Opcional. De esta forma transmitimos al receptor el nombre original del
			// fichero de imagen.
			adjunto.setFileName(attached.getName());	
			
			MimeMultipart multiParte = new MimeMultipart();
//			multiParte.addBodyPart(texto);
			multiParte.addBodyPart(adjunto);	 
			
			// Se mete el texto y la foto adjunta.
			message.setContent(multiParte);
		    
		    Transport t = session.getTransport("smtp");

			 // Aqui usuario y password de gmail
			 t.connect(mailUser,password);
			 t.sendMessage(message,message.getAllRecipients());
			 t.close();
			 
		}catch(MessagingException me){
			LOGGER.error("sendEmailNotification: " + me.getMessage());
		}
	}
	
	public Boolean sendEmailAdjuntoB(String fromMail, List<String> listToMail, String asunto, String body, File attached,
			List<String> listCC, List<String> listBCC) {
			Boolean resultado = false;
			Properties props = new Properties();
			// Nombre del host de correo, es smtp.gmail.com
			props.setProperty("mail.smtp.host", smtp);
			// TLS si está disponible
			props.setProperty("mail.smtp.starttls.enable", tsl);
			// Puerto de gmail para envio de correos
			props.setProperty("mail.smtp.port", port);
			// Nombre del usuario
			props.setProperty("mail.smtp.user", mailUser);
			// Si requiere o no usuario y password para conectarse.
			props.setProperty("mail.smtp.auth", login);

			Session session = Session.getDefaultInstance(props);

			// Para obtener un log de salida más extenso
			session.setDebug(true);

			MimeMessage message = new MimeMessage(session);

			try {

				// Quien envia el correo
				message.setFrom(new InternetAddress(fromMail));
				// A quien va dirigido
				InternetAddress arrayTo[] = new InternetAddress[listToMail.size()];
				int i = 0;
				for (String toMail : listToMail) {
					arrayTo[i] = new InternetAddress(toMail);
					i++;
				}
				message.addRecipients(Message.RecipientType.TO, arrayTo);
				if (listCC != null) {
					InternetAddress arrayCC[] = new InternetAddress[listCC.size()];
					Integer icc = 0;
					for (String ccMail : listCC) {
						arrayCC[i] = new InternetAddress(ccMail);
						icc++;

					}
					message.addRecipients(Message.RecipientType.CC, arrayCC);
				}

				if (listBCC != null) {
					InternetAddress arrayBCC[] = new InternetAddress[listBCC.size()];
					Integer ibcc = 0;
					for (String bccMail : listBCC) {
						arrayBCC[i] = new InternetAddress(bccMail);
						ibcc++;

					}
					message.addRecipients(Message.RecipientType.BCC, arrayBCC);
				}

				message.setSubject(asunto);
				message.setText("Texto del mensaje");

				String cuerpo = body;
				message.setContent(cuerpo, "text/html; charset=utf-8");
				message.setSentDate(Calendar.getInstance().getTime());
				BodyPart adjunto = new MimeBodyPart();

				adjunto.setDataHandler(new DataHandler(new FileDataSource(attached)));

				adjunto.setFileName(attached.getName());

				MimeMultipart multiParte = new MimeMultipart();

				
				MimeBodyPart bodyMessagePart = new MimeBodyPart();
				bodyMessagePart.setContent(body, "text/html; charset=utf-8");
				multiParte.addBodyPart(bodyMessagePart);
				multiParte.addBodyPart(adjunto);

				message.setContent(multiParte);
				
				Transport t = session.getTransport("smtp");

				t.connect(mailUser, password);
				t.sendMessage(message, message.getAllRecipients());
				t.close();
				
				resultado=true;

			} catch (MessagingException me) {
				LOGGER.error("sendEmailAdjunto: " + me.getMessage());
				resultado=false;
			}
			
			return resultado;
		}
}
