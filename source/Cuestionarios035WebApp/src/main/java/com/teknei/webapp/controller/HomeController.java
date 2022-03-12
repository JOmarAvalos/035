package com.teknei.webapp.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayOutputStream;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.apache.log4j.Logger;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.teknei.security.bsn.UsersManager;
import com.teknei.util.Constants;
import com.teknei.vo.UsuarioVO;

@Controller
public class HomeController {
	private static final Logger LOGGER = Logger.getLogger(HomeController.class);

	private static final String PAGE_HOME = "home";

	@Autowired
	ServletContext context;

	@Autowired
	private UsersManager usersManager;

	@Value("${app.wff.image.perfil}")
	private String locationPictureProfile;
	@Value("${app.wff.documentos.ruta.recursos}")
	private String rutaRecursos;


	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String message(Model model, HttpServletRequest request,
			@RequestParam(value = Constants.MENU_REQUEST_PARAM, required = false) String menuId) {
		return PAGE_HOME;
	}

	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	@ResponseBody
	public ModelAndView handleFormUpload(HttpServletRequest request, @RequestBody MultipartFile file,
			@RequestHeader HttpHeaders headers) throws IOException {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UsuarioVO currentUser = (UsuarioVO) request.getSession(false).getAttribute("currentUser");
			String protocol = "http";
			if (request.getScheme().equals("https"))
				protocol = "https";

			String urlReturn = "redirect:" + protocol + "://" + headers.getFirst("HOST") + context.getContextPath()
					+ "/";
			if (!file.isEmpty()) {
				try {

					UsuarioVO usuarioVO = usersManager.getUser(currentUser.getId());

					BufferedImage src = ImageIO.read(new ByteArrayInputStream(file.getBytes()));
					String nombreImagen = "perfil_" + usuarioVO.getId() + ".png";
					File destination = new File(locationPictureProfile + "/" + nombreImagen);
					ImageIO.write(src, "png", destination);
					//usuarioVO.setImgEmpleado(locationPictureProfile  + "/" + nombreImagen);
					//UsuarioVO update = usersManager.save(usuarioVO);
				} catch (Exception e) {
					LOGGER.error(e);
					return new ModelAndView(urlReturn + "?message=error");
				}
				
			} else {
				return new ModelAndView(urlReturn + "?message=error");
			}
			return new ModelAndView(urlReturn + "?message=successful");
		} else {
			return null;
		}

	}

	@RequestMapping(value = "/downloadImagePerfil", method = RequestMethod.GET)
	public String downloadImagePerfil(HttpServletRequest request, HttpServletResponse response) throws FileNotFoundException {

		
		UsuarioVO currentUser = (UsuarioVO) request.getSession(false).getAttribute("currentUser");

		UsuarioVO usuarioVO = usersManager.getUser(currentUser.getId());
		String ruta = locationPictureProfile;
		String nombre = "perfil_" + usuarioVO.getId() + ".png";
		String fileView = ruta + "/" + nombre;
		try {
			File docFile = new File(fileView);

			if (!docFile.exists()) {
					nombre = "avatar-user.svg";
				
				fileView = ruta + "/" + nombre;
				docFile = new File(fileView);
			}

			FileInputStream fis = new FileInputStream(docFile);
			int iterador = 0;
			ByteArrayOutputStream os = new ByteArrayOutputStream();
			while ((iterador = fis.read()) != -1) {
				os.write(iterador);
			}

			response.setHeader("Content-Disposition", "attachment;filename=" + nombre);
			if (nombre.toLowerCase().endsWith(".svg"))
				response.setContentType("image/svg+xml");
			else
				response.setContentType("image/*");

			response.getOutputStream().write(os.toByteArray());
			fis.close();
			response.getOutputStream().flush();
			response.getOutputStream().close();
			response.flushBuffer();

		} catch (Exception e) {
			// TODO: handle exception

			ruta = locationPictureProfile;
			nombre = "avatar-user.svg";
			fileView = ruta + "/" + nombre;
			File docFile = new File(fileView);
			FileInputStream fis2 = new FileInputStream(docFile);
			int iterador = 0;
			ByteArrayOutputStream os = new ByteArrayOutputStream();
			try {
				while ((iterador = fis2.read()) != -1) {
					os.write(iterador);
				}
			} catch (IOException e1) {
				// TODO Auto-generated catch block

			}
			try {
				response.setHeader("Content-Disposition", "attachment;filename=" + nombre);
				response.setContentType("image/*");
				response.getOutputStream().write(os.toByteArray());
				fis2.close();
				response.getOutputStream().flush();
				response.getOutputStream().close();
				response.flushBuffer();
			} catch (Exception exception) {
				// TODO: handle exception
			}

		}

		return null;
	}

	@RequestMapping(value = "/downloadImage", method = RequestMethod.GET)
	public String downloadImage(HttpServletRequest request, HttpServletResponse response, @RequestParam(value="param", required = true) String imagen) throws FileNotFoundException {

		
		UsuarioVO currentUser = (UsuarioVO) request.getSession(false).getAttribute("currentUser");

		UsuarioVO usuarioVO = usersManager.getUser(currentUser.getId());
		String ruta = locationPictureProfile;
		String nombre = "perfil_" + usuarioVO.getId() + ".png";
		String fileView = ruta + "/" + nombre;
		try {
			File docFile = new File(rutaRecursos+imagen);

			FileInputStream fis = new FileInputStream(docFile);
			int iterador = 0;
			ByteArrayOutputStream os = new ByteArrayOutputStream();
			while ((iterador = fis.read()) != -1) {
				os.write(iterador);
			}

			response.setHeader("Content-Disposition", "attachment;filename=" + nombre);
			if (nombre.toLowerCase().endsWith(".svg"))
				response.setContentType("image/svg+xml");
			else
				response.setContentType("image/*");

			response.getOutputStream().write(os.toByteArray());
			fis.close();
			response.getOutputStream().flush();
			response.getOutputStream().close();
			response.flushBuffer();

		} catch (Exception e) {
			// TODO: handle exception

			ruta = locationPictureProfile;
			nombre = "avatar-user.svg";
			fileView = ruta + "/" + nombre;
			File docFile = new File(fileView);
			FileInputStream fis2 = new FileInputStream(docFile);
			int iterador = 0;
			ByteArrayOutputStream os = new ByteArrayOutputStream();
			try {
				while ((iterador = fis2.read()) != -1) {
					os.write(iterador);
				}
			} catch (IOException e1) {
				// TODO Auto-generated catch block

			}
			try {
				response.setHeader("Content-Disposition", "attachment;filename=" + nombre);
				response.setContentType("image/*");
				response.getOutputStream().write(os.toByteArray());
				fis2.close();
				response.getOutputStream().flush();
				response.getOutputStream().close();
				response.flushBuffer();
			} catch (Exception exception) {
				// TODO: handle exception
			}

		}

		return null;
	}
}
