package com.teknei.common.webapp;

/**
 * Success or failure messages class to return after the execution of some operation.
 * The default created message is a FAIL Message. 
 */
public class Message {

	public static final String SUCCESS = "SUCCESS";

	public static final String FAIL = "FAIL";

	private String status = FAIL;

	private String message = null;

	private Object data = null;
	
	private Message() {
	}
	
	/**
	 * Creates a new FAIL Message with the specified message
	 * @param message The detailed fail message.
	 * @return
	 */
	public static Message failMessage(String message) {
		return new Message(FAIL, message);
	}

	/**
	 * Creates a new SUCCESS Message with the specified message and result data
	 * @param message The detailed message of the SUCCESS operation
	 * @param data The result object of the SUCCESS operation
	 * @return
	 */
	public static Message successMessage(String message, Object data) {
		return new Message(SUCCESS, message, data);
	}

	private Message(String status, String message, Object data) {
		this.status = status;
		this.message = message;
		this.data = data;
	}

	private Message(String status, String message) {
		this(status, message, null);
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

}
