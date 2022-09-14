-- DataBase: disofgis_035
-- Schema:
    -- desarrollo
    -- produccion

CREATE SCHEMA desarrollo;

---------------------------------------
-- desarrollo.tbl_cata_perfil
---------------------------------------

create table desarrollo.tbl_cata_perfil
(
  cve_perfil serial NOT NULL,
  nombre character varying(20) NOT NULL,
  ban_activo integer NOT NULL,

  CONSTRAINT tbl_cata_perfil_pkey PRIMARY KEY (cve_perfil)
);

---------------------------------------
-- desarrollo.tbl_cata_menu
---------------------------------------

create table desarrollo.tbl_cata_menu
(
  cve_menu serial NOT NULL,
  nombre character varying(20) NOT NULL,
  orden integer NOT NULL,
  ban_activo integer NOT NULL,
  CONSTRAINT tbl_cata_menu_pkey PRIMARY KEY (cve_menu)
);

---------------------------------------
-- desarrollo.tbl_perfil_menu
---------------------------------------

create table desarrollo.tbl_perfil_menu
(
  cve_perfil_menu serial NOT NULL,
  id_perfil integer NOT NULL,
  id_menu integer NOT NULL,
  id_usuario_crea integer NOT NULL,
  id_usuario_modifica integer,
  fch_creacion timestamp without time zone NOT NULL DEFAULT now(),
  fch_modificacion timestamp without time zone,

  CONSTRAINT tbl_perfil_menu_pkey PRIMARY KEY (cve_perfil_menu),

  CONSTRAINT fkey_tbl_perfil_menu_tbl_cata_perfil_id FOREIGN KEY (id_perfil)
      REFERENCES desarrollo.tbl_cata_perfil (cve_perfil) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,

  CONSTRAINT fkey_tbl_perfil_menu_tbl_cata_menu_id FOREIGN KEY (id_menu)
      REFERENCES desarrollo.tbl_cata_menu (cve_menu) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

---------------------------------------
-- desarrollo.tbl_usuarios
---------------------------------------

create table desarrollo.tbl_usuarios
(
  cve_usuario serial NOT NULL,
  usuario character varying(100) NOT NULL,
  contrasena character varying(200) NOT NULL,
  nombre character varying(100),
  email character varying(80) NOT NULL,
  id_perfil integer NOT NULL,
  id_usuario_crea integer NOT NULL,
  id_usuario_modifica integer,
  fch_creacion timestamp without time zone NOT NULL DEFAULT now(),
  fch_modificacion timestamp without time zone,
  estatus integer NOT NULL,
  ban_activo integer NOT NULL,

  CONSTRAINT tbl_usuarios_pkey PRIMARY KEY (cve_usuario),

  CONSTRAINT fkey_tbl_usuarios_tbl_cata_perfil_id FOREIGN KEY (id_perfil)
      REFERENCES desarrollo.tbl_cata_perfil (cve_perfil) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

---------------------------------------
-- desarrollo.tbl_cata_giros
---------------------------------------

create table desarrollo.tbl_cata_giros
(
  cve_giro serial NOT NULL,
  nombre character varying(100) NOT NULL,
  ban_activo integer NOT NULL,

  CONSTRAINT tbl_cata_giro_pkey PRIMARY KEY (cve_giro)
);

---------------------------------------
-- desarrollo.tbl_cata_estados_republica
---------------------------------------

create table desarrollo.tbl_cata_estados_republica
(
  cve_estado_republica serial NOT NULL,
  nombre character varying(100) NOT NULL,
  ban_activo integer NOT NULL,

  CONSTRAINT tbl_cata_estados_republica_pkey PRIMARY KEY (cve_estado_republica)
);

---------------------------------------
-- desarrollo.tbl_centros_trabajo
---------------------------------------

create table desarrollo.tbl_centros_trabajo
(
  cve_centro_trabajo serial NOT NULL,
  nombre character varying(300) NOT NULL,
  empleados_numero integer NOT NULL,
  id_usuario integer NOT NULL,
  id_giro integer NOT NULL,
  id_estado_republica integer NOT NULL,
  fac_nombre character varying(100),
  fac_rfc character varying(20),
  fac_pais character varying(50),
  fac_estado character varying(50),
  fac_municipio character varying(50),
  fac_colonia character varying(50),
  fac_calle character varying(100),
  fac_numero_exterior character varying(10),
  fac_numero_interior character varying(10),
  fac_cp character varying(10),
  fac_telefono character varying(20),
  id_usuario_crea integer NOT NULL,
  id_usuario_modifica integer,
  fch_creacion timestamp without time zone NOT NULL DEFAULT now(),
  fch_modificacion timestamp without time zone,
  ban_activo integer NOT NULL,

  CONSTRAINT tbl_centros_trabajo_pkey PRIMARY KEY (cve_centro_trabajo),

  CONSTRAINT fkey_tbl_centros_trabajo_tbl_usuarios_id FOREIGN KEY (id_usuario)
      REFERENCES desarrollo.tbl_usuarios (cve_usuario) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,

  CONSTRAINT fkey_tbl_centros_trabajo_tbl_cata_giros_id FOREIGN KEY (id_giro)
      REFERENCES desarrollo.tbl_cata_giros (cve_giro) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,

  CONSTRAINT fkey_tbl_centros_trabajo_tbl_cata_estados_republica_id FOREIGN KEY (id_estado_republica)
      REFERENCES desarrollo.tbl_cata_estados_republica (cve_estado_republica) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

---------------------------------------
-- desarrollo.tbl_cuestionarios
---------------------------------------

create table desarrollo.tbl_cuestionarios
(
  cve_cuestionario serial NOT NULL,
  nombre character varying(200),
  titulo character varying(1000),
  descripcion character varying(1000),
  empleados_rango_inicial integer NOT NULL,
  empleados_rango_final integer NOT NULL,
  orden integer NOT NULL,
  dias_limite_actividad integer NOT NULL,
  id_usuario_crea integer NOT NULL,
  id_usuario_modifica integer,
  fch_creacion timestamp without time zone NOT NULL DEFAULT now(),
  fch_modificacion timestamp without time zone,
  ban_activo integer NOT NULL,

  CONSTRAINT tbl_cuestionarios_pkey PRIMARY KEY (cve_cuestionario)
);

---------------------------------------
-- desarrollo.tbl_cata_preguntas_tipo
---------------------------------------

create table desarrollo.tbl_cata_preguntas_tipo
(
  cve_pregunta_tipo serial NOT NULL,
  nombre character varying(50) NOT NULL,
  ban_activo integer NOT NULL,

  CONSTRAINT tbl_cata_preguntas_tipo_pkey PRIMARY KEY (cve_pregunta_tipo)
);

---------------------------------------
-- desarrollo.tbl_preguntas
---------------------------------------

create table desarrollo.tbl_preguntas
(
  cve_pregunta serial NOT NULL,
  id_cuestionario integer NOT NULL,
  id_pregunta_tipo integer NOT NULL,
  seccion character varying(200),
  nombre character varying(200) NOT NULL,
  titulo character varying(1000),
  descripcion character varying(1000),
  orden integer NOT NULL,
  id_usuario_crea integer NOT NULL,
  id_usuario_modifica integer,
  fch_creacion timestamp without time zone NOT NULL DEFAULT now(),
  fch_modificacion timestamp without time zone,
  ban_activo integer NOT NULL,

  CONSTRAINT tbl_preguntas_pkey PRIMARY KEY (cve_pregunta),

  CONSTRAINT fkey_tbl_preguntas_tbl_cuestionarios_id FOREIGN KEY (id_cuestionario)
      REFERENCES desarrollo.tbl_cuestionarios (cve_cuestionario) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,

  CONSTRAINT fkey_tbl_preguntas_tbl_cata_preguntas_tipo_id FOREIGN KEY (id_pregunta_tipo)
      REFERENCES desarrollo.tbl_cata_preguntas_tipo (cve_pregunta_tipo) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

---------------------------------------
-- desarrollo.tbl_respuestas
---------------------------------------

create table desarrollo.tbl_respuestas
(
  cve_respuesta serial NOT NULL,
  id_pregunta integer NOT NULL,
  nombre character varying(200) NOT NULL,
  orden integer NOT NULL,
  id_usuario_crea integer NOT NULL,
  id_usuario_modifica integer,
  fch_creacion timestamp without time zone NOT NULL DEFAULT now(),
  fch_modificacion timestamp without time zone,
  ban_activo integer NOT NULL,

  CONSTRAINT tbl_respuestas_pkey PRIMARY KEY (cve_respuesta),

  CONSTRAINT fkey_tbl_respuestas_tbl_preguntas_id FOREIGN KEY (id_pregunta)
      REFERENCES desarrollo.tbl_preguntas (cve_pregunta) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

---------------------------------------
-- desarrollo.tbl_productos
---------------------------------------

create table desarrollo.tbl_productos
(
  cve_producto serial NOT NULL,
  id_cuestionario integer NOT NULL,
  nombre character varying(200) NOT NULL,
  precio numeric(10,2) NOT NULL,
  empleados_rango_inicial integer NOT NULL,
  empleados_rango_final integer NOT NULL,
  id_usuario_crea integer NOT NULL,
  id_usuario_modifica integer,
  fch_creacion timestamp without time zone NOT NULL DEFAULT now(),
  fch_modificacion timestamp without time zone,
  ban_activo integer NOT NULL,

  CONSTRAINT tbl_productos_pkey PRIMARY KEY (cve_producto),

  CONSTRAINT fkey_tbl_productos_tbl_cuestionarios_id FOREIGN KEY (id_cuestionario)
      REFERENCES desarrollo.tbl_cuestionarios (cve_cuestionario) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

---------------------------------------
-- desarrollo.tbl_cata_compra_estatus
---------------------------------------

create table desarrollo.tbl_cata_compra_estatus
(
  cve_compra_estatus serial NOT NULL,
  nombre character varying(50) NOT NULL,
  ban_activo integer NOT NULL,

  CONSTRAINT tbl_cata_compra_estatus_pkey PRIMARY KEY (cve_compra_estatus)
);

---------------------------------------
-- desarrollo.tbl_producto_comprado
---------------------------------------

create table desarrollo.tbl_producto_comprado
(
  cve_producto_comprado serial NOT NULL,
  id_centro_trabajo integer NOT NULL,
  id_producto integer NOT NULL,
  codigo character varying(20),
  ruta_respuesta character varying(200),
  numero_referencia_pago character varying(50),
  costo numeric(10,2) NOT NULL,
  iva numeric(10,2),
  total numeric(10,2),
  id_usuario_crea integer NOT NULL,
  id_usuario_modifica integer,
  fch_creacion timestamp without time zone NOT NULL DEFAULT now(),
  fch_modificacion timestamp without time zone,
  id_compra_estatus integer NOT NULL,
  order_id character varying,

  CONSTRAINT tbl_producto_comprado_pkey PRIMARY KEY (cve_producto_comprado),

  CONSTRAINT fkey_tbl_producto_comprado_tbl_centros_trabajo_id FOREIGN KEY (id_centro_trabajo)
      REFERENCES desarrollo.tbl_centros_trabajo (cve_centro_trabajo) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,

  CONSTRAINT fkey_tbl_producto_comprado_tbl_productos_id FOREIGN KEY (id_producto)
      REFERENCES desarrollo.tbl_productos (cve_producto) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,

  CONSTRAINT fkey_tbl_producto_comprado_tbl_cata_compra_estatus_id FOREIGN KEY (id_compra_estatus)
      REFERENCES desarrollo.tbl_cata_compra_estatus (cve_compra_estatus) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

---------------------------------------
-- desarrollo.tbl_actividades
---------------------------------------

create table desarrollo.tbl_actividades
(
  cve_actividad serial NOT NULL,
  id_cuestionario integer NOT NULL,
  id_centro_trabajo integer NOT NULL,
  ruta_cuestionario character varying(200),
  id_usuario_crea integer NOT NULL,
  id_usuario_modifica integer,
  fch_creacion timestamp without time zone NOT NULL DEFAULT now(),
  fch_modificacion timestamp without time zone,
  fch_fin timestamp without time zone,

  CONSTRAINT tbl_actividades_pkey PRIMARY KEY (cve_actividad),

  CONSTRAINT fkey_tbl_actividades_tbl_cuestionarios_id FOREIGN KEY (id_cuestionario)
      REFERENCES desarrollo.tbl_cuestionarios (cve_cuestionario) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,

  CONSTRAINT fkey_tbl_actividades_tbl_ccentro_trabajo_id FOREIGN KEY (id_centro_trabajo)
      REFERENCES desarrollo.tbl_centros_trabajo (cve_centro_trabajo) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

---------------------------------------
-- desarrollo.tbl_actividades_resueltas
---------------------------------------

create table desarrollo.tbl_actividades_resueltas
(
  cve_actividad_resuelta serial NOT NULL,
  id_actividad integer NOT NULL,
  nombre character varying(100) NOT NULL,
  paterno character varying(100) NOT NULL,
  materno character varying(100) NOT NULL,
  fch_creacion timestamp without time zone NOT NULL DEFAULT now(),
  estatus integer NOT NULL,

  CONSTRAINT tbl_actividades_resueltas_pkey PRIMARY KEY (cve_actividad_resuelta),

  CONSTRAINT fkey_tbl_actividades_resueltas_tbl_actividades_id FOREIGN KEY (id_actividad)
      REFERENCES desarrollo.tbl_actividades (cve_actividad) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);

---------------------------------------
-- desarrollo.tbl_preguntas_resueltas
---------------------------------------

create table desarrollo.tbl_preguntas_resueltas
(
  cve_pregunta_resuelta serial NOT NULL,
  id_actividad_resuelta integer NOT NULL,
  id_pregunta integer NOT NULL,
  id_respuesta integer,
  respuesta_abierta character varying(1000),
  fch_creacion timestamp without time zone NOT NULL DEFAULT now(),

  CONSTRAINT tbl_preguntas_resueltas_pkey PRIMARY KEY (cve_pregunta_resuelta),

  CONSTRAINT fkey_tbl_preguntas_resueltas_tbl_actividades_resueltas_id FOREIGN KEY (id_actividad_resuelta)
      REFERENCES desarrollo.tbl_actividades_resueltas (cve_actividad_resuelta) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,

  CONSTRAINT fkey_tbl_preguntas_resueltas_tbl_preguntas_id FOREIGN KEY (id_pregunta)
      REFERENCES desarrollo.tbl_preguntas (cve_pregunta) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,

  CONSTRAINT fkey_tbl_preguntas_resueltas_tbl_respuestas_id FOREIGN KEY (id_respuesta)
      REFERENCES desarrollo.tbl_respuestas (cve_respuesta) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
);


---------------------------------------
-- public.persistent_logins
---------------------------------------
-- Table: public.persistent_logins

-- DROP TABLE public.persistent_logins;

CREATE TABLE public.persistent_logins
(
    username character varying(64) NOT NULL,
    series character varying(64) NOT NULL,
    token character varying(64) NOT NULL,
    last_used timestamp without time zone NOT NULL,
    CONSTRAINT persistent_logins_pkey PRIMARY KEY (series)
)
