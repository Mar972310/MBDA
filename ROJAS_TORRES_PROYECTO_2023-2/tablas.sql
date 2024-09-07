-- Create tables

--------GC --> PACIENTE--------------------------
CREATE TABLE pacientes (
    idPaciente     VARCHAR(11)  NOT NULL,
    cliente        VARCHAR(11)  NOT NULL,
    nombrePac      VARCHAR(50)  NOT NULL,
    especie        VARCHAR(50)  NOT NULL,
    raza           VARCHAR(50)  NOT NULL,
    fechaRegistro  DATE         NOT NULL,
    peso           NUMBER(5, 2) NOT NULL,
    sexo           CHAR(1)      NOT NULL,
    fechaNacimiento DATE,
    edad           NUMBER(3)    NOT NULL,
    comportamiento VARCHAR(150)  NOT NULL,
    numeroChip     VARCHAR(15),
    esterilizado   CHAR(1),
    ACTIVO         CHAR(1)     NOT NULL,
    fechaActualizacion DATE    NOT NULL
);

CREATE TABLE pacientesDORM (
    idPaciente     VARCHAR(11)  NOT NULL,
    fechaRegistro  DATE         NOT NULL,
    fechaMuerte    DATE
);

CREATE TABLE directorios (
    idRazaEspecie  VARCHAR(50)  NOT NULL,
    tipoAnimal     VARCHAR(30)  NOT NULL,
    nombreRaza     VARCHAR(150) NOT NULL,
    origen         VARCHAR(150) NOT NULL,
    tamanoPromedio VARCHAR(20)   NOT NULL,
    esperanzaVida  NUMBER(3)    NOT NULL,
    caracteristicasFisicas VARCHAR(150)  NOT NULL,
    comportamientoCaracteristico VARCHAR(150)  NOT NULL,
    alimentacionRecomendada VARCHAR(150)  NOT NULL,
    enfermedadesComunes VARCHAR(150)  NOT NULL,
    regulacionLegal char(1)    NOT NULL,
    habitad        VARCHAR(150)  
);

--------GC --> Cliente--------------------------
CREATE TABLE Clientes (
    documentoId         VARCHAR(11)  NOT NULL,
    nombre              VARCHAR(50)  NOT NULL,
    apellido            VARCHAR(50)  NOT NULL,
    numTelefono          VARCHAR(10)   NOT NULL,
    activo               CHAR(1)      NOT NULL,
    direccion           VARCHAR(100)  NOT NULL,
    correoElectronico   VARCHAR(100)
);


--------GC --> HISTORIAL--------------------------


CREATE TABLE historial (
    idRegistro          VARCHAR(11)  NOT NULL,
    fechaRegistro       DATE         NOT NULL,
    servicio            VARCHAR(11)   NOT NULL
);

--------GC --> PERSONAL----------------------------R

CREATE TABLE empleados (
    idEmpleado        VARCHAR(11)  NOT NULL,   
    nombre            VARCHAR(50)  NOT NULL,
    apellido          VARCHAR(50)  NOT NULL,   
    fechaNacimiento   DATE         NOT NULL,
    fechaRegistro     Date         NOT NULL,
    numeroTelefono    VARCHAR(10)   NOT NULL,
    correoElectronico VARCHAR(100) NOT NULL,   
    salario           NUMBER(8)   NOT NULL,
    estadoEmpleado    CHAR(1)     NOT NULL,
    empleado          CHAR(1)     NOT NULL
);

CREATE TABLE horarioEmpleados(
    idHorario         VARCHAR(12) NOT NULL,
    empleado          VARCHAR(11) NOT NULL,
    fechaInicio       DATE        NOT NULL,
    fechaFin          DATE        NOT NULL,
    diaSemana         CHAR(1)     NOT NULL,
    ocupado           CHAR(1)     NOT NULL,
    rol               CHAR(1)      
);

CREATE TABLE Certificaciones(
    idCertificacion             VARCHAR(15)     NOT NULL,
    numRegistroCertificacion    NUMBER(15)      NOT NULL,
    urlCertificacion            VARCHAR(100),
    fechaEmision                Date            NOT NULL,
    fechaVencimiento            Date,
    tipoCertificacion           CHAR(1)         NOT NULL,
    institucionPersonaEmite     VARCHAR(50)     NOT NULL,
    nombreCertificacion         VARCHAR(50)     NOT NULL,
    contactoInstitucionPersona  NUMBER(10)      NOT NULL,
    documentoFisico             VARCHAR(100),
    categoria                   CHAR(1),
    empleado                    VARCHAR(11)     NOT NULL
);
--------GC --> SERVICIOS--------------------------


CREATE TABLE servicios (
    idServicio          VARCHAR(11)  NOT NULL,
    nombre              VARCHAR(50)  NOT NULL, 
    costo               NUMBER(8)   NOT NULL,
    empleado            VARCHAR(11)  NOT NULL,
    tipo                CHAR(1)      NOT NULL,
    fecha               DATE         NOT NULL,
    fechaFin            DATE         NOT NULL,
    paciente            VARCHAR(11),
    estado              CHAR(1)         NOT NULL,
    duracionEstimada    NUMBER(4)    NOT NULL,
    observaciones       VARCHAR(150)  
);
CREATE TABLE vacunas (
    idServicio      VARCHAR(11)  NOT NULL,
    fechaProxima    DATE,
    dosis           VARCHAR(5)  NOT NULL,
    lote            VARCHAR(50) NOT NULL
);

CREATE TABLE laboratorios (
    idServicio         VARCHAR(11)   NOT NULL,
    resultadoAnalisis  VARCHAR(200)  NOT NULL,
    labRealizado       VARCHAR(50)   NOT NULL,
    motivo             VARCHAR(150)  NOT NULL
);

CREATE TABLE citas (
    idServicio         VARCHAR(11)   NOT NULL,
    duracion           NUMBER(5)    NOT NULL,
    motivo             VARCHAR(150) NOT NULL,
    recetaMedica       VARCHAR(50),
    fechaProxima       DATE
);

CREATE TABLE cirugias (
    idServicio         VARCHAR(11)   NOT NULL,
    duracion           NUMBER(5)    NOT NULL,
    equipoQuirurgico   VARCHAR(150) NOT NULL,
    complicaciones     VARCHAR(150),     
    recetaMedica       VARCHAR(150) NOT NULL,
    anestesia          VARCHAR(30)  NOT NULL,
    fechaFin           DATE         NOT NULL,
    estadoPos          VARCHAR(150) NOT NULL
);


CREATE TABLE guarderias(
    idGuarderia        VARCHAR(11)  NOT NULL,
    fechaInicio        DATE         NOT NULL,
    paciente           VARCHAR(11)  NOT NULL,
    fechaFin           DATE         NOT NULL,
    estado             CHAR         NOT NULL
    
);
-----



/*xTablas*/


DROP TABLE pacientes CASCADE CONSTRAINTS;
DROP TABLE pacientesDORM CASCADE CONSTRAINTS;
DROP TABLE directorios CASCADE CONSTRAINTS;
DROP TABLE clientes CASCADE CONSTRAINTS;
DROP TABLE historial CASCADE CONSTRAINTS;
DROP TABLE empleados CASCADE CONSTRAINTS;
DROP TABLE horarioEmpleados CASCADE CONSTRAINTS;
DROP TABLE certificaciones CASCADE CONSTRAINTS;
DROP TABLE servicios CASCADE CONSTRAINTS;
DROP TABLE vacunas CASCADE CONSTRAINTS;
DROP TABLE laboratorios CASCADE CONSTRAINTS;
DROP TABLE citas CASCADE CONSTRAINTS;
DROP TABLE cirugias CASCADE CONSTRAINTS;
DROP TABLE auditorias CASCADE CONSTRAINTS;
DROP TABLE evaluacionesAuditorias CASCADE CONSTRAINTS;
DROP TABLE guarderias CASCADE CONSTRAINTS;


