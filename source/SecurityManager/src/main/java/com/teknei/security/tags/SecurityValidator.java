package com.teknei.security.tags;

import org.springframework.stereotype.Component;

import com.teknei.vo.UsuarioVO;

@Component
public class SecurityValidator {
	
	public SecurityValidator() {
	}
	
	/**
	 * Validates the access to the module for the provided user.
	 * <br>The user must have the assigned roles list.
	 * @param user The user to validate.
	 * @param module The module to check.
	 * @return
	 */
	public boolean isUserGranted(UsuarioVO user, String module) {
		return isUserGranted(user, module, null);
	}
	
	/**
	 * Validates the access to the module/component for the provided user.
	 * <br>The user must have the assigned roles list.
	 * @param user The user to validate.
	 * @param module The module to check.
	 * @param component The component in the module to check.
	 * @return
	 */
	public boolean isUserGranted(UsuarioVO user, String module, String component) {
		boolean isGranted = false;
		
		if(user != null && module != null) {
			String target = "";
			
			if(component!=null && component.trim().length()>0)
				target = module +  "_" + component;
			else
				target = module;
			
			for(String auth:user.getLstAutoridades())
				if(auth.equals(target ))
					isGranted = true;
//			isGranted = true;
		}
		
		return isGranted;
	}
	
}
