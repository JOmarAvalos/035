
INSERT INTO desarrollo.tbl_cata_perfil (nombre, ban_activo) VALUES ('Administrador', 1);
INSERT INTO desarrollo.tbl_cata_perfil (nombre, ban_activo) VALUES ('Cliente', 1);


INSERT INTO desarrollo.tbl_cata_menu (nombre, orden, ban_activo) VALUES ('Centros de trabajo', 1, 1);
INSERT INTO desarrollo.tbl_cata_menu (nombre, orden, ban_activo) VALUES ('Configuración', 2, 1);
INSERT INTO desarrollo.tbl_cata_menu (nombre, orden, ban_activo) VALUES ('Reportes', 3, 1);
INSERT INTO desarrollo.tbl_cata_menu (nombre, orden, ban_activo) VALUES ('Actividades', 4, 1);


-- Administrador
INSERT INTO desarrollo.tbl_perfil_menu (id_perfil, id_menu, id_usuario_crea, fch_creacion) VALUES (1, 1, 1, now());
INSERT INTO desarrollo.tbl_perfil_menu (id_perfil, id_menu, id_usuario_crea, fch_creacion) VALUES (1, 2, 1, now());
INSERT INTO desarrollo.tbl_perfil_menu (id_perfil, id_menu, id_usuario_crea, fch_creacion) VALUES (1, 3, 1, now());
INSERT INTO desarrollo.tbl_perfil_menu (id_perfil, id_menu, id_usuario_crea, fch_creacion) VALUES (1, 4, 1, now());

-- Cliente
INSERT INTO desarrollo.tbl_perfil_menu (id_perfil, id_menu, id_usuario_crea, fch_creacion) VALUES (2, 1, 1, now());
INSERT INTO desarrollo.tbl_perfil_menu (id_perfil, id_menu, id_usuario_crea, fch_creacion) VALUES (2, 4, 1, now());


INSERT INTO desarrollo.tbl_usuarios (usuario, contrasena, nombre, email, id_perfil, id_usuario_crea, fch_creacion, estatus, ban_activo)
    VALUES ('ADMINGENERAL', '$2a$10$WCsR0O09qeZ9XrbbA0fn4edxPowBuY9ZlwAZ.ucqZKsN8X9U/J20C', 'ADMINISTRADOR NOMBRE', 'correo@mail.com', 1, 1, now(), 0, 1);


INSERT INTO desarrollo.tbl_cata_giros (nombre, ban_activo) values ('Agricultura, ganadería, pesca, minería', 1);
INSERT INTO desarrollo.tbl_cata_giros (nombre, ban_activo) values ('Comercio mayorista, detallista, distribución', 1);
INSERT INTO desarrollo.tbl_cata_giros (nombre, ban_activo) values ('Industria (textil, química, transformación, metal mecánica, etc.)', 1);
INSERT INTO desarrollo.tbl_cata_giros (nombre, ban_activo) values ('Servicios (comunicación, logística, transporte, financieros, salud, etc.)', 1);
INSERT INTO desarrollo.tbl_cata_giros (nombre, ban_activo) values ('Academia desde preescolar hasta postgrado, cursos, idiomas, etc.)', 1);
INSERT INTO desarrollo.tbl_cata_giros (nombre, ban_activo) values ('Otros', 1);

INSERT INTO desarrollo.tbl_cata_compra_estatus (nombre, ban_activo) VALUES ('Disponible', 1);
INSERT INTO desarrollo.tbl_cata_compra_estatus (nombre, ban_activo) VALUES ('En carrito', 1);
INSERT INTO desarrollo.tbl_cata_compra_estatus (nombre, ban_activo) VALUES ('Comprado', 1);
INSERT INTO desarrollo.tbl_cata_compra_estatus (nombre, ban_activo) VALUES ('Entregado', 1);
INSERT INTO desarrollo.tbl_cata_compra_estatus (nombre, ban_activo) VALUES ('Descargado', 1);


INSERT INTO desarrollo.tbl_cata_estados_republica (nombre, ban_activo) VALUES ('Aguascalientes', 1);
INSERT INTO desarrollo.tbl_cata_estados_republica (nombre, ban_activo) VALUES ('Baja California', 1);
INSERT INTO desarrollo.tbl_cata_estados_republica (nombre, ban_activo) VALUES ('Baja California Sur', 1);
INSERT INTO desarrollo.tbl_cata_estados_republica (nombre, ban_activo) VALUES ('Campeche', 1);
INSERT INTO desarrollo.tbl_cata_estados_republica (nombre, ban_activo) VALUES ('CDMX', 1);
INSERT INTO desarrollo.tbl_cata_estados_republica (nombre, ban_activo) VALUES ('Coahuila', 1);
INSERT INTO desarrollo.tbl_cata_estados_republica (nombre, ban_activo) VALUES ('Colima', 1);
INSERT INTO desarrollo.tbl_cata_estados_republica (nombre, ban_activo) VALUES ('Chiapas', 1);
INSERT INTO desarrollo.tbl_cata_estados_republica (nombre, ban_activo) VALUES ('Chihuahua', 1);
INSERT INTO desarrollo.tbl_cata_estados_republica (nombre, ban_activo) VALUES ('Durango', 1);
INSERT INTO desarrollo.tbl_cata_estados_republica (nombre, ban_activo) VALUES ('Estado de México', 1);
INSERT INTO desarrollo.tbl_cata_estados_republica (nombre, ban_activo) VALUES ('Guanajuato', 1);
INSERT INTO desarrollo.tbl_cata_estados_republica (nombre, ban_activo) VALUES ('Guerrero', 1);
INSERT INTO desarrollo.tbl_cata_estados_republica (nombre, ban_activo) VALUES ('Hidalgo', 1);
INSERT INTO desarrollo.tbl_cata_estados_republica (nombre, ban_activo) VALUES ('Jalisco', 1);
INSERT INTO desarrollo.tbl_cata_estados_republica (nombre, ban_activo) VALUES ('Michoacán', 1);
INSERT INTO desarrollo.tbl_cata_estados_republica (nombre, ban_activo) VALUES ('Morelos', 1);
INSERT INTO desarrollo.tbl_cata_estados_republica (nombre, ban_activo) VALUES ('Nayarit', 1);
INSERT INTO desarrollo.tbl_cata_estados_republica (nombre, ban_activo) VALUES ('Nuevo León', 1);
INSERT INTO desarrollo.tbl_cata_estados_republica (nombre, ban_activo) VALUES ('Oaxaca', 1);
INSERT INTO desarrollo.tbl_cata_estados_republica (nombre, ban_activo) VALUES ('Puebla', 1);
INSERT INTO desarrollo.tbl_cata_estados_republica (nombre, ban_activo) VALUES ('Querétaro', 1);
INSERT INTO desarrollo.tbl_cata_estados_republica (nombre, ban_activo) VALUES ('Quintana Roo', 1);
INSERT INTO desarrollo.tbl_cata_estados_republica (nombre, ban_activo) VALUES ('San Luis Potosí', 1);
INSERT INTO desarrollo.tbl_cata_estados_republica (nombre, ban_activo) VALUES ('Sinaloa', 1);
INSERT INTO desarrollo.tbl_cata_estados_republica (nombre, ban_activo) VALUES ('Sonora', 1);
INSERT INTO desarrollo.tbl_cata_estados_republica (nombre, ban_activo) VALUES ('Tabasco', 1);
INSERT INTO desarrollo.tbl_cata_estados_republica (nombre, ban_activo) VALUES ('Tamaulipas', 1);
INSERT INTO desarrollo.tbl_cata_estados_republica (nombre, ban_activo) VALUES ('Tlaxcala', 1);
INSERT INTO desarrollo.tbl_cata_estados_republica (nombre, ban_activo) VALUES ('Veracruz', 1);
INSERT INTO desarrollo.tbl_cata_estados_republica (nombre, ban_activo) VALUES ('Yucatán', 1);
INSERT INTO desarrollo.tbl_cata_estados_republica (nombre, ban_activo) VALUES ('Zacatecas', 1);


INSERT INTO desarrollo.tbl_cata_preguntas_tipo (nombre, ban_activo) VALUES ('Falso/Verdadero', 1);
INSERT INTO desarrollo.tbl_cata_preguntas_tipo (nombre, ban_activo) VALUES ('Opcion Multiple Unica', 1);
INSERT INTO desarrollo.tbl_cata_preguntas_tipo (nombre, ban_activo) VALUES ('Abierta', 1);


-- Cuestionarios
INSERT INTO desarrollo.tbl_cuestionarios (nombre, titulo, descripcion, empleados_rango_inicial, empleados_rango_final, orden, dias_limite_actividad, id_usuario_crea, fch_creacion, ban_activo)
    VALUES ('Eventos traumáticos severos', 'Guía de referencia I. Eventos traumáticos severos. Se aplica en todos los centros de trabajo','', 0, 100000, 1, 10, 1,now(), 1);
INSERT INTO desarrollo.tbl_cuestionarios (nombre, titulo, descripcion, empleados_rango_inicial, empleados_rango_final, orden, dias_limite_actividad, id_usuario_crea, fch_creacion, ban_activo)
    VALUES ('Riesgos Psicosociales', 'Cuestionario para identificar los factores de riesgo psicosocial en los centros de trabajo de 16 a 50 empleados','', 16, 50, 2, 10, 1,now(), 1);
INSERT INTO desarrollo.tbl_cuestionarios (nombre, titulo, descripcion, empleados_rango_inicial, empleados_rango_final, orden, dias_limite_actividad, id_usuario_crea, fch_creacion, ban_activo)
    VALUES ('Riesgos Psicosociales y Ambiente laboral', 'Cuestionario para identificar los factores de riesgo psicosocial y evaluar el entorno organizacional en los centros de trabajo con más de 50 empleados','', 51, 100000, 3, 10, 1,now(), 1);

-- Preguntas
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (1, 1, 'Sección I.- Acontecimiento traumático severo', 'Accidente que tenga como consecuencia la muerte, la pérdida de un miembro o una lesión grave?', '¿Ha presenciado o sufrido alguna vez, durante o con motivo del trabajo un acontecimiento como los siguientes:', '', 1, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (1, 1, 'Sección I.- Acontecimiento traumático severo', 'Asaltos?', '¿Ha presenciado o sufrido alguna vez, durante o con motivo del trabajo un acontecimiento como los siguientes:', '', 2, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (1, 1, 'Sección I.- Acontecimiento traumático severo', 'Actos violentos que derivaron en lesiones graves?', '¿Ha presenciado o sufrido alguna vez, durante o con motivo del trabajo un acontecimiento como los siguientes:', '', 3, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (1, 1, 'Sección I.- Acontecimiento traumático severo', 'Secuestro?', '¿Ha presenciado o sufrido alguna vez, durante o con motivo del trabajo un acontecimiento como los siguientes:', '', 4, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (1, 1, 'Sección I.- Acontecimiento traumático severo', 'Amenazas?', '¿Ha presenciado o sufrido alguna vez, durante o con motivo del trabajo un acontecimiento como los siguientes:', '', 5, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (1, 1, 'Sección I.- Acontecimiento traumático severo', 'Cualquier otro que ponga en riesgo su vida o salud, y/o la de otras personas?', '¿Ha presenciado o sufrido alguna vez, durante o con motivo del trabajo un acontecimiento como los siguientes:', '', 6, 1, now() ,1);

INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (1, 1, 'Sección II.- Recuerdos persistentes sobre el acontecimiento (durante el último mes)', '¿Ha tenido recuerdos recurrentes sobre el acontecimiento que le provocan malestares?', '', '', 7, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (1, 1, 'Sección II.- Recuerdos persistentes sobre el acontecimiento (durante el último mes)', '¿Ha tenido sueños de carácter recurrente sobre el acontecimiento, que le producen malestar?', '', '', 8, 1, now() ,1);

INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (1, 1, 'Sección III.- Esfuerzo por evitar circunstancias parecidas o asociadas al acontecimiento (durante el último mes)', '¿Se ha esforzado por evitar todo tipo de sentimientos, conversaciones o situaciones que le puedan recordar el acontecimiento?', '', '', 9, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (1, 1, 'Sección III.- Esfuerzo por evitar circunstancias parecidas o asociadas al acontecimiento (durante el último mes)', '¿Se ha esforzado por evitar todo tipo de actividades, lugares o personas que motivan recuerdos del acontecimiento?', '', '', 10, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (1, 1, 'Sección III.- Esfuerzo por evitar circunstancias parecidas o asociadas al acontecimiento (durante el último mes)', '¿Ha tenido dificultad para recordar alguna parte importante del evento?', '', '', 11, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (1, 1, 'Sección III.- Esfuerzo por evitar circunstancias parecidas o asociadas al acontecimiento (durante el último mes)', '¿Ha disminuido su interés en sus actividades cotidianas?', '', '', 12, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (1, 1, 'Sección III.- Esfuerzo por evitar circunstancias parecidas o asociadas al acontecimiento (durante el último mes)', '¿Se ha sentido usted alejado o distante de los demás?', '', '', 13, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (1, 1, 'Sección III.- Esfuerzo por evitar circunstancias parecidas o asociadas al acontecimiento (durante el último mes)', '¿Ha notado que tiene dificultad para expresar sus sentimientos?', '', '', 14, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (1, 1, 'Sección III.- Esfuerzo por evitar circunstancias parecidas o asociadas al acontecimiento (durante el último mes)', '¿Ha tenido la impresión de que su vida se va a acortar, que va a morir antes que otras personas o que tiene un futuro limitado?', '', '', 15, 1, now() ,1);

INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (1, 1, 'Sección IV.- Afectación (durante el último mes)', '¿Ha tenido usted dificultades para dormir?', '', '',16, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (1, 1, 'Sección IV.- Afectación (durante el último mes)', '¿Ha estado particularmente irritable o le han dado arranques de coraje?', '', '',17, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (1, 1, 'Sección IV.- Afectación (durante el último mes)', '¿Ha tenido dificultad para concentrarse?', '', '',18, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (1, 1, 'Sección IV.- Afectación (durante el último mes)', '¿Ha estado nervioso o constantemente en alerta?', '', '',19, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (1, 1, 'Sección IV.- Afectación (durante el último mes)', '¿Se ha sobresaltado fácilmente por cualquier cosa?', '', '',20, 1, now() ,1);

INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (1, 2, 'Sección A.- Perfil', 'A1. Género:', 'En esta sección se registran datos descriptivos de tu perfil para fines estadísticos', '', 21, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (1, 2, 'Sección A.- Perfil', 'A2. Edad', 'En esta sección se registran datos descriptivos de tu perfil para fines estadísticos', '', 22, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (1, 2, 'Sección A.- Perfil', 'A3. Antigüedad en la empresa:', 'En esta sección se registran datos descriptivos de tu perfil para fines estadísticos', '', 23, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (1, 2, 'Sección A.- Perfil', 'A4. ¿A cuál de las siguientes áreas se asemeja más el trabajo que realizas?:', 'En esta sección se registran datos descriptivos de tu perfil para fines estadísticos', '', 24, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (1, 2, 'Sección A.- Perfil', 'A5. Nivel organizacional que ocupas:', 'En esta sección se registran datos descriptivos de tu perfil para fines estadísticos', '', 25, 1, now() ,1);

INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (1, 3, '', 'Área o departamento en donde labora', '', '', 26, 1, now() ,1);

-----

INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (2, 2, 'Sección A.- Perfil', 'A1. Género:', 'En esta sección se registran datos descriptivos de tu perfil para fines estadísticos', '', 1, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (2, 2, 'Sección A.- Perfil', 'A2. Edad:', 'En esta sección se registran datos descriptivos de tu perfil para fines estadísticos', '', 2, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (2, 2, 'Sección A.- Perfil', 'A3. Antigüedad en la empresa:', 'En esta sección se registran datos descriptivos de tu perfil para fines estadísticos', '', 3, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (2, 2, 'Sección A.- Perfil', 'A4. ¿A cuál de las siguientes áreas se asemeja más el trabajo que realizas?:', 'En esta sección se registran datos descriptivos de tu perfil para fines estadísticos', '', 4, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (2, 2, 'Sección A.- Perfil', 'A5. Nivel organizacional que ocupas:', 'En esta sección se registran datos descriptivos de tu perfil para fines estadísticos', '', 5, 1, now() ,1);

INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (2, 2, '', 'Mi trabajo me exige hacer mucho esfuerzo físico', 'Para responder las preguntas siguientes considere las condiciones de su centro de trabajo, así como la cantidad y ritmo de trabajo.', '', 6, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (2, 2, '', 'Me preocupa sufrir un accidente en mi trabajo', 'Para responder las preguntas siguientes considere las condiciones de su centro de trabajo, así como la cantidad y ritmo de trabajo.', '', 7, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (2, 2, '', 'Considero que las actividades que realizo son peligrosa', 'Para responder las preguntas siguientes considere las condiciones de su centro de trabajo, así como la cantidad y ritmo de trabajo.', '', 8, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (2, 2, '', 'Por la cantidad de trabajo que tengo debo quedarme tiempo adicional a mi turno', 'Para responder las preguntas siguientes considere las condiciones de su centro de trabajo, así como la cantidad y ritmo de trabajo.', '', 9, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (2, 2, '', 'Por la cantidad de trabajo que tengo debo trabajar sin parar', 'Para responder las preguntas siguientes considere las condiciones de su centro de trabajo, así como la cantidad y ritmo de trabajo.', '', 10, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (2, 2, '', 'Considero que es necesario mantener un ritmo de trabajo acelerado', 'Para responder las preguntas siguientes considere las condiciones de su centro de trabajo, así como la cantidad y ritmo de trabajo.', '', 11, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (2, 2, '', 'Mi trabajo exige que esté muy concentrado', 'Para responder las preguntas siguientes considere las condiciones de su centro de trabajo, así como la cantidad y ritmo de trabajo.', '', 12, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (2, 2, '', 'Mi trabajo requiere que memorice mucha información', 'Para responder las preguntas siguientes considere las condiciones de su centro de trabajo, así como la cantidad y ritmo de trabajo.', '', 13, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (2, 2, '', 'Mi trabajo exige que atienda varios asuntos al mismo tiempo', 'Para responder las preguntas siguientes considere las condiciones de su centro de trabajo, así como la cantidad y ritmo de trabajo.', '', 14, 1, now() ,1);

INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (2, 2, '', 'En mi trabajo soy responsable de cosas de mucho valor', 'Las preguntas siguientes están relacionadas con las actividades que realiza en su trabajo y las responsabilidades que tiene.', '', 15, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (2, 2, '', 'Respondo ante mi jefe por los resultados de toda mi área de trabajo', 'Las preguntas siguientes están relacionadas con las actividades que realiza en su trabajo y las responsabilidades que tiene.', '', 16, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (2, 2, '', 'En mi trabajo me dan órdenes contradictorias', 'Las preguntas siguientes están relacionadas con las actividades que realiza en su trabajo y las responsabilidades que tiene.', '', 17, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (2, 2, '', 'Considero que en mi trabajo me piden hacer cosas innecesarias', 'Las preguntas siguientes están relacionadas con las actividades que realiza en su trabajo y las responsabilidades que tiene.', '', 18, 1, now() ,1);

INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (2, 2, '', 'Trabajo horas extras más de tres veces a la semana', 'Las preguntas siguientes están relacionadas con el tiempo destinado a su trabajo y sus responsabilidades familiares.', '', 19, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (2, 2, '', 'Mi trabajo me exige laborar en días de descanso, festivos o fines de semana', 'Las preguntas siguientes están relacionadas con el tiempo destinado a su trabajo y sus responsabilidades familiares.', '', 20, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (2, 2, '', 'Considero que el tiempo en el trabajo es mucho y perjudica mis actividades familiares o personales', 'Las preguntas siguientes están relacionadas con el tiempo destinado a su trabajo y sus responsabilidades familiares.', '', 21, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (2, 2, '', 'Pienso en las actividades familiares o personales cuando estoy en mi trabajo', 'Las preguntas siguientes están relacionadas con el tiempo destinado a su trabajo y sus responsabilidades familiares.', '', 22, 1, now() ,1);

INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (2, 2, '', 'Mi trabajo permite que desarrolle nuevas habilidades', 'Las preguntas siguientes están relacionadas con las decisiones que puede tomar en su trabajo ', '', 23, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (2, 2, '', 'En mi trabajo puedo aspirar a un mejor puesto', 'Las preguntas siguientes están relacionadas con las decisiones que puede tomar en su trabajo ', '', 24, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (2, 2, '', 'Durante mi jornada de trabajo puedo tomar pausas cuando las necesito', 'Las preguntas siguientes están relacionadas con las decisiones que puede tomar en su trabajo ', '', 25, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (2, 2, '', 'Puedo decidir la velocidad a la que realizo mis actividades en mi trabajo', 'Las preguntas siguientes están relacionadas con las decisiones que puede tomar en su trabajo ', '', 26, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (2, 2, '', 'Puedo cambiar el orden de las actividades que realizo en mi trabajo', 'Las preguntas siguientes están relacionadas con las decisiones que puede tomar en su trabajo ', '', 27, 1, now() ,1);

INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (2, 2, '', 'Me informan con claridad cuáles son mis funciones', 'Las preguntas siguientes están relacionadas con la capacitación e información que recibe sobre su trabajo ', '', 28, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (2, 2, '', 'Me explican claramente los resultados que debo obtener en mi trabajo', 'Las preguntas siguientes están relacionadas con la capacitación e información que recibe sobre su trabajo ', '', 29, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (2, 2, '', 'Me informan con quién puedo resolver problemas o asuntos de trabajo', 'Las preguntas siguientes están relacionadas con la capacitación e información que recibe sobre su trabajo ', '', 30, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (2, 2, '', 'Me permiten asistir a capacitaciones relacionadas con mi trabajo', 'Las preguntas siguientes están relacionadas con la capacitación e información que recibe sobre su trabajo ', '', 31, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (2, 2, '', 'Recibo capacitación útil para hacer mi trabajo', 'Las preguntas siguientes están relacionadas con la capacitación e información que recibe sobre su trabajo ', '', 32, 1, now() ,1);

INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (2, 2, '', 'Mi jefe tiene en cuenta mis puntos de vista y opiniones', 'Las preguntas siguientes se refieren a las relaciones con sus compañeros de trabajo y su jefe ', '', 33, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (2, 2, '', 'Mi jefe ayuda a solucionar los problemas que se presentan en el trabajo', 'Las preguntas siguientes se refieren a las relaciones con sus compañeros de trabajo y su jefe ', '', 34, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (2, 2, '', 'Puedo confiar en mis compañeros de trabajo', 'Las preguntas siguientes se refieren a las relaciones con sus compañeros de trabajo y su jefe ', '', 35, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (2, 2, '', 'Cuando tenemos que realizar trabajo de equipo los compañeros colaboran', 'Las preguntas siguientes se refieren a las relaciones con sus compañeros de trabajo y su jefe ', '', 36, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (2, 2, '', 'Mis compañeros de trabajo me ayudan cuando tengo dificultades', 'Las preguntas siguientes se refieren a las relaciones con sus compañeros de trabajo y su jefe ', '', 37, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (2, 2, '', 'En mi trabajo puedo expresarme libremente sin interrupciones', 'Las preguntas siguientes se refieren a las relaciones con sus compañeros de trabajo y su jefe ', '', 38, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (2, 2, '', 'Recibo críticas constantes a mi persona y/o trabajo', 'Las preguntas siguientes se refieren a las relaciones con sus compañeros de trabajo y su jefe ', '', 39, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (2, 2, '', 'Recibo burlas, calumnias, difamaciones, humillaciones o ridiculizaciones', 'Las preguntas siguientes se refieren a las relaciones con sus compañeros de trabajo y su jefe ', '', 40, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (2, 2, '', 'Se ignora mi presencia o se me excluye de las reuniones de trabajo y en la toma de decisiones', 'Las preguntas siguientes se refieren a las relaciones con sus compañeros de trabajo y su jefe ', '', 41, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (2, 2, '', 'Se manipulan las situaciones de trabajo para hacerme parecer un mal trabajador', 'Las preguntas siguientes se refieren a las relaciones con sus compañeros de trabajo y su jefe ', '', 42, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (2, 2, '', 'Se ignoran mis éxitos laborales y se atribuyen a otros trabajadores', 'Las preguntas siguientes se refieren a las relaciones con sus compañeros de trabajo y su jefe ', '', 43, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (2, 2, '', 'Me bloquean o impiden las oportunidades que tengo para obtener ascenso o mejora en mi trabajo', 'Las preguntas siguientes se refieren a las relaciones con sus compañeros de trabajo y su jefe ', '', 44, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (2, 2, '', 'He presenciado actos de violencia en mi centro de trabajo', 'Las preguntas siguientes se refieren a las relaciones con sus compañeros de trabajo y su jefe ', '', 45, 1, now() ,1);

INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (2, 2, '', 'En mi trabajo debo brindar servicio a clientes o usuarios:', 'Las preguntas siguientes están relacionadas con la atención a clientes y usuarios.', '', 46, 1, now() ,1);

INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (2, 2, '', 'Atiendo clientes o usuarios muy enojados', '', '', 47, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (2, 2, '', 'Mi trabajo me exige atender personas muy necesitadas de ayuda o enfermas', '', '', 48, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (2, 2, '', 'Para hacer mi trabajo debo demostrar sentimientos distintos a los míos', '', '', 49, 1, now() ,1);

INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (2, 2, '', 'Soy jefe de otros trabajadores:', '', '', 50, 1, now() ,1);

INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (2, 2, '', 'Comunican tarde los asuntos de trabajo', 'Las siguientes preguntas están relacionadas con las actitudes de los trabajadores que supervisa.', '', 51, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (2, 2, '', 'Dificultan el logro de los resultados del trabajo', 'Las siguientes preguntas están relacionadas con las actitudes de los trabajadores que supervisa.', '', 52, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (2, 2, '', 'Ignoran las sugerencias para mejorar su trabajo', 'Las siguientes preguntas están relacionadas con las actitudes de los trabajadores que supervisa.', '', 53, 1, now() ,1);

-----

INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, 'Sección A.- Perfil', 'A1. Género:', 'En esta sección se registran datos descriptivos de tu perfil para fines estadísticos', '', 1, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, 'Sección A.- Perfil', 'A2. Edad:', 'En esta sección se registran datos descriptivos de tu perfil para fines estadísticos', '', 2, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, 'Sección A.- Perfil', 'A3. Antigüedad en la empresa:', 'En esta sección se registran datos descriptivos de tu perfil para fines estadísticos', '', 3, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, 'Sección A.- Perfil', 'A4. ¿A cuál de las siguientes áreas se asemeja más el trabajo que realizas?:', 'En esta sección se registran datos descriptivos de tu perfil para fines estadísticos', '', 4, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, 'Sección A.- Perfil', 'A5. Nivel organizacional que ocupas:', 'En esta sección se registran datos descriptivos de tu perfil para fines estadísticos', '', 5, 1, now() ,1);

INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'El espacio donde trabajo me permite realizar mis actividades de manera segura e higiénica', 'Para responder las preguntas siguientes considere las condiciones ambientales de su centro de trabajo.', '', 6, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'Mi trabajo me exige hacer mucho esfuerzo físico', 'Para responder las preguntas siguientes considere las condiciones ambientales de su centro de trabajo.', '', 7, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'Me preocupa sufrir un accidente en mi trabajo', 'Para responder las preguntas siguientes considere las condiciones ambientales de su centro de trabajo.', '', 8, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'Considero que en mi trabajo se aplican las normas de seguridad y salud en el trabajo', 'Para responder las preguntas siguientes considere las condiciones ambientales de su centro de trabajo.', '', 9, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'Considero que las actividades que realizo son peligrosas', 'Para responder las preguntas siguientes considere las condiciones ambientales de su centro de trabajo.', '', 10, 1, now() ,1);

INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'Por la cantidad de trabajo que tengo debo quedarme tiempo adicional a mi turno', 'Para responder a las preguntas siguientes piense en la cantidad y ritmo de trabajo que tiene. ', '', 11, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'Por la cantidad de trabajo que tengo debo trabajar sin parar', 'Para responder a las preguntas siguientes piense en la cantidad y ritmo de trabajo que tiene. ', '', 12, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'Considero que es necesario mantener un ritmo de trabajo acelerado', 'Para responder a las preguntas siguientes piense en la cantidad y ritmo de trabajo que tiene. ', '', 13, 1, now() ,1);

INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'Mi trabajo exige que esté muy concentrado', 'Las preguntas siguientes están relacionadas con el esfuerzo mental que le exige su trabajo. ', '', 14, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'Mi trabajo requiere que memorice mucha información', 'Las preguntas siguientes están relacionadas con el esfuerzo mental que le exige su trabajo. ', '', 15, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'En mi trabajo tengo que tomar decisiones difíciles muy rápido', 'Las preguntas siguientes están relacionadas con el esfuerzo mental que le exige su trabajo. ', '', 16, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'Mi trabajo exige que atienda varios asuntos al mismo tiempo', 'Las preguntas siguientes están relacionadas con el esfuerzo mental que le exige su trabajo. ', '', 17, 1, now() ,1);

INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'En mi trabajo soy responsable de cosas de mucho valor', 'Las preguntas siguientes están relacionadas con las actividades que realiza en su trabajo y las responsabilidades que tiene. ', '', 18, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'Respondo ante mi jefe por los resultados de toda mi área de trabajo', 'Las preguntas siguientes están relacionadas con las actividades que realiza en su trabajo y las responsabilidades que tiene. ', '', 19, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'En el trabajo me dan órdenes contradictorias', 'Las preguntas siguientes están relacionadas con las actividades que realiza en su trabajo y las responsabilidades que tiene. ', '', 20, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'Considero que en mi trabajo me piden hacer cosas innecesarias', 'Las preguntas siguientes están relacionadas con las actividades que realiza en su trabajo y las responsabilidades que tiene. ', '', 21, 1, now() ,1);

INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'Trabajo horas extras más de tres veces a la semana', 'Las preguntas siguientes están relacionadas con su jornada de trabajo. ', '', 22, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'Mi trabajo me exige laborar en días de descanso, festivos o fines de semana', 'Las preguntas siguientes están relacionadas con su jornada de trabajo. ', '', 23, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'Considero que el tiempo en el trabajo es mucho y perjudica mis actividades familiares o personales', 'Las preguntas siguientes están relacionadas con su jornada de trabajo. ', '', 24, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'Debo atender asuntos de trabajo cuando estoy en casa', 'Las preguntas siguientes están relacionadas con su jornada de trabajo. ', '', 25, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'Pienso en las actividades familiares o personales cuando estoy en mi trabajo', 'Las preguntas siguientes están relacionadas con su jornada de trabajo. ', '', 26, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'Pienso que mis responsabilidades familiares afectan mi trabajo', 'Las preguntas siguientes están relacionadas con su jornada de trabajo. ', '', 27, 1, now() ,1);

INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'Mi trabajo permite que desarrolle nuevas habilidades', 'Las preguntas siguientes están relacionadas con las decisiones que puede tomar en su trabajo. ', '', 28, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'En mi trabajo puedo aspirar a un mejor puesto', 'Las preguntas siguientes están relacionadas con las decisiones que puede tomar en su trabajo. ', '', 29, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'Durante mi jornada de trabajo puedo tomar pausas cuando las necesito', 'Las preguntas siguientes están relacionadas con las decisiones que puede tomar en su trabajo. ', '', 30, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'Puedo decidir cuánto trabajo realizo durante la jornada laboral', 'Las preguntas siguientes están relacionadas con las decisiones que puede tomar en su trabajo. ', '', 31, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'Puedo decidir la velocidad a la que realizo mis actividades en mi trabajo', 'Las preguntas siguientes están relacionadas con las decisiones que puede tomar en su trabajo. ', '', 32, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'Puedo cambiar el orden de las actividades que realizo en mi trabajo', 'Las preguntas siguientes están relacionadas con las decisiones que puede tomar en su trabajo. ', '', 33, 1, now() ,1);

INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'Los cambios que se presentan en mi trabajo dificultan mi labor', 'Las preguntas siguientes están relacionadas con cualquier tipo de cambio que ocurra en su trabajo (considere los últimos cambios realizados). ', '', 34, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'Cuando se presentan cambios en mi trabajo se tienen en cuenta mis ideas o aportaciones', 'Las preguntas siguientes están relacionadas con cualquier tipo de cambio que ocurra en su trabajo (considere los últimos cambios realizados). ', '', 35, 1, now() ,1);

INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'Me informan con claridad cuáles son mis funciones', 'Las preguntas siguientes están relacionadas con la capacitación e información que se le proporciona sobre su trabajo.', '', 36, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'Me explican claramente los resultados que debo obtener en mi trabajo', 'Las preguntas siguientes están relacionadas con la capacitación e información que se le proporciona sobre su trabajo.', '', 37, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'Me explican claramente los objetivos de mi trabajo', 'Las preguntas siguientes están relacionadas con la capacitación e información que se le proporciona sobre su trabajo.', '', 38, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'Me informan con quién puedo resolver problemas o asuntos de trabajo', 'Las preguntas siguientes están relacionadas con la capacitación e información que se le proporciona sobre su trabajo.', '', 39, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'Me permiten asistir a capacitaciones relacionadas con mi trabajo', 'Las preguntas siguientes están relacionadas con la capacitación e información que se le proporciona sobre su trabajo.', '', 40, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'Recibo capacitación útil para hacer mi trabajo', 'Las preguntas siguientes están relacionadas con la capacitación e información que se le proporciona sobre su trabajo.', '', 41, 1, now() ,1);

INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'Mi jefe ayuda a organizar mejor el trabajo', 'Las preguntas siguientes están relacionadas con el o los jefes con quien tiene contacto.', '', 42, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'Mi jefe tiene en cuenta mis puntos de vista y opiniones', 'Las preguntas siguientes están relacionadas con el o los jefes con quien tiene contacto.', '', 43, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'Mi jefe me comunica a tiempo la información relacionada con el trabajo', 'Las preguntas siguientes están relacionadas con el o los jefes con quien tiene contacto.', '', 44, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'La orientación que me da mi jefe me ayuda a realizar mejor mi trabajo', 'Las preguntas siguientes están relacionadas con el o los jefes con quien tiene contacto.', '', 45, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'Mi jefe ayuda a solucionar los problemas que se presentan en el trabajo', 'Las preguntas siguientes están relacionadas con el o los jefes con quien tiene contacto.', '', 46, 1, now() ,1);

INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'Puedo confiar en mis compañeros de trabajo', 'Las preguntas siguientes se refieren a las relaciones con sus compañeros.', '', 47, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'Entre compañeros solucionamos los problemas de trabajo de forma respetuosa', 'Las preguntas siguientes se refieren a las relaciones con sus compañeros.', '', 48, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'En mi trabajo me hacen sentir parte del grupo', 'Las preguntas siguientes se refieren a las relaciones con sus compañeros.', '', 49, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'Cuando tenemos que realizar trabajo de equipo los compañeros colaboran', 'Las preguntas siguientes se refieren a las relaciones con sus compañeros.', '', 50, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'Mis compañeros de trabajo me ayudan cuando tengo dificultades', 'Las preguntas siguientes se refieren a las relaciones con sus compañeros.', '', 51, 1, now() ,1);

INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'Me informan sobre lo que hago bien en mi trabajo', 'Las preguntas siguientes están relacionadas con la información que recibe sobre su rendimiento en el trabajo, el reconocimiento, el sentido de pertenencia y la estabilidad que le ofrece su trabajo', '', 52, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'La forma como evalúan mi trabajo en mi centro de trabajo me ayuda a mejorar mi desempeño', 'Las preguntas siguientes están relacionadas con la información que recibe sobre su rendimiento en el trabajo, el reconocimiento, el sentido de pertenencia y la estabilidad que le ofrece su trabajo', '', 53, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'En mi centro de trabajo me pagan a tiempo mi salario', 'Las preguntas siguientes están relacionadas con la información que recibe sobre su rendimiento en el trabajo, el reconocimiento, el sentido de pertenencia y la estabilidad que le ofrece su trabajo', '', 54, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'El pago que recibo es el que merezco por el trabajo que realizo', 'Las preguntas siguientes están relacionadas con la información que recibe sobre su rendimiento en el trabajo, el reconocimiento, el sentido de pertenencia y la estabilidad que le ofrece su trabajo', '', 55, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'Si obtengo los resultados esperados en mi trabajo me recompensan o reconocen', 'Las preguntas siguientes están relacionadas con la información que recibe sobre su rendimiento en el trabajo, el reconocimiento, el sentido de pertenencia y la estabilidad que le ofrece su trabajo', '', 56, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'Las personas que hacen bien el trabajo pueden crecer laboralmente', 'Las preguntas siguientes están relacionadas con la información que recibe sobre su rendimiento en el trabajo, el reconocimiento, el sentido de pertenencia y la estabilidad que le ofrece su trabajo', '', 57, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'Considero que mi trabajo es estable', 'Las preguntas siguientes están relacionadas con la información que recibe sobre su rendimiento en el trabajo, el reconocimiento, el sentido de pertenencia y la estabilidad que le ofrece su trabajo', '', 58, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'En mi trabajo existe continua rotación de personal', 'Las preguntas siguientes están relacionadas con la información que recibe sobre su rendimiento en el trabajo, el reconocimiento, el sentido de pertenencia y la estabilidad que le ofrece su trabajo', '', 59, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'Siento orgullo de laborar en este centro de trabajo', 'Las preguntas siguientes están relacionadas con la información que recibe sobre su rendimiento en el trabajo, el reconocimiento, el sentido de pertenencia y la estabilidad que le ofrece su trabajo', '', 60, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'Me siento comprometido con mi trabajo', 'Las preguntas siguientes están relacionadas con la información que recibe sobre su rendimiento en el trabajo, el reconocimiento, el sentido de pertenencia y la estabilidad que le ofrece su trabajo', '', 61, 1, now() ,1);

INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'En mi trabajo puedo expresarme libremente sin interrupciones', 'Las preguntas siguientes están relacionadas con actos de violencia laboral (malos tratos, acoso, hostigamiento, acoso psicológico). ', '', 62, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'Recibo críticas constantes a mi persona y/o trabajo', 'Las preguntas siguientes están relacionadas con actos de violencia laboral (malos tratos, acoso, hostigamiento, acoso psicológico). ', '', 63, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'Recibo burlas, calumnias, difamaciones, humillaciones o ridiculizaciones', 'Las preguntas siguientes están relacionadas con actos de violencia laboral (malos tratos, acoso, hostigamiento, acoso psicológico). ', '', 64, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'Se ignora mi presencia o se me excluye de las reuniones de trabajo y en la toma de decisiones', 'Las preguntas siguientes están relacionadas con actos de violencia laboral (malos tratos, acoso, hostigamiento, acoso psicológico). ', '', 65, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'Se manipulan las situaciones de trabajo para hacerme parecer un mal trabajador', 'Las preguntas siguientes están relacionadas con actos de violencia laboral (malos tratos, acoso, hostigamiento, acoso psicológico). ', '', 66, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'Se ignoran mis éxitos laborales y se atribuyen a otros trabajadores', 'Las preguntas siguientes están relacionadas con actos de violencia laboral (malos tratos, acoso, hostigamiento, acoso psicológico). ', '', 67, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'Me bloquean o impiden las oportunidades que tengo para obtener ascenso o mejora en mi trabajo', 'Las preguntas siguientes están relacionadas con actos de violencia laboral (malos tratos, acoso, hostigamiento, acoso psicológico). ', '', 68, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'He presenciado actos de violencia en mi centro de trabajo', 'Las preguntas siguientes están relacionadas con actos de violencia laboral (malos tratos, acoso, hostigamiento, acoso psicológico). ', '', 69, 1, now() ,1);

INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'En mi trabajo debo brindar servicio a clientes o usuarios:', 'Las preguntas siguientes están relacionadas con la atención a clientes y usuarios.', '', 70, 1, now() ,1);

INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'Atiendo clientes o usuarios muy enojados', '', '', 71, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'Mi trabajo me exige atender personas muy necesitadas de ayuda o enfermas', '', '', 72, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'Para hacer mi trabajo debo demostrar sentimientos distintos a los míos', '', '', 73, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'Mi trabajo me exige atender situaciones de violencia', '', '', 74, 1, now() ,1);

INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'Soy jefe de otros trabajadores:', '', '', 75, 1, now() ,1);

INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'Comunican tarde los asuntos de trabajo', 'Las preguntas siguientes están relacionadas con las actitudes de las personas que supervisa.', '', 76, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'Dificultan el logro de los resultados del trabajo', 'Las preguntas siguientes están relacionadas con las actitudes de las personas que supervisa.', '', 77, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'Cooperan poco cuando se necesita', 'Las preguntas siguientes están relacionadas con las actitudes de las personas que supervisa.', '', 78, 1, now() ,1);
INSERT INTO desarrollo.tbl_preguntas (id_cuestionario, id_pregunta_tipo, seccion, nombre, titulo, descripcion, orden, id_usuario_crea, fch_creacion, ban_activo)
    VALUES (3, 2, '', 'Ignoran las sugerencias para mejorar su trabajo', 'Las preguntas siguientes están relacionadas con las actitudes de las personas que supervisa.', '', 79, 1, now() ,1);

-- Respuestas

INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (1,'Si', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (1,'No', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (2,'Si', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (2,'No', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (3,'Si', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (3,'No', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (4,'Si', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (4,'No', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (5,'Si', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (5,'No', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (6,'Si', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (6,'No', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (7,'Si', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (7,'No', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (8,'Si', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (8,'No', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (9,'Si', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (9,'No', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (10,'Si', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (10,'No', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (11,'Si', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (11,'No', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (12,'Si', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (12,'No', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (13,'Si', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (13,'No', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (14,'Si', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (14,'No', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (15,'Si', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (15,'No', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (16,'Si', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (16,'No', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (17,'Si', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (17,'No', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (18,'Si', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (18,'No', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (19,'Si', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (19,'No', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (20,'Si', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (20,'No', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (21,'Masculino', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (21,'Femenino', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (22,'Hasta 19', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (22,'20 a 29', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (22,'30 a 39', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (22,'40 a 49', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (22,'Más de 50', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (23,'<6 meses', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (23,'Más de 6 meses a 1 año', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (23,'Más de 1 año a 3 años', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (23,'Más de 3 años a 5 años', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (23,'Más de 5 años a 10 años', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (23,'Más de 10 años', 6, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (24,'Compras', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (24,'Ventas', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (24,'Administración', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (24,'Recursos Humanos', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (24,'Dirección General', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (24,'Operaciones', 6, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (24,'Producción', 7, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (24,'Logística, reparto, transporte', 8, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (24,'Almacén materia prima', 9, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (24,'Almacén producto terminado', 10, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (24,'Almacén en general', 11, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (24,'Mercadotecnia', 12, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (24,'Servicio al cliente', 13, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (24,'Sistemas', 14, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (24,'Otro', 15, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (25,'Sin personal a mi cargo', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (25,'Jefatura, coordinación', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (25,'Gerencia, subdirección', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (25,'Dirección, consejero, socio, propietario', 4, 1, now(), 1);

------

INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (27,'Masculino', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (27,'Femenino', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (28,'Hasta 19 ', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (28,'20 a 29', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (28,'30 a 39', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (28,'40 a 49', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (28,'Más de 50', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (29,'<6 meses', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (29,'Más de 6 meses a 1 año', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (29,'Más de 1 año a 3 años', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (29,'Más de 3 años a 5 años', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (29,'Más de 5 años a 10 años', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (29,'Más de 10 años', 6, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (30,'Compras', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (30,'Ventas', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (30,'Administración', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (30,'Recursos Humanos', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (30,'Dirección General', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (30,'Operaciones', 6, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (30,'Producción', 7, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (30,'Logística, reparto, transporte', 8, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (30,'Almacén materia prima', 9, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (30,'Almacén producto terminado', 10, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (30,'Almacén en general', 11, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (30,'Mercadotecnia', 12, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (30,'Servicio al cliente', 13, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (30,'Sistemas', 14, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (30,'Otro', 15, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (31,'Sin personal a mi cargo', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (31,'Jefatura, coordinación', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (31,'Gerencia, subdirección', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (31,'Dirección, consejero, socio, propietario', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (32,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (32,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (32,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (32,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (32,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (33,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (33,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (33,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (33,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (33,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (34,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (34,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (34,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (34,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (34,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (35,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (35,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (35,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (35,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (35,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (36,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (36,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (36,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (36,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (36,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (37,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (37,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (37,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (37,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (37,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (38,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (38,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (38,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (38,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (38,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (39,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (39,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (39,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (39,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (39,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (40,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (40,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (40,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (40,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (40,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (41,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (41,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (41,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (41,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (41,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (42,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (42,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (42,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (42,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (42,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (43,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (43,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (43,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (43,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (43,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (44,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (44,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (44,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (44,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (44,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (45,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (45,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (45,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (45,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (45,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (46,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (46,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (46,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (46,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (46,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (47,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (47,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (47,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (47,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (47,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (48,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (48,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (48,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (48,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (48,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (49,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (49,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (49,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (49,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (49,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (50,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (50,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (50,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (50,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (50,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (51,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (51,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (51,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (51,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (51,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (52,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (52,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (52,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (52,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (52,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (53,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (53,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (53,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (53,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (53,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (54,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (54,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (54,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (54,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (54,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (55,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (55,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (55,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (55,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (55,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (56,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (56,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (56,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (56,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (56,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (57,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (57,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (57,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (57,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (57,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (58,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (58,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (58,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (58,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (58,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (59,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (59,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (59,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (59,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (59,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (60,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (60,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (60,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (60,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (60,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (61,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (61,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (61,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (61,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (61,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (62,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (62,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (62,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (62,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (62,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (63,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (63,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (63,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (63,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (63,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (64,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (64,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (64,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (64,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (64,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (65,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (65,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (65,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (65,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (65,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (66,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (66,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (66,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (66,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (66,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (67,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (67,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (67,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (67,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (67,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (68,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (68,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (68,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (68,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (68,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (69,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (69,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (69,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (69,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (69,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (70,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (70,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (70,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (70,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (70,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (71,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (71,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (71,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (71,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (71,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (72,'Si', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (72,'No', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (73,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (73,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (73,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (73,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (73,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (74,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (74,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (74,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (74,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (74,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (75,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (75,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (75,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (75,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (75,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (76,'Si', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (76,'No', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (77,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (77,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (77,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (77,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (77,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (78,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (78,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (78,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (78,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (78,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (79,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (79,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (79,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (79,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (79,'Nunca', 5, 1, now(), 1);

---

INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (80,'Masculino', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (80,'Femenino', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (81,'Hasta 19', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (81,'20 a 29', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (81,'30 a 39', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (81,'40 a 49', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (81,'Más de 50', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (82,'<6 meses', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (82,'Más de 6 meses a 1 año', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (82,'Más de 1 año a 3 años', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (82,'Más de 3 años a 5 años', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (82,'Más de 5 años a 10 años', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (82,'Más de 10 años', 6, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (83,'Compras', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (83,'Ventas', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (83,'Administración', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (83,'Recursos Humanos', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (83,'Dirección General', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (83,'Operaciones', 6, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (83,'Producción', 7, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (83,'Logística, reparto, transporte', 8, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (83,'Almacén materia prima', 9, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (83,'Almacén producto terminado', 10, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (83,'Almacén en general', 11, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (83,'Mercadotecnia', 12, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (83,'Servicio al cliente', 13, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (83,'Sistemas', 14, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (83,'Otro', 15, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (84,'Sin personal a mi cargo', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (84,'Jefatura, coordinació', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (84,'Gerencia, subdirección', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (84,'Dirección, consejero, socio, propietario', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (85,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (85,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (85,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (85,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (85,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (86,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (86,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (86,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (86,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (86,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (87,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (87,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (87,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (87,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (87,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (88,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (88,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (88,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (88,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (88,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (89,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (89,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (89,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (89,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (89,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (90,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (90,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (90,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (90,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (90,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (91,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (91,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (91,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (91,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (91,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (92,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (92,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (92,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (92,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (92,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (93,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (93,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (93,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (93,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (93,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (94,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (94,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (94,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (94,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (94,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (95,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (95,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (95,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (95,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (95,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (96,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (96,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (96,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (96,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (96,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (97,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (97,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (97,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (97,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (97,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (98,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (98,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (98,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (98,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (98,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (99,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (99,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (99,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (99,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (99,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (100,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (100,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (100,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (100,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (100,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (101,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (101,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (101,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (101,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (101,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (102,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (102,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (102,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (102,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (102,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (103,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (103,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (103,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (103,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (103,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (104,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (104,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (104,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (104,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (104,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (105,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (105,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (105,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (105,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (105,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (106,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (106,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (106,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (106,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (106,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (107,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (107,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (107,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (107,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (107,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (108,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (108,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (108,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (108,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (108,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (109,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (109,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (109,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (109,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (109,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (110,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (110,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (110,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (110,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (110,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (111,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (111,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (111,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (111,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (111,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (112,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (112,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (112,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (112,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (112,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (113,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (113,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (113,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (113,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (113,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (114,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (114,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (114,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (114,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (114,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (115,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (115,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (115,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (115,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (115,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (116,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (116,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (116,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (116,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (116,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (117,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (117,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (117,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (117,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (117,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (118,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (118,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (118,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (118,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (118,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (119,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (119,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (119,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (119,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (119,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (120,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (120,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (120,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (120,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (120,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (121,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (121,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (121,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (121,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (121,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (122,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (122,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (122,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (122,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (122,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (123,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (123,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (123,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (123,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (123,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (124,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (124,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (124,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (124,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (124,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (125,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (125,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (125,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (125,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (125,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (126,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (126,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (126,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (126,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (126,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (127,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (127,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (127,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (127,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (127,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (128,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (128,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (128,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (128,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (128,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (129,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (129,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (129,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (129,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (129,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (130,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (130,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (130,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (130,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (130,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (131,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (131,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (131,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (131,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (131,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (132,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (132,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (132,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (132,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (132,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (133,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (133,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (133,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (133,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (133,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (134,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (134,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (134,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (134,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (134,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (135,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (135,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (135,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (135,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (135,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (136,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (136,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (136,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (136,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (136,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (137,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (137,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (137,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (137,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (137,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (138,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (138,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (138,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (138,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (138,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (139,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (139,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (139,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (139,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (139,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (140,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (140,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (140,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (140,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (140,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (141,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (141,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (141,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (141,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (141,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (142,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (142,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (142,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (142,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (142,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (143,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (143,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (143,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (143,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (143,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (144,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (144,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (144,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (144,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (144,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (145,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (145,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (145,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (145,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (145,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (146,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (146,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (146,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (146,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (146,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (147,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (147,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (147,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (147,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (147,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (148,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (148,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (148,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (148,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (148,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (149,'Si', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (149,'No', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (150,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (150,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (150,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (150,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (150,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (151,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (151,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (151,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (151,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (151,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (152,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (152,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (152,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (152,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (152,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (153,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (153,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (153,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (153,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (153,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (154,'Si', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (154,'No', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (155,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (155,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (155,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (155,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (155,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (156,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (156,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (156,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (156,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (156,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (157,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (157,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (157,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (157,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (157,'Nunca', 5, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (158,'Siempre', 1, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (158,'Casi siempre', 2, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (158,'Algunas veces', 3, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (158,'Casi nunca', 4, 1, now(), 1);
INSERT INTO desarrollo.tbl_respuestas (id_pregunta, nombre, orden, id_usuario_crea, fch_creacion, ban_activo) VALUES (158,'Nunca', 5, 1, now(), 1);


INSERT INTO desarrollo.tbl_productos (id_cuestionario, precio, empleados_rango_inicial, empleados_rango_final, id_usuario_crea, fch_creacion, ban_activo, nombre) VALUES (1, 100.00, 1, 15, 1, now(), 1,'Resumen general de eventos traumáticos severos');
INSERT INTO desarrollo.tbl_productos (id_cuestionario, precio, empleados_rango_inicial, empleados_rango_final, id_usuario_crea, fch_creacion, ban_activo, nombre) VALUES (1, 200.00, 16, 50, 1, now(), 1,'Resumen general de eventos traumáticos severos');
INSERT INTO desarrollo.tbl_productos (id_cuestionario, precio, empleados_rango_inicial, empleados_rango_final, id_usuario_crea, fch_creacion, ban_activo, nombre) VALUES (1, 400.00, 51, 100000, 1, now(), 1,'Resumen general de eventos traumáticos severos');
INSERT INTO desarrollo.tbl_productos (id_cuestionario, precio, empleados_rango_inicial, empleados_rango_final, id_usuario_crea, fch_creacion, ban_activo, nombre) VALUES (1, 100.00, 1, 15, 1, now(), 1,'Hojas individuales de eventos traumáticos severos');
INSERT INTO desarrollo.tbl_productos (id_cuestionario, precio, empleados_rango_inicial, empleados_rango_final, id_usuario_crea, fch_creacion, ban_activo, nombre) VALUES (1, 200.00, 16, 50, 1, now(), 1,'Hojas individuales de eventos traumáticos severos');
INSERT INTO desarrollo.tbl_productos (id_cuestionario, precio, empleados_rango_inicial, empleados_rango_final, id_usuario_crea, fch_creacion, ban_activo, nombre) VALUES (1, 400.00, 51, 100000, 1, now(), 1,'Hojas individuales de eventos traumáticos severos');
INSERT INTO desarrollo.tbl_productos (id_cuestionario, precio, empleados_rango_inicial, empleados_rango_final, id_usuario_crea, fch_creacion, ban_activo, nombre) VALUES (2, 600.00, 16, 50, 1, now(), 1,'Resumen');
INSERT INTO desarrollo.tbl_productos (id_cuestionario, precio, empleados_rango_inicial, empleados_rango_final, id_usuario_crea, fch_creacion, ban_activo, nombre) VALUES (3, 1200.00, 51, 100000, 1, now(), 1,'Resumen');
INSERT INTO desarrollo.tbl_productos (id_cuestionario, precio, empleados_rango_inicial, empleados_rango_final, id_usuario_crea, fch_creacion, ban_activo, nombre) VALUES (2, 1000.00, 16, 50, 1, now(), 1,'Resultado por área de trabajo y recomendaciones');
INSERT INTO desarrollo.tbl_productos (id_cuestionario, precio, empleados_rango_inicial, empleados_rango_final, id_usuario_crea, fch_creacion, ban_activo, nombre) VALUES (3, 2000.00, 51, 100000, 1, now(), 1,'Resultado por área de trabajo y recomendaciones');
