package com.teknei.common.webapp;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.security.authentication.RememberMeAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

/**
 * Tools for general operations with localised messages and http requests.
 * @author JCMS
 */
public class RequestUtils {
	
	/**
	 * Validates if the current authentication was made by a RememberMe token.
	 * @return <b>true</b> if the current authentication was made by a RememberMe token
	 * <b>false</b> otherwise.
	 */
	public static boolean isRememberMeAuthenticated() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		
		if (authentication == null) {
			return false;
		}
 
		return RememberMeAuthenticationToken.class.isAssignableFrom(authentication.getClass());
	}
	
	/**
	 * Sets the current requested url to session. Useful to intercept urls which require some validation: 
	 * intercept url, redirect to a validation url, make validations and finally redirect to the originally requested url.
	 * @param request The HttpServletRequest being managed.
	 * @param url the url to set to session.
	 */
	public static void setRememberMeTargetUrlToSession(HttpServletRequest request, String url) {
		HttpSession session = request.getSession(false);
		
		if(session != null) {
			session.setAttribute("targetUrl", url);
		}
	}
	
	/**
	 * Obtains the Message, if it exists, in the indicated HttpServletRquest.
	 * @param source the MessageSource which resolves the localised messages.
	 * @param request The request to check.
	 * @return The Message found in the request, if any.
	 */
	public static Message getAlertMessage(MessageSource source, HttpServletRequest request) {
		Message message = null;
		boolean error = "1".equals((String) request.getParameter("error"));
		boolean success = "1".equals((String) request.getParameter("success"));
		String msg = (String) request.getParameter("msg");
		
		if(error || success) {
			if(msg == null || "".equals(msg)) {
				if(error) {
					msg = getLocalisedResource(source, "general.operation.not_complete");
				}else if(success){
					msg = getLocalisedResource(source, "general.operation.success_message");
				}
			}
			if(error) {
				message = Message.failMessage(msg);
			}else if(success){
				message = Message.successMessage(msg, null);
			}
		}
		
		return message;
	}
	
	/**
	 * Obtains the "targetUrl" put in session if any.
	 * @param request The HttpServletRequest being managed.
	 * @return the "targetUrl" parameter found in current session.
	 */
	public static String getRememberMeTargetUrlFromSession(HttpServletRequest request) {
		String targetUrl = "";
		HttpSession session = request.getSession(false);
		
		if(session != null) {
			targetUrl = session.getAttribute("targetUrl") == null ? 
					"" : session.getAttribute("targetUrl").toString();
		}
		
		return targetUrl;
	}

	/**
	 * Gets the current user logged in.
	 * @return The username of the current user or "NOT AUTHENTICATED" string if no user authenticated is found.
	 */
	public static String getCurrentUser() {
		String userName = "";
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		
		if(authentication != null) {
			userName = authentication.getName();
		}else {
			userName = "NOT AUTHENTICATED";
		}
		
		return userName;
	}

	/**
	 * Gets the localised message indicated by the passed key.
	 * @param source the MessageSource which resolves the localised messages.
	 * @param key The key name for the message to get.
	 * @return The message found according to the key.
	 */
	public static String getLocalisedResource(MessageSource source, String key) {
	    return getLocalisedResource(source, key, null);
	}
	
	/**
	 * Gets the localised message indicated by the passed key.
	 * @param source the MessageSource which resolves the localised messages.
	 * @param key The key name for the message to get.
	 * @param params The arguments used to replace params in the message.
	 * @return The message found according to the key.
	 * @see {@link MessageSource#getMessage} 
	 */
	public static String getLocalisedResource(MessageSource source, String key, String[] params) {
		Locale locale = LocaleContextHolder.getLocale();
	    return source.getMessage(key, params, locale);
	}
	
}
