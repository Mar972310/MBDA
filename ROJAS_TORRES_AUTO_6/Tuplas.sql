/*Restricciones declarativas*/

ALTER TABLE event 
ADD CONSTRAINT CK_EVENT_KIND 
CHECK (kind IN('L','T'));

ALTER TABLE event
ADD CONSTRAINT CK_EVENT_DOW
CHECK (dow IN('Monday','Wednesday','Tuesday','Thursday','Friday'));

ALTER TABLE event
ADD CONSTRAINT CK_EVENT_TOD
CHECK (tod >= '08:00' AND tod <= '20:00');

ALTER TABLE event
ADD CONSTRAINT  CK_EVENT_DURATION 
CHECK (duration = 1 OR duration = 2);

/*TuplaOk*/

/*Con estos regisrtos estamos validadndo los constraint CK_EVENT_KIND,CK_EVENT_DOW,CK_EVENT_TOD y CK_EVENT_DURATION */

INSERT INTO event (id_e, modle, kind, dow, tod, duration, room) VALUES ('co12004.L11', 'co12004', 'T', 'Wednesday', '11:00', 1, 'cr.SMH');
INSERT INTO event (id_e, modle, kind, dow, tod, duration, room) VALUES ('co12004.L12', 'co12004', 'L', 'Monday', '17:00', 1, 'cr.B13');
INSERT INTO event (id_e, modle, kind, dow, tod, duration, room) VALUES ('co12009.T01', 'co12004', 'T', 'Monday', '11:00', 2, 'co.G78+G82');
INSERT INTO event (id_e, modle, kind, dow, tod, duration, room) VALUES ('co13004.T02', 'co12004', 'T', 'Tuesday', '15:00', 1, 'co.B7');

/*TuplasNoOk*/

/*Con estos registro estamos tratando de insertar dats que en algunos atributos no corresponde a las especificaciones dadas en el apartado de "Restricciones declarativas"*/

INSERT INTO event (id_e, modle, kind, dow, tod, duration, room) VALUES ('co12004.L01', 'co12004', 'S', 'Wednesday', '11:00', 1, 'cr.SMH');
INSERT INTO event (id_e, modle, kind, dow, tod, duration, room) VALUES ('co12004.L02', 'co12004', 'L', 'Monday', '7:00', 3, 'cr.B13');
INSERT INTO event (id_e, modle, kind, dow, tod, duration, room) VALUES ('co12004.T01', 'co12004', 'K', 'Monday', '11:00', 2, 'co.G78+G82');
INSERT INTO event (id_e, modle, kind, dow, tod, duration, room) VALUES ('co12004.T02', 'co12004', 'T', 'T', '24:00', 7, 'co.B7');
