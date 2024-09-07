/*Tablas*/
CREATE TABLE staff(
    id_s        VARCHAR(20) NOT NULL,
    name        VARCHAR(50)
);

CREATE TABLE modle(
    id_m        VARCHAR(20) NOT NULL,
    name        VARCHAR(50)
);

CREATE TABLE event(
    id_e        VARCHAR(20) NOT NULL,
    modle       VARCHAR(20),
    kind        CHAR(1),
    dow         VARCHAR(15),
    tod         CHAR(5),
    duration    NUMBER(11), 
    room        VARCHAR(20)
);

CREATE TABLE teaches(
    staff       VARCHAR(20) NOT NULL,
    event       VARCHAR(20) NOT NULL
);
CREATE TABLE occurs (
    event       VARCHAR(20) NOT NULL, 
    week        VARCHAR(20) NOT NULL
);

/*RESTRICCIONES*/

ALTER TABLE staff ADD CONSTRAINT PK_staff PRIMARY KEY(id_s);
ALTER TABLE modle ADD CONSTRAINT PK_modle PRIMARY KEY(id_m);
ALTER TABLE event ADD CONSTRAINT PK_EVENT PRIMARY KEY(id_e);
ALTER TABLE teaches ADD CONSTRAINT PK_TEACHES PRIMARY KEY(staff,event);
ALTER TABLE occurs ADD CONSTRAINT PK_occurs PRIMARY KEY(event,week);

ALTER TABLE teaches ADD CONSTRAINT FK_TEACHES_STAFF FOREIGN KEY (staff) REFERENCES staff(id_s);
ALTER TABLE teaches ADD CONSTRAINT FK_TEACHES_EVENT FOREIGN KEY (event) REFERENCES event(id_e);
ALTER TABLE occurs ADD CONSTRAINT FK_occurs FOREIGN KEY (event) REFERENCES event(id_e);
ALTER TABLE event ADD CONSTRAINT FK_EVENT_MODLE FOREIGN KEY (modle) REFERENCES modle(id_m);

/*AtributosOk*/

/*---------------------------------------------modle----------------------------------------------------*/

/* Con estas registros estamos validando la condicion de PK_modle y que los datos ingresados si sean del tipo establecido en los atributos*/
INSERT INTO modle (id_m, name) VALUES ('co12004', 'Applications Workshop');
INSERT INTO modle (id_m, name) VALUES ('co12005', 'Software Development 1B');
/* Con estos registros estamos validando las longitudes maximas y minimas que fueron definidas en los atributos*/
INSERT INTO modle (id_m, name) VALUES ('M1', 'Mathematics');
INSERT INTO modle (id_m, name) VALUES ('M2', 'History');
INSERT INTO modle (id_m, name) VALUES ('M3', 'Science');
INSERT INTO modle (id_m, name) VALUES ('M1234567890123456789', 'Mathematics1234567890123456789');
INSERT INTO modle (id_m, name) VALUES ('M2345678901234567890','History1234567890123456789012');
INSERT INTO modle (id_m, name) VALUES ('M3456789012345678901','Science1234567890123456789012');

/*---------------------------------------------staff----------------------------------------------------*/

/* Con estas registros estamos validando la condicion de PK_staff y que los datos ingresados si sean del tipo establecido en los atributos*/
INSERT INTO staff (id_s, name) VALUES ('co.ACg', 'Cumming, Andrew');
INSERT INTO staff (id_s, name) VALUES ('co.ACr', 'Crerar, Dr Alison');
INSERT INTO staff (id_s, name) VALUES ('co.AFA', 'Armitage, Dr Alistair');
INSERT INTO staff (id_s, name) VALUES ('co.AG', 'Groat, Anne');
INSERT INTO staff (id_s, name) VALUES ('co.AL', 'Lawson, Alistair');
INSERT INTO staff (id_s, name) VALUES ('co.AMn', 'Maclean, Aileen');
INSERT INTO staff (id_s, name) VALUES ('co.ASc', 'Scott, Andrea');
INSERT INTO staff (id_s, name) VALUES ('co.ASr', 'Soutar, Alastair');
INSERT INTO staff (id_s, name) VALUES ('co.AV', 'Varey, Alison');
/* Con estos registros estamos validando las longitudes maximas y minimas que fueron definidas en los atributos*/
INSERT INTO staff (id_s, name) VALUES ('12345678901234567890', 'John Doe123456789012345678901234567890');
INSERT INTO staff (id_s, name) VALUES ('23456789012345678901', 'Jane Smith123456789012345678901234567890');
INSERT INTO staff (id_s, name) VALUES ('1', 'John Doe');
INSERT INTO staff (id_s, name) VALUES ('2', 'Jane Smith');
INSERT INTO staff (id_s, name) VALUES ('3', 'Robert Johnson');

/*---------------------------------------------event----------------------------------------------------*/

/* Con estas registros estamos validando la condicion de PK_EVENT, FK_EVENT_MODLE y  que los datos ingresados si sean del tipo establecido en los atributos*/
INSERT INTO event (id_e, modle, kind, dow, tod, duration, room) VALUES ('co12004.L01', 'co12004', 'L', 'Wednesday', '11:00', 1, 'cr.SMH');
INSERT INTO event (id_e, modle, kind, dow, tod, duration, room) VALUES ('co12004.L02', 'co12004', 'T', 'Monday', '17:00', 1, 'cr.B13');
INSERT INTO event (id_e, modle, kind, dow, tod, duration, room) VALUES ('co12004.T01', 'co12004', 'T', 'Monday', '11:00', 2, 'co.G78+G82');
INSERT INTO event (id_e, modle, kind, dow, tod, duration, room) VALUES ('co12004.T02', 'co12004', 'L', 'Tuesday', '15:00', 1, 'co.B7');
INSERT INTO event (id_e, modle, kind, dow, tod, duration, room) VALUES ('co12004.T03', 'co12004', 'T', 'Tuesday', '13:00', 2, 'co.G78+G82');
INSERT INTO event (id_e, modle, kind, dow, tod, duration, room) VALUES ('co12004.T04', 'co12004', 'L', 'Wednesday', '13:00', 2, 'co.LB42+LB46');
INSERT INTO event (id_e, modle, kind, dow, tod, duration, room) VALUES ('co12004.T05', 'co12004', 'T', 'Wednesday', '8:00', 2, 'co.117+118');
INSERT INTO event (id_e, modle, kind, dow, tod, duration, room) VALUES ('co12004.T06', 'co12004', 'L', 'Tuesday', '13:00', 1, 'co.LB47');
INSERT INTO event (id_e, modle, kind, dow, tod, duration, room) VALUES ('co12005.L01', 'co12005', 'L', 'Monday', '14:00', 2, 'cr.SMH');


/*---------------------------------------------teaches----------------------------------------------------*/

/* Con estas registros estamos validando la condicion de FK_TEACHES_STAFF,FK_TEACHES_EVENT y  que los datos ingresados si sean del tipo establecido en los atributos*/
INSERT INTO teaches (staff, event) VALUES ('co.ACg', 'co12004.L01');
INSERT INTO teaches (staff, event) VALUES ('co.ACr', 'co12004.L02');
INSERT INTO teaches (staff, event) VALUES ('co.AFA', 'co12004.T01');
INSERT INTO teaches (staff, event) VALUES ('co.AG', 'co12004.T02');
INSERT INTO teaches (staff, event) VALUES ('co.AL', 'co12004.T05');
INSERT INTO teaches (staff, event) VALUES ('co.AMn', 'co12004.T05');
INSERT INTO teaches (staff, event) VALUES ('co.ASc', 'co12004.L01');
INSERT INTO teaches (staff, event) VALUES ('co.ASr', 'co12005.L01');

/*AtributosNoOk*/

/* Con estos registros estamos tratando de tener dos registros con la misma PK_modle*/
INSERT INTO modle (id_m, name) VALUES ('co12001', 'Rapid Application Development');
INSERT INTO modle (id_m, name) VALUES ('co12001', 'Software Development 1A');

/* Con estos registros estamos tratando de ingresar valores no permitidos en los atributos*/
INSERT INTO modle (id_m, name) VALUES (null, 'Computer Systems');
INSERT INTO modle (id_m, name) VALUES (co12008, 'Word Processing and Spreadsheets Elective');

/*Con este registro estamos tratando de insertar valores mas largos de lo permitido*/
INSERT INTO modle (id_m, name) VALUES ('co22002', 'Software Development............................................................................................');

/* Con estos registros estamos tratando de tener dos registros con la misma PK_staff*/
INSERT INTO staff (id_s, name) VALUES ('co.ACg', 'Cumming, Andrew');
INSERT INTO staff (id_s, name) VALUES ('co.ACg', 'Crerar, Dr Alison');
INSERT INTO staff (id_s, name) VALUES ('co.ACg', 'Armitage, Dr Alistair');

/*Con este registro estamos tratando de insertar valores mas largos de lo permitido*/
INSERT INTO staff (id_s, name) VALUES ('co.AG....................................', '*:*:**:******::::*:*:**:*:****:*:*:***:**:*:**:*Groat, Anne');

/* Con estos registros estamos tratando de tener registros donde la FK no se encuentra en la tabla de origen*/
INSERT INTO event (id_e, modle, kind, dow, tod, duration, room) VALUES ('co12004.L01', 'co12004', 's', 'Wednesday', '11:00', 1, 'cr.SMH');
INSERT INTO event (id_e, modle, kind, dow, tod, duration, room) VALUES ('co12004.L02', 'co12004', 'm', 'Monday', '17:00', 1, 'cr.B13');

/*Con este registro estamos tratando de insertar valores mas largos de lo permitido*/
INSERT INTO event (id_e, modle, kind, dow, tod, duration, room) VALUES ('co12004.T01', 'co12004', 'Tod', 'Monday', '11:00', 5, 'co.G78+G82');

/* Con estos registros estamos tratando de tener registros donde la FK no se encuentra en las tablas de origen*/
INSERT INTO teaches (staff, event) VALUES ('co.AFS', 'co12004.T01');
INSERT INTO teaches (staff, event) VALUES ('co.AG', 'co12094.T02');
INSERT INTO teaches (staff, event) VALUES ('co.AX', 'co12004.T09');
