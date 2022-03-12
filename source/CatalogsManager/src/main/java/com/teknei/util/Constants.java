package com.teknei.util;

public class Constants {

	public static final String CONSTANTE = "CONSTANTE";

	public static final String MENU_REQUEST_PARAM = "menu";

	public static final Integer BAN_ACTIVO = 1;

	public static final Integer BAN_INACTIVO = 0;

	public static final Integer ID_MODULO_CURSOS = 1;
	public static final Integer ID_MODULO_CATALOGOS = 2;
	public static final Integer ID_MODULO_USUARIOS = 3;
	public static final Integer ID_MODULO_LMS = 4;
	public static final Integer ID_MODULO_CALENDARIO = 5;
	public static final Integer ID_MODULO_FUNCIONARIOS = 6;
	public static final Integer ID_MODULO_REPORTES = 7;
	public static final Integer ID_MODULO_ADICIONALES = 8;
	public static final Integer ID_MODULO_INSUMOS = 9;
	

	// Empresa principal
	public static final Integer ID_EMPRESA_MEGADEALER = 1;

	// Tipo Actividad
	public static final int ID_CATA_TIPO_ACTIVIDAD_SCORM = 1;
	public static final int ID_CATA_TIPO_ACTIVIDAD_VIDEO = 2;
	public static final int ID_CATA_TIPO_ACTIVIDAD_DOCUMENTO = 3;
	public static final int ID_CATA_TIPO_ACTIVIDAD_EXAMEN = 4;
	public static final int ID_CATA_TIPO_ACTIVIDAD_ENCUESTA = 5;
	public static final int ID_CATA_TIPO_ACTIVIDAD_CONFERENCIA = 6;
	public static final int ID_CATA_TIPO_ACTIVIDAD_TAREA = 7;
	public static final int ID_CATA_TIPO_ACTIVIDAD_ASISTENCIA = 8;
	public static final int ID_CATA_TIPO_ACTIVIDAD_EXAMEN_DIAGNOSTICO = 9;
	public static final int ID_CATA_TIPO_ACTIVIDAD_EXAMEN_ECOP = 10;
	public static final int ID_CATA_TIPO_ACTIVIDAD_EXAMEN_FINAL_PRESENCIAL = 11;
	public static final int ID_CATA_TIPO_ACTIVIDAD_EXAMEN_POR_DIA = 12;
	public static final int ID_CATA_TIPO_ACTIVIDAD_TRABAJO_POR_DIA = 13;
	
	
	// Estatus notificacion
	public static final Integer ID_ESTATUS_NOTIFICACION_CREADA = 1;
	public static final Integer ID_ESTATUS_NOTIFICACION_RECIBIDA = 2;
	public static final Integer ID_ESTATUS_NOTIFICACION_VISTA = 3;

	// prioridad notificacion
	public static final Integer ID_PRIORIDAD_NOTIFICACION_NORMAL = 1;
	public static final Integer ID_PRIORIDAD_NOTIFICACION_URGENTE = 2;

	// FOLDER EMAIL
	public static final String FOLDER_EMAIL_INBOX = "INBOX";
	public static final String FOLDER_EMAIL_SENT = "INBOX.Sent";
	public static final String FOLDER_EMAIL_DRAFTS = "INBOX.Drafts";
	public static final int FOLDER_EMAIL_ID_INBOX = 1;
	public static final int FOLDER_EMAIL_ID_SENT = 2;
	public static final int FOLDER_EMAIL_ID_DRAFTS = 3;
	public static final String ESTATUS_EMAIL_SEEN = "SEEN";
	public static final String FILES_INLINE_EMAIL = "inline";
	
	//estatus del funcionario para mesa de control
	public static final int ID_ESTATUS_FUNCIONARIO_CREADO = 1;
	public static final int ID_ESTATUS_FUNCIONARIO_ACEPTADO = 2;
	public static final int ID_ESTATUS_FUNCIONARIO_BAJA = 3;
	public static final int ID_ESTATUS_FUNCIONARIO_BAJA_VALIDADO = 4;
	public static final int ID_ESTATUS_FUNCIONARIO_REINGRESO = 5;
	public static final int ID_ESTATUS_FUNCIONARIO_REINGRESO_VALIDADO = 6;
	public static final int ID_ESTATUS_FUNCIONARIO_MODIFICADO = 7;
	public static final int ID_ESTATUS_FUNCIONARIO_REINGRESO_RECHAZADO = 8;
	public static final int ID_ESTATUS_FUNCIONARIO_EMAIL_CONFIRMADO = 9;
	public static final int ID_ESTATUS_FUNCIONARIO_RECHAZADO = 10;
	public static final int ID_ESTATUS_FUNCIONARIO_DUPLICADO = 11;
	public static final int ID_ESTATUS_FUNCIONARIO_NUEVO_PUESTO= 12;
	public static final int ID_ESTATUS_FUNCIONARIO_CAMBIO_PUESTO= 13;
	public static final String ESTATUS_FUNCIONARIO_CREADO = "Nuevo Funcionario";
	public static final String ESTATUS_FUNCIONARIO_ACEPTADO = "Aceptado";
	public static final String ESTATUS_FUNCIONARIO_BAJA = "Baja";
	public static final String ESTATUS_FUNCIONARIO_BAJA_VALIDADO = "Baja validado";
	public static final String ESTATUS_FUNCIONARIO_REINGRESO = "Reingreso";
	public static final String ESTATUS_FUNCIONARIO_REINGRESO_VALIDADO = "Reingreso validado";
	public static final String ESTATUS_FUNCIONARIO_MODIFICADO = "Datos actualizados";
	
	public static final String ARCHIVO_LIBERACION = "CartaLiberacion";
	public static final String ARCHIVO_VALIDACION = "ValidacionGerente";
	public static final String ARCHIVO_JUSTIFICANTE = "Justificante";
	
	public static final float CARGA_IMAGEN_PREGUNTA_TAMANO_MAXIMO = 1073741824;
	public static final float CARGA_ARCHIVO_SCORM_TAMANO_MAXIMO = 1073741824;
	public static final float CARGA_ARCHIVO_VIDEO_TAMANO_MAXIMO = 1073741824;
	public static final float CARGA_ARCHIVO_DOCUMENTO_TAMANO_MAXIMO = 1073741824;
	// 10GB - 10737418240, 1GB  - 1073741824, 50MB - 52428800
	
	public static final int TIPO_PREGUNTA_ABIERTA = 1;
	public static final int TIPO_PREGUNTA_VERDADERO_FALSO = 2;
	public static final int TIPO_PREGUNTA_OPCION_MULTIPLE_UNICA = 3;
	public static final int TIPO_PREGUNTA_OPCION_MULTIPLE_MULTIPLE = 4;
	public static final int TIPO_PREGUNTA_OPCION_RELACION = 5;
	public static final int TIPO_PREGUNTA_OPCION_RELLENAR_BLANCOS = 6;
	public static final int TIPO_PREGUNTA_OPCION_CONBINACION_EXACTA = 7;
	public static final int TIPO_PREGUNTA_OPCION_GRADO_CERTEZA = 8;
	public static final int TIPO_PREGUNTA_OPCION_IMAGEN_UNICA = 9;
	public static final int TIPO_PREGUNTA_OPCION_ARRASTRABLE = 10;
	
	public static final Integer ID_ESTATUS_INSCRIPCION = 1;
	

	public static final Integer ID_TIPO_CURSO_ONLINE = 1;
	public static final Integer ID_TIPO_CURSO_PRESENCIAL = 2;
	public static final Integer ID_TIPO_CURSO_WEBINAR = 3;
	public static final Integer ID_TIPO_CURSO_REVALIDACION_PRESENCIAL = 4;
	public static final Integer ID_TIPO_CURSO_REVALIDACION_ONLINE = 5;
	

	public static final int ID_ESTATUS_CALENDARIO_EVENTO_CREADO = 1;
	public static final int ID_ESTATUS_CALENDARIO_EVENTO_CANCELADO = 2;
	public static final int ID_ESTATUS_CALENDARIO_EVENTO_ACTUALIZADO = 3;
	public static final int ID_ESTATUS_CALENDARIO_EVENTO_IMPARTIDO = 4;
	
	
	public static final int ID_ESTATUS_INSCRIPCION_SOLICITADO = 1;
	public static final int ID_ESTATUS_INSCRIPCION_ACEPTADO = 2;
	public static final int ID_ESTATUS_INSCRIPCION_RECHAZADO = 3;
	public static final int ID_ESTATUS_INSCRIPCION_CANCELADO = 4;
	public static final int ID_ESTATUS_INSCRIPCION_APROVADO = 5;
	public static final int ID_ESTATUS_INSCRIPCION_NO_APROVADO = 6;
	public static final int ID_ESTATUS_INSCRIPCION_NO_SHOW = 7;
	public static final int ID_ESTATUS_INSCRIPCION_NO_EXAMEN = 8;
	public static final int ID_ESTATUS_INSCRIPCION_CURSO_CANCELADO = 9;
	public static final int ID_ESTATUS_INSCRIPCION_CANCELADO_EXTEMPORANEO = 10;
	public static final int ID_ESTATUS_INSCRIPCION_CANCELADO_JUSTIFICADO = 11;
	public static final int ID_ESTATUS_INSCRIPCION_APARTADO = 12;
	
	
	public static final Integer ID_ESTATUS_ACTIVIDAD_REGISTRADA = 1;
	public static final Integer ID_ESTATUS_ACTIVIDAD_COMPLETA = 2;
	
	public static final Integer CALIF_ACTIVIDAD= 80;
	
	
	// mensaje notificacion de inscripcion
	public static final String TITULO_NOTIFICACION_INSCRIPCION_ACEPTADA = "Notificaci\u00F3n de Inscripci\u00F3n";
	public static final String TITULO_NOTIFICACION_INSCRIPCION_ACEPTADA_EN = "Enrollment Notification";
	public static final String TITULO_NOTIFICACION_INSCRIPCION_ACEPTADA_FR = "Avis dinscription";
	
	public static final String TITULO_NOTIFICACION_CURSO_CANCELADO = "Curso Cancelado";
	public static final String TITULO_NOTIFICACION_CURSO_CANCELADO_EN = "Course Canceled";
	public static final String TITULO_NOTIFICACION_CURSO_CANCELADO_FR = "Cours annule";
	
	public static final String TITULO_NOTIFICACION_MODULO_REPORTES_ADICIONALES = "Notificaci\u00F3n m\u00F3dulo de reportes adicionales disponible";
	public static final String TITULO_NOTIFICACION_MODULO_REPORTES_ADICIONALES_EN = "Notification module for additional reports available";
	public static final String TITULO_NOTIFICACION_MODULO_REPORTES_ADICIONALES_FR = "Module de notification pour des rapports supplementaires disponibles";
	
	public static final String TITULO_NOTIFICACION_REPORTES_ADICIONALES = "Notificaci\u00F3n de reportes adicionales";
	public static final String TITULO_NOTIFICACION_REPORTES_ADICIONALES_EN = "Notification of additional reports";
	public static final String TITULO_NOTIFICACION_REPORTES_ADICIONALES_FR = "Notification de rapports supplementaires";
	
	public static final String TITULO_NOTIFICACION_MODULO_INSUMOS = "Notificaci\u00F3n m\u00F3dulo de solicitud de insumos disponible";
	public static final String TITULO_NOTIFICACION_MODULO_INSUMOS_EN = "Notification input request module available";
	public static final String TITULO_NOTIFICACION_MODULO_INSUMOS_FR = "Module de demande dentree de notification disponible";
	
	
	
	// mensaje notificacion de inscripcion
	public static final String MENSAJE_NOTIFICACION_INSCRIPCION_ACEPTADA = "Se acepto tu solicitud de inscripci\u00F3n al curso ";
	public static final String MENSAJE_NOTIFICACION_INSCRIPCION_ACEPTADA_EN = "Your application for enrollment in the course has been accepted ";
	public static final String MENSAJE_NOTIFICACION_INSCRIPCION_ACEPTADA_FR = "Votre demande d inscription au cours a ete acceptee ";
	
	public static final String MENSAJE_NOTIFICACION_INSCRIPCION_RECHAZADO = "Se rechazo tu solicitud de inscripci\u00F3n al curso ";
	public static final String MENSAJE_NOTIFICACION_INSCRIPCION_RECHAZADO_EN = "Your request to enroll in the course was rejected ";
	public static final String MENSAJE_NOTIFICACION_INSCRIPCION_RECHAZADO_FR = "Votre demande d inscription au cours a ete rejetee ";
	
	public static final String MENSAJE_NOTIFICACION_INSCRIPCION_CANCELADO = "Se cancelo tu solicitud de inscripci\u00F3n al curso ";
	public static final String MENSAJE_NOTIFICACION_INSCRIPCION_CANCELADO_EN = "Your course registration request has been canceled ";
	public static final String MENSAJE_NOTIFICACION_INSCRIPCION_CANCELADO_FR = "Votre demande d inscription au cours a ete annulee ";
	
	public static final String MENSAJE_NOTIFICACION_INSCRIPCION_INSCRITO = "Fuiste inscrito al curso ";
	public static final String MENSAJE_NOTIFICACION_INSCRIPCION_INSCRITO_EN = "You were enrolled in the course ";
	public static final String MENSAJE_NOTIFICACION_INSCRIPCION_INSCRITO_FR = "Vous etiez inscrit au cours ";
	
	public static final String MENSAJE_NOTIFICACION_MODULO_REPORTES_ADICIONALES = "El m\u00F3dulo de carga de reportes adicionales se encontrara disponible dentro de las siguientes fechas ";
	public static final String MENSAJE_NOTIFICACION_MODULO_REPORTES_ADICIONALES_EN = "The module for loading additional reports will be available within the following dates ";
	public static final String MENSAJE_NOTIFICACION_MODULO_REPORTES_ADICIONALES_FR = "Le module de chargement de rapports supplementaires sera disponible dans les dates suivantes ";
	
	public static final String MENSAJE_NOTIFICACION_MODULO_INSUMOS = "El m\u00F3dulo de solicitud de insumos se encontrara disponible dentro de las siguientes fechas ";
	public static final String MENSAJE_NOTIFICACION_MODULO_INSUMOS_EN = "The input request form will be available within the following dates ";
	public static final String MENSAJE_NOTIFICACION_MODULO_INSUMOS_FR = "Le formulaire de demande de saisie sera disponible dans les dates suivantes ";
	
    public static final String MENSAJE_NOTIFICACION_REPORTES_ADICIONALES = "Se subi\u00F3 un docuemnto";
    public static final String MENSAJE_NOTIFICACION_REPORTES_ADICIONALES_EN = "A document was uploaded";
    public static final String MENSAJE_NOTIFICACION_REPORTES_ADICIONALES_FR = "Un document a ete telecharge";
    
	public static final String URL_CONFIRMACION_CORREO = "/lms/funcionarios/confirmacionEmail?param=";
	
	
	
	public static final Integer ID_ESTATUS_CONSULTA_ACTIVIDAD_REGISTRADA = 1;
	public static final Integer ID_ESTATUS_CONSULTA_ACTIVIDAD_COMPLETA = 2;
	
	public static final Integer ID_ESTATUS_CURSO_PENDIENTE = 0;
	public static final Integer ID_ESTATUS_CURSO_INSCRITO = 1;
	public static final Integer ID_ESTATUS_CURSO_APROVADO = 2;
	public static final Integer ID_ESTATUS_CURSO_NOVISIBLE = 3;
	
	public static final Integer ID_EMPRESA_MDL = 1;
	public static final Integer ID_EMPRESA_TOY = 2;
	public static final Integer ID_EMPRESA_MIT = 3;
	public static final Integer ID_EMPRESA_CMMDM = 5;
	public static final Integer ID_EMPRESA_LMEX = 6;
	public static final Integer ID_EMPRESA_AA = 7;
	
	// Tipo transacciones almacenar imagenes 
	public static final String IMAGEN_DOCUMENTO = "documento";
	public static final String IMAGEN_RFC = "rfc";
	public static final String IMAGEN_CURP = "curp";
	/** Metodos para los servicios */
	public static final int GET = 1;
	public static final int POST = 2;
	public static final int DELETE = 3;
	//
	public static final String SERVICE_DOCUMENT = "serviceDocument";
	
	public static final Integer TIPO_CARPETA_REPOSITORIO = 1;
	public static final Integer TIPO_DOCUMENTO_REPOSITORIO = 2;
	
	public static final Integer ID_ESTATUS_CONSULTA_INSUMOS_SOLICITADA = 1;
	public static final Integer ID_ESTATUS_CONSULTA_INSUMOS_EN_PROCESO = 2;
	public static final Integer ID_ESTATUS_CONSULTA_INSUMOS_ATENDIDA = 3;
	
	
	public static final Integer ID_ESTATUS_PUESTO_INACTIVO = 0;
	public static final Integer ID_ESTATUS_PUESTO_ACTIVO = 1;
	public static final Integer ID_ESTATUS_PUESTO_ALTA_SIN_VALIDAR = 3;
	public static final Integer ID_ESTATUS_PUESTO_BAJA_SIN_VALIDAR = 4;
	public static final Integer ID_ESTATUS_PUESTO_RECHAZADO = 5;
	public static final Integer ID_ESTATUS_PUESTO_PRINCIPAL = 6;

	public static final Integer ID_ESTATUS_MESA_NUEVO = 1;
	public static final Integer ID_ESTATUS_MESA_VALIDADO = 2;
	public static final Integer ID_ESTATUS_MESA_RECHAZADO = 3;

	public static final Integer ID_TIPO_MESA_FUNCIONARIO_NUEVO = 1;
	public static final Integer ID_TIPO_MESA_FUNCIONARIO_MODIFICADO = 2;
	public static final Integer ID_TIPO_MESA_FUNCIONARIO_REINGRESO = 3;
	public static final Integer ID_TIPO_MESA_FUNCIONARIO_BAJA = 4;
	public static final Integer ID_TIPO_MESA_FUNCIONARIO_NUEVO_PUESTO = 5;
	public static final Integer ID_TIPO_MESA_FUNCIONARIO_BAJA_PUESTO = 6;
	public static final Integer ID_TIPO_MESA_FUNCIONARIO_NUEVO_PRINCIPAL = 7;
	
	//notificaciones mesa de control
	public static final String TITULO_NOTIFICACION_FUNCIONARIO_RECHAZADO = "Funcionario rechazado";
	public static final String MENSAJE_NOTIFICACION_FUNCIONARIO_RECHAZADO = "Se rechazo el alta del funcionario {RFC} por el siguiente motivo: {motivo}";
	public static final String TITULO_NOTIFICACION_BAJA_FUNCIONARIO_RECHAZADO = "Baja de funcionario rechazado";
	public static final String MENSAJE_NOTIFICACION_BAJA_FUNCIONARIO_RECHAZADO = "Se rechazo la baja del funcionario {RFC} por el siguiente motivo: {motivo}";
	public static final String TITULO_NOTIFICACION_PUESTO_RECHAZADO = "Nuevo puesto rechazado";
	public static final String MENSAJE_NOTIFICACION_PUESTO_RECHAZADO = "Se rechazo el nuevo puesto \"{puesto} - {dealer}\" del funcionario {RFC} por el siguiente motivo: {motivo}";
	public static final String TITULO_NOTIFICACION_BAJA_PUESTO_RECHAZADO = "Baja de puesto rechazado";
	public static final String MENSAJE_NOTIFICACION_BAJA_PUESTO_RECHAZADO = "Se rechazo la baja del puesto \"{puesto} - {dealer}\" del funcionario {RFC} por el siguiente motivo: {motivo}";
	public static final String TITULO_NOTIFICACION_MODIFICACION_FUNCIONARIO_RECHAZADO = "Cambios en funcionario rechazados";
	public static final String MENSAJE_NOTIFICACION_MODIFICACION_FUNCIONARIO_RECHAZADO = "Se rechazaron las modificaciones al funcionario {RFC} por el siguiente motivo: {motivo}";
	
	
	public static final Integer ID_ESTATUS_CONTACTO_NUEVO = 1;
	public static final Integer ID_ESTATUS_CONTACTO_LEIDO = 2;
	
	//nombre de las hojas de los catalogos
		public static final String NOMBRE_HOJA_EMPRESAS = "Empresas";
		public static final String NOMBRE_HOJA_GRUPO_PUESTOS="GrupoPuesto";
		public static final String NOMBRE_HOJA_PUESTOS="PuestoS";
		public static final String NOMBRE_HOJA_TIPO_DEALER="TipoDealer";
		public static final String NOMBRE_HOJA_NIVELES_DEALER="NivelesDealer";
		public static final String NOMBRE_HOJA_GRUPO_DEALER="GrupoDealer";
		public static final String NOMBRE_HOJA_ZONA="Zona";
		public static final String NOMBRE_HOJA_SEDES="Sedes";
		public static final String NOMBRE_HOJA_IDIOMAS="Idiomas";
		public static final String NOMBRE_HOJA_DEALER="Dealer";
		public static final String NOMBRE_HOJA_GRUPOS_CONTACTO="GrupoContacto";
		public static final String NOMBRE_HOJA_INSTRUCTORES="Instructores";
		public static final String NOMBRE_HOJA_DIAS_INHABILES="DiasInhabiles";
		public static final String NOMBRE_HOJA_MOTIVOS_CONTACTO="MotivosContacto";
		public static final String NOMBRE_HOJA_PROYECTOS="Proyectos";
		public static final String NOMBRE_HOJA_MOTIVOS_CANCELACIONES="MotivosCancelaciones";
		public static final String NOMBRE_HOJA_MOTIVOS_CANCELACIONES_CURSOS="MotivosCancelacionesCursos";
		public static final String NOMBRE_HOJA_TIPO_REPORTES="TipoReportes";
		public static final String NOMBRE_HOJA_FUNCIONARIOS="Funcionarios";
		public static final String NOMBRE_HOJA_CURSOS="Cursos";
		public static final String NOMBRE_HOJA_CERTIFICADOS="Certificados";
		public static final String NOMBRE_HOJA_PLANES_CARRERA="PlanesCarrera";
		
		//nombre de los catalogos 
		public static final String FILE_CATALOGO_EMPRESAS = "CatalogoEmpresas";
		public static final String FILE_CATALOGO_GRUPO_PUESTOS = "CatalogoGrupoPuesto";
		public static final String FILE_CATALOGO_PUESTOS = "CatalogoPuestos";
		public static final String FILE_CATALOGO_TIPO_DEALER = "CatalogoTipoDealer";
		public static final String FILE_CATALOGO_NIVELES_DEALER="CatalogoNivelesDealer";
		public static final String FILE_CATALOGO_GRUPO_DEALER="CatalogoGrupoDealer";
		public static final String FILE_CATALOGO_ZONA="CatalogoZona";
		public static final String FILE_CATALOGO_SEDES="CatalogoSedes";
		public static final String FILE_CATALOGO_IDIOMAS="CatalogoIdiomas";
		public static final String FILE_CATALOGO_DEALER="CatalogoDealer";
		public static final String FILE_CATALOGO_GRUPOS_CONTACTO="CatalogoGrupoContacto";
		public static final String FILE_CATALOGO_INSTRUCTORES="CatalogoInstructores";
		public static final String FILE_CATALOGO_DIAS_INHABILES="CatalogoDiasInhabiles";
		public static final String FILE_CATALOGO_MOTIVOS_CONTACTO="CatalogoMotivosContacto";
		public static final String FILE_CATALOGO_PROYECTOS="CatalogoProyectos";
		public static final String FILE_CATALOGO_MOTIVOS_CANCELACIONES="CatalogoMotivosCancelaciones";
		public static final String FILE_CATALOGO_MOTIVOS_CANCELACIONES_CURSOS="CatalogoMotivosCancelacionesCursos";
		public static final String FILE_CATALOGO_TIPO_REPORTES="CatalogoTipoReportes";
		public static final String FILE_CATALOGO_FUNCIONARIOS="CatalogoFuncionarios";
		public static final String FILE_CATALOGO_CURSOS="CatalogoCursos";
		public static final String FILE_CATALOGO_CERTIFICADOS="CatalogoCertificados";
		public static final String FILE_CATALOGO_PLANES_CARRERA="CatalogoPlanesCarrera";
		
		//nombre de los modulos
		public static final String MODULO_AGENDA="Agenda";
		public static final String MODULO_MI_CARRERA="MiCarrera";
		public static final String MODULO_CALIFICACIONES="Calificaciones";
		
		//Tipo de platilla
		public static final Integer ID_TIPO_PLANTILLA_PLAN_CARRERA = 1;
		public static final Integer ID_TIPO_PLANTILLA_CERTIFICADO = 2;
		public static final Integer ID_TIPO_PLANTILLA_CURSO = 3;
		
		public static final Integer ID_MOTIVO_CANCELA_BAJA_MEGA = 19;
		public static final Integer ID_MOTIVO_CANCELA_BAJA_TOY = 20;
		public static final Integer ID_MOTIVO_CANCELA_BAJA_MIT = 2;
		public static final Integer ID_MOTIVO_CANCELA_BAJA_CMMDM = 21;
		
		//nombre de los reportes
		public static final String NAME_REPORT_CER_AS="Cer AS ";
		public static final String NAME_REPORT_CER_AS_SPP="Cer AS SPP ";
		public static final String NAME_REPORT_CER_TEC_SPP="Cer TEC ";
		public static final String NAME_REPORT_CER_TEC="Cer TEC ";
		public static final String NAME_REPORT_CER_TEC_KPIS_SPP="Cer TEC KPIS ";
		public static final String NAME_REPORT_CER_TEC_KPIS="Cer TEC KPIS ";
		public static final String NAME_REPORT_CER_TEC_MENSUAL_SPP="Cer TEC MENSUAL ";
		public static final String NAME_REPORT_CER_TEC_MENSUAL="Cer TEC MENSUAL ";
		public static final String NAME_REPORT_CER_TEC_SKILL_SPP="Cer TEC SKILL ";
		public static final String NAME_REPORT_CER_TEC_SKILL="Cer TEC SKILL ";
		
		//nombre nivel reporte
		public static final String NAME_NIVEL_GENERAL="General";
		public static final String NAME_NIVEL_BASICO="Basico";
		public static final String NAME_NIVEL_AVANZADO="Avanzado";
		public static final String NAME_NIVEL_MANTENIMIENTO="Mantenimiento";
		public static final String NAME_NIVEL_REPARACION_MOTORES="Reparación de Motores";
		public static final String NAME_NIVEL_REPARACIONES_ELECTRICAS="Reparación Eléctricas";
		public static final String NAME_NIVEL_REPARACION_HIBRIDOS="Reparación de Híbridos";
		public static final String NAME_NIVEL_REPARACION_CHASIS="Reparación de Chasis";
		public static final String NAME_NIVEL_REPARACION_TREN_MOTRIZ="Reparación de Tren Motriz";
		public static final String NAME_NIVEL_DIAGNOSTICO_MOTORES="Diagnóstico de Motores";
		public static final String NAME_NIVEL_DIAGNOSTICO_ELECTRICO="Diagnóstico Eléctrico";
		public static final String NAME_NIVEL_DIAGNOSTICO_CHASIS="Diagnóstico de Chasis";
		public static final String NAME_NIVEL_DIAGNOSTICO_TREN_MOTRIZ="Diagnóstico de Tren Motriz";
		public static final String NAME_NIVEL_DIAGNOSTICO_REPARACION_HIBRIDOS="Diagnóstico y Reparación de Híbridos";
		public static final String NAME_NIVEL_MDT="MDT";
		public static final String NAME_NIVEL_REPARACION_FASE_1="Reparación Fase 1";
		public static final String NAME_NIVEL_REPARACION_FASE_2="Reparación Fase 2";
		public static final String NAME_NIVEL_REPARACION_FASE_3="Reparación Fase 3";
		public static final String NAME_NIVEL_REPARACION="Reparación";
		public static final String NAME_NIVEL_DIAGNOSTICO_FASE_1="Diagnóstico Fase 1";
		public static final String NAME_NIVEL_DIAGNOSTICO_FASE_2="Diagnóstico Fase 2";
		public static final String NAME_NIVEL_DIAGNOSTICO_FASE_3="Diagnóstico Fase 3";
		public static final String NAME_NIVEL_DIAGNOSTICO="Diagnóstico";
		public static final String NAME_NIVEL_NCF="NCF";
		
		public static final String ZONA_FTS = "FTS";
}







