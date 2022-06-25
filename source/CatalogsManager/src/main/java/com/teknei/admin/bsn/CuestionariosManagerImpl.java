package com.teknei.admin.bsn;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.teknei.admin.dao.ActividadDAO;
import com.teknei.admin.dao.ActividadResueltaDAO;
import com.teknei.admin.dao.CentroTrabajoDAO;
import com.teknei.admin.dao.CuestionarioDAO;
import com.teknei.admin.dao.GiroDAO;
import com.teknei.admin.dao.PreguntaDAO;
import com.teknei.admin.dao.PreguntaResueltaDAO;
import com.teknei.admin.dao.RespuestaDAO;
import com.teknei.admin.dao.UserDAO;
import com.teknei.entity.ActividadResuelta;
import com.teknei.entity.Cuestionario;
import com.teknei.entity.Pregunta;
import com.teknei.entity.PreguntaResuelta;
import com.teknei.entity.Respuesta;
import com.teknei.entity.Usuario;
import com.teknei.mapper.Mapper;
import com.teknei.vo.ActividadResueltaVO;
import com.teknei.vo.ActividadVO;
import com.teknei.vo.CentroTrabajoVO;
import com.teknei.vo.CuestionarioVO;
import com.teknei.vo.GiroVO;
import com.teknei.vo.PreguntaResueltaVO;
import com.teknei.vo.PreguntaVO;
import com.teknei.vo.RespuestaVO;
import com.teknei.vo.UsuarioVO;

@Service
@Transactional
public class CuestionariosManagerImpl implements CuestionariosManager{
	
	private static final Logger LOGGER = Logger.getLogger(CuestionariosManagerImpl.class);
	
	@Autowired
	private CuestionarioDAO cuestionarioDAO;
	@Autowired
	private PreguntaDAO preguntaDAO;
	@Autowired
	private RespuestaDAO respuestaDAO;
	@Autowired
	private ActividadDAO actividadDAO;
	@Autowired
	private ActividadResueltaDAO actividadResueltaDAO;
	@Autowired
	private PreguntaResueltaDAO preguntaResueltaDAO;
	@Autowired
	private CentroTrabajoDAO centroTrabajoDAO;
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private GiroDAO giroDAO;
	
	

	@Override
	public CuestionarioVO getCustonarioCompleto(Integer id, Integer idActividad) {
		CuestionarioVO resp = null;
		try {
			resp = Mapper.toVO(cuestionarioDAO.find(id));
			List<Pregunta> preguntas = preguntaDAO.getActivasByCuestionario(resp.getId());
			List<PreguntaVO> preguntasVO = new ArrayList<PreguntaVO>();
			if(preguntas != null && !preguntas.isEmpty()) {
				for(Pregunta pregunta: preguntas) {
					PreguntaVO preguntaVO = Mapper.toVO(pregunta);
					List<Respuesta> respuestas = respuestaDAO.getActivasByPregunta(pregunta.getId());
					List<RespuestaVO> respuestasVO = new ArrayList<RespuestaVO>();
					if(respuestas != null && !respuestas.isEmpty()) {
						for(Respuesta respuesta: respuestas) {
							respuestasVO.add(Mapper.toVO(respuesta));
						}
					}
					preguntaVO.setRespuestas(respuestasVO);
					preguntasVO.add(preguntaVO);
				}
			}
			resp.setPreguntas(preguntasVO);
			ActividadVO actividad =  Mapper.toVO(actividadDAO.find(idActividad));
			resp.setActividad(actividad);
		} catch (Exception e) {
			LOGGER.error("Ocurrio un error en CuestionariosManagerImpl.getCustonarioCompleto			error:	",e);
		}
		return resp;
	}


	@Override
	public List<CuestionarioVO> getCuestionariosByCentro(Integer idCentro) {
		List<CuestionarioVO> resp = new ArrayList<CuestionarioVO>();
		List<Cuestionario> cuestionarios = cuestionarioDAO.getByCentro(idCentro);
		for(Cuestionario cuestionario: cuestionarios){
			
			CuestionarioVO cuestionarioVO = Mapper.toVO(cuestionario);
			ActividadVO actividadVO = Mapper.toVO(actividadDAO.getByCentroCuestionario(idCentro, cuestionario.getId()));
			cuestionarioVO.setActividad(actividadVO);
			
			int resueltos = actividadResueltaDAO.actividadesConcluidas(actividadVO.getId());
			cuestionarioVO.setResueltos(resueltos);
			
			resp.add(cuestionarioVO);
		}
		
		return resp;
	}


	@Override
	public ActividadResueltaVO saveActividadResuelta(ActividadResueltaVO actividadResueltaVO) {
		try {
			ActividadResuelta actividadResuelta = Mapper.toEntity(actividadResueltaVO);
			actividadResueltaVO = Mapper.toVO(actividadResueltaDAO.save(actividadResuelta));
		} catch (Exception e) {
			LOGGER.error("Error ",e);
		}
		return actividadResueltaVO;
	}
	
	@Override
	public PreguntaResueltaVO savePregunta(PreguntaResueltaVO preguntaResueltaVO) {
		
		try {
			PreguntaResuelta preguntaResuelta = Mapper.toEntity(preguntaResueltaVO);
			PreguntaResuelta preguntaResueltaOld = preguntaResueltaDAO.getByActividadPregunta(preguntaResuelta.getIdActividadResuelta(), preguntaResuelta.getIdPregunta());
			
			if(preguntaResueltaOld != null) {
				preguntaResuelta.setId(preguntaResueltaOld.getId());
				preguntaResueltaVO = Mapper.toVO(preguntaResueltaDAO.update(preguntaResuelta));
			}else {
				preguntaResueltaVO = Mapper.toVO(preguntaResueltaDAO.save(preguntaResuelta));
			}
			
		} catch (Exception e) {
			LOGGER.error("Error al guardar la respuesta",e);
		}
		return preguntaResueltaVO;
	}


	@Override
	public ActividadResueltaVO endActividadResuelta(Integer id) {
		
		ActividadResueltaVO resp = null;
		ActividadResuelta actividadTmp = actividadResueltaDAO.find(id);
		actividadTmp.setEstatus(2);
		
		resp = Mapper.toVO(actividadResueltaDAO.update(actividadTmp));
		
		return resp;
	}


	@Override
	public int cuestionariosResueltos() {
		return actividadResueltaDAO.actividadesConcluidasGeneral();
	}
	

	@Override
	public List<String[]> getCuestionarioTipo1Descarga(Integer idCuestionario, Integer idCentroTrabajo) {
		List<String[]> resp = new ArrayList<String[]>();

		String[] header0 = new String[300];
		header0[0]  = "Cuestionario 1";
		resp.add(header0);
		
		String[] header1 = new String[300];
		header1[0]  = "";
		header1[1]  = "I.- Acontecimiento traumático severo";
		header1[7]  = "II.- Recuerdos persistentes sobre el acontecimiento (durante el último mes)";
		header1[9]  = "III.- Esfuerzo por evitar circunstancias parecidas o asociadas al acontecimiento (durante el último mes)";
		header1[16] = "IV Afectación (durante el último mes)";
		header1[21] = "A. Perfil";
		resp.add(header1);
		
		String[] header2 = new String[300];
		header2[0]  = "Nombre";
		header2[1]  = "Accidente que tenga como consecuencia la muerte, la pérdida de un miembro o una lesión grave? ";
		header2[2]  = "Asaltos?";
		header2[3]  = "Actos violentos que derivaron en lesiones graves? ";
		header2[4]  = "Secuestro?";
		header2[5]  = "Amenazas?";
		header2[6]  = "Cualquier otro que ponga en riesgo su vida o salud, y/o la de otras personas?";
		header2[7]  = "¿Ha tenido recuerdos recurrentes sobre el acontecimiento que le provocan malestares?";
		header2[8]  = "¿Ha tenido sueños de carácter recurrente sobre el acontecimiento, que le producen malestar?";
		header2[9]  = "¿Se ha esforzado por evitar todo tipo de sentimientos, conversaciones o situaciones que le puedan recordar el acontecimiento?";
		header2[10]  = "¿Se ha esforzado por evitar todo tipo de actividades, lugares o personas que motivan recuerdos del acontecimiento?";
		header2[11]  = "¿Ha tenido dificultad para recordar alguna parte importante del evento?";
		header2[12]  = "¿Ha disminuido su interés en sus actividades cotidianas?";
		header2[13]  = "¿Se ha sentido usted alejado o distante de los demás?";
		header2[14]  = "¿Se ha sentido usted alejado o distante de los demás?	¿Ha notado que tiene dificultad para expresar sus sentimientos?";
		header2[15]  = "¿Ha tenido la impresión de que su vida se va a acortar, que va a morir antes que otras personas o que tiene un futuro limitado?";
		header2[16]  = "¿Ha tenido usted dificultades para dormir?";
		header2[17]  = "¿Ha estado particularmente irritable o le han dado arranques de coraje?";
		header2[18]  = "¿Ha tenido dificultad para concentrarse?";
		header2[19]  = "¿Ha estado nervioso o constantemente en alerta?";
		header2[20]  = "¿Se ha sobresaltado fácilmente por cualquier cosa?";
		header2[21]  = "Género:";
		header2[22]  = "Edad";
		header2[23]  = "Antigüedad en la empresa:";
		header2[24]  = "¿A cuál de las siguientes áreas se asemeja más el trabajo que realizas?:";
		header2[25]  = "Nivel organizacional que ocupas";
		header2[26]  = "Área o departamento en donde labora";
		header2[27]  = "BLANCO";
		header2[28]  = "Clave del cuestionario";
		header2[29]  = "Alias del centro de trabajo";
		header2[30]  = "Num de contrato";
		header2[31]  = "Giro del centro de trabajo";
		header2[32]  = "Tamaño del centro de trabajo";
		resp.add(header2);
		
		
		ActividadVO actividadVO = Mapper.toVO(actividadDAO.getByCentroCuestionario(idCentroTrabajo, idCuestionario));
		List<ActividadResuelta> actividadesResueltas = actividadResueltaDAO.actividadesConcluidasDetalle(actividadVO.getId());
		
		if(actividadesResueltas != null) {
			for(ActividadResuelta actividadResuelta: actividadesResueltas) {
				
				Integer idActividadResuelta = actividadResuelta.getId();
				String nombreCompleto = actividadResuelta.getNombre() + ' ' + actividadResuelta.getPaterno() + ' ' + actividadResuelta.getMaterno();

				
				String[] linea = new String[300];
				linea[0] = nombreCompleto;
				
				
				// Cuestionario estructura
				List<Pregunta> cuestionarioEstructura = preguntaDAO.getActivasByCuestionario(idCuestionario);
				Integer columna = 1;
				for(Pregunta pregunta: cuestionarioEstructura) {
					
					Integer idPregunta =  pregunta.getId();
					Integer tipoPregunta = pregunta.getIdPreguntaTipo();
					String  respuesta = "";
					
					if(tipoPregunta == 3) { // Abierta
						

						String respuestasDetalle1 = preguntaResueltaDAO.getRespuestaAbierta(idActividadResuelta, idPregunta);
						if(respuestasDetalle1 != null) {
							respuesta = respuestasDetalle1;
						}else {
							respuesta = "";
						}
						
						
					} else {
						
						String respuestasDetalle2 = preguntaResueltaDAO.getRespuestaCerrada(idActividadResuelta, idPregunta);
						if(respuestasDetalle2 != null) {
							respuesta = respuestasDetalle2;
						}else {
							respuesta = "";
						}
						
					}
					linea[columna] = respuesta;
					columna++;
					
				}
				
				columna++;
				
				
				// Clave del cuestionario
				linea[columna] = Integer.toString(idCuestionario);
				columna++;
				
				// Alias del centro de trabajo
				CentroTrabajoVO centroTrabajo = Mapper.toVO(centroTrabajoDAO.find(idCentroTrabajo));
				linea[columna] = centroTrabajo.getNombre();
				columna++;
				
				// Num de contrato
				Integer idUsuario = centroTrabajo.getIdUsuario();
				Usuario usuario = userDAO.getUser(idUsuario);
				linea[columna] = usuario.getUsuario();
				columna++;
				
				// Giro del centro de trabajo
				Integer idGiro = centroTrabajo.getIdGiro();
				GiroVO giro = Mapper.toVO(giroDAO.find(idGiro));
				linea[columna] = giro.getNombre();
				columna++;
				
				// Tamaño del centro de trabajo
				linea[columna] = Integer.toString(centroTrabajo.getEmpleadoNumero());
				columna++;
				
				resp.add(linea);
			}
		}
		
		return resp;
	}
	
	
	@Override
	public List<String[]> getCuestionarioTipo2Descarga(Integer idCuestionario, Integer idCentroTrabajo) {
		List<String[]> resp = new ArrayList<String[]>();

		String[] header0 = new String[300];
		header0[0]  = "Cuestionario 2";
		resp.add(header0);
		
		String[] header1 = new String[300];
		header1[0]  = "";
		header1[1]  = "A. Perfil";
		header1[6]  = "Para responder las preguntas siguientes considere las condiciones de su centro de trabajo, así como la cantidad y ritmo de trabajo";
		header1[15]  = "Las preguntas siguientes están relacionadas con las actividades que realiza en su trabajo y las responsabilidades que tiene.";
		header1[19]  = "Las preguntas siguientes están relacionadas con el tiempo destinado a su trabajo y sus responsabilidades familiares.";
		header1[23]  = "Las preguntas siguientes están relacionadas con las decisiones que puede tomar en su trabajo";
		header1[28]  = "Las preguntas siguientes están relacionadas con la capacitación e información que recibe sobre su trabajo";
		header1[33]  = "Las preguntas siguientes se refieren a las relaciones con sus compañeros de trabajo y su jefe";
		header1[46]  = "Las preguntas siguientes están relacionadas con la atención a clientes y usuarios.";
		header1[51]  = "Las siguientes preguntas están relacionadas con las actitudes de los trabajadores que supervisa.";
		header1[55]  = "Complemento";
		resp.add(header1);
		
		String[] header2 = new String[300];
		header2[0]  = "Nombre";
		header2[1]  = "Género:";
		header2[2]  = "Edad";
		header2[3]  = "Antigüedad en la empresa:";
		header2[4]  = "¿A cuál de las siguientes áreas se asemeja más el trabajo que realizas?:";
		header2[5]  = "Nivel organizacional que ocupas";
		header2[6]  = "Mi trabajo me exige hacer mucho esfuerzo físico";
		header2[7]  = "Me preocupa sufrir un accidente en mi trabajo";
		header2[8]  = "Considero que las actividades que realizo son peligrosas";
		header2[9]  = "Por la cantidad de trabajo que tengo debo quedarme tiempo adicional a mi turno";
		header2[10]  = "Por la cantidad de trabajo que tengo debo trabajar sin parar";
		header2[11]  = "Considero que es necesario mantener un ritmo de trabajo acelerado";
		header2[12]  = "Mi trabajo exige que esté muy concentrado";
		header2[13]  = "Mi trabajo requiere que memorice mucha información";
		header2[14]  = "Mi trabajo exige que atienda varios asuntos al mismo tiempo";
		header2[15]  = "En mi trabajo soy responsable de cosas de mucho valor";
		header2[16]  = "Respondo ante mi jefe por los resultados de toda mi área de trabajo";
		header2[17]  = "En mi trabajo me dan órdenes contradictorias";
		header2[18]  = "Considero que en mi trabajo me piden hacer cosas innecesarias";
		header2[19]  = "Trabajo horas extras más de tres veces a la semana";
		header2[20]  = "Mi trabajo me exige laborar en días de descanso, festivos o fines de semana";
		header2[21]  = "Considero que el tiempo en el trabajo es mucho y perjudica mis actividades familiares o personales";
		header2[22]  = "Pienso en las actividades familiares o personales cuando estoy en mi trabajo";
		header2[23]  = "Mi trabajo permite que desarrolle nuevas habilidades";
		header2[24]  = "En mi trabajo puedo aspirar a un mejor puesto";
		header2[25]  = "Durante mi jornada de trabajo puedo tomar pausas cuando las necesito";
		header2[26]  = "Puedo decidir la velocidad a la que realizo mis actividades en mi trabajo";
		header2[27]  = "Puedo cambiar el orden de las actividades que realizo en mi trabajo";
		header2[28]  = "Me informan con claridad cuáles son mis funciones";
		header2[29]  = "Me explican claramente los resultados que debo obtener en mi trabajo";
		header2[30]  = "Me informan con quién puedo resolver problemas o asuntos de trabajo";
		header2[31]  = "Me permiten asistir a capacitaciones relacionadas con mi trabajo";
		header2[32]  = "Recibo capacitación útil para hacer mi trabajo";
		header2[33]  = "Mi jefe tiene en cuenta mis puntos de vista y opiniones";
		header2[34]  = "Mi jefe ayuda a solucionar los problemas que se presentan en el trabajo";
		header2[35]  = "Puedo confiar en mis compañeros de trabajo";
		header2[36]  = "Cuando tenemos que realizar trabajo de equipo los compañeros colaboran";
		header2[37]  = "Mis compañeros de trabajo me ayudan cuando tengo dificultades";
		header2[38]  = "En mi trabajo puedo expresarme libremente sin interrupciones";
		header2[39]  = "Recibo críticas constantes a mi persona y/o trabajo";
		header2[40]  = "Recibo burlas, calumnias, difamaciones, humillaciones o ridiculizaciones";
		header2[41]  = "Se ignora mi presencia o se me excluye de las reuniones de trabajo y en la toma de decisiones";
		header2[42]  = "Se manipulan las situaciones de trabajo para hacerme parecer un mal trabajador";
		header2[43]  = "Se ignoran mis éxitos laborales y se atribuyen a otros trabajadores";
		header2[44]  = "Me bloquean o impiden las oportunidades que tengo para obtener ascenso o mejora en mi trabajo";
		header2[45]  = "He presenciado actos de violencia en mi centro de trabajo";
		header2[46]  = "En mi trabajo debo brindar servicio a clientes o usuarios:";
		header2[47]  = "Atiendo clientes o usuarios muy enojados";
		header2[48]  = "Mi trabajo me exige atender personas muy necesitadas de ayuda o enfermas";
		header2[49]  = "Para hacer mi trabajo debo demostrar sentimientos distintos a los míos";
		header2[50]  = "Soy jefe de otros trabajadores:";
		header2[51]  = "Comunican tarde los asuntos de trabajo";
		header2[52]  = "Dificultan el logro de los resultados del trabajo";
		header2[53]  = "Ignoran las sugerencias para mejorar su trabajo";
		header2[54]  = "BLANCO";
		header2[55]  = "Clave del cuestionario";
		header2[56]  = "Alias del centro de trabajo";
		header2[57]  = "Num de contrato";
		header2[58]  = "Giro del centro de trabajo";
		header2[59]  = "Tamaño del centro de trabajo";
		header2[60]  = "Nombre del depto donde trabaja";
		resp.add(header2);
		
		ActividadVO actividadVO = Mapper.toVO(actividadDAO.getByCentroCuestionario(idCentroTrabajo, idCuestionario));
		List<ActividadResuelta> actividadesResueltas = actividadResueltaDAO.actividadesConcluidasDetalle(actividadVO.getId());
		
		if(actividadesResueltas != null) {
			for(ActividadResuelta actividadResuelta: actividadesResueltas) {
				
				Integer idActividadResuelta = actividadResuelta.getId();
				String nombreCompleto = actividadResuelta.getNombre() + ' ' + actividadResuelta.getPaterno() + ' ' + actividadResuelta.getMaterno();

				
				String[] linea = new String[300];
				linea[0] = nombreCompleto;
				
				
				// Cuestionario estructura
				List<Pregunta> cuestionarioEstructura = preguntaDAO.getActivasByCuestionario(idCuestionario);
				Integer columna = 1;
				for(Pregunta pregunta: cuestionarioEstructura) {
					
					Integer idPregunta =  pregunta.getId();
					Integer tipoPregunta = pregunta.getIdPreguntaTipo();
					String  respuesta = "";
					
					if(tipoPregunta == 3) { // Abierta
						

						String respuestasDetalle1 = preguntaResueltaDAO.getRespuestaAbierta(idActividadResuelta, idPregunta);
						if(respuestasDetalle1 != null) {
							respuesta = respuestasDetalle1;
						}else {
							respuesta = "";
						}
						
						
					} else {
						
						String respuestasDetalle2 = preguntaResueltaDAO.getRespuestaCerrada(idActividadResuelta, idPregunta);
						if(respuestasDetalle2 != null) {
							respuesta = respuestasDetalle2;
						}else {
							respuesta = "";
						}
						
					}
					linea[columna] = respuesta;
					columna++;
					
				}
				
				columna++;
				
				
				// Clave del cuestionario
				linea[columna] = Integer.toString(idCuestionario);
				columna++;
				
				// Alias del centro de trabajo
				CentroTrabajoVO centroTrabajo = Mapper.toVO(centroTrabajoDAO.find(idCentroTrabajo));
				linea[columna] = centroTrabajo.getNombre();
				columna++;
				
				// Num de contrato
				Integer idUsuario = centroTrabajo.getIdUsuario();
				Usuario usuario = userDAO.getUser(idUsuario);
				linea[columna] = usuario.getUsuario();
				columna++;
				
				// Giro del centro de trabajo
				Integer idGiro = centroTrabajo.getIdGiro();
				GiroVO giro = Mapper.toVO(giroDAO.find(idGiro));
				linea[columna] = giro.getNombre();
				columna++;
				
				// Tamaño del centro de trabajo
				linea[columna] = Integer.toString(centroTrabajo.getEmpleadoNumero());
				columna++;
				
				resp.add(linea);
			}
		}

		return resp;
	}
	
	
	@Override
	public List<String[]> getCuestionarioTipo3Descarga(Integer idCuestionario, Integer idCentroTrabajo) {
		List<String[]> resp = new ArrayList<String[]>();

		String[] header0 = new String[300];
		header0[0]  = "Cuestionario 3";
		resp.add(header0);
		
		String[] header1 = new String[300];
		header1[0]  = "";
		header1[1]  = "A. Perfil";
		header1[6]  = "Para responder las preguntas siguientes considere las condiciones ambientales de su centro de trabajo.";
		header1[11]  = "Para responder a las preguntas siguientes piense en la cantidad y ritmo de trabajo que tiene.";
		header1[14]  = "Las preguntas siguientes están relacionadas con el esfuerzo mental que le exige su trabajo.";
		header1[18]  = "Las preguntas siguientes están relacionadas con las actividades que realiza en su trabajo y las responsabilidades que tiene.";
		header1[22]  = "Las preguntas siguientes están relacionadas con su jornada de trabajo.";
		header1[28]  = "Las preguntas siguientes están relacionadas con las decisiones que puede tomar en su trabajo.";
		header1[34]  = "Las preguntas siguientes están relacionadas con cualquier tipo de cambio que ocurra en su trabajo (considere los últimos cambios realizados).";
		header1[36]  = "Las preguntas siguientes están relacionadas con la capacitación e información que se le proporciona sobre su trabajo.";
		header1[42]  = "Las preguntas siguientes están relacionadas con el o los jefes con quien tiene contacto.";
		header1[47]  = "Las preguntas siguientes se refieren a las relaciones con sus compañeros.";
		header1[52]  = "Las preguntas siguientes están relacionadas con la información que recibe sobre su rendimiento en el trabajo, el reconocimiento, el sentido de pertenencia y la estabilidad que le ofrece su trabajo";
		header1[62]  = "Las preguntas siguientes están relacionadas con actos de violencia laboral (malos tratos, acoso, hostigamiento, acoso psicológico).";
		header1[70]  = "Las preguntas siguientes están relacionadas con la atención a clientes y usuarios.";
		header1[76]  = "Las preguntas siguientes están relacionadas con las actitudes de las personas que supervisa.";
		header1[81]  = "complemento";
		resp.add(header1);
		
		String[] header2 = new String[300];
		header2[0]  = "Nombre";
		header2[1]  = "Género:";
		header2[2]  = "Edad";
		header2[3]  = "Antigüedad en la empresa:";
		header2[4]  = "¿A cuál de las siguientes áreas se asemeja más el trabajo que realizas?:";
		header2[5]  = "Nivel organizacional que ocupas";
		header2[6]  = "El espacio donde trabajo me permite realizar mis actividades de manera segura e higiénica";
		header2[7]  = "Mi trabajo me exige hacer mucho esfuerzo físico";
		header2[8]  = "Me preocupa sufrir un accidente en mi trabajo";
		header2[9]  = "Considero que en mi trabajo se aplican las normas de seguridad y salud en el trabajo";
		header2[10]  = "Considero que las actividades que realizo son peligrosas";
		header2[11]  = "Por la cantidad de trabajo que tengo debo quedarme tiempo adicional a mi turno";
		header2[12]  = "Por la cantidad de trabajo que tengo debo trabajar sin parar";
		header2[13]  = "Considero que es necesario mantener un ritmo de trabajo acelerado";
		header2[14]  = "Mi trabajo exige que esté muy concentrado";
		header2[15]  = "Mi trabajo requiere que memorice mucha información";
		header2[16]  = "En mi trabajo tengo que tomar decisiones difíciles muy rápido";
		header2[17]  = "Mi trabajo exige que atienda varios asuntos al mismo tiempo";
		header2[18]  = "En mi trabajo soy responsable de cosas de mucho valor";
		header2[19]  = "Respondo ante mi jefe por los resultados de toda mi área de trabajo";
		header2[20]  = "En el trabajo me dan órdenes contradictorias";
		header2[21]  = "Considero que en mi trabajo me piden hacer cosas innecesarias";
		header2[22]  = "Trabajo horas extras más de tres veces a la semana";
		header2[23]  = "Mi trabajo me exige laborar en días de descanso, festivos o fines de semana";
		header2[24]  = "Considero que el tiempo en el trabajo es mucho y perjudica mis actividades familiares o personales";
		header2[25]  = "Debo atender asuntos de trabajo cuando estoy en casa";
		header2[26]  = "Pienso en las actividades familiares o personales cuando estoy en mi trabajo";
		header2[27]  = "Pienso que mis responsabilidades familiares afectan mi trabajo";
		header2[28]  = "Mi trabajo permite que desarrolle nuevas habilidades";
		header2[29]  = "En mi trabajo puedo aspirar a un mejor puesto";
		header2[30]  = "Durante mi jornada de trabajo puedo tomar pausas cuando las necesito";
		header2[31]  = "Puedo decidir cuánto trabajo realizo durante la jornada laboral";
		header2[32]  = "Puedo decidir la velocidad a la que realizo mis actividades en mi trabajo";
		header2[33]  = "Puedo cambiar el orden de las actividades que realizo en mi trabajo";
		header2[34]  = "Los cambios que se presentan en mi trabajo dificultan mi labor";
		header2[35]  = "Cuando se presentan cambios en mi trabajo se tienen en cuenta mis ideas o aportaciones";
		header2[36]  = "Me informan con claridad cuáles son mis funciones";
		header2[37]  = "Me explican claramente los resultados que debo obtener en mi trabajo";
		header2[38]  = "Me explican claramente los objetivos de mi trabajo";
		header2[39]  = "Me informan con quién puedo resolver problemas o asuntos de trabajo";
		header2[40]  = "Me permiten asistir a capacitaciones relacionadas con mi trabajo";
		header2[41]  = "Recibo capacitación útil para hacer mi trabajo";
		header2[42]  = "Mi jefe ayuda a organizar mejor el trabajo";
		header2[43]  = "Mi jefe tiene en cuenta mis puntos de vista y opiniones";
		header2[44]  = "Mi jefe me comunica a tiempo la información relacionada con el trabajo";
		header2[45]  = "La orientación que me da mi jefe me ayuda a realizar mejor mi trabajo";
		header2[46]  = "Mi jefe ayuda a solucionar los problemas que se presentan en el trabajo";
		header2[47]  = "Puedo confiar en mis compañeros de trabajo";
		header2[48]  = "Entre compañeros solucionamos los problemas de trabajo de forma respetuosa";
		header2[49]  = "En mi trabajo me hacen sentir parte del grupo";
		header2[50]  = "Cuando tenemos que realizar trabajo de equipo los compañeros colaboran";
		header2[51]  = "Mis compañeros de trabajo me ayudan cuando tengo dificultades";
		header2[52]  = "Me informan sobre lo que hago bien en mi trabajo";
		header2[53]  = "La forma como evalúan mi trabajo en mi centro de trabajo me ayuda a mejorar mi desempeño";
		header2[54]  = "En mi centro de trabajo me pagan a tiempo mi salario";
		header2[55]  = "El pago que recibo es el que merezco por el trabajo que realizo";
		header2[56]  = "Si obtengo los resultados esperados en mi trabajo me recompensan o reconocen";
		header2[57]  = "Las personas que hacen bien el trabajo pueden crecer laboralmente";
		header2[58]  = "Considero que mi trabajo es estable";
		header2[59]  = "En mi trabajo existe continua rotación de personal";
		header2[60]  = "Siento orgullo de laborar en este centro de trabajo";
		header2[61]  = "Me siento comprometido con mi trabajo";
		header2[62]  = "En mi trabajo puedo expresarme libremente sin interrupciones";
		header2[63]  = "Recibo críticas constantes a mi persona y/o trabajo";
		header2[64]  = "Recibo burlas, calumnias, difamaciones, humillaciones o ridiculizaciones";
		header2[65]  = "Se ignora mi presencia o se me excluye de las reuniones de trabajo y en la toma de decisiones";
		header2[66]  = "Se manipulan las situaciones de trabajo para hacerme parecer un mal trabajador";
		header2[67]  = "Se ignoran mis éxitos laborales y se atribuyen a otros trabajadores";
		header2[68]  = "Me bloquean o impiden las oportunidades que tengo para obtener ascenso o mejora en mi trabajo";
		header2[69]  = "He presenciado actos de violencia en mi centro de trabajo";
		header2[70]  = "En mi trabajo debo brindar servicio a clientes o usuarios:";
		header2[71]  = "Atiendo clientes o usuarios muy enojados";
		header2[72]  = "Mi trabajo me exige atender personas muy necesitadas de ayuda o enfermas";
		header2[73]  = "Para hacer mi trabajo debo demostrar sentimientos distintos a los míos";
		header2[74]  = "Mi trabajo me exige atender situaciones de violencia";
		header2[75]  = "Soy jefe de otros trabajadores:";
		header2[76]  = "Comunican tarde los asuntos de trabajo";
		header2[77]  = "Dificultan el logro de los resultados del trabajo";
		header2[78]  = "Cooperan poco cuando se necesita";
		header2[79]  = "Ignoran las sugerencias para mejorar su trabajo";
		header2[80]  = "BLANCO";
		header2[81]  = "Clave del cuestionario";
		header2[82]  = "Alias del centro de trabajo";
		header2[83]  = "Num de contrato";
		header2[84]  = "Giro del centro de trabajo";
		header2[85]  = "Tamaño del centro de trabajo";
		header2[86]  = "Nombre del depto donde trabaja";
		resp.add(header2);
		
		ActividadVO actividadVO = Mapper.toVO(actividadDAO.getByCentroCuestionario(idCentroTrabajo, idCuestionario));
		List<ActividadResuelta> actividadesResueltas = actividadResueltaDAO.actividadesConcluidasDetalle(actividadVO.getId());
		
		if(actividadesResueltas != null) {
			for(ActividadResuelta actividadResuelta: actividadesResueltas) {
				
				Integer idActividadResuelta = actividadResuelta.getId();
				String nombreCompleto = actividadResuelta.getNombre() + ' ' + actividadResuelta.getPaterno() + ' ' + actividadResuelta.getMaterno();

				
				String[] linea = new String[300];
				linea[0] = nombreCompleto;
				
				
				// Cuestionario estructura
				List<Pregunta> cuestionarioEstructura = preguntaDAO.getActivasByCuestionario(idCuestionario);
				Integer columna = 1;
				for(Pregunta pregunta: cuestionarioEstructura) {
					
					Integer idPregunta =  pregunta.getId();
					Integer tipoPregunta = pregunta.getIdPreguntaTipo();
					String  respuesta = "";
					
					if(tipoPregunta == 3) { // Abierta
						

						String respuestasDetalle1 = preguntaResueltaDAO.getRespuestaAbierta(idActividadResuelta, idPregunta);
						if(respuestasDetalle1 != null) {
							respuesta = respuestasDetalle1;
						}else {
							respuesta = "";
						}
						
						
					} else {
						
						String respuestasDetalle2 = preguntaResueltaDAO.getRespuestaCerrada(idActividadResuelta, idPregunta);
						if(respuestasDetalle2 != null) {
							respuesta = respuestasDetalle2;
						}else {
							respuesta = "";
						}
						
					}
					linea[columna] = respuesta;
					columna++;
					
				}
				
				columna++;
				
				
				// Clave del cuestionario
				linea[columna] = Integer.toString(idCuestionario);
				columna++;
				
				// Alias del centro de trabajo
				CentroTrabajoVO centroTrabajo = Mapper.toVO(centroTrabajoDAO.find(idCentroTrabajo));
				linea[columna] = centroTrabajo.getNombre();
				columna++;
				
				// Num de contrato
				Integer idUsuario = centroTrabajo.getIdUsuario();
				Usuario usuario = userDAO.getUser(idUsuario);
				linea[columna] = usuario.getUsuario();
				columna++;
				
				// Giro del centro de trabajo
				Integer idGiro = centroTrabajo.getIdGiro();
				GiroVO giro = Mapper.toVO(giroDAO.find(idGiro));
				linea[columna] = giro.getNombre();
				columna++;
				
				// Tamaño del centro de trabajo
				linea[columna] = Integer.toString(centroTrabajo.getEmpleadoNumero());
				columna++;
				
				resp.add(linea);
			}
		}

		return resp;
	}

}
