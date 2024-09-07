/* Restricciones llaves */

-- Add primary key constraints


ALTER TABLE directorios
ADD CONSTRAINT PK_Directorio PRIMARY KEY(idRazaEspecie);
ALTER TABLE pacientes
ADD CONSTRAINT PK_pacientes PRIMARY KEY(idPaciente);

ALTER TABLE pacientesDORM
ADD CONSTRAINT PK_pacientesDORM PRIMARY KEY(idPaciente);

ALTER TABLE clientes
ADD CONSTRAINT PK_clientes PRIMARY KEY(documentoId);

ALTER TABLE historial
ADD CONSTRAINT PK_historial PRIMARY KEY(idRegistro);

ALTER TABLE empleados
ADD CONSTRAINT PK_empleados PRIMARY KEY(idEmpleado);

ALTER TABLE horarioEmpleados
ADD CONSTRAINT PK_horarioEmpleados PRIMARY KEY(idHorario);

ALTER TABLE servicios
ADD CONSTRAINT PK_servicios PRIMARY KEY(idServicio);


ALTER TABLE vacunas
ADD CONSTRAINT PK_vacunas PRIMARY KEY(idServicio);

ALTER TABLE laboratorios
ADD CONSTRAINT PK_laboratorios PRIMARY KEY(idServicio);

ALTER TABLE citas
ADD CONSTRAINT PK_citas PRIMARY KEY(idServicio);


ALTER TABLE guarderias
ADD CONSTRAINT PK_guarderia PRIMARY KEY(idGuarderia);

ALTER TABLE certificaciones
ADD CONSTRAINT PK_certificaciones PRIMARY KEY(idCertificacion);

/*-----------PK PARCIAL------------
ALTER TABLE auditorias
ADD CONSTRAINT PK_auditorias PRIMARY KEY(idAuditoria);

ALTER TABLE evaluacionesAuditorias
ADD CONSTRAINT PK_evaluacionesAuditorias PRIMARY KEY(idEvaluacion);

*/

--ADD UK CONSTRAINTS

ALTER TABLE EMPLEADOS
ADD CONSTRAINT UK_EPLEADOS UNIQUE (numeroTelefono,correoElectronico);

ALTER TABLE clientes
ADD CONSTRAINT UK_clienteS UNIQUE (numTelefono,correoElectronico);

ALTER TABLE CERTIFICACIONES
ADD CONSTRAINT UK_certificaciones UNIQUE (numRegistroCertificacion,urlCertificacion);

ALTER TABLE DIRECTORIOS
ADD CONSTRAINT UK_nombreRaza UNIQUE (nombreRaza);



-- Add foreign key constraints
ALTER TABLE horarioEmpleados
ADD CONSTRAINT FK_horario_empleados FOREIGN KEY (empleado) REFERENCES empleados(idEmpleado);


ALTER TABLE pacientes
ADD CONSTRAINT FK_pacientes_clientesVETERINARIA FOREIGN KEY (cliente) REFERENCES clientes(documentoId);

ALTER TABLE pacientes
ADD CONSTRAINT FK_pacientes_Raza FOREIGN KEY (raza) REFERENCES directorios(idRazaEspecie);


ALTER TABLE historial
ADD CONSTRAINT FK_historiales_servicios FOREIGN KEY (servicio) REFERENCES servicios(idServicio);

ALTER TABLE servicios
ADD CONSTRAINT FK_servicios_empleados FOREIGN KEY (empleado) REFERENCES empleados(idEmpleado);

ALTER TABLE certificaciones
ADD CONSTRAINT FK_certificaciones_empleados FOREIGN KEY (empleado) REFERENCES empleados(idEmpleado);


ALTER TABLE vacunas
ADD CONSTRAINT FK_vacunas_servicios FOREIGN KEY (idServicio) REFERENCES servicios(idServicio);

ALTER TABLE laboratorios
ADD CONSTRAINT FK_laboratorios_servicios FOREIGN KEY (idServicio) REFERENCES servicios(idServicio);

ALTER TABLE citas
ADD CONSTRAINT FK_citas_servicios FOREIGN KEY (idServicio) REFERENCES servicios(idServicio);


ALTER TABLE guarderias
ADD CONSTRAINT FK_guarderia_Paciente FOREIGN KEY (paciente) REFERENCES pacientes(idPaciente);

ALTER TABLE pacientesDORM
ADD CONSTRAINT FK_paciente_D FOREIGN KEY (idPaciente) REFERENCES pacientes(idPaciente);


-- Eliminar restricciones de clave externa
ALTER TABLE pacientesDORM DROP CONSTRAINT FK_paciente_D  CASCADE;
ALTER TABLE guarderias DROP CONSTRAINT FK_guarderia_Paciente CASCADE;
ALTER TABLE citas DROP CONSTRAINT FK_citas_servicios CASCADE;
ALTER TABLE laboratorios DROP CONSTRAINT FK_laboratorios_servicios CASCADE;
ALTER TABLE vacunas DROP CONSTRAINT FK_vacunas_servicios CASCADE;
ALTER TABLE certificaciones DROP CONSTRAINT FK_certificaciones_empleados CASCADE;
ALTER TABLE servicios DROP CONSTRAINT FK_servicios_empleados CASCADE;
ALTER TABLE historial DROP CONSTRAINT FK_historiales_servicios CASCADE;
ALTER TABLE pacientes DROP CONSTRAINT FK_pacientes_Raza CASCADE;
ALTER TABLE pacientes DROP CONSTRAINT FK_pacientes_clientesVETERINARIA CASCADE;
ALTER TABLE horarioEmpleados DROP CONSTRAINT FK_horario_empleados CASCADE;

-- Eliminar restricciones de clave única
ALTER TABLE certificaciones DROP CONSTRAINT UK_certificaciones CASCADE;
ALTER TABLE clientes DROP CONSTRAINT UK_clienteS CASCADE;
ALTER TABLE EMPLEADOS DROP CONSTRAINT UK_EPLEADOS CASCADE;
ALTER TABLE directorios DROP CONSTRAINT UK_nombreRaza CASCADE;

-- Eliminar restricciones de clave primaria
ALTER TABLE certificaciones DROP CONSTRAINT PK_certificaciones CASCADE;
ALTER TABLE guarderias DROP CONSTRAINT PK_guarderia CASCADE;
ALTER TABLE citas DROP CONSTRAINT PK_citas CASCADE;
ALTER TABLE laboratorios DROP CONSTRAINT PK_laboratorios CASCADE;
ALTER TABLE vacunas DROP CONSTRAINT PK_vacunas CASCADE;
ALTER TABLE servicios DROP CONSTRAINT PK_servicios CASCADE;
ALTER TABLE horarioEmpleados DROP CONSTRAINT PK_horarioEmpleados CASCADE;
ALTER TABLE empleados DROP CONSTRAINT PK_empleados CASCADE;
ALTER TABLE historial DROP CONSTRAINT PK_historial CASCADE;
ALTER TABLE clientes DROP CONSTRAINT PK_clientes CASCADE;
ALTER TABLE pacientesDORM DROP CONSTRAINT PK_pacientesDORM CASCADE;
ALTER TABLE pacientes DROP CONSTRAINT PK_pacientes CASCADE;
ALTER TABLE directorios DROP CONSTRAINT PK_Directorio CASCADE;




