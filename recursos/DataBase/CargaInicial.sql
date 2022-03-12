
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
    VALUES ('ADMINGENERAL', '2758d92e216577218ec0c153d3b54dd2', 'ADMINISTRADOR NOMBRE', 'correo@mail.com', 1, 1, now(), 0, 1);


INSERT INTO desarrollo.tbl_cata_giros (nombre, ban_activo) VALUES ('Giro 1', 1);


INSERT INTO desarrollo.tbl_cata_actividad_estatus (nombre, ban_activo) VALUES ('Uso libre', 1);
INSERT INTO desarrollo.tbl_cata_actividad_estatus (nombre, ban_activo) VALUES ('Comprado', 1);
INSERT INTO desarrollo.tbl_cata_actividad_estatus (nombre, ban_activo) VALUES ('Descargado', 1);
INSERT INTO desarrollo.tbl_cata_actividad_estatus (nombre, ban_activo) VALUES ('Entregado', 1);



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
