package com.teknei.security.tags;

import javax.servlet.jsp.PageContext;
import org.springframework.web.servlet.tags.RequestContextAwareTag;
import com.teknei.common.security.StringEncrypt;

public class SecurityUrlTag extends RequestContextAwareTag{

	/**
	 * 
	 */
	private static final long serialVersionUID = 3711460145637751316L;
	private String data;
	private String var;
	private int scope = PageContext.PAGE_SCOPE;
	
	
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	public String getVar() {
		return var;
	}
	public void setVar(String var) {
		this.var = var;
	}
	
	private String encode(String input) {
        StringBuilder resultStr = new StringBuilder();
        for (char ch : input.toCharArray()) {
            if (isUnsafe(ch)) {
                resultStr.append('%');
                resultStr.append(toHex(ch / 16));
                resultStr.append(toHex(ch % 16));
            } else {
                resultStr.append(ch);
            }
        }
        return resultStr.toString();
    }

    private static char toHex(int ch) {
        return (char) (ch < 10 ? '0' + ch : 'A' + ch - 10);
    }

    private static boolean isUnsafe(char ch) {
        if (ch > 128 || ch < 0)
            return true;
        return " %$&+,/:;=?@<>#%".indexOf(ch) >= 0;
    }
    
	@Override
	protected int doStartTagInternal() throws Exception {
        try {			
        	if (this.data!=null &&  this.data.trim().length()>0){
        		
        		String cifrado = StringEncrypt.encrypt(StringEncrypt.KEY, StringEncrypt.IV,this.data);
        		String codificado = encode(cifrado);
    			this.pageContext.setAttribute(this.var, codificado, this.scope);
    		}
        	else
        		return SKIP_BODY;
        	
            return EVAL_PAGE;
        } catch (Exception ex) {
            return SKIP_BODY;
        }
	}

}
