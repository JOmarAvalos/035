package com.teknei.security.tags;

import javax.servlet.jsp.PageContext;

import org.springframework.web.servlet.tags.RequestContextAwareTag;
import org.springframework.web.util.TagUtils;

import com.teknei.vo.UsuarioVO;

public class AccessValidationTag extends RequestContextAwareTag {

	private static final long serialVersionUID = -1956905905717425694L;

	private String module;
	
	private String component;
	
	private String var;

	private int scope = PageContext.PAGE_SCOPE;
	
	@Override
	protected int doStartTagInternal() throws Exception {
		UsuarioVO currentUser = (UsuarioVO) pageContext.getSession().getAttribute("currentUser");
		SecurityValidator securityValidator = getRequestContext().getWebApplicationContext().getBean("securityValidator", SecurityValidator.class);
		
        try {
        	boolean hasAccess = securityValidator.isUserGranted(currentUser, module, component);
        	
        	if (this.var != null && !"".equals(this.var.trim())) {
    			this.pageContext.setAttribute(this.var, hasAccess, this.scope);
    		}
        	
        	if (hasAccess) {
	            return EVAL_PAGE;
        	}else {
        		return SKIP_BODY;
        	}
        } catch (Exception ex) {
            return SKIP_BODY;
        }
	}

	/**
	 * @param module the module to set
	 */
	public void setModule(String module) {
		this.module = module;
	}

	/**
	 * @param component the component to set
	 */
	public void setComponent(String component) {
		this.component = component;
	}

	/**
	 * @param var the var to set
	 */
	public void setVar(String var) {
		this.var = var;
	}

	/**
	 * @param scope the scope to set
	 */
	public void setScope(String scope) {
		this.scope = TagUtils.getScope(scope);
	}
	
}
