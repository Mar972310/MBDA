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

ALTER TRIGGER TR_EVENT_BI ENABLE;




DROP TRIGGER TR_EVENT_BI;
    