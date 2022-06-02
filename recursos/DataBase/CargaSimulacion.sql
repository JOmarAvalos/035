
/*** Alta de cliente ***/
INSERT INTO desarrollo.tbl_usuarios (usuario, contrasena, nombre, email, id_perfil, id_usuario_crea, fch_creacion, estatus, ban_activo)
  VALUES ('CLIENTE01', '2758d92e216577218ec0c153d3b54dd2', 'RICARDO GONZALES', 'rgonzalez@mail.com', 2, 1, now(), 2, 1);

INSERT INTO desarrollo.tbl_usuarios (usuario, contrasena, nombre, email, id_perfil, id_usuario_crea, fch_creacion, estatus, ban_activo)
  VALUES ('CLIENTE02', '2758d92e216577218ec0c153d3b54dd2', 'MARIO GARCIA', 'mgarcia@mail.com', 2, 1, now(), 2, 1);

INSERT INTO desarrollo.tbl_usuarios (usuario, contrasena, nombre, email, id_perfil, id_usuario_crea, fch_creacion, estatus, ban_activo)
  VALUES ('CLIENTE03', '2758d92e216577218ec0c153d3b54dd2', 'ALEJANDRO DURAN', 'raduran@mail.com', 2, 1, now(), 2, 1);



/*** Alta de centro de trabajo ***/
INSERT INTO desarrollo.tbl_centros_trabajo (nombre, empleados_numero, id_usuario, id_giro, id_estado_republica, id_usuario_crea, fch_creacion, ban_activo)
  VALUES ('CENTRO DE TRABAJO 1', 10, 2, 1, 5, 1, now(), 1);

INSERT INTO desarrollo.tbl_centros_trabajo (nombre, empleados_numero, id_usuario, id_giro, id_estado_republica, id_usuario_crea, fch_creacion, ban_activo)
  VALUES ('CENTRO DE TRABAJO 2', 20, 3, 1, 5, 1, now(), 1);

INSERT INTO desarrollo.tbl_centros_trabajo (nombre, empleados_numero, id_usuario, id_giro, id_estado_republica, id_usuario_crea, fch_creacion, ban_activo)
  VALUES ('CENTRO DE TRABAJO 3', 60, 4, 1, 5, 1, now(), 1);



/*** Alta de actividades ***/
INSERT INTO desarrollo.tbl_actividades (id_cuestionario, ruta_cuestionario, id_usuario_crea, fch_creacion) 
  VALUES (1, 'https://app.035.com.mx/Admin035/cuestionarios/01', 2, now());

INSERT INTO desarrollo.tbl_actividades (id_cuestionario, ruta_cuestionario, id_usuario_crea, fch_creacion) 
  VALUES (2, 'https://app.035.com.mx/Admin035/cuestionarios/02', 3, now());

INSERT INTO desarrollo.tbl_actividades (id_cuestionario, ruta_cuestionario, id_usuario_crea, fch_creacion) 
  VALUES (3, 'https://app.035.com.mx/Admin035/cuestionarios/03', 4, now());

/*** Alta de actividades resuelta ***/
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (1, 'MARIO', 'CORTEZ', 'OCHOA', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (1, 'HUGO', 'DUARTE', 'ESPINOZA', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (1, 'MIGUEL', 'DIAZ', 'CASTRO', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (1, 'MARC', 'RIVAS', 'RIVERA', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (1, 'CARLOS', 'VARGAS', 'VERA', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (1, 'LUCIA', 'PEREIRA', 'MARTINEZ', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (1, 'SOFIA', 'GUTIERREZ', 'HERNANDEZ', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (1, 'MARIA', 'FLORES', 'MACIAS', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (1, 'EMMA', 'BENTEZ', 'CASTILLO', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (1, 'VALERIA', 'ALVAREZ', 'ANDRADE', now(), 1);


INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (2, 'PAULINA', 'VILLANUEVA', 'ORTIZ', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (2, 'PALOMA', 'AVALOS', 'ORTIZ', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (2, 'ANGELA', 'TORRES', 'VARGAS', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (2, 'FATIMA', 'SOTO', 'CATAÑON', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (2, 'JULIA', 'MARTINEZ', 'LOPEZ', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (2, 'ALBA', 'SILVA', 'SOSA', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (2, 'ANAHI', 'ROJAS', 'MARTINEZ', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (2, 'KARLA', 'MARTINEZ', 'FRIAS', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (2, 'ELENA', 'MARTINEZ', 'CASILLAS', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (2, 'GABRIELA', 'ESPINO', 'GARZA', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (2, 'MATEO', 'GARCIA', 'LOPEZ', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (2, 'ALVARO', 'SOSA', 'SANCHEZ', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (2, 'ADRIAN', 'SALAZAR', 'ANDRADE', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (2, 'MARCOS', 'PINEDA', 'GARAY', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (2, 'MANUEL', 'ROCA', 'OROZCO', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (2, 'NICOLAS', 'VILLA', 'OTHON', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (2, 'ZAID', 'MORENO', 'MORALES', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (2, 'IBRAHIM', 'HERNADEZ', 'ACOSTA', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (2, 'OMAR', 'PEREZ', 'AVALOS', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (2, 'LEONARDO', 'ARROYO', 'CORONA', now(), 1);


INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (3, 'SARA', 'SOSA', 'SANCHEZ', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (3, 'TATIANA', 'MARTINEZ', 'CALDERON', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (3, 'ROCIO', 'MARTINEZ', 'CASILLAS', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (3, 'VALENTINA', 'ALVAREZ', 'SOSA', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (3, 'PAULA', 'PEREZ', 'GUTIERREZ', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (3, 'FLORENCIA', 'PEÑA', 'LOPEZ', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (3, 'FLORA', 'GONZALEZ', 'DURAN', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (3, 'ISELA', 'VEGA', 'VARGAZ', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (3, 'IVET', 'GARCIA', 'RODRIGUEZ', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (3, 'IRMA', 'DIAZ', 'CASTRO', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (3, 'CECILIA', 'SANCHEZ', 'TORRES', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (3, 'DOLORES', 'MARTINEZ', 'PEREZ', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (3, 'EDNA', 'MODA', 'MORAN', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (3, 'FABIOLA', 'PINEDA', 'ORTEGA', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (3, 'GRETA', 'GARCIA', 'SANCEHZ', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (3, 'MARIELA', 'CARDENAS', 'DONDE', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (3, 'MERCEDES', 'NAJERA', 'ORTIZ', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (3, 'MAGDALENA', 'DURCAL', 'GARCIA', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (3, 'ALICIA', 'LOPEZ', 'LOPEZ', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (3, 'GLADIS', 'LEON', 'MORAN', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (3, 'BELEN', 'LOPEZ', 'HERNADEZ', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (3, 'CARMEN', 'MUÑOS', 'ORDAZ', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (3, 'PILAR', 'RIVA', 'REYES', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (3, 'OLGA', 'ORDOÑEZ', 'SALDIVAR', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (3, 'OFELIA', 'SALAZAR', 'ROJAS', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (3, 'SANDRA', 'REYNA', 'VILLANUEVA', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (3, 'ROSALIA', 'SANCHEZ', 'SALAZAR', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (3, 'SILVIA', 'GARCIA', 'MARTIN', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (3, 'SUSANA', 'LOPEZ', 'SANTANA', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (3, 'TERESA', 'MORELOS', 'MORELOS', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (3, 'DAVID', 'ORTIZ', 'MADERO', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (3, 'DIEGO', 'CEBALLOS', 'GARCIA', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (3, 'BERNARDO', 'MORA', 'MORELOS', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (3, 'MARIO', 'GARCIA', 'HERNANDEZ', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (3, 'JAVIER', 'MATUK', 'GUTIERREZ', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (3, 'SERGIO', 'GARCIA', 'GARCIA', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (3, 'IVAN', 'ARROYO', 'SANCHEZ', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (3, 'JOSE', 'ALVARADO', 'DURAN', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (3, 'RAFAEL', 'SOTO', 'LUNA', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (3, 'LUCAS', 'LOBOS', 'GARCIA', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (3, 'DANIEL', 'ORTIZ', 'GARCIA', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (3, 'ARTURO', 'GUTIERREZ', 'CEBALLOS', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (3, 'ISRAEL', 'ORDAS', 'ORTIZ', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (3, 'IGNACIO', 'PEREZ', 'PEREZ', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (3, 'ANTONIO', 'PEREZ', 'MARTINEZ', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (3, 'ROBERTO', 'DE LEON', 'SOTO', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (3, 'DANIEL', 'AVALOS', 'MARTINEZ', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (3, 'BENJAMIN', 'HERNANDEZ', 'PEREZ', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (3, 'OLIVER', 'ANDRADE', 'ARTEAGA', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (3, 'JULIAN', 'SEBASTIAN', 'HERNANDEZ', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (3, 'MATIAS', 'MATEO', 'LOPEZ', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (3, 'ANGEL', 'SOTO', 'PADILLA', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (3, 'JOSE', 'AVALOS', 'MANRIQUEZ', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (3, 'OCTAVIO', 'CEROS', 'GUDIÑO', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (3, 'VICTOR', 'HERAS', 'ANDRADE', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (3, 'HUGO', 'LOPEZ', 'CASTRO', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (3, 'ERICK', 'MERLO', 'MARTIN', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (3, 'ANDRES', 'PUENTE', 'GARCIA', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (3, 'SANTIAGO', 'SOLIS', 'ORTIZ', now(), 1);
INSERT INTO desarrollo.tbl_actividades_resueltas (id_actividad, nombre, paterno, materno, fch_creacion, estatus) 
  VALUES (3, 'GABRIEL', 'MALACARA', 'CARDENAS', now(), 1);


/*** Alta de preguntas resuelta ***/
INSERT INTO desarrollo.tbl_preguntas_resueltas (id_actividad_resuelta, id_pregunta, id_respuesta, respuesta_abierta, fch_creacion) 
  VALUES (1, 1, 2, '', now()); 
INSERT INTO desarrollo.tbl_preguntas_resueltas (id_actividad_resuelta, id_pregunta, id_respuesta, respuesta_abierta, fch_creacion) 
  VALUES (2, 1, 2, '', now()); 
INSERT INTO desarrollo.tbl_preguntas_resueltas (id_actividad_resuelta, id_pregunta, id_respuesta, respuesta_abierta, fch_creacion) 
  VALUES (3, 1, 2, '', now()); 
INSERT INTO desarrollo.tbl_preguntas_resueltas (id_actividad_resuelta, id_pregunta, id_respuesta, respuesta_abierta, fch_creacion) 
  VALUES (4, 1, 2, '', now()); 
INSERT INTO desarrollo.tbl_preguntas_resueltas (id_actividad_resuelta, id_pregunta, id_respuesta, respuesta_abierta, fch_creacion) 
  VALUES (5, 1, 2, '', now()); 
INSERT INTO desarrollo.tbl_preguntas_resueltas (id_actividad_resuelta, id_pregunta, id_respuesta, respuesta_abierta, fch_creacion) 
  VALUES (6, 1, 2, '', now()); 
INSERT INTO desarrollo.tbl_preguntas_resueltas (id_actividad_resuelta, id_pregunta, id_respuesta, respuesta_abierta, fch_creacion) 
  VALUES (7, 1, 2, '', now()); 
INSERT INTO desarrollo.tbl_preguntas_resueltas (id_actividad_resuelta, id_pregunta, id_respuesta, respuesta_abierta, fch_creacion) 
  VALUES (8, 1, 2, '', now()); 
INSERT INTO desarrollo.tbl_preguntas_resueltas (id_actividad_resuelta, id_pregunta, id_respuesta, respuesta_abierta, fch_creacion) 
  VALUES (9, 1, 2, '', now()); 
INSERT INTO desarrollo.tbl_preguntas_resueltas (id_actividad_resuelta, id_pregunta, id_respuesta, respuesta_abierta, fch_creacion) 
  VALUES (10, 1, 2, '', now()); 

INSERT INTO desarrollo.tbl_preguntas_resueltas (id_actividad_resuelta, id_pregunta, id_respuesta, respuesta_abierta, fch_creacion) 
  VALUES (1, 2, 4, '', now()); 
INSERT INTO desarrollo.tbl_preguntas_resueltas (id_actividad_resuelta, id_pregunta, id_respuesta, respuesta_abierta, fch_creacion) 
  VALUES (2, 2, 4, '', now()); 
INSERT INTO desarrollo.tbl_preguntas_resueltas (id_actividad_resuelta, id_pregunta, id_respuesta, respuesta_abierta, fch_creacion) 
  VALUES (3, 2, 4, '', now()); 
INSERT INTO desarrollo.tbl_preguntas_resueltas (id_actividad_resuelta, id_pregunta, id_respuesta, respuesta_abierta, fch_creacion) 
  VALUES (4, 2, 4, '', now()); 
INSERT INTO desarrollo.tbl_preguntas_resueltas (id_actividad_resuelta, id_pregunta, id_respuesta, respuesta_abierta, fch_creacion) 
  VALUES (5, 2, 3, '', now()); 
INSERT INTO desarrollo.tbl_preguntas_resueltas (id_actividad_resuelta, id_pregunta, id_respuesta, respuesta_abierta, fch_creacion) 
  VALUES (6, 2, 4, '', now()); 
INSERT INTO desarrollo.tbl_preguntas_resueltas (id_actividad_resuelta, id_pregunta, id_respuesta, respuesta_abierta, fch_creacion) 
  VALUES (7, 2, 4, '', now()); 
INSERT INTO desarrollo.tbl_preguntas_resueltas (id_actividad_resuelta, id_pregunta, id_respuesta, respuesta_abierta, fch_creacion) 
  VALUES (8, 2, 3, '', now()); 
INSERT INTO desarrollo.tbl_preguntas_resueltas (id_actividad_resuelta, id_pregunta, id_respuesta, respuesta_abierta, fch_creacion) 
  VALUES (9, 2, 4, '', now()); 
INSERT INTO desarrollo.tbl_preguntas_resueltas (id_actividad_resuelta, id_pregunta, id_respuesta, respuesta_abierta, fch_creacion) 
  VALUES (10, 2, 4, '', now()); 

INSERT INTO desarrollo.tbl_preguntas_resueltas (id_actividad_resuelta, id_pregunta, id_respuesta, respuesta_abierta, fch_creacion) 
  VALUES (1, 3, 6, '', now()); 
INSERT INTO desarrollo.tbl_preguntas_resueltas (id_actividad_resuelta, id_pregunta, id_respuesta, respuesta_abierta, fch_creacion) 
  VALUES (2, 3, 6, '', now()); 
INSERT INTO desarrollo.tbl_preguntas_resueltas (id_actividad_resuelta, id_pregunta, id_respuesta, respuesta_abierta, fch_creacion) 
  VALUES (3, 3, 6, '', now()); 
INSERT INTO desarrollo.tbl_preguntas_resueltas (id_actividad_resuelta, id_pregunta, id_respuesta, respuesta_abierta, fch_creacion) 
  VALUES (4, 3, 6, '', now()); 
INSERT INTO desarrollo.tbl_preguntas_resueltas (id_actividad_resuelta, id_pregunta, id_respuesta, respuesta_abierta, fch_creacion) 
  VALUES (5, 3, 6, '', now()); 
INSERT INTO desarrollo.tbl_preguntas_resueltas (id_actividad_resuelta, id_pregunta, id_respuesta, respuesta_abierta, fch_creacion) 
  VALUES (6, 3, 6, '', now()); 
INSERT INTO desarrollo.tbl_preguntas_resueltas (id_actividad_resuelta, id_pregunta, id_respuesta, respuesta_abierta, fch_creacion) 
  VALUES (7, 3, 6, '', now()); 
INSERT INTO desarrollo.tbl_preguntas_resueltas (id_actividad_resuelta, id_pregunta, id_respuesta, respuesta_abierta, fch_creacion) 
  VALUES (8, 3, 6, '', now()); 
INSERT INTO desarrollo.tbl_preguntas_resueltas (id_actividad_resuelta, id_pregunta, id_respuesta, respuesta_abierta, fch_creacion) 
  VALUES (9, 3, 6, '', now()); 
INSERT INTO desarrollo.tbl_preguntas_resueltas (id_actividad_resuelta, id_pregunta, id_respuesta, respuesta_abierta, fch_creacion) 
  VALUES (10, 3, 6, '', now()); 

INSERT INTO desarrollo.tbl_preguntas_resueltas (id_actividad_resuelta, id_pregunta, id_respuesta, respuesta_abierta, fch_creacion) 
  VALUES (1, 4, 8, '', now()); 
INSERT INTO desarrollo.tbl_preguntas_resueltas (id_actividad_resuelta, id_pregunta, id_respuesta, respuesta_abierta, fch_creacion) 
  VALUES (2, 4, 8, '', now()); 
INSERT INTO desarrollo.tbl_preguntas_resueltas (id_actividad_resuelta, id_pregunta, id_respuesta, respuesta_abierta, fch_creacion) 
  VALUES (3, 4, 8, '', now()); 
INSERT INTO desarrollo.tbl_preguntas_resueltas (id_actividad_resuelta, id_pregunta, id_respuesta, respuesta_abierta, fch_creacion) 
  VALUES (4, 4, 8, '', now()); 
INSERT INTO desarrollo.tbl_preguntas_resueltas (id_actividad_resuelta, id_pregunta, id_respuesta, respuesta_abierta, fch_creacion) 
  VALUES (5, 4, 8, '', now()); 
INSERT INTO desarrollo.tbl_preguntas_resueltas (id_actividad_resuelta, id_pregunta, id_respuesta, respuesta_abierta, fch_creacion) 
  VALUES (6, 4, 8, '', now()); 
INSERT INTO desarrollo.tbl_preguntas_resueltas (id_actividad_resuelta, id_pregunta, id_respuesta, respuesta_abierta, fch_creacion) 
  VALUES (7, 4, 8, '', now()); 
INSERT INTO desarrollo.tbl_preguntas_resueltas (id_actividad_resuelta, id_pregunta, id_respuesta, respuesta_abierta, fch_creacion) 
  VALUES (8, 4, 8, '', now()); 
INSERT INTO desarrollo.tbl_preguntas_resueltas (id_actividad_resuelta, id_pregunta, id_respuesta, respuesta_abierta, fch_creacion) 
  VALUES (9, 4, 8, '', now()); 
INSERT INTO desarrollo.tbl_preguntas_resueltas (id_actividad_resuelta, id_pregunta, id_respuesta, respuesta_abierta, fch_creacion) 
  VALUES (10, 4, 8, '', now()); 

INSERT INTO desarrollo.tbl_preguntas_resueltas (id_actividad_resuelta, id_pregunta, id_respuesta, respuesta_abierta, fch_creacion) 
  VALUES (1, 5, 10, '', now()); 
INSERT INTO desarrollo.tbl_preguntas_resueltas (id_actividad_resuelta, id_pregunta, id_respuesta, respuesta_abierta, fch_creacion) 
  VALUES (2, 5, 10, '', now()); 
INSERT INTO desarrollo.tbl_preguntas_resueltas (id_actividad_resuelta, id_pregunta, id_respuesta, respuesta_abierta, fch_creacion) 
  VALUES (3, 5, 10, '', now()); 
INSERT INTO desarrollo.tbl_preguntas_resueltas (id_actividad_resuelta, id_pregunta, id_respuesta, respuesta_abierta, fch_creacion) 
  VALUES (4, 5, 10, '', now()); 
INSERT INTO desarrollo.tbl_preguntas_resueltas (id_actividad_resuelta, id_pregunta, id_respuesta, respuesta_abierta, fch_creacion) 
  VALUES (5, 5, 10, '', now()); 
INSERT INTO desarrollo.tbl_preguntas_resueltas (id_actividad_resuelta, id_pregunta, id_respuesta, respuesta_abierta, fch_creacion) 
  VALUES (6, 5, 10, '', now()); 
INSERT INTO desarrollo.tbl_preguntas_resueltas (id_actividad_resuelta, id_pregunta, id_respuesta, respuesta_abierta, fch_creacion) 
  VALUES (7, 5, 10, '', now()); 
INSERT INTO desarrollo.tbl_preguntas_resueltas (id_actividad_resuelta, id_pregunta, id_respuesta, respuesta_abierta, fch_creacion) 
  VALUES (8, 5, 10, '', now()); 
INSERT INTO desarrollo.tbl_preguntas_resueltas (id_actividad_resuelta, id_pregunta, id_respuesta, respuesta_abierta, fch_creacion) 
  VALUES (9, 5, 10, '', now()); 
INSERT INTO desarrollo.tbl_preguntas_resueltas (id_actividad_resuelta, id_pregunta, id_respuesta, respuesta_abierta, fch_creacion) 
  VALUES (10, 5, 10, '', now()); 

INSERT INTO desarrollo.tbl_preguntas_resueltas (id_actividad_resuelta, id_pregunta, id_respuesta, respuesta_abierta, fch_creacion) 
  VALUES (1, 6, 12, '', now()); 
INSERT INTO desarrollo.tbl_preguntas_resueltas (id_actividad_resuelta, id_pregunta, id_respuesta, respuesta_abierta, fch_creacion) 
  VALUES (2, 6, 12, '', now()); 
INSERT INTO desarrollo.tbl_preguntas_resueltas (id_actividad_resuelta, id_pregunta, id_respuesta, respuesta_abierta, fch_creacion) 
  VALUES (3, 6, 12, '', now()); 
INSERT INTO desarrollo.tbl_preguntas_resueltas (id_actividad_resuelta, id_pregunta, id_respuesta, respuesta_abierta, fch_creacion) 
  VALUES (4, 6, 12, '', now()); 
INSERT INTO desarrollo.tbl_preguntas_resueltas (id_actividad_resuelta, id_pregunta, id_respuesta, respuesta_abierta, fch_creacion) 
  VALUES (5, 6, 12, '', now()); 
INSERT INTO desarrollo.tbl_preguntas_resueltas (id_actividad_resuelta, id_pregunta, id_respuesta, respuesta_abierta, fch_creacion) 
  VALUES (6, 6, 12, '', now()); 
INSERT INTO desarrollo.tbl_preguntas_resueltas (id_actividad_resuelta, id_pregunta, id_respuesta, respuesta_abierta, fch_creacion) 
  VALUES (7, 6, 12, '', now()); 
INSERT INTO desarrollo.tbl_preguntas_resueltas (id_actividad_resuelta, id_pregunta, id_respuesta, respuesta_abierta, fch_creacion) 
  VALUES (8, 6, 12, '', now()); 
INSERT INTO desarrollo.tbl_preguntas_resueltas (id_actividad_resuelta, id_pregunta, id_respuesta, respuesta_abierta, fch_creacion) 
  VALUES (9, 6, 12, '', now()); 
INSERT INTO desarrollo.tbl_preguntas_resueltas (id_actividad_resuelta, id_pregunta, id_respuesta, respuesta_abierta, fch_creacion) 
  VALUES (10, 6, 12, '', now()); 
