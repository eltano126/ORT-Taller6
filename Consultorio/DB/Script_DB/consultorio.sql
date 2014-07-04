CREATE TABLE paciente(
pa_dni integer primary key,
pa_nombre varchar(64),
pa_apellido varchar(64),
pa_sexo varchar (1),
pa_nacimiento varchar(64),
pa_direccion varchar(128),
pa_telefono integer,
pa_celular integer,
pa_mail varchar(64)
);

CREATE TABLE medico(
me_matricula integer primary key,
me_usuario varchar(64),
me_pass varchar (64),
me_nombre varchar(64),
me_apellido varchar(64),
me_horario_aten varchar(64)
);

CREATE TABLE tratamiento(
tr_id integer primary key autoincrement,
tr_nombre varchar(64),
tr_descripcion varchar(128),
tr_duracion integer
);

CREATE TABLE turno(
tu_id integer primary key autoincrement,
tu_medico integer,
tu_paciente integer,
tu_tratamiento integer,
FOREIGN KEY (tu_medico) REFERENCES medico(me_matricula),
FOREIGN KEY (tu_paciente) REFERENCES paciente(pa_dni),
FOREIGN KEY (tu_tratamiento) REFERENCES tratamiento(tr_id)
);

-- INSERT DE PACIENTES
INSERT INTO paciente (pa_dni, pa_nombre, pa_apellido, pa_sexo, pa_nacimiento, pa_direccion, pa_telefono, pa_celular, pa_mail)
 values (31764118, 'Enzo', 'Toscano', 'M', '05/09/1985', 'Guayaquil 582', 49023874, 1531689931, 'eltano126@gmail.com');
INSERT INTO paciente (pa_dni, pa_nombre, pa_apellido, pa_sexo, pa_nacimiento, pa_direccion, pa_telefono, pa_celular, pa_mail)
 values (30382987, 'Cristian', 'Ilinczyk', 'M', '04/02/1985', 'Yatay 123', 46578907, 1594837162, 'cristian_ilinczyk@hotmail.com');

-- INSERT DE MEDICOS
INSERT INTO medico (me_matricula, me_usuario, me_pass, me_nombre, me_apellido, me_horario_aten)
 values ('12345', 'etoscano', 'pass', 'M_Enzo', 'M_Toscano', '09 a 18');
INSERT INTO medico (me_matricula, me_usuario, me_pass, me_nombre, me_apellido, me_horario_aten)
 values ('9876', 'cilinzcyk', 'asd123', 'M_Cristian', 'M_Iliczyk', '18 a 03');

-- INSERT DE TRATAMIENTOS
INSERT INTO tratamiento (tr_nombre, tr_descripcion, tr_duracion)
 values ('Mesoterapia', 'Aplicacion de Mesoterapia', 15);
INSERT INTO tratamiento (tr_nombre, tr_descripcion, tr_duracion)
 values ('Depilacion', 'Maquina de Depilacion', 60);