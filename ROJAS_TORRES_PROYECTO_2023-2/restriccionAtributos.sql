-- Personal
-- Para la tabla de clientes
ALTER TABLE clientes ADD CONSTRAINT CK_Tidentificacion_Cli CHECK (documentoId LIKE 'C__________');
ALTER TABLE clientes ADD CONSTRAINT CK_ClienteCorreoValido CHECK (REGEXP_LIKE(correoElectronico, '[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}'));
ALTER TABLE clientes ADD CONSTRAINT CK_activoCliente CHECK (activo IN ('F','T'));

-- GC --> Personal --------
ALTER TABLE empleados ADD CONSTRAINT CK_Tidentificacion_Emp CHECK (idEmpleado LIKE 'E__________');
ALTER TABLE empleados ADD CONSTRAINT CK_TEstadoEmpleo CHECK (estadoEmpleado IN ('A','D','P'));
ALTER TABLE empleados ADD CONSTRAINT CK_TEmpleado CHECK (empleado IN ('V','A','R','G','L','P','B'));
ALTER TABLE empleados ADD CONSTRAINT CK_EmpleadoCorreoValido CHECK (REGEXP_LIKE(correoElectronico, '[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}'));

-- HorarioEmpleados
ALTER TABLE horarioEmpleados ADD CONSTRAINT CK_TSemanaH CHECK (diaSemana IN ('L','M','W','J','V','S','D'));
ALTER TABLE horarioEmpleados ADD CONSTRAINT CK_TRolH CHECK (rol IN ('U','A'));
ALTER TABLE horarioEmpleados ADD CONSTRAINT CK_OCUPADO CHECK (ocupado IN ('F','T'));
ALTER TABLE horarioEmpleados ADD CONSTRAINT CK_DISPONIBLE CHECK (ocupado IN ('F','T'));
ALTER TABLE horarioEmpleados ADD CONSTRAINT CK_idHorarioempleado CHECK (idHorario LIKE 'HO__________');

-- Certificaciones
ALTER TABLE certificaciones ADD CONSTRAINT CK_URLCertificacion CHECK (urlCertificacion LIKE 'https://%');
ALTER TABLE certificaciones ADD CONSTRAINT CK_TCertificacion CHECK (idCertificacion LIKE 'CERTI__________');
ALTER TABLE certificaciones ADD CONSTRAINT CK_TipoCertificacion CHECK (tipoCertificacion IN ('A','F','I'));

-- Pacientes
ALTER TABLE pacientes ADD CONSTRAINT CK_Tidentificacion_Pac CHECK (idPaciente LIKE 'P__________');
ALTER TABLE pacientes ADD CONSTRAINT CK_TChip_Pac CHECK (REGEXP_LIKE(numeroChip, '^[A-Za-z]{3}\d{12}$'));
ALTER TABLE pacientes ADD CONSTRAINT CK_TSexo CHECK (sexo IN('H','M'));
ALTER TABLE directorios ADD CONSTRAINT CK_TipoAnimal CHECK (tipoAnimal IN ('Pez', 'Conejo', 'Roedor', 'Perro', 'Gato', 'Reptil'));
ALTER TABLE pacientes ADD CONSTRAINT CK_Esterilizado CHECK (esterilizado IN ('F','T'));

-- Historial
ALTER TABLE historial ADD CONSTRAINT CK_THistorial1 CHECK (idRegistro LIKE 'H__________');

-- Servicios
ALTER TABLE servicios ADD CONSTRAINT CK_TIDservicio CHECK (idServicio LIKE 'S__________');
ALTER TABLE servicios ADD CONSTRAINT CK_EstadoServicio CHECK (estado IN ('F','T'));
ALTER TABLE servicios ADD CONSTRAINT CK_TServicio CHECK (tipo IN ('M','C','V','L'));

-- Vacunas
ALTER TABLE vacunas ADD CONSTRAINT CK_TDosis CHECK (dosis LIKE '%mL');

-- Guarderias
ALTER TABLE guarderias ADD CONSTRAINT CK_TGuarderia CHECK (idGuarderia LIKE 'G__________');


-- Personal
-- Para la tabla de clientes
ALTER TABLE clientes DROP CONSTRAINT CK_Tidentificacion_Cli;
ALTER TABLE clientes DROP CONSTRAINT CK_ClienteCorreoValido;
ALTER TABLE clientes DROP CONSTRAINT CK_activoCliente;


-- GC --> Personal --------
ALTER TABLE empleados DROP CONSTRAINT CK_Tidentificacion_Emp;
ALTER TABLE empleados DROP CONSTRAINT CK_TEstadoEmpleo;
ALTER TABLE empleados DROP CONSTRAINT CK_TEmpleado;
ALTER TABLE empleados DROP CONSTRAINT CK_EmpleadoCorreoValido;

-- HorarioEmpleados

ALTER TABLE horarioEmpleados DROP CONSTRAINT CK_TSemanaH;
ALTER TABLE horarioEmpleados DROP CONSTRAINT CK_TRolH;
ALTER TABLE horarioEmpleados DROP CONSTRAINT CK_OCUPADO;
ALTER TABLE horarioEmpleados DROP CONSTRAINT CK_DISPONIBLE;
ALTER TABLE horarioEmpleados DROP CONSTRAINT CK_idHorarioempleado;

-- Certificaciones
ALTER TABLE certificaciones DROP CONSTRAINT CK_URLCertificacion;
ALTER TABLE certificaciones DROP CONSTRAINT CK_TCertificacion;
ALTER TABLE certificaciones DROP CONSTRAINT CK_TipoCertificacion;

-- Pacientes
ALTER TABLE pacientes DROP CONSTRAINT CK_Tidentificacion_Pac;
ALTER TABLE pacientes DROP CONSTRAINT CK_TChip_Pac;
ALTER TABLE pacientes DROP CONSTRAINT CK_TSexo;
ALTER TABLE directorios DROP CONSTRAINT CK_TipoAnimal;
ALTER TABLE pacientes DROP CONSTRAINT CK_Esterilizado;

-- Historial
ALTER TABLE historial DROP CONSTRAINT CK_THistorial1;

-- Servicios
ALTER TABLE servicios DROP CONSTRAINT CK_EstadoServicio;
ALTER TABLE servicios DROP CONSTRAINT CK_TServicio;

-- Vacunas
ALTER TABLE vacunas DROP CONSTRAINT CK_TDosis;

-- Guarderias
ALTER TABLE guarderias DROP CONSTRAINT CK_TGuarderia;
