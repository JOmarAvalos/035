package com.teknei.webapp.controller;

import static com.teknei.common.webapp.RequestUtils.getCurrentUser;
import static com.teknei.common.webapp.RequestUtils.getLocalisedResource;

import java.text.MessageFormat;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.hibernate.TypeMismatchException;
import org.springframework.beans.ConversionNotSupportedException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.http.converter.HttpMessageNotWritableException;
import org.springframework.validation.BindException;
import org.springframework.web.HttpMediaTypeNotAcceptableException;
import org.springframework.web.HttpMediaTypeNotSupportedException;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.multipart.support.MissingServletRequestPartException;
import org.springframework.web.servlet.NoHandlerFoundException;
import org.springframework.web.servlet.mvc.multiaction.NoSuchRequestHandlingMethodException;

import com.teknei.common.webapp.Message;

@ControllerAdvice
public class ExceptionHandlerController {

	private static final String HEADER_PARAMETER_PAGE_TITLE = "pageTitle";
	
	public static final String ERROR_MSG_USER_UNAUTHORIZED = "app.error.403_message_user_unauthorized";
	
    public static final String BAD_REQUEST = "app.error.400_header";
    
    private static final String UNAUTHORIZED = "app.error.403_header";

    private static final String NOT_FOUND = "404 (Not Found)";

    private static final String METHOD_NOT_ALLOWED = "app.error.405_header";

    private static final String NOT_ACCEPTABLE = "406 (Not Acceptable)";

    private static final String UNSUPPORTED_MEDIA_TYPE = "415 (Unsupported Media Type)";

    private static final String INTERNAL_SERVER_ERROR = "app.error.500_header";
    
    private static final String INTERNAL_SERVER_ERROR_MESSAGE = "app.error.500_message_detail";

    private static final Logger LOGGER = Logger.getLogger(ExceptionHandlerController.class);

    @Autowired
	private MessageSource messageSource;
    
    /**
     *
     * This method is to address no handler request, throw exception into 404 exception advisor
     *
     * @param request
     * @return
     * @throws org.springframework.web.servlet.mvc.multiaction.NoSuchRequestHandlingMethodException
     */
    @RequestMapping("/**")
    @ResponseBody
    public Message PathNotFoundHandler(HttpServletRequest request) throws NoSuchRequestHandlingMethodException {
    	LOGGER.warn(MessageFormat.format("{0} occured, request URL: {1}, request host: {2}", NOT_FOUND, 
        		request.getRequestURI(), request.getRemoteAddr()));
        throw new NoSuchRequestHandlingMethodException(request);
    }

    /**
     * Mapping for 400
     *
     * @param req
     * @param e
     * @return
     */
    @ExceptionHandler(
        {
            BindException.class, HttpMessageNotReadableException.class,
            MethodArgumentNotValidException.class, MissingServletRequestParameterException.class,
            MissingServletRequestPartException.class, TypeMismatchException.class
        })
    public String badRequest(HttpServletRequest req, Exception e) {
    	LOGGER.error(e.getMessage(), e);
    	req.setAttribute(HEADER_PARAMETER_PAGE_TITLE, getLocalisedResource(messageSource, BAD_REQUEST));
    	req.setAttribute("errorMessage", e.getMessage());
        return "serverError";
    }

    /**
     * Mapping for 404
     *
     * @param req
     * @param e
     * @return
     */
    @ResponseStatus(value = HttpStatus.NOT_FOUND)
    @ExceptionHandler(
    	{
    		NoHandlerFoundException.class, NoSuchRequestHandlingMethodException.class
    	})
    public String notFound(HttpServletRequest req, Exception e) {
    	LOGGER.error(e.getMessage(), e);
    	return "notFound";
    }

    /**
     * Mapping for 405
     *
     * @param req
     * @param e
     * @return
     */
    @ExceptionHandler(
        {
            HttpRequestMethodNotSupportedException.class
        })
    public String methodNotAllowed(HttpServletRequest req, Exception e) {
    	LOGGER.error(e.getMessage(), e);        
        req.setAttribute(HEADER_PARAMETER_PAGE_TITLE, getLocalisedResource(messageSource, METHOD_NOT_ALLOWED));
    	req.setAttribute("errorMessage", e.getMessage());
        return "serverError";
    }

    /**
     * Mapping for 406
     *
     * @param req
     * @param e
     * @return
     */
    @ResponseBody
    @ExceptionHandler(
        {
            HttpMediaTypeNotAcceptableException.class
        })
    public Message notAcceptable(HttpServletRequest req, Exception e) {
    	LOGGER.error(e.getMessage(), e);
        return Message.failMessage(NOT_ACCEPTABLE);
    }

    /**
     * Mapping for 415
     *
     * @param req
     * @param e
     * @return
     */
    @ResponseBody
    @ExceptionHandler(
        {
            HttpMediaTypeNotSupportedException.class
        })
    public Message unsupportedMediaType(HttpServletRequest req, Exception e) {
    	LOGGER.error(e.getMessage(), e);
        return Message.failMessage(UNSUPPORTED_MEDIA_TYPE);
    }

    /**
     * Mapping for 500
     *
     * @param req
     * @param e
     * @return
     */
    @ExceptionHandler(
        {
            ConversionNotSupportedException.class, HttpMessageNotWritableException.class,
        })
    public String internalServerError(HttpServletRequest req, Exception e) {
    	LOGGER.error(e.getMessage(), e);
    	
    		req.setAttribute(HEADER_PARAMETER_PAGE_TITLE, getLocalisedResource(messageSource, INTERNAL_SERVER_ERROR));
        	req.setAttribute("errorMessage", e.getMessage());
            return "serverError";
    }

    /**
     * Mapping for other exceptions
     *
     * @param req
     * @param e
     * @return
     */
    @ExceptionHandler(
        {
            Exception.class
        })
    public String otherException(HttpServletRequest req, Exception e) {
    	if(getLocalisedResource(messageSource, ERROR_MSG_USER_UNAUTHORIZED).equals(e.getMessage())) {
    		LOGGER.warn("UNAUTHORIZED ACCESS; REQUEST HANDLER[" + req.getAttribute("handler") + "]");
    		req.setAttribute(HEADER_PARAMETER_PAGE_TITLE, getLocalisedResource(messageSource, UNAUTHORIZED));
        	req.setAttribute("errorMessage", e.getMessage());
    		req.setAttribute("username", getCurrentUser());
        	
            return "unauthorized";
    	}else{
    		String simpleName = "";
    		String exMsg = e.getMessage();
    		if(e.getCause() != null) {
    			simpleName = e.getCause().getClass().getSimpleName();
    		}
    		
    		if("ClientAbortException".equals(simpleName) || 
    				(exMsg != null && (exMsg.toLowerCase().contains("socketexception") || exMsg.toLowerCase().contains("broken pipe")))) {
    			if(req.getAttribute("handler") != null) {
    				long startTime = (Long) req.getAttribute("startTime");
    				int handlerCode = (Integer) req.getAttribute("handler");
    				long endTime = System.currentTimeMillis();
    				long executeTime = endTime - startTime;
    				
    				LOGGER.warn("RESPONSE for REQUEST [" + handlerCode + "] already canceled, TIME [" + executeTime + "ms]");
    			}else {
    				LOGGER.warn("RESPONSE already canceled: " + exMsg);
    			}
    			
    			return null;
    		}else { 
	    		LOGGER.error("Unhandled exception: " + exMsg, e);
		    	req.setAttribute(HEADER_PARAMETER_PAGE_TITLE, getLocalisedResource(messageSource, INTERNAL_SERVER_ERROR));
		    	req.setAttribute("errorMessage", getLocalisedResource(messageSource, INTERNAL_SERVER_ERROR_MESSAGE));
		    	
		    	return "serverError";
    		}
    	}
    }
    
}
