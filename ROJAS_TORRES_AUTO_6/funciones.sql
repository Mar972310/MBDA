
CREATE OR REPLACE PACKAGE FUNCIONESPC_EVENT AS
    FUNCTION ad(modleFUNCTION VARCHAR2, kindFUNCTION CHAR, dowFUNCTION VARCHAR2, todFUNCTION CHAR, durationFUNCTION NUMBER, roomFUNCTION VARCHAR2)
        RETURN VARCHAR2;
    
    PROCEDURE up(id_eFUNCTION VARCHAR2, roomFUNCTION VARCHAR2);
    
    PROCEDURE adStaff(eventFUNCTION VARCHAR2, staffFUNCTION VARCHAR2);

    PROCEDURE del(eventFUNCTION VARCHAR2);
        
END FUNCIONESPC_EVENT;
/


CREATE OR REPLACE PACKAGE BODY FUNCIONESPC_EVENT IS
    FUNCTION ad(modleFUNCTION VARCHAR2, kindFUNCTION CHAR, dowFUNCTION VARCHAR2, todFUNCTION CHAR, durationFUNCTION NUMBER, roomFUNCTION VARCHAR2)
        RETURN VARCHAR2
    AS
        id_event VARCHAR2(100);
    BEGIN
        INSERT INTO event (id_e, kind, dow, tod, duration, room) 
        VALUES (NULL, modleFUNCTION, kindFUNCTION, dowFUNCTION, todFUNCTION, durationFUNCTION, roomFUNCTION);
        
        SELECT id INTO id_event
        FROM event
        WHERE kind = kindFUNCTION AND dow = dowFUNCTION AND tod = todFUNCTION AND duration = durationFUNCTION AND room = roomFUNCTION;
        
        COMMIT;
        RETURN id_event;
        
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            raise_application_error(-20002, 'Error al Insertar el evento');
    END ad;
       
    PROCEDURE up(id_eFUNCTION VARCHAR2, roomFUNCTION VARCHAR2) IS
    BEGIN 
        UPDATE event SET room = roomFUNCTION
        WHERE id_e = id_eFUNCTION;
        DBMS_OUTPUT.PUT_LINE('Se ha logrado modificar el salon del evento ');
        COMMIT;
        
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            raise_application_error(-20003, 'No se puede actualizar el evento');
    END up;
    
    PROCEDURE adStaff(eventFUNCTION VARCHAR2, staffFUNCTION VARCHAR2) IS
    BEGIN
        INSERT INTO teaches (event, staff)
        VALUES (eventFUNCTION, staffFUNCTION);
        DBMS_OUTPUT.PUT_LINE('Se agrego un profesor al evento');
        COMMIT;
        
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            raise_application_error(-20004, 'No se puede añadir al trabajador');
    END adStaff;
        
    PROCEDURE del(eventFUNCTION VARCHAR2) IS
    BEGIN
        DELETE FROM event WHERE id_e = eventFUNCTION;
        DBMS_OUTPUT.PUT_LINE('Se elimino el evento');
        COMMIT;
        
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            raise_application_error(-20005, 'No se puede eliminar el evento');
    END del;
        
END FUNCIONESPC_EVENT;
/