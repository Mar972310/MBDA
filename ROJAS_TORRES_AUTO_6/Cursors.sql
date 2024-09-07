CREATE OR REPLACE FUNCTION ObtenerDatosEvento(p_event_id VARCHAR2) 
  RETURN SYS_REFCURSOR 
AS
  event_teacher SYS_REFCURSOR;
BEGIN
  OPEN event_teacher FOR
    SELECT e.*, s.name AS staff_name
    FROM event e
    LEFT JOIN teaches t ON e.id_e = t.event
    LEFT JOIN staff s ON t.staff = s.id_s
    WHERE e.id_e = p_event_id;

  RETURN event_teacher;
END ObtenerDatosEvento;
/

VARIABLE elCursor REFCURSOR;
EXECUTE :elCursor:=ObtenerDatosEvento('co12004.L01'); 
PRINT  elCursor;

CLOSE :elCursor;

CREATE OR REPLACE VIEW VistaDatosEvento AS
SELECT * FROM TABLE(ObtenerDatosEvento('co12004.T06'));


CREATE OR REPLACE FUNCTION ObtenerEventosPorProfesor(p_staff_id VARCHAR2) 
  RETURN SYS_REFCURSOR 
AS
  teacher_events SYS_REFCURSOR;
BEGIN
  OPEN teacher_events FOR
    SELECT e.*
    FROM event e
    JOIN teaches t ON e.id_e = t.event
    WHERE t.staff = p_staff_id;

  RETURN teacher_events;
END ObtenerEventosPorProfesor;
/

VARIABLE elCursor REFCURSOR;
EXECUTE :elCursor:=ObtenerEventosPorProfesor('co12004.T05'); 
PRINT  elCursor;

CREATE OR REPLACE VIEW VistaEventosPorProfesor AS
SELECT * FROM TABLE(ObtenerEventosPorProfesor('co.AL'));




DROP PACKAGE CursorPackage;
DROP FUNCTION ObtenerDatosEvento;
DROP FUNCTION ObtenerEventosPorProfesor;