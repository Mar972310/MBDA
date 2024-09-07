--LABORATORIO 3
--Ciclo1: Tablas
CREATE TABLE Personas (
    id_Persona  NUMBER(9)      NOT NULL,
    tipo        VARCHAR(2)     NOT NULL,
    numero      VARCHAR(10)    NOT NULL,
    nombre      VARCHAR(50)    NOT NULL,
    registro    DATE           NOT NULL,
    celular     NUMBER(10)     NOT NULL,
    correo      VARCHAR(50)    NOT NULL
);

CREATE TABLE Clientes(
    persona         NUMBER(9)      NOT NULL,
    idiomaNativo    VARCHAR(10)    NOT NULL  
);

CREATE TABLE conductores(
    persona         NUMBER(9)      NOT NULL,
    licencia        VARCHAR(10)    NOT NULL,
    fechaNacimiento DATE           NOT NULL,
    estrellas       NUMBER(1)      NOT NULL,
    estado          VARCHAR(1)     NOT NULL
);

CREATE TABLE Vehiculos(
    placa           VARCHAR(30)    NOT NULL,
    a_o             NUMBER(4)      NOT NULL,
    tipo            VARCHAR(1)     NOT NULL,
    estado          VARCHAR(1)     NOT NULL,
    puertas         NUMBER(3),
    pasajeros       NUMBER(3),
    carga           NUMBER(3),
    conductor       NUMBER(9)      NOT NULL
);

CREATE TABLE Tarjetas(
    numero          NUMBER(15)     NOT NULL,
    entidad         VARCHAR(10)    NOT NULL,
    vencimiento     DATE           NOT NULL
);

CREATE TABLE Presenta(
    cliente         NUMBER(9)      NOT NULL,
    tarjeta         NUMBER(15)     NOT NULL
);

CREATE TABLE Solicitudes(
    codigo          NUMBER(9)      NOT NULL,
    fechaCreacion   DATE,           
    fechaViaje      DATE,
    plataforma      VARCHAR(1)     NOT NULL,
    precio          NUMBER(5),
    estado          VARCHAR(1)     NOT NULL,
    cliente         NUMBER(9)      NOT NULL,
    latitudI        DECIMAL(3,2)   NOT NULL,
    longitudI       DECIMAL(3,2)   NOT NULL,
    latitudF        DECIMAL(3,2)   NOT NULL,
    longitudF       DECIMAL(3,2)   NOT NULL
);


CREATE TABLE PQRS(
    ticked          VARCHAR(13)    NOT NULL,
    radicacion      DATE           NOT NULL,
    cierre          DATE,
    descripcion     VARCHAR(255),
    tipo            CHAR(1)        NOT NULL,
    estado          CHAR(1)        NOT NULL,
    solicitud       NUMBER(9)      NOT NULL
);

CREATE TABLE  Anexos(
    pqrs            VARCHAR(13)    NOT NULL,
    urlP            VARCHAR(100)   NOT NULL,
    nombre          VARCHAR(20)    NOT NULL
); 

CREATE TABLE PqrsRespuestas(
    pqrs            VARCHAR(13)    NOT NULL,
    fecha           DATE           NOT NULL,
    descripcion     VARCHAR(50)    NOT NULL,
    nombre          VARCHAR(20)    NOT NULL,
    correo          VARCHAR(50)    NOT NULL,
    comentario      VARCHAR(20),
    evaluacion      NUMBER(1)
);

CREATE TABLE Posiciones(
    latitud        DECIMAL(3,2)   NOT NULL,
    longitud       DECIMAL(3,2)   NOT NULL
);

CREATE TABLE Requerimientos(
    solicitud       NUMBER(9)      NOT NULL,
    requerimiento   VARCHAR(100)   NOT NULL
);

--CICLO 1: PoblarOK(1)

/*SELECT 'INSERT INTO clientes (persona, idiomaNativo) VALUES (''' || persona || ''', ''' || idiomaNativo || ''');'
FROM clientes;*/

INSERT INTO clientes (persona, idiomaNativo) VALUES (102358109, 'Ingles');
INSERT INTO clientes (persona, idiomaNativo) VALUES (124576789, 'Espaï¿½ol');
INSERT INTO clientes (persona, idiomaNativo) VALUES (214912841, 'Portugues');

/*SELECT 'INSERT INTO conductores (persona, licencia, fechaNacimiento, estrellas, estado) VALUES (''' || persona || ''', ''' || licencia || ''', 
                                                                                                  ''' || fechaNacimiento || ''', ''' || estrellas || ''', 
                                                                                                  ''' || estado || ''');'
FROM conductores;*/

INSERT INTO conductores (persona, licencia, fechaNacimiento, estrellas, estado) VALUES (113654972, 2136549120, TO_DATE('2012-11-02', 'YYYY-MM-DD'), 3, 'A');
INSERT INTO conductores (persona, licencia, fechaNacimiento, estrellas, estado) VALUES (145897341, 3139549731, TO_DATE('2001-07-04', 'YYYY-MM-DD'), 4, 'I');
INSERT INTO conductores (persona, licencia, fechaNacimiento, estrellas, estado) VALUES (245198721, 1136549526, TO_DATE('1997-02-07', 'YYYY-MM-DD'), 5, 'O');


/*SELECT 'INSERT INTO vehiculos (placa, a_o, tipo, estado, puertas, pasajeros, carga, conductor) VALUES (''' || placa || ''', ''' || a_o || ''', 
                                                                                                         ''' || tipo || ''', ''' || estado || ''', ''' || puertas || ''',                                                                                           ''' || pasajeros || ''', ''' || carga || ''', ''' || conductor || ''');'
FROM vehiculos;*/

INSERT INTO vehiculos (placa, a_o, tipo, estado, puertas, pasajeros, carga, conductor) VALUES ('ABC291', 887, 'A', 'I', 2, 2, 120, 113654972);
INSERT INTO vehiculos (placa, a_o, tipo, estado, puertas, pasajeros, carga, conductor) VALUES ('BAC214', 900, 'C', 'A', 5, 3, 110, 145897341);
INSERT INTO vehiculos (placa, a_o, tipo, estado, puertas, pasajeros, carga, conductor) VALUES ('CAB412', 120, 'A', 'A', 1, 9, 200, 245198721);

/*SELECT 'INSERT INTO solicitudes (codigo, fechaCreacion, fechaViaje, plataforma, precio, estado, cliente, latitudI, longitudI, latitudF, longitudF) VALUES (codigo, fechaCreacion, 
                                                                                                  fechaViaje, plataforma, precio, estado, cliente, latitudI, longitudI, latitudF, longitudF);'
FROM solicitudes;*/
INSERT INTO Solicitudes (codigo, fechaCreacion, fechaViaje, plataforma, estado, precio, cliente, latitudI, longitudI, latitudF, longitudF)
VALUES (3, TO_DATE('2023-10-07', 'YYYY-MM-DD'), TO_DATE('2023-10-15', 'YYYY-MM-DD'), 'W', 'P', 300.00, 3909, 9.96, -6.87, 9.85, -3.24);

INSERT INTO Solicitudes (codigo, fechaCreacion, fechaViaje, plataforma, estado, precio, cliente, latitudI, longitudI, latitudF, longitudF)
VALUES (4, TO_DATE('2023-10-08', 'YYYY-MM-DD'), TO_DATE('2023-10-18', 'YYYY-MM-DD'), 'A', 'P', 800.00, 4909, 2.37, -5.92, 2.54, -4.89);

INSERT INTO Solicitudes (codigo, fechaCreacion, fechaViaje, plataforma, estado, precio, cliente, latitudI, longitudI, latitudF, longitudF)
VALUES (5, TO_DATE('2023-10-09', 'YYYY-MM-DD'), TO_DATE('2023-10-20', 'YYYY-MM-DD'), 'W', 'P', 700.00, 1009, 2.38, -7.67, 3.39, -9.78);

/*SELECT 'INSERT INTO PQRS (ticked, radicacion, cierre, descricion, tipo, estado, solicitud) VALUES (ticked, radicacion, cierre, descricion, tipo, estado, solicitud);'
FROM PQRS;*/

INSERT INTO PQRS (ticked, radicacion, cierre, descripcion, tipo, estado, solicitud)
VALUES ('455899012', TO_DATE('2023-03-07', 'YYYY-MM-DD'), TO_DATE('2023-04-01', 'YYYY-MM-DD'), NULL, 'P', 'A', 523369010);

INSERT INTO PQRS (ticked, radicacion, cierre, descripcion, tipo, estado, solicitud)
VALUES ('555899012', TO_DATE('2023-02-10', 'YYYY-MM-DD'), TO_DATE('2023-03-01', 'YYYY-MM-DD'), NULL, 'S', 'A', 419089012);

INSERT INTO PQRS (ticked, radicacion, cierre, descripcion, tipo, estado, solicitud)
VALUES ('631899012', TO_DATE('2023-12-30', 'YYYY-MM-DD'), TO_DATE('2024-01-15', 'YYYY-MM-DD'), NULL, 'Q', 'A', 208981771);

/*SELECT 'INSERT INTO Pqrsrespuestas (ticked, radicacion, cierre, descricion, tipo, estado, solicitud) VALUES (ticked, radicacion, cierre, descricion, tipo, estado, solicitud);'
FROM PQRS;*/
INSERT INTO Pqrsrespuestas (pqrs, fecha, descripcion, nombre, correo, comentario, evaluacion)
VALUES ('455899012', TO_DATE('2023-04-01', 'YYYY-MM-DD'), 'ww', 'Pablo', 'pablo@gmail.com', 'Hola', 1);

INSERT INTO Pqrsrespuestas (pqrs, fecha, descripcion, nombre, correo, comentario, evaluacion)
VALUES ('555899012', TO_DATE('2023-03-01', 'YYYY-MM-DD'), 'bb', 'Julian', 'julian@hotmail.com', 'Hola', 6);

INSERT INTO Pqrsrespuestas (pqrs, fecha, descripcion, nombre, correo, comentario, evaluacion)
VALUES ('631899012', TO_DATE('2024-01-15', 'YYYY-MM-DD'), 'cc', 'Juan', 'juan@escuelaing.edu.co', 'Hola', 2);


--CICLO 1: PoblarNoOk 2 

--PARTE 2 (INCISO C) Agregar al documento
--insertar una fecha en un formato diferente a 'YYYY-MM-DD'
INSERT INTO conductores (persona, licencia, fechaNacimiento, estrellas, estado)
VALUES (113654972, 2136549120, '02-11-2012', 3, 'A');
--insertar un nulo en el atributo estrellas que no puede ser nulo
INSERT INTO conductores (persona, licencia, fechaNacimiento, estrellas, estado)
VALUES (145897341, 3139549731, TO_DATE('2001-07-04', 'YYYY-MM-DD'), NULL, 'I');
--insertar una cadena en lugar de un numero entero de longitud 9
INSERT INTO clientes (persona, idiomaNativo)
VALUES (dfbhdbvfbg, 'Portugues');
--insertar en dos atributos las fechas en un formato diferente a 'YYYY-MM-DD', atributos con NULL donde no puede ser null y numero mas largos de la longitud permitida
INSERT INTO PQRS (ticked, radicacion, cierre, descripcion, tipo, estado, solicitud)
VALUES (NULL, '07-03-2023', '01-04-2023', NULL, 'P', NULL , 52336901222220);
--insertar registros incompletos
INSERT INTO solicitudes (codigo, fechaCreacion, fechaViaje, plataforma, precio, estado, cliente, latitudI, longitudI, latitudF, longitudF)
VALUES (523369010, '03-06-1230', '10-06-1230', 'W', 50000, 'A', 102358109, 113654972);

--CICLO 1: PoblarNoOk 3 
--PARTE 3 (INCISO C) Agregar al documento
--el registro se inserta pero el atributo tipo no cumple con las condiciones definidas en el diagrama de conceptos y deberia ser 'M', 'A', 'C'
INSERT INTO vehiculos (placa, a_o, tipo, estado, puertas, pasajeros, carga, conductor)
VALUES ('CAB412', 120, 'K', 'A', 1, 9, 200, 245198721);
--el registro se inserta pero el atributo correo no cumple con las condiciones definidas en el diagrama de conceptos y deberia ser una secuencia de caracteres antes de que se incluya el @ 
INSERT INTO Pqrsrespuestas (pqrs, fecha, descripcion, nombre, correo, comentario, evaluacion)
VALUES (631899012, TO_DATE('2023-03-01', 'YYYY-MM-DD'), 'cc', 'Juan', '@escuealing.edu.co','Hola', 3);
--el registro se inserta, pero el atributo evaluacion no puede ser un numero mayor que 5
INSERT INTO Pqrsrespuestas (pqrs, fecha, descripcion, nombre, correo, comentario, evaluacion)
VALUES ('555899012', TO_DATE('2023-03-01', 'YYYY-MM-DD'), 'bb', 'Julian', 'julian@hotmail.com', 'Hola', 6);
--el registro se inserta pero el atributo estado no cumple con las condiciones definidas en el diagrama de conceptos y deberia ser 'A','I','R','O'
INSERT INTO conductores (persona, licencia, fechaNacimiento, estrellas, estado)
VALUES (2, 'C123456780', TO_DATE('1990-01-15', 'YYYY-MM-DD'), 5, 'Z');
--el registro se inserta pero el atributo ticked no cumple con las condiciones definidas en el diagrama de conceptos y deberia ser un caracter seguido de la concatenacion de 12 numeros
INSERT INTO PQRS (ticked, radicacion, cierre, descripcion, tipo, estado, solicitud)
VALUES ('TICK001', TO_DATE('2023-10-05', 'YYYY-MM-DD'), TO_DATE('2023-10-15', 'YYYY-MM-DD'), 'Consulta', 'P', 'A', 1);

--CICLO 1: XPoblar
DELETE FROM Presenta;
DELETE FROM Vehiculos;
DELETE FROM Tarjetas;
DELETE FROM Anexos;
DELETE FROM PqrsRespuestas;
DELETE FROM PQRS;
DELETE FROM Requerimientos;
DELETE FROM Solicitudes;
DELETE FROM Posiciones;
DELETE FROM Clientes;
DELETE FROM Conductores;
DELETE FROM Personas;

--PROTEGIENDO LLAVES
--Ciclo1: PRIMARY KEY

ALTER TABLE Personas
ADD CONSTRAINT PK_Personas PRIMARY KEY (id_persona);

ALTER TABLE Clientes
ADD CONSTRAINT PK_Clientes PRIMARY KEY (persona);

ALTER TABLE Conductores
ADD CONSTRAINT PK_Conductores PRIMARY KEY (persona);

ALTER TABLE Vehiculos
ADD CONSTRAINT PK_Vehiculos PRIMARY KEY (placa);

ALTER TABLE Tarjetas
ADD CONSTRAINT PK_Tarjetas PRIMARY KEY (numero);

ALTER TABLE Presenta
ADD CONSTRAINT PK_Presenta PRIMARY KEY (cliente,tarjeta);

ALTER TABLE Solicitudes
ADD CONSTRAINT PK_Solicitudes PRIMARY KEY (codigo);

ALTER TABLE PQRS
ADD CONSTRAINT PK_PQRS PRIMARY KEY (ticked);

ALTER TABLE Anexos
ADD CONSTRAINT PK_Anexos PRIMARY KEY (pqrs,urlP);

ALTER TABLE PqrsRespuestas
ADD CONSTRAINT PK_PQRSRespuestas PRIMARY KEY(pqrs);

ALTER TABLE Requerimientos
ADD CONSTRAINT PK_Requerimientos PRIMARY KEY(solicitud, requerimiento);


ALTER TABLE Posiciones 
ADD CONSTRAINT PK_posicion PRIMARY KEY(latitud,longitud);

--Ciclo1: UNIQUE KEY

ALTER TABLE Personas
ADD CONSTRAINT UK_Persona UNIQUE (tipo, numero);

ALTER TABLE Anexos
ADD CONSTRAINT UK_Anexos UNIQUE (urlP);

--Ciclo1: FOREING KEY

ALTER TABLE Clientes
ADD CONSTRAINT FK_cliente FOREIGN KEY (persona) REFERENCES Personas(id_Persona);

ALTER TABLE Conductores
ADD CONSTRAINT FK_conductores FOREIGN KEY (persona) REFERENCES Personas(id_Persona);

ALTER TABLE Vehiculos
ADD CONSTRAINT FK_vehiculos FOREIGN KEY (conductor) REFERENCES Conductores(persona);

ALTER TABLE Presenta
ADD CONSTRAINT FK_presenta_1 FOREIGN KEY (cliente) REFERENCES Clientes(persona);

ALTER TABLE Presenta
ADD CONSTRAINT FK_presenta_2 FOREIGN KEY (tarjeta) REFERENCES Tarjetas(numero);

ALTER TABLE Solicitudes
ADD CONSTRAINT FK_PosicionIni FOREIGN KEY (latitudI, longitudI) REFERENCES Posiciones (latitud, longitud);

ALTER TABLE Solicitudes
ADD CONSTRAINT FK_PosicionFin FOREIGN KEY (latitudF, longitudF) REFERENCES Posiciones (latitud, longitud);
ALTER TABLE PQRS
ADD CONSTRAINT FK_solicitud FOREIGN KEY (solicitud) REFERENCES Solicitudes(codigo);

ALTER TABLE PqrsRespuestas
ADD CONSTRAINT FK_respuestas FOREIGN KEY (pqrs) REFERENCES PQRS(ticked);

ALTER TABLE Anexos
ADD CONSTRAINT FK_Anexos FOREIGN KEY (pqrs) REFERENCES PQRS(ticked);

ALTER TABLE Requerimientos
ADD CONSTRAINT FK_requerimientos FOREIGN KEY (solicitud) REFERENCES Solicitudes(codigo);

--Ciclo1: Atributos

--TABLA PERSONAS

ALTER TABLE Personas
ADD CONSTRAINT CK_TipoValido CHECK (tipo IN ('TI', 'CC', 'CE', 'PS'));

ALTER TABLE Personas
ADD CONSTRAINT CK_CorreoValido
CHECK (
 REGEXP_LIKE(correo, '[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}')
);

---AGREGAR AL ASTAH ( "3" y tenga 10 dï¿½gitos numï¿½ricos)
ALTER TABLE Personas
ADD CONSTRAINT CK_CelularValido
CHECK (REGEXP_LIKE(celular, '^3\d{9}$'));

--TABLA CONDUCTRES
ALTER TABLE Conductores
ADD CONSTRAINT CK_estrellas
CHECK ( estrellas >= 1 AND estrellas <= 5);

ALTER TABLE Conductores
ADD CONSTRAINT CK_EstadoConductor
CHECK (estado IN ('A','I','R','O'));

--TABLA VEHICULO
ALTER TABLE Vehiculos
ADD CONSTRAINT CK_TEstadoVehiculo
CHECK (estado IN ('A','I','R','O'));

ALTER TABLE Vehiculos
ADD CONSTRAINT CK_TPositivo
CHECK (puertas > 0);

ALTER TABLE Vehiculos
ADD CONSTRAINT CK_TPositivoP
CHECK (pasajeros > 0);

ALTER TABLE Vehiculos
ADD CONSTRAINT CK_TPositivoC
CHECK (carga > 0);

--AGREGAR AL ASTAH("M" (Moto), "A" (Automï¿½vil) o "C" (Camioneta))
ALTER TABLE Vehiculos
ADD CONSTRAINT CK_TVehiculo
CHECK (tipo IN ('M', 'A', 'C'));

--TABLA SOLICITUDES

ALTER TABLE Solicitudes
ADD CONSTRAINT CK_TMoneda
CHECK (precio > 0 and MOD(precio, 100) = 0);


ALTER TABLE Solicitudes
ADD CONSTRAINT CK_TEstadoSolicitud
CHECK (estado IN ('P','A','C','F'));

--TABLA PQRS
ALTER TABLE PQRS
ADD CONSTRAINT CK_STTicked
CHECK (ticked LIKE '[A-Za-z][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]');

ALTER TABLE PQRS
ADD CONSTRAINT CK_TTipo
CHECK (tipo IN ('P','Q','R','S'));

ALTER TABLE PQRS
ADD CONSTRAINT CK_TEstadoPQRS
CHECK (estado IN ('P','A','C','F'));

--TABLA PQRSRespuestas

ALTER TABLE PqrsRespuestas
ADD CONSTRAINT CK_TcorreoP
CHECK (REGEXP_LIKE(correo, '[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}')
);

ALTER TABLE PqrsRespuestas
ADD CONSTRAINT CK_evaluacion
CHECK ( evaluacion >= 1 AND evaluacion <= 5);

--TABLA ANEXOS

ALTER TABLE Anexos
ADD CONSTRAINT CK_TURL
CHECK (urlP LIKE 'https://://%');

INSERT INTO Personas (id_Persona, tipo, numero, nombre, registro, celular, correo)
VALUES (1082, 'CC', '1234567890', 'Juan Perez', TO_DATE('2023-10-05', 'YYYY-MM-DD'), 3123456789, 'juan.perez@example.com');

INSERT INTO Personas (id_Persona, tipo, numero, nombre, registro, celular, correo)
VALUES (2955, 'TI', '9876543210', 'Maria Lopez', TO_DATE('2023-10-05', 'YYYY-MM-DD'), 3009876543, 'maria.lopez@example.com');

INSERT INTO Clientes (persona, idiomaNativo)
VALUES (1082, 'EspaNol');

INSERT INTO Conductores (persona, licencia, fechaNacimiento, estrellas, estado)
VALUES (2955, 'MDR963', TO_DATE('1990-01-15', 'YYYY-MM-DD'), 3, 'A');

INSERT INTO Vehiculos (placa, a_o, tipo, estado, puertas, pasajeros, carga, conductor)
VALUES ('ABC123', 2022, 'A', 'A', 4, 4, NULL, 2955);


------PoblarOKRestricciones

INSERT INTO Personas (id_Persona, tipo, numero, nombre, registro, celular, correo)
VALUES (1909, 'CC', '1234567890', 'Juan Guzman', TO_DATE('01/01/1990', 'DD/MM/YYYY'), 3112345678, 'juan.guzman@example.com');

INSERT INTO Personas (id_Persona, tipo, numero, nombre, registro, celular, correo)
VALUES (2909, 'TI', '2345678901', 'Ana Maria Rodriguez', TO_DATE('15/03/1985', 'DD/MM/YYYY'), 3223456099, 'ana.rodriguez@example.com');

INSERT INTO Personas (id_Persona, tipo, numero, nombre, registro, celular, correo)
VALUES (3909, 'CC', '3456789012', 'Carlos Gomez', TO_DATE('20/06/1978', 'DD/MM/YYYY'), 3334567890, 'carlos.gomez@example.com');

INSERT INTO Personas (id_Persona, tipo, numero, nombre, registro, celular, correo)
VALUES (4909, 'CE', '4567890123', 'Marina LÃ³pez', TO_DATE('10/11/1995', 'DD/MM/YYYY'), 3445678967, 'maria.lopez@example.com');

INSERT INTO Personas (id_Persona, tipo, numero, nombre, registro, celular, correo)
VALUES (5909, 'CC', '5678901234', 'Luis Ramirez', TO_DATE('05/09/1980', 'DD/MM/YYYY'), 3559383012, 'luis.ramirez@example.com');

INSERT INTO Personas (id_Persona, tipo, numero, nombre, registro, celular, correo)
VALUES (6909, 'CC', '6789012345', 'Laura MartÃ­nez', TO_DATE('12/08/1992', 'DD/MM/YYYY'), 3667890123, 'laura.martinez@example.com');

INSERT INTO Personas (id_Persona, tipo, numero, nombre, registro, celular, correo)
VALUES (7909, 'TI', '7894562456', 'Roberto GonzÃ¡lez', TO_DATE('22/04/1980', 'DD/MM/YYYY'), 3778901234, 'roberto.gonzalez@example.com');

INSERT INTO Personas (id_Persona, tipo, numero, nombre, registro, celular, correo)
VALUES (8909, 'CC', '8901234567', 'Isabela Castro', TO_DATE('05/11/1991', 'DD/MM/YYYY'), 3889012345, 'isabela.castro@example.com');

INSERT INTO Personas (id_Persona, tipo, numero, nombre, registro, celular, correo)
VALUES (9909, 'CE', '9012345678', 'Camilo RamÃ­rez', TO_DATE('30/06/1988', 'DD/MM/YYYY'), 3990123456, 'camilo.ramirez@example.com');

INSERT INTO Personas (id_Persona, tipo, numero, nombre, registro, celular, correo)
VALUES (1009, 'CC', '3123456789', 'Ana Maria SÃ¡nchez', TO_DATE('18/03/1997', 'DD/MM/YYYY'), 3001234567, 'ana.sanchez@example.com');


INSERT INTO Clientes (persona, idiomaNativo)
VALUES (1009, 'EspaÃ±ol');

INSERT INTO Clientes (persona, idiomaNativo)
VALUES (2909, 'Ingles');

INSERT INTO Clientes (persona, idiomaNativo)
VALUES (3909, 'Frances');

INSERT INTO Clientes (persona, idiomaNativo)
VALUES (4909, 'Coreano');

INSERT INTO Clientes (persona, idiomaNativo)
VALUES (5909, 'Catalan');

INSERT INTO Conductores (persona, licencia, fechaNacimiento, estrellas, estado)
VALUES (6909, 'A19845', TO_DATE('15/05/1985', 'DD/MM/YYYY'), 4, 'I');

INSERT INTO Conductores (persona, licencia, fechaNacimiento, estrellas, estado)
VALUES (8909, 'B56890', TO_DATE('10/10/1995', 'DD/MM/YYYY'), 3, 'A');

INSERT INTO Conductores (persona, licencia, fechaNacimiento, estrellas, estado)
VALUES (7909, 'C54705', TO_DATE('25/03/1982', 'DD/MM/YYYY'), 1, 'O');

INSERT INTO Conductores (persona, licencia, fechaNacimiento, estrellas, estado)
VALUES (9909, 'D54459', TO_DATE('08/12/1993', 'DD/MM/YYYY'), 3, 'A');

INSERT INTO Conductores (persona, licencia, fechaNacimiento, estrellas, estado)
VALUES (1009, 'E67890', TO_DATE('03/07/1987', 'DD/MM/YYYY'), 4, 'R');

INSERT INTO Vehiculos (placa, a_o, tipo, estado, puertas, pasajeros, carga, conductor)
VALUES ('ABC129', 2022, 'A', 'A', 4, 5, 500, 6909);

INSERT INTO Vehiculos (placa, a_o, tipo, estado, puertas, pasajeros, carga, conductor)
VALUES ('XYZ789', 2021, 'A', 'A', 4, 5, 500, 7909);

INSERT INTO Vehiculos (placa, a_o, tipo, estado, puertas, pasajeros, carga, conductor)
VALUES ('LMN456', 2023, 'M', 'A', 2, 2, 100, 8909);

INSERT INTO Vehiculos (placa, a_o, tipo, estado, puertas, pasajeros, carga, conductor)
VALUES ('PQR987', 2022, 'C', 'A', 2, 4, 100, 9909);

INSERT INTO Vehiculos (placa, a_o, tipo, estado, puertas, pasajeros, carga, conductor)
VALUES ('DEF321', 2023, 'A', 'A', 4, 5, 500, 1009);

INSERT INTO Posiciones (latitud, longitud)
VALUES (2.34, -7.89);

INSERT INTO Posiciones (latitud, longitud)
VALUES (2.35, -6.88);

INSERT INTO Posiciones (latitud, longitud)
VALUES (9.96, -6.87);

INSERT INTO Posiciones (latitud, longitud)
VALUES (2.37, -5.92);

INSERT INTO Posiciones (latitud, longitud)
VALUES (2.38, -7.67);

INSERT INTO Posiciones (latitud, longitud)
VALUES (1.35, -6.88);

INSERT INTO Posiciones (latitud, longitud)
VALUES (1.36, -7.87);

INSERT INTO Posiciones (latitud, longitud)
VALUES (9.85, -3.24);

INSERT INTO Posiciones (latitud, longitud)
VALUES (2.54, -4.89);

INSERT INTO Posiciones (latitud, longitud)
VALUES (3.39, -9.78);


INSERT INTO Solicitudes (codigo, fechaCreacion, fechaViaje, plataforma, estado, precio, cliente, latitudI, longitudI, latitudF, longitudF)
VALUES (1808, TO_DATE('2023-10-05', 'YYYY-MM-DD'), TO_DATE('2023-10-10', 'YYYY-MM-DD'), 'A', 'P', 200.00, 1909, 2.34, -7.89, 1.35, -6.88);

INSERT INTO Solicitudes (codigo, fechaCreacion, fechaViaje, plataforma, estado, precio, cliente, latitudI, longitudI, latitudF, longitudF)
VALUES (2808, TO_DATE('2023-10-06', 'YYYY-MM-DD'), TO_DATE('2023-10-12', 'YYYY-MM-DD'), 'B', 'P', 100.00, 2909, 2.35, -6.88, 1.36, -7.87);

INSERT INTO Solicitudes (codigo, fechaCreacion, fechaViaje, plataforma, estado, precio, cliente, latitudI, longitudI, latitudF, longitudF)
VALUES (3808, TO_DATE('2023-10-07', 'YYYY-MM-DD'), TO_DATE('2023-10-15', 'YYYY-MM-DD'), 'W', 'P', 300.00, 3909, 9.96, -6.87, 9.85, -3.24);

INSERT INTO Solicitudes (codigo, fechaCreacion, fechaViaje, plataforma, estado, precio, cliente, latitudI, longitudI, latitudF, longitudF)
VALUES (4808, TO_DATE('2023-10-08', 'YYYY-MM-DD'), TO_DATE('2023-10-18', 'YYYY-MM-DD'), 'A', 'P', 800.00, 4909, 2.37, -5.92, 2.54, -4.89);

INSERT INTO Solicitudes (codigo, fechaCreacion, fechaViaje, plataforma, estado, precio, cliente, latitudI, longitudI, latitudF, longitudF)
VALUES (5808, TO_DATE('2023-10-09', 'YYYY-MM-DD'), TO_DATE('2023-10-20', 'YYYY-MM-DD'), 'W', 'P', 700.00, 1009, 2.38, -7.67, 3.39, -9.78);

INSERT INTO PQRS (ticked, radicacion, cierre, descripcion, tipo, estado, solicitud)
VALUES ('P180812345678', TO_DATE('2023-10-05', 'YYYY-MM-DD'), TO_DATE('2023-10-10', 'YYYY-MM-DD'), 'DescripciÃ³n 1', 'P', 'P', 1808);

INSERT INTO PQRS (ticked, radicacion, cierre, descripcion, tipo, estado, solicitud)
VALUES ('P280812345678', TO_DATE('2023-10-06', 'YYYY-MM-DD'), TO_DATE('2023-10-12', 'YYYY-MM-DD'), 'DescripciÃ³n 2', 'P', 'P', 2808);

INSERT INTO PQRS (ticked, radicacion, cierre, descripcion, tipo, estado, solicitud)
VALUES ('P380812345678', TO_DATE('2023-10-07', 'YYYY-MM-DD'), TO_DATE('2023-10-15', 'YYYY-MM-DD'), 'DescripciÃ³n 3', 'P', 'P', 3808);

INSERT INTO PQRS (ticked, radicacion, cierre, descripcion, tipo, estado, solicitud)
VALUES ('P480812345678', TO_DATE('2023-10-08', 'YYYY-MM-DD'), TO_DATE('2023-10-18', 'YYYY-MM-DD'), 'DescripciÃ³n 4', 'P', 'P', 4808);

INSERT INTO PQRS (ticked, radicacion, cierre, descripcion, tipo, estado, solicitud)
VALUES ('P580812345678', TO_DATE('2023-10-09', 'YYYY-MM-DD'), TO_DATE('2023-10-20', 'YYYY-MM-DD'), 'DescripciÃ³n 5', 'P', 'P', 5808);

INSERT INTO PqrsRespuestas (pqrs, fecha, descripcion, nombre, correo, comentario, evaluacion)
VALUES ('P180812345678', TO_DATE('2023-10-05', 'YYYY-MM-DD'), 'Respuesta 1', 'Nombre1', 'correo1@example.com', 'Comentario1', 4);

INSERT INTO PqrsRespuestas (pqrs, fecha, descripcion, nombre, correo, comentario, evaluacion)
VALUES ('P280812345678', TO_DATE('2023-10-06', 'YYYY-MM-DD'), 'Respuesta 2', 'Nombre2', 'correo2@example.com', 'Comentario2', 3);

INSERT INTO PqrsRespuestas (pqrs, fecha, descripcion, nombre, correo, comentario, evaluacion)
VALUES ('P380812345678', TO_DATE('2023-10-07', 'YYYY-MM-DD'), 'Respuesta 3', 'Nombre3', 'correo3@example.com', 'Comentario3', 5);

INSERT INTO PqrsRespuestas (pqrs, fecha, descripcion, nombre, correo, comentario, evaluacion)
VALUES ('P480812345678', TO_DATE('2023-10-08', 'YYYY-MM-DD'), 'Respuesta 4', 'Nombre4', 'correo4@example.com', 'Comentario4', 2);

INSERT INTO PqrsRespuestas (pqrs, fecha, descripcion, nombre, correo, comentario, evaluacion)
VALUES ('P580812345678', TO_DATE('2023-10-09', 'YYYY-MM-DD'), 'Respuesta 5', 'Nombre5', 'correo5@example.com', 'Comentario5', 1);

--Ciclo1: XTablas
DROP TABLE Presenta;
DROP TABLE Vehiculos;
DROP TABLE Tarjetas;
DROP TABLE Anexos;
DROP TABLE PqrsRespuestas;
DROP TABLE PQRS;
DROP TABLE Requerimientos;
DROP TABLE Solicitudes;
DROP TABLE Posiciones;
DROP TABLE Clientes;
DROP TABLE Conductores;
DROP TABLE Personas;

--LABORATORIO 4

--CICLO 1: CRUD : Registrar Solicitud de viaje---------------------


--Adicionar
------------------------------------------------Tuplas-------------------------------------------------


--No puede tener la misma posicion inicial y final
ALTER TABLE Solicitudes 
ADD CONSTRAINT CK_SOLICITUDES_POSICION CHECK (latitudI <> latitudF AND longitudI<>longitudF);

--La fecha de viaje y precio deben iniciar desconocidas (nulo)
ALTER TABLE Solicitudes 
ADD CONSTRAINT CK_SOLICITUDES_VIAJE_PRECIO  CHECK (fechaViaje IS NULL AND fechaCreacion IS NULL);

------------------------------------------------TuplasOK------------------------------------------------
INSERT INTO Personas (id_Persona, tipo, numero, nombre, registro, celular, correo) VALUES (11, 'CC', '1234567890', 'John Doe', TO_DATE('2023-10-26', 'yyyy-mm-dd'), 3123456789, 'john@example.com');
INSERT INTO Personas (id_Persona, tipo, numero, nombre, registro, celular, correo) VALUES (22, 'TI', '9876543210', 'Jane Smith', TO_DATE('2023-10-26', 'yyyy-mm-dd'), 3123456789, 'jane@example.com');
INSERT INTO Personas (id_Persona, tipo, numero, nombre, registro, celular, correo) VALUES (33, 'CC', '1111111111', 'Alice Johnson', TO_DATE('2023-10-26', 'yyyy-mm-dd'), 3111111111, 'alice@example.com');
INSERT INTO Personas (id_Persona, tipo, numero, nombre, registro, celular, correo) VALUES (44, 'CE', '2222222222', 'Bob Brown', TO_DATE('2023-10-26', 'yyyy-mm-dd'), 3222222222, 'bob@example.com');
INSERT INTO Personas (id_Persona, tipo, numero, nombre, registro, celular, correo) VALUES (55, 'PS', '3333333333', 'Eve White', TO_DATE('2023-10-26', 'yyyy-mm-dd'), 3333333333, 'eve@example.com');
INSERT INTO Clientes (persona, idiomaNativo) VALUES (11, 'Spanish');
INSERT INTO Clientes (persona, idiomaNativo) VALUES (22, 'English');
INSERT INTO Clientes (persona, idiomaNativo) VALUES (33, 'French');
INSERT INTO Clientes (persona, idiomaNativo) VALUES (44, 'German');
INSERT INTO Clientes (persona, idiomaNativo) VALUES (55, 'Italian');
INSERT INTO Posiciones (latitud, longitud) VALUES (3.14, 2.71);
INSERT INTO Posiciones (latitud, longitud) VALUES (1.23, 4.56);
INSERT INTO Posiciones (latitud, longitud) VALUES (0.99, 6.78);
INSERT INTO Posiciones (latitud, longitud) VALUES (5.67, 8.43);
INSERT INTO Posiciones (latitud, longitud) VALUES (2.71, 1.23);
INSERT INTO Solicitudes (codigo, fechaCreacion, fechaViaje, plataforma, precio, estado, cliente, latitudI, longitudI, latitudF, longitudF) VALUES (100000000, NULL, NULL, 'A', NULL, 'P', 11, 3.14, 2.71, 1.23, 4.56);
INSERT INTO Solicitudes (codigo, fechaCreacion, fechaViaje, plataforma, precio, estado, cliente, latitudI, longitudI, latitudF, longitudF) VALUES (200000000, NULL, NULL, 'B', NULL, 'P', 22, 1.23, 4.56, 5.67, 8.43);
INSERT INTO Solicitudes (codigo, fechaCreacion, fechaViaje, plataforma, precio, estado, cliente, latitudI, longitudI, latitudF, longitudF) VALUES (300000000, NULL, NULL, 'A', NULL, 'P', 33, 0.99, 6.78, 2.71, 1.23);
INSERT INTO Solicitudes (codigo, fechaCreacion, fechaViaje, plataforma, precio, estado, cliente, latitudI, longitudI, latitudF, longitudF) VALUES (400000000, NULL, NULL, 'C', NULL, 'P', 44, 5.67, 8.43, 3.14, 2.71);
INSERT INTO Solicitudes (codigo, fechaCreacion, fechaViaje, plataforma, precio, estado, cliente, latitudI, longitudI, latitudF, longitudF) VALUES (500000000, NULL, NULL, 'A', NULL, 'P', 55, 2.71, 1.23, 0.99, 6.78);


------------------------------------------------TuplasNoOK----------------------------------------------
INSERT INTO Personas (id_Persona, tipo, numero, nombre, registro, celular, correo) VALUES (16, 'CC', '123456789', 'John ', TO_DATE('2023-10-26', 'yyyy-mm-dd'), 3123456789, 'john@exampl.com');
INSERT INTO Personas (id_Persona, tipo, numero, nombre, registro, celular, correo) VALUES (27, 'TI', '987654321', 'Jane ', TO_DATE('2023-10-26', 'yyyy-mm-dd'), 3123456789, 'jane@exampl.com');
INSERT INTO Personas (id_Persona, tipo, numero, nombre, registro, celular, correo) VALUES (38, 'CC', '111111111', 'Alice', TO_DATE('2023-10-26', 'yyyy-mm-dd'), 3111111111, 'alice@exampl.com');
INSERT INTO Personas (id_Persona, tipo, numero, nombre, registro, celular, correo) VALUES (49, 'CE', '222222222', 'Bob', TO_DATE('2023-10-26', 'yyyy-mm-dd'), 3222222222, 'bob@exampl.com');
INSERT INTO Personas (id_Persona, tipo, numero, nombre, registro, celular, correo) VALUES (50, 'PS', '333333333', 'Eve', TO_DATE('2023-10-26', 'yyyy-mm-dd'), 3333333333, 'eve@exampl.com');
INSERT INTO Clientes (persona, idiomaNativo) VALUES (16, 'Spanish');
INSERT INTO Clientes (persona, idiomaNativo) VALUES (27, 'English');
INSERT INTO Clientes (persona, idiomaNativo) VALUES (38, 'French');
INSERT INTO Clientes (persona, idiomaNativo) VALUES (49, 'German');
INSERT INTO Clientes (persona, idiomaNativo) VALUES (50, 'Italian');
INSERT INTO Posiciones (latitud, longitud) VALUES (3.15, 2.75);
INSERT INTO Posiciones (latitud, longitud) VALUES (1.25, 4.55);
INSERT INTO Posiciones (latitud, longitud) VALUES (0.95, 6.75);
INSERT INTO Posiciones (latitud, longitud) VALUES (5.65, 8.45);
INSERT INTO Posiciones (latitud, longitud) VALUES (2.75, 1.25);
INSERT INTO Solicitudes (codigo, fechaCreacion, fechaViaje, plataforma, precio, estado, cliente, latitudI, longitudI, latitudF, longitudF) VALUES (100000000, NULL, NULL, 'A', NULL, 'A', 16, 3.14, 2.71, 3.14, 2.71);
INSERT INTO Solicitudes (codigo, fechaCreacion, fechaViaje, plataforma, precio, estado, cliente, latitudI, longitudI, latitudF, longitudF) VALUES (200000000, NULL, NULL, 'B', NULL, 'P', 27, 1.23, 4.56, 1.23, 4.56);
INSERT INTO Solicitudes (codigo, fechaCreacion, fechaViaje, plataforma, precio, estado, cliente, latitudI, longitudI, latitudF, longitudF) VALUES (300000000, NULL, NULL, 'A', NULL, 'S', 38, 0.99, 6.78, 2.71, 1.23);
INSERT INTO Solicitudes (codigo, fechaCreacion, fechaViaje, plataforma, precio, estado, cliente, latitudI, longitudI, latitudF, longitudF) VALUES (400000000, NULL, NULL, 'C', NULL, 'R', 49, 5.67, 8.43, 3.14, 2.71);
INSERT INTO Solicitudes (codigo, fechaCreacion, fechaViaje, plataforma, precio, estado, cliente, latitudI, longitudI, latitudF, longitudF) VALUES (NULL, NULL, NULL, 'A', NULL, 'P', 50, 2.71, 1.23, 0.99, 6.78);

------------------------------------------------Disparadores--------------------------------------------

--El codigo y la fecha de creacion son autogenerados: Entero(9)
CREATE OR REPLACE TRIGGER TR_SOLICITUDES_INS_CODIGO_FECHA
BEFORE INSERT ON Solicitudes
FOR EACH ROW
BEGIN
    :NEW.codigo := FLOOR(100000000+(999999999-100000000+1)*DBMS_RANDOM.VALUE);
    :NEW.fechaCreacion := SYSTIMESTAMP;
    :NEW.estado := 'P';
END;
/ 
--La fecha de viaje debe ser superior a la fecha actual.
CREATE OR REPLACE TRIGGER TR_SOLICITUDES_INS_FECHA
BEFORE INSERT ON Solicitudes
FOR EACH ROW
BEGIN
    :NEW.precio := null;
IF :NEW.fechaViaje <= SYSTIMESTAMP THEN
    RAISE_APPLICATION_ERROR(-20001, 'La fecha de viaje debe ser superior a la fecha actual.');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TR_SOLICTUDES_INS_ESTADO 
BEFORE INSERT ON Solicitudes
FOR EACH ROW
DECLARE
  solicitudesActivas NUMBER;
BEGIN
  SELECT COUNT(*) INTO solicitudesActivas 
  FROM Solicitudes
  WHERE estado IN ('A','P') AND cliente = :NEW.cliente;
  
  IF solicitudesActivas >= 2 THEN 
    RAISE_APPLICATION_ERROR(-20002, 'El cliente ya tiene 2 solicitudes activas.');
  END IF;
END;
/

------------------------------------------------DisparadoresOK------------------------------------------------
INSERT INTO Personas (id_Persona, tipo, numero, nombre, registro, celular, correo)
VALUES (2, 'TI', '987654321', 'María Rodríguez', TO_DATE('2023-10-26', 'yyyy-mm-dd'), 3012345678, 'maria.rodriguez@example.com');
INSERT INTO Personas (id_Persona, tipo, numero, nombre, registro, celular, correo)
VALUES (3, 'CC', '1111222333', 'Luis Gómez', TO_DATE('2023-10-26', 'yyyy-mm-dd'), 3155555555, 'luis.gomez@example.com');
INSERT INTO Personas (id_Persona, tipo, numero, nombre, registro, celular, correo)
VALUES (4, 'CE', '876543210', 'Ana López', TO_DATE('2023-10-26', 'yyyy-mm-dd'), 3188888888, 'ana.lopez@example.com');
INSERT INTO Personas (id_Persona, tipo, numero, nombre, registro, celular, correo)
VALUES (5, 'PS', '9999999', 'Pedro Pérez', TO_DATE('2023-10-26', 'yyyy-mm-dd'), 3144444444, 'pedro.perez@example.com');
INSERT INTO Clientes (persona, idiomaNativo)
VALUES (2, 'Inglés');
INSERT INTO Clientes (persona, idiomaNativo)
VALUES (3, 'Francés');
INSERT INTO Clientes (persona, idiomaNativo)
VALUES (4, 'Español');
INSERT INTO Clientes (persona, idiomaNativo)
VALUES (5, 'Alemán');
INSERT INTO Posiciones (latitud, longitud)
VALUES (1.23, 4.56);
INSERT INTO Posiciones (latitud, longitud)
VALUES (2.34, 5.67);
INSERT INTO Posiciones (latitud, longitud)
VALUES (3.45, 6.78);
INSERT INTO Posiciones (latitud, longitud)
VALUES (4.56, 7.89);
INSERT INTO Solicitudes (codigo, fechaCreacion, fechaViaje, plataforma, precio, estado, cliente, latitudI, longitudI, latitudF, longitudF)
VALUES (2, NULL, NULL, 'B', NULL, 'P', 2, 1.23, 4.56, 2.34, 5.67);
INSERT INTO Solicitudes (codigo, fechaCreacion, fechaViaje, plataforma, precio, estado, cliente, latitudI, longitudI, latitudF, longitudF)
VALUES (3, NULL, NULL, 'C', NULL, 'P', 3, 2.34, 5.67, 3.45, 6.78);
INSERT INTO Solicitudes (codigo, fechaCreacion, fechaViaje, plataforma, precio, estado, cliente, latitudI, longitudI, latitudF, longitudF)
VALUES (4, NULL, NULL, 'A', NULL, 'P', 4, 3.45, 6.78, 4.56, 7.89);
INSERT INTO Solicitudes (codigo, fechaCreacion, fechaViaje, plataforma, precio, estado, cliente, latitudI, longitudI, latitudF, longitudF)
VALUES (5, NULL, NULL, 'A', NULL, 'P', 5, 4.56, 7.89, 3.45, 6.78);
------------------------------------------------DisparadoresNoOK----------------------------------------------

INSERT INTO Solicitudes (codigo, fechaCreacion, fechaViaje, plataforma, estado, precio, cliente, latitudI, longitudI, latitudF, longitudF)
VALUES (1808, TO_DATE('2023-10-05', 'YYYY-MM-DD'), TO_DATE('2023-10-10', 'YYYY-MM-DD'), 'A', 'P', 200.00, 1909, 2.34, -7.89, 1.35, -6.88);
INSERT INTO Solicitudes (codigo, fechaCreacion, fechaViaje, plataforma, estado, precio, cliente, latitudI, longitudI, latitudF, longitudF)
VALUES (2808, TO_DATE('2023-10-06', 'YYYY-MM-DD'), TO_DATE('2023-10-12', 'YYYY-MM-DD'), 'B', 'P', 100.00, 6909, 2.35, -6.88, 1.36, -7.87);
INSERT INTO Solicitudes (codigo, fechaCreacion, fechaViaje, plataforma, estado, precio, cliente, latitudI, longitudI, latitudF, longitudF)
VALUES (3808, TO_DATE('2023-10-07', 'YYYY-MM-DD'), TO_DATE('2023-10-15', 'YYYY-MM-DD'), 'W', 'P', 300.00, 4909, 9.96, -6.87, 9.85, -3.24);
INSERT INTO Solicitudes (codigo, fechaCreacion, fechaViaje, plataforma, estado, precio, cliente, latitudI, longitudI, latitudF, longitudF)
VALUES (4808, NULL, TO_DATE('2023-10-31', 'YYYY-MM-DD'), 'B', 'P', 100.00, 3909, 2.35, -6.88, 1.36, -7.87);
INSERT INTO Solicitudes (codigo, fechaCreacion, fechaViaje, plataforma, estado, precio, cliente, latitudI, longitudI, latitudF, longitudF)
VALUES (5808, TO_DATE('2023-10-07', 'YYYY-MM-DD'), TO_DATE('2023-11-01', 'YYYY-MM-DD'), 'W', 'P', 300.00, 3909, 9.96, -6.87, 9.85, -3.24);
--Modificar

------------------------------------------------Disparadores--------------------------------------------
create or replace TRIGGER TR_SOLICITUDES_UP_FECHAVIAJE_PRECIO_ESTADO  
BEFORE UPDATE ON Solicitudes
FOR EACH ROW
BEGIN
    --Solo se pueden actualizar los campos: fecha de viaje, precio y estado.
    IF :OLD.fechaCreacion != :NEW.fechaCreacion OR :OLD.plataforma != :NEW.plataforma OR 
        :OLD.cliente != :NEW.cliente OR :OLD.latitudI != :NEW.latitudI OR :OLD.longitudI != :NEW.longitudI OR
        :OLD.latitudF != :NEW.latitudF OR :OLD.longitudF != :NEW.longitudF THEN

    RAISE_APPLICATION_ERROR(-20003, 'Solo se pueden actualizar los campos: fecha de viaje, precio y estado.'); 
    END IF;
END;
/
create or replace TRIGGER TR_SOLICITUDES_UP_FECHAVIAJE_PRECIO_ESTAD  
BEFORE UPDATE ON Solicitudes
FOR EACH ROW
BEGIN
    --La fecha de viaje debe ser superior a la fecha de creación y a la fecha actual.
    IF :OLD.fechaCreacion > :NEW.fechaViaje OR  SYSTIMESTAMP > :NEW.fechaViaje THEN 

    RAISE_APPLICATION_ERROR(-20004, 'La fecha de viaje debe ser superior a la fecha de creación y a la fecha actual.'); 
    END IF;
    
    --Se puede modificar la fecha de viaje y el precio si el estado de la solicitud es Pendiente.
    IF :OLD.estado <> 'P' THEN

    RAISE_APPLICATION_ERROR(-20005, 'Solo se Se puede modificar la fecha de viaje y el precio si el estado de la solicitud es Pendiente.'); 
    END IF;

    --El estado se puede cambiar siempre y cuando no sea Cancelada
    IF :NEW.estado = 'C' THEN

    RAISE_APPLICATION_ERROR(-20006, 'El estado se puede cambiar siempre y cuando no sea Cancelada'); 
    
    
END;
/

------------------------------------------------DisparadoresOK------------------------------------------------
UPDATE Solicitudes
SET fechaViaje = TO_DATE('2023-12-01', 'yyyy-mm-dd'),
    precio = 220,
    estado = 'A'
WHERE codigo = 50;
------------------------------------------------DisparadoresNoOK----------------------------------------------
UPDATE Solicitudes
SET estado= 'C';


--Eliminar
------------------------------------------------Disparadores--------------------------------------------
create or replace TRIGGER TR_SOLICITUDES_DEL   
BEFORE DELETE ON Solicitudes
FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20007, 'Las solicitudes no se pueden eliminar.'); 
END;
/
------------------------------------------------DisparadoresOK------------------------------------------------

------------------------------------------------DisparadoresNoOK----------------------------------------------
DELETE FROM Solicitudes;
--CICLO 2: CRUD : Registrar PQRS---------------------

--Ad
------------------------------------------------Tuplas-------------------------------------------------
ALTER TABLE PQRS
ADD CONSTRAINT CK_PQRS_ESTADO CHECK (tipo IN('A'));
------------------------------------------------TuplasOK------------------------------------------------

INSERT INTO Personas (id_Persona, tipo, numero, nombre, registro, celular, correo)
VALUES (1909, 'CC', '3123456789', 'Ana Maria SÃ¡nchez', TO_DATE('18/03/1997', 'DD/MM/YYYY'), 3001234567, 'ana.sanchez@example.com');
INSERT INTO Clientes (persona, idiomaNativo)
VALUES (1909, 'Espanol');
INSERT INTO Posiciones (latitud, longitud)
VALUES (2.34, -7.89);
INSERT INTO Posiciones (latitud, longitud)
VALUES (1.35, -6.88);
INSERT INTO Solicitudes (codigo, fechaCreacion, fechaViaje, plataforma, estado, precio, cliente, latitudI, longitudI, latitudF, longitudF)
VALUES (1808, TO_DATE('2023-10-05', 'YYYY-MM-DD'), TO_DATE('2023-10-10', 'YYYY-MM-DD'), 'A', 'P', 200.00, 1909, 2.34, -7.89, 1.35, -6.88);
INSERT INTO PQRS (ticked, radicacion, cierre, descripcion, tipo, estado, solicitud)
VALUES ('P180812345678', TO_DATE('2023-10-05', 'YYYY-MM-DD'), TO_DATE('2023-10-10', 'YYYY-MM-DD'), 'DescripciÃ³n 1', 'P', 'A', 1808);

------------------------------------------------TuplasNoOK----------------------------------------------
------------------------------------------------Disparadores--------------------------------------------
CREATE OR REPLACE TRIGGER FT_PQRS_INS_TICKED
BEFORE INSERT ON PQRS
FOR EACH ROW
DECLARE 
    tipo CHAR(1);
BEGIN 
    SELECT estado INTO tipo FROM solicitudes
    WHERE codigo = :NEW.solicitud;

    IF tipo IS NOT NULL THEN
        :NEW.ticked := tipo || SYSTIMESTAMP; 
    END IF;
END;

/

CREATE OR REPLACE TRIGGER FT_PQRS_INS_TIPO   
BEFORE INSERT ON PQRS
FOR EACH ROW
DECLARE 
BEGIN 
    :NEW.estado := 'A';
    IF :NEW.tipo IS NULL THEN
    :NEW.TIPO := 'S';
    END IF;
END;
/

CREATE OR REPLACE TRIGGER FT_PQRS_INS_RADICACION   
BEFORE INSERT ON PQRS
FOR EACH ROW
DECLARE 
BEGIN 
    :NEW.radicacion := SYSTIMESTAMP;
END;
/
------------------------------------------------DisparadoresOK------------------------------------------
------------------------------------------------DisparadoresNoOK----------------------------------------
--Modificar
--El estado inicial de un PQRS es Abierto.
ALTER TABLE PQRS 
ADD CONSTRAINT CK_PQRS_ESTADO_U CHECK (cierre < radicacion);

------------------------------------------------Disparadores--------------------------------------------
create or replace TRIGGER FT_PQRS_UP_ESTADO   
BEFORE UPDATE ON PQRS
FOR EACH ROW
BEGIN
    --Solo se pueden actualizar los campos: fecha de viaje, precio y estado.
    IF :OLD.ticked != :NEW.ticked OR :OLD.radicacion != :NEW.radicacion OR 
        :OLD.cierre != :NEW.cierre OR :OLD.descripcion != :NEW.descripcion OR :OLD.tipo != :NEW.tipo THEN
        RAISE_APPLICATION_ERROR(-20008, 'El único dato  que se puede modificar es el estado del PQRS.'); 
    END IF;
END;
/
create or replace TRIGGER FT_PQRS_UP_ESTADO_CIERRE   
BEFORE UPDATE ON PQRS
FOR EACH ROW
BEGIN
    --Al cerrar o rechazar la PQRS se debe asignar la fecha actual en el campo fecha de cierre.
    IF :NEW.estado = 'C' OR :NEW.estado = 'F' THEN
       :NEW.cierre := SYSTIMESTAMP; 
    END IF;
   -- La fecha de cierre debe ser posterior a la fecha de radicación.
   IF :NEW.cierre = 'C' OR :NEW.estado = 'F' THEN
       :NEW.cierre := SYSTIMESTAMP; 
    END IF;
END;
/

CREATE OR REPLACE TRIGGER FT_ANEXOS_INS
BEFORE INSERT ON Anexos
FOR EACH ROW
DECLARE
    pqrs_estado CHAR(1);
BEGIN
    
    SELECT estado INTO pqrs_estado
    FROM PQRS
    WHERE ticked = :NEW.pqrs;

    IF pqrs_estado <> 'A' THEN
        RAISE_APPLICATION_ERROR(-20010, 'Solo es posible adicionar anexos al PQRS si su estado es Abierto');
    END IF;
END;
/


------------------------------------------------DisparadoresOK------------------------------------------
------------------------------------------------DisparadoresNoOK----------------------------------------

--Eliminar
------------------------------------------------Disparadores--------------------------------------------
CREATE OR REPLACE TRIGGER FT_PQRS_DE
BEFORE DELETE ON PQRS
FOR EACH ROW
DECLARE
    count_r NUMBER;
BEGIN

    SELECT COUNT(*) INTO count_r
    FROM PqrsRespuestas
    WHERE pqrs = :OLD.ticked;

    IF count_r > 0 THEN
        RAISE_APPLICATION_ERROR(-20009,'Los PQRS solo se pueden eliminar si no tienen respuestas asociadas.');
    END IF;
END;
/

ALTER TABLE ANEXOS
ADD CONSTRAINT FK_ANEXOS_PQRS
FOREIGN KEY (pqrs) REFERENCES PQRS(ticked)
ON DELETE CASCADE;


DROP TRIGGER TR_SOLICITUDES_INS_CODIGO_FECHA;
DROP TRIGGER TR_SOLICITUDES_INS_FECHA;
DROP TRIGGER TR_SOLICTUDES_INS_ESTADO;
DROP TRIGGER TR_SOLICITUDES_UP_FECHAVIAJE_PRECIO_ESTADO;
DROP TRIGGER TR_SOLICITUDES_UP_FECHAVIAJE_PRECIO_ESTAD;
DROP TRIGGER TR_SOLICITUDES_DEL;
DROP TRIGGER FT_PQRS_INS_TICKED;
DROP TRIGGER FT_PQRS_INS_TIPO;
DROP TRIGGER FT_PQRS_INS_RADICACION;
DROP TRIGGER FT_PQRS_UP_ESTADO;
DROP TRIGGER FT_PQRS_UP_ESTADO_CIERRE;
DROP TRIGGER FT_PQRS_DE;

-----------------------------------------------------------------------------LABORATORIO 5 --------------------------------------------------------------------------------
SELECT * FROM MBDA.DATA;
INSERT INTO MBDA.DATA(EMAIL,CEDULA,CELULAR,NOMBRES) 
VALUES ('daniel.rojas-h@mail.escuelaing.edu.co', 1000318916, 1234567890, 'Daniel Rojas');
INSERT INTO MBDA.DATA(EMAIL,CEDULA,CELULAR,NOMBRES) 
VALUES ('maria.torres-m@mail.escuelaing.edu.co', 1034776161, 3229118752, 'Maria Torres');
COMMIT;

------PUNTO 5------------------------------------


CREATE OR REPLACE TRIGGER TR_CLIENTE_INS_PERSONA
BEFORE INSERT ON PERSONAS
FOR EACH ROW
DECLARE  
    cedulan VARCHAR2(10);
    repetido NUMBER(30);
BEGIN
    cedulan := :NEW.numero;
    :NEW.id_Persona := TRUNC(TO_NUMBER(cedulan)/10000) || FLOOR(100+(999-100+1)*DBMS_RANDOM.VALUE);
    :NEW.tipo := 'CC';
    :NEW.registro := SYSTIMESTAMP;
    INSERT INTO clientes (persona, idiomaNativo) VALUES (:NEW.id_persona, 'Espa�ol');
    
END;
/

CREATE OR REPLACE VIEW vista_mbda AS
SELECT 
    cedula, MAX(nombres) AS nombres, MAX(celular) AS celular, MAX(email) AS email
FROM MBDA.DATA
WHERE 
    (SELECT COUNT(*) FROM personas WHERE personas.numero = cedula) = 0 AND
    cedula IS NOT NULL AND nombres IS NOT NULL AND celular IS NOT NULL AND 
    LENGTH(cedula) = 10 AND LENGTH(nombres) <= 50 AND LENGTH(celular) = 10 AND LENGTH(email) <= 50
GROUP BY cedula;


INSERT INTO Personas (numero, nombre, celular, correo)
SELECT cedula,nombres,celular,email
FROM vista_mbda;

select * from personas;
select * from clientes;

--------------------------------------CRUD PQRS---------------------------------------------

CREATE OR REPLACE PACKAGE  PC_PQRS IS

    PROCEDURE adicionar(xcierre IN DATE,  xdescripcion IN VARCHAR,xtipo IN VARCHAR, xsolicitud IN NUMBER);
    PROCEDURE modificar(xticked IN VARCHAR, xestado IN CHAR);
    PROCEDURE eliminar(xticked IN VARCHAR);
    FUNCTION CO_PQRS_CERRADAS_CORREO RETURN SYS_REFCURSOR;
    FUNCTION CO_RESPUESTAS_PQRS RETURN SYS_REFCURSOR;
    
END PC_PQRS;
/
CREATE OR REPLACE PACKAGE BODY PC_PQRS IS
    PROCEDURE adicionar(xcierre IN DATE,  xdescripcion IN VARCHAR,xtipo IN VARCHAR, xsolicitud IN NUMBER) IS
    BEGIN 
        INSERT INTO PQRS(cierre,descripcion,tipo,solicitud) VALUES (xcierre,xdescripcion,xtipo,xsolicitud);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20020, 'Error al insertar en PQRS'); 
    END adicionar;
    PROCEDURE modificar(xticked IN VARCHAR, xestado IN CHAR) IS 
    BEGIN
        UPDATE PQRS 
        SET estado = xestado
        WHERE  ticked = xticked;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20021, 'Error al modificar en PQRS'); 
    END modificar;
    PROCEDURE eliminar(xticked IN VARCHAR) IS 
    BEGIN
        DELETE PQRS
        WHERE ticked = xticked;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20022, 'Error al eliminar en PQRS'); 
    END eliminar;
    FUNCTION CO_PQRS_CERRADAS_CORREO RETURN SYS_REFCURSOR IS
    CO_PCC SYS_REFCURSOR;
    BEGIN
        OPEN CO_PCC FOR
            SELECT ticked, radicacion
            FROM pqrs
            WHERE cierre is not null;
        RETURN CO_PCC;
    END CO_PQRS_CERRADAS_CORREO;

    FUNCTION CO_RESPUESTAS_PQRS RETURN SYS_REFCURSOR IS
        CO_PQRS SYS_REFCURSOR;
    BEGIN
        OPEN CO_PQRS FOR
            SELECT s.cierre, s.descripcion, M.comentario
            FROM pqrsrespuestas M
            join PQRS S on s.ticked = M.pqrs
            WHERE s.cierre >= ADD_MONTHS(TRUNC(SYSDATE, 'MM'), -1)
            AND s.cierre < TRUNC(SYSDATE, 'MM')
            ORDER BY s.cierre;
        RETURN CO_PQRS;
    END CO_RESPUESTAS_PQRS;
END PC_PQRS;    

/
--CRUDOK
    INSERT INTO Posiciones (latitud, longitud)
    VALUES (1.23, 4.56);
    INSERT INTO Posiciones (latitud, longitud)
    VALUES (7.89, 1.11);
    INSERT INTO Solicitudes (codigo, fechaCreacion, fechaViaje, plataforma, precio, estado, cliente, latitudI, longitudI, latitudF, longitudF)
    VALUES (12345, SYSDATE, TO_DATE('2023-12-01', 'YYYY-MM-DD'), 'P', 5000, 'P', 1, 1.23, 4.56, 7.89, 1.11);
    DECLARE
        v_fecha_creacion DATE := SYSDATE;
        v_descripcion VARCHAR2(255) := 'Nueva PQRS';
        v_tipo VARCHAR2(10) := 'Queja';
        v_solicitud NUMBER := 12345;
    BEGIN
        PC_PQRS.adicionar(v_fecha_creacion, v_descripcion, v_tipo, v_solicitud);
        COMMIT;
    END;
    /

CREATE OR REPLACE PACKAGE PC_ANEXO IS
    PROCEDURE AD_ANEXO(xnombre IN VARCHAR2, xurl IN VARCHAR2);

    PROCEDURE EL_ANEXO(xpqrs IN VARCHAR2);
END PC_ANEXO;
/

CREATE OR REPLACE PACKAGE PC_ANEXO IS
    PROCEDURE AD_ANEXO(xnombre IN VARCHAR2, xurl IN VARCHAR2);

    PROCEDURE EL_ANEXO(xpqrs IN VARCHAR2);
END PC_ANEXO;
/

CREATE OR REPLACE PACKAGE BODY PC_ANEXO IS
    PROCEDURE AD_ANEXO(xnombre IN VARCHAR2, xurl IN VARCHAR2) IS
    BEGIN
        -- Usar una secuencia para generar valores de clave primaria si es necesario
        INSERT INTO Anexos (pqrs, urlP, nombre) VALUES (xnombre, xurl, NULL);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK TO SAVEPOINT ad_anexo_savepoint;
            SAVEPOINT ad_anexo_savepoint;
            RAISE_APPLICATION_ERROR(-20004, 'Error al insertar en anexos');
    END;

    PROCEDURE EL_ANEXO(xpqrs IN VARCHAR2) IS
    BEGIN
        DELETE FROM Anexos WHERE pqrs = xpqrs;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK TO SAVEPOINT el_anexo_savepoint;
            SAVEPOINT el_anexo_savepoint;
            RAISE_APPLICATION_ERROR(-20005, 'Error al eliminar en anexos');
    END;
END PC_ANEXO;

--xCRUD
DROP PACKAGE PC_PQRS;
DROP PACKAGE PC_ANEXO;
--------------------------------------SEGURIDAD--------------------------------------------
----------------------+++++++++++-ACTORESE-++++++++++++-----------------------
--CLIENTE

CREATE OR REPLACE PACKAGE PA_CLIENTE IS
    --pqrs--
    PROCEDURE PQRSAdicionar(xcierre IN DATE, xdescripcion IN VARCHAR,xtipo IN VARCHAR, xsolicitud IN NUMBER);
    PROCEDURE PQRSModificar(xticked IN VARCHAR, xestado IN CHAR);
    PROCEDURE PQRSEliminar(xticked IN VARCHAR);
    --solicitud--
    --PROCEDURE sAdicionar(xfechaViaje IN DATE, xplataforma IN CHAR,  xcliente IN NUMBER, latitudI IN NUMBER, longitudI IN NUMBER, latitudF IN NUMBER, longitudF IN NUMBER);
    PROCEDURE solicitudModificarViaje(xcodigo IN NUMBER, xfechaViaje IN DATE);
    PROCEDURE solicitudModificarPrecio(xcodigo IN NUMBER, xprecio IN NUMBER);
    PROCEDURE solicitudModificarEstado(xcodigo IN NUMBER, xestado IN CHAR);
    FUNCTION  solicitudViaje(xcodigo IN NUMBER) RETURN SYS_REFCURSOR;
    --persona--
    PROCEDURE personaAdicionar(xid IN NUMBER, xtipo IN VARCHAR, xnumber IN NUMBER, xnombre IN VARCHAR, xcelular IN NUMBER, xcorreo IN VARCHAR);
    PROCEDURE personaModificarCelular(xidp IN NUMBER, xcelular IN NUMBER);
    PROCEDURE personaModificarCorreo(xidp IN NUMBER, xcorreo IN VARCHAR);
    --cliente--
    PROCEDURE clienteAdicionar(xpersona IN NUMBER, xidioma IN VARCHAR);
    PROCEDURE clienteModificar(xpersona IN NUMBER, xidioma IN VARCHAR);

END PA_CLIENTE;
/
--ANALISTA DE CLIENTES
CREATE OR REPLACE PACKAGE PA_ANALISTA_CLIENTE IS
    --PQRSRespuesta
    PROCEDURE PQRSrespuestaAdicionar(xpqrs IN VARCHAR, xfecha IN DATE, xdescripcion IN VARCHAR, xnombre IN VARCHAR, xcorreo IN VARCHAR, xcomentario IN VARCHAR, xevaluacion IN NUMBER);
    FUNCTION PQRSCerrados RETURN SYS_REFCURSOR;
    FUNCTION clientesFrecuentes RETURN SYS_REFCURSOR;
END PA_ANALISTA_CLIENTE;
/
----------------------+++++++++++-ACTORESI-++++++++++++-----------------------
CREATE OR REPLACE PACKAGE BODY PA_CLIENTE IS
    PROCEDURE PQRSAdicionar(xcierre IN DATE, xdescripcion IN VARCHAR, xtipo IN VARCHAR, xsolicitud IN NUMBER) IS 
    BEGIN 
        PC_PQRS.adicionar(xcierre, xdescripcion, xtipo, xsolicitud);
    END PQRSAdicionar;
    
    PROCEDURE PQRSModificar(xticked IN VARCHAR, xestado IN CHAR) IS 
    BEGIN
        PC_PQRS.modificar(xticked, xestado);
    END PQRSModificar;
    
    PROCEDURE PQRSEliminar(xticked IN VARCHAR) IS
    BEGIN
        PC_PQRS.eliminar(xticked);
    END PQRSEliminar;
    
    --PROCEDURE sAdicionar(xfechaViaje IN DATE, xplataforma IN CHAR, xcliente IN NUMBER, xlatitudI IN NUMBER, xlongitudI IN NUMBER, xlatitudF IN NUMBER, xlongitudF IN NUMBER) IS
    --BEGIN 
       -- INSERT INTO solicitudes (fechaViaje, plataforma, cliente, latitudI, longitudI, latitudF, longitudF) 
       -- VALUES (xfechaViaje, xplataforma, xcliente, xlatitudI, xlongitudI, xlatitudF, xlongitudF);
        
       -- COMMIT;
        
    --EXCEPTION
     --   WHEN OTHERS THEN
     --       ROLLBACK;
     --       RAISE_APPLICATION_ERROR(-20011, 'Error al insertar en solicitudes');
    --END sAdicionar;
    
    PROCEDURE solicitudModificarViaje(xcodigo IN NUMBER, xfechaViaje IN DATE) IS
    BEGIN
        UPDATE solicitudes
        SET fechaViaje = xfechaViaje
        WHERE codigo = xcodigo AND estado = 'P';
        
        COMMIT;
        
    EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20012, 'Error al modificar la fecha de viaje');
    END solicitudModificarViaje;
    
    PROCEDURE solicitudModificarPrecio(xcodigo IN NUMBER, xprecio IN NUMBER) IS
    BEGIN
        UPDATE solicitudes
        SET precio = xprecio
        WHERE codigo = xcodigo AND estado = 'P';
        
        COMMIT;
        
    EXCEPTION
        WHEN OTHERS THEN 
            RAISE_APPLICATION_ERROR(-20013, 'Error al modificar el precio');
    END solicitudModificarPrecio;
    
    PROCEDURE solicitudModificarEstado(xcodigo IN NUMBER, xestado IN CHAR) IS
    BEGIN
        UPDATE solicitudes
        SET estado = xestado
        WHERE codigo = xcodigo;
        
        COMMIT;
        
    EXCEPTION
        WHEN OTHERS THEN 
            RAISE_APPLICATION_ERROR(-20014, 'Error al modificar el estado');
    END solicitudModificarEstado;
    
    FUNCTION solicitudViaje(xcodigo IN NUMBER) RETURN SYS_REFCURSOR IS
        SOL_VIAJE SYS_REFCURSOR;
    BEGIN 
        OPEN SOL_VIAJE FOR
            SELECT fechaCreacion, fechaViaje, plataforma, precio
            FROM solicitudes
            WHERE codigo = xcodigo 
              AND fechaCreacion > ADD_MONTHS(TO_DATE('2023-11-5', 'YYYY-MM-DD'), -1)
              AND precio > 5000;
              
        RETURN SOL_VIAJE;
    END solicitudViaje;
    
    PROCEDURE personaAdicionar(xid IN NUMBER, xtipo IN VARCHAR, xnumber IN NUMBER, xnombre IN VARCHAR, xcelular IN NUMBER, xcorreo IN VARCHAR) IS
    BEGIN 
        INSERT INTO personas (id_Persona, tipo, numero, nombre, celular, correo) 
        VALUES (xid, xtipo, xnumber, xnombre, xcelular, xcorreo);
        
        COMMIT;
        
    EXCEPTION
        WHEN OTHERS THEN 
            RAISE_APPLICATION_ERROR(-20015, 'Error al insertar en personas');
    END personaAdicionar;
    
    PROCEDURE personaModificarCelular(xidp IN NUMBER, xcelular IN NUMBER) IS 
    BEGIN
        UPDATE personas
        SET celular = xcelular
        WHERE id_Persona = xidp; 
        
        COMMIT;
        
    EXCEPTION
        WHEN OTHERS THEN 
            RAISE_APPLICATION_ERROR(-20016, 'Error al modificar el celular en personas');
    END personaModificarCelular;
    
    PROCEDURE personaModificarCorreo(xidp IN NUMBER, xcorreo IN VARCHAR) IS
    BEGIN
        UPDATE personas
        SET correo = xcorreo
        WHERE id_Persona = xidp; 
        
        COMMIT;
        
    EXCEPTION
        WHEN OTHERS THEN 
            RAISE_APPLICATION_ERROR(-20017, 'Error al modificar el correo en personas');
    END personaModificarCorreo;
    
    PROCEDURE clienteAdicionar(xpersona IN NUMBER, xidioma IN VARCHAR) IS
    BEGIN 
        INSERT INTO clientes (persona, idiomaNativo) 
        VALUES (xpersona, xidioma);
        
        COMMIT;
        
    EXCEPTION
        WHEN OTHERS THEN 
            RAISE_APPLICATION_ERROR(-20018, 'Error al adicionar clientes');
    END clienteAdicionar;
    
    PROCEDURE clienteModificar(xpersona IN NUMBER, xidioma IN VARCHAR) IS
    BEGIN
        UPDATE clientes
        SET idiomaNativo = xidioma
        WHERE persona = xpersona; 
        
        COMMIT;
        
    EXCEPTION
        WHEN OTHERS THEN 
            RAISE_APPLICATION_ERROR(-20019, 'Error al modificar el idioma en clientes');
    END clienteModificar;       
END PA_CLIENTE;
/

CREATE OR REPLACE PACKAGE BODY PA_ANALISTA_CLIENTE IS
    PROCEDURE PQRSrespuestaAdicionar(xpqrs IN VARCHAR, xfecha IN DATE, xdescripcion IN VARCHAR, xnombre IN VARCHAR, xcorreo IN VARCHAR, xcomentario IN VARCHAR, xevaluacion IN NUMBER) IS
    BEGIN 
        INSERT INTO PqrsRespuestas (pqrs, fecha, descripcion, nombre, correo, comentario, evaluacion) VALUES (xpqrs, xfecha, xdescripcion, xnombre, xcorreo, xcomentario, xevaluacion);
        COMMIT;
        
    EXCEPTION
        WHEN OTHERS THEN 
            RAISE_APPLICATION_ERROR(-20023, 'Error al insertar en PQRS respuestas');
    END PQRSrespuestaAdicionar;

    FUNCTION PQRSCerrados RETURN SYS_REFCURSOR IS
        PQRSCerrado SYS_REFCURSOR;
    BEGIN 
        OPEN PQRSCerrado FOR
            SELECT c.pqrs, c.descripcion,c.fecha
            FROM PqrsRespuestas c
            JOIN PQRS m ON c.pqrs= m.ticked
            WHERE  m.estado = 'C'
            ORDER BY fecha DESC;
        RETURN PQRSCerrado;
    END PQRSCerrados;

    FUNCTION clientesFrecuentes RETURN SYS_REFCURSOR IS
        frecuente SYS_REFCURSOR;
    BEGIN 
        OPEN frecuente FOR
            SELECT P.tipo, P.numero, P.nombre, S.precio
            FROM Personas P
            JOIN Clientes C ON P.id_Persona = C.persona
            JOIN Solicitudes S ON C.persona = S.cliente
            WHERE S.estado = 'F'
            ORDER BY S.precio DESC
            FETCH FIRST 10 ROWS ONLY;
        RETURN frecuente;
    END clientesFrecuentes;
END PA_ANALISTA_CLIENTE;
/

-- xActores
DROP PACKAGE PA_CLIENTE;
DROP PACKAGE PA_ANALISTA_CLIENTE;


--Seguridad
--Rol Administrador_CLENTES

CREATE ROLE ANALISTA_ROLE;
GRANT ANALISTA TO bd10000;--VALENTINA
GRANT EXECUTE ON PA_ANALISTA_CLIENTE TO ANALISTA;


--Rol cliente

CREATE ROLE CLIENTE_ROLE;
--grant Cliente to bd10000972201a;
grant Cliente to bd1000046159;--DANIEL
GRANT EXECUTE ON PA_CLIENTE TO Cliente;



-- xSeguridad
DROP ROLE ANALISTA_ROLE;
DROP ROLE CLIENTE_ROLE;


