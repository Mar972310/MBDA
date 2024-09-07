/*Register an Event(Ad,Mo,Co,El)
Ad
El id se genera automáticamente: id del módulo, un punto, el tipo del evento y dos digitos aleatorio.
TR_EVENT_BI (disparador.automatizar)*/

CREATE OR REPLACE TRIGGER TR_EVENT_BI
BEFORE INSERT ON event
FOR EACH ROW
DECLARE 
    id_modle        VARCHAR(20);
    event_type      CHAR(1);
    random_digits   CHAR(2);

BEGIN 
    id_modle := :NEW.modle;
    event_type := :NEW.kind;
    random_digits := LPAD(TRUNC(DBMS_RANDOM.VALUE(0, 100)), 2, '0');
    :NEW.id_e := id_modle || '.' || event_type || random_digits;
    
END TR_EVENT_BI;

INSERT INTO event (modle, kind, dow, tod, duration, room) 
VALUES ('co12006', 'L', 'Monday', '09:00', 2, 'cr.123');
SELECT * FROM event WHERE modle = 'co12006';


CREATE OR REPLACE TRIGGER CK_EVENT_TOD_DURATION
BEFORE INSERT ON event
FOR EACH ROW
DECLARE
    hora VARCHAR(5);
BEGIN
    IF :new.tod = '20:00'  THEN 
        :NEW.duration := 1;
    END IF;
END CK_EVENT_TOD_DURATION;

INSERT INTO event (id_e,modle, kind, dow, tod, duration, room) 
VALUES ('co12006.L02','co12006', 'L', 'Monday', '20:00', 2, 'cr.123');

CREATE OR REPLACE TRIGGER TR_EVENT_BU
BEFORE UPDATE ON event
FOR EACH ROW
BEGIN 
    IF :OLD.room <> :NEW.room THEN
        NULL;
    ELSE
        RAISE_APLICATION_ERROR(-20001,'Se esta tratando de modificar un atributo no permitido');
    END IF;
END TR_EVENT_BU;
   
UPDATE event
SET room = 'c340.g';
UPDATE event
SET modle = 'c340.g';


DROP TRIGGER TR_EVENT_BI;
    