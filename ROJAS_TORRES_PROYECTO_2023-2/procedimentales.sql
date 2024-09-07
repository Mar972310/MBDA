---------------------Cliente--------------------

CREATE OR REPLACE TRIGGER TR_INS_CLIENTES
BEFORE INSERT ON clientes
FOR EACH ROW
DECLARE 
    documento number(10);
    buscar number(1);
BEGIN
 documento := :new.documentoid;
 :NEW.documentoid := 'C'||documento;
 :NEW.activo := 'T';
END;
/ 

CREATE OR REPLACE TRIGGER TR_UP_CLIENTES
BEFORE UPDATE ON CLIENTES
FOR EACH ROW
BEGIN
    IF :OLD.documentoId != :NEW.documentoId  THEN
        RAISE_APPLICATION_ERROR(-20001, 'No se puede modificar el serial de registro y el numero de documento del cliente');
    END IF;
    IF :New.activo = 'F' THEN
        DBMS_OUTPUT.PUT_LINE('El cliente fue desactivado'); 
    END IF;
    
END;
/



CREATE OR REPLACE TRIGGER TR_DE_CLIENTES
BEFORE DELETE ON CLIENTES
FOR EACH ROW
BEGIN

    RAISE_APPLICATION_ERROR(-20025, 'Los clientes no se pueden eliminar, actualice el estado del cliente a "F"');
    
    
    
END;
/

-------------------------------------------------PACIENTES-------------------------------------------------
CREATE OR REPLACE TRIGGER TR_INS_Directorio
BEFORE INSERT ON directorios
FOR EACH ROW
DECLARE
    TIPO VARCHAR2(50);  -- Se cambiÃ³ a VARCHAR2 para ser consistente con el tipo de datos en la tabla
    maximo NUMBER(16);
BEGIN
    TIPO := :NEW.tipoAnimal;
    
    IF TIPO = 'Perro' THEN 
        SELECT NVL(MAX(TO_NUMBER(REGEXP_SUBSTR(idRazaEspecie, '\d+'))), 0) + 1 INTO maximo 
        FROM Directorios
        WHERE tipoAnimal = 'Perro';
        :NEW.idRazaEspecie := 'P' || LPAD(maximo, 16, '0'); 
    ELSIF TIPO = 'Gato' THEN 
        SELECT NVL(MAX(TO_NUMBER(SUBSTR(idRazaEspecie, 2))), 0) + 1 INTO maximo 
        FROM Directorios
        WHERE tipoAnimal = 'Gato';
        :NEW.idRazaEspecie := 'G' || LPAD(maximo, 16, '0');
    ELSIF TIPO = 'Reptil' THEN 
        SELECT NVL(MAX(TO_NUMBER(SUBSTR(idRazaEspecie, 2))), 0) + 1 INTO maximo 
        FROM Directorios
        WHERE tipoAnimal = 'Reptil';
        :NEW.idRazaEspecie := 'R' || LPAD(maximo, 16, '0');
    ELSIF TIPO = 'Roedor' THEN  
        SELECT NVL(MAX(TO_NUMBER(SUBSTR(idRazaEspecie, 2))), 0) + 1 INTO maximo 
        FROM Directorios
        WHERE tipoAnimal = 'Roedor';
        :NEW.idRazaEspecie := 'Z' || LPAD(maximo, 16, '0');
    ELSIF TIPO = 'Conejo' THEN
        SELECT NVL(MAX(TO_NUMBER(SUBSTR(idRazaEspecie, 2))), 0) + 1 INTO maximo 
        FROM Directorios
        WHERE tipoAnimal = 'Conejo';
        :NEW.idRazaEspecie := 'C' || LPAD(maximo, 16, '0');
    ELSIF TIPO = 'Pez' THEN 
        SELECT NVL(MAX(TO_NUMBER(SUBSTR(idRazaEspecie, 2))), 0) + 1 INTO maximo 
        FROM Directorios
        WHERE tipoAnimal = 'Pez';
        :NEW.idRazaEspecie := 'F' || LPAD(maximo, 16, '0');
    END IF;
    
END;
/

CREATE OR REPLACE TRIGGER TR_UP_DIRECTORIOS
BEFORE UPDATE ON directorios
FOR EACH ROW
BEGIN
    IF :OLD.idRazaEspecie != :NEW.idRazaEspecie OR
       :OLD.nombreRaza != :NEW.nombreRaza OR
       :OLD.tipoAnimal != :NEW.tipoAnimal THEN
        RAISE_APPLICATION_ERROR(-20025, 'No se puede modificar idRazaEspecie, nombreRaza o tipoAnimal');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TR_DE_DIRECTORIOS
BEFORE delete ON directorios
FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20024, 'Los registros del directorio no se pueden eliminar');
END;
/
--PACIENTE
CREATE OR REPLACE TRIGGER TR_INS_Pacientes
BEFORE INSERT ON pacientes
FOR EACH ROW
DECLARE
    maximo NUMBER(10);
BEGIN
 SELECT NVL(MAX(TO_NUMBER(REGEXP_SUBSTR(idPaciente, '\d+'))), 0) + 1 
  INTO maximo 
 FROM Pacientes;
 :NEW.idPaciente := 'P'||LPAD(maximo, 10, '0');
 :NEW.fechaRegistro := SYSTIMESTAMP;
 :NEW.fechaActualizacion := SYSTIMESTAMP;
 :NEW.ACTIVO := 'T';
END;
/
CREATE OR REPLACE TRIGGER TR_UP_Pacientes
BEFORE UPDATE ON pacientes
FOR EACH ROW
DECLARE
    maximo NUMBER(10);
    cirugia NUMBER(2);
    CLIENTE NUMBER(1);
BEGIN
    SELECT COUNT(*) INTO maximo 
    FROM HISTORIALES B
    JOIN SERVICIOS A ON B.servicio = A.idServicio
    WHERE :OLD.idPaciente = A.paciente AND TO_CHAR(FECHAREGISTRO, 'DD-MM-YYYY') = TO_CHAR(SYSDATE, 'DD-MM-YYYY');

    IF :OLD.FECHANACIMIENTO IS NOT NULL AND MONTHS_BETWEEN(SYSDATE, TO_DATE(:OLD.fechaNacimiento, 'DD-MM-YYYY'))/12 > :OLD.EDAD THEN
        :NEW.EDAD := MONTHS_BETWEEN(SYSDATE, TO_DATE(:OLD.fechaNacimiento, 'DD-MM-YYYY'))/12;
    ELSE 
        :NEW.EDAD := :OLD.EDAD + MONTHS_BETWEEN(SYSDATE, TO_DATE(:OLD.fechaREGISTRO, 'DD-MM-YYYY'))/12;
    END IF;

    IF (maximo = 0 OR :OLD.fechaActualizacion = SYSTIMESTAMP) AND :OLD.PESO != :NEW.PESO THEN 
        RAISE_APPLICATION_ERROR(-20010, 'No se puede actualizar el peso del paciente en este momento');
    END IF;

    SELECT COUNT(*) INTO cirugia 
    FROM SERVICIOS 
    WHERE NOMBRE LIKE '%Esterilizacion%' AND PACIENTE = :OLD.IDPACIENTE AND TO_CHAR(FECHA, 'DD-MM-YYYY') < TO_CHAR(SYSDATE, 'DD-MM-YYYY');

    IF cirugia = 0 AND :OLD.ESTERILIZADO != :NEW.ESTERILIZADO THEN 
        RAISE_APPLICATION_ERROR(-20011, 'No se puede actualizar el campo de esterilizado del paciente en este momento');
    END IF;

    :NEW.FECHAACTUALIZACION := SYSTIMESTAMP;

    IF :NEW.ACTIVO = 'F' THEN
        SELECT COUNT(*) INTO CLIENTE
        FROM CLIENTES
        WHERE :OLD.CLIENTE = DOCUMENTOID AND activo = 'F';
        
        IF CLIENTE = 1 THEN
            INSERT INTO PACIENTESDORM (idPaciente,fechaRegistro)
            VALUES (:OLD.idPaciente, SYSTIMESTAMP);
        END IF;
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TR_DE_PACIENTES
BEFORE DELETE ON pacientes
FOR EACH ROW    
BEGIN   
    RAISE_APPLICATION_ERROR(-20026, 'Los pacientes no se pueden eliminar, actualice el estado del paciente a "F"');  
END;
/




-------------------------------------EMPLEADOS-------------------------------------
CREATE OR REPLACE TRIGGER TR_INS_EMPLEADOS
BEFORE INSERT ON empleados
FOR EACH ROW
DECLARE 
    documento number(10);
BEGIN
 documento := :new.idEmpleado;
 :NEW.IDEMPLEADO := 'E'||documento;
 :NEW.estadoEmpleado := 'P';
 :NEW.fechaRegistro := SYSTIMESTAMP;
END;
/
create or replace TRIGGER TR_UP_EMPLEADOS
BEFORE UPDATE ON EMPLEADOS
FOR EACH ROW
BEGIN
    IF :new.estadoEmpleado = 'D' THEN 
        DELETE FROM HORARIOEMPLEADOS 
        WHERE EMPLEADO = :OLD.IDEMPLEADO;
        DELETE FROM CERTIFICACIONES 
        WHERE EMPLEADO = :OLD.IDEMPLEADO;
        DBMS_OUTPUT.PUT_LINE('Se borraron todos los registros de horarios del empleado ya que fue despedido'); 
    END IF;  

    -- Check if IDEMPLEADO is being changed
    IF :OLD.IDEMPLEADO != :NEW.IDEMPLEADO THEN
        RAISE_APPLICATION_ERROR(-20003, 'No se pueden realizar cambios a los campos que trata de modificar');
    END IF;


END;
/

CREATE OR REPLACE TRIGGER TR_DE_EMPLEADOS
BEFORE DELETE ON EMPLEADOS
FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20004, 'Los empleados no se pueden eliminar, actualice el estado del empleado a "D"');
END;
/

create or replace TRIGGER TR_INS_HORARIOSEMPLEADOS
BEFORE INSERT ON horarioEmpleados
FOR EACH ROW
DECLARE 
    MAXIMO number(10);
BEGIN
 SELECT NVL(MAX(TO_NUMBER(REGEXP_SUBSTR(IDHORARIO, '\d+'))), 0) + 1 INTO maximo 
    FROM HORARIOEMPLEADOS; 
    :NEW.IDHORARIO := 'HO' || LPAD(maximo, 10, '0'); 
    
    IF (:NEW.FECHAINICIO < SYSTIMESTAMP OR :NEW.FECHAFIN < SYSTIMESTAMP OR :NEW.FECHAINICIO > :NEW.FECHAFIN ) THEN
        RAISE_APPLICATION_ERROR(-20017, 'Las fechas ingresadas no son correctas');
    END IF;
END;
/


CREATE OR REPLACE TRIGGER TR_UP_HORARIO_EMPLEADO
BEFORE UPDATE ON horarioempleados
FOR EACH ROW
DECLARE
    SERVICIOH NUMBER(2);
BEGIN
    SELECT COUNT(*) INTO SERVICIOH 
    FROM SERVICIOS
    WHERE FECHA = SYSTIMESTAMP AND ESTADO = 'T';
    
    IF (UPDATING('OCUPADO')) = false THEN
        RAISE_APPLICATION_ERROR(-20018, 'No se permite la actualizaciï¿½n de otros campos en la tabla horario empleados.');
    END IF;
    
    IF (:NEW.OCUPADO = 'F' AND SERVICIOH > 0) THEN
        RAISE_APPLICATION_ERROR(-20019, 'El empleado tiene un paciente en este momento,no esta libre');
    END IF;
    
    IF (:NEW.OCUPADO = 'T' AND SERVICIOH = 0) THEN
        RAISE_APPLICATION_ERROR(-20020, 'El empleado no tiene un paciente en este momento,esta libre');
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TR_DE_HORARIO_EMPLEADO
BEFORE DELETE ON horarioempleados
FOR EACH ROW
DECLARE
    EMPLEADOD NUMBER(1);
BEGIN 
    SELECT COUNT(*) INTO EMPLEADOD
    FROM EMPLEADOS
    WHERE IDEMPLEADO = :OLD.EMPLEADO AND ESTADOEMPLEADO = 'D';
    
    IF (EMPLEADOD = 0) THEN
        RAISE_APPLICATION_ERROR(-20021, 'El empleado trabaja en la veterinaria todavia, no se puede eliminar sus registros de horario');
    END IF;
    
END;
/

create or replace TRIGGER TR_INS_CERTIFICACIONES
BEFORE INSERT ON certificaciones
FOR EACH ROW
DECLARE 
    MAXIMO number(10);
BEGIN
 SELECT NVL(MAX(TO_NUMBER(REGEXP_SUBSTR(IDcertificacion, '\d+'))), 0) + 1 INTO maximo 
    FROM certificaciones; 
    :NEW.IDcertificacion := 'CERTI' || LPAD(maximo, 10, '0'); 
END;
/

CREATE OR REPLACE TRIGGER TR_UP_CERTIFICACIONES
BEFORE UPDATE ON CERTIFICACIONES
BEGIN
    RAISE_APPLICATION_ERROR(-20022, 'No se permite la actualizacion de las certificaciones.');
END;
/

CREATE OR REPLACE TRIGGER TR_DE_CERTIFICACIONES
BEFORE DELETE ON certificaciones
FOR EACH ROW
DECLARE
    EMPLEADOD NUMBER(1);
BEGIN 
    SELECT COUNT(*) INTO EMPLEADOD
    FROM EMPLEADOS
    WHERE IDEMPLEADO = :OLD.EMPLEADO AND ESTADOEMPLEADO = 'D';
    
    IF (EMPLEADOD = 0) THEN
        RAISE_APPLICATION_ERROR(-20023, 'El empleado trabaja en la veterinaria todavia, no se puede eliminar sus certificaciones');
    END IF;
    
END;
/
---------------------------SERVICIOS---------------------------------
CREATE OR REPLACE TRIGGER TR_INS_SERVICIOS
BEFORE INSERT ON SERVICIOS
FOR EACH ROW
DECLARE
    maximo NUMBER(16);
    FECHAVALIDA DATE;
    IDSER VARCHAR(11);
    veterinarioOcupa NUMBER(2);
    veterinarioCiru NUMBER(2);
    EMPLEADOLIBRE NUMBER(1);
    MAX_CIRUGIAS_EMPLEADO CONSTANT NUMBER := 2;
    MAX_SERVICIOS_EMPLEADO CONSTANT NUMBER := 15;
    NUM_CIRUGIAS_EMPLEADO NUMBER;
    NUM_SERVICIOS_EMPLEADO NUMBER;
BEGIN
    -- Contar el número de cirugías para el empleado en la fecha del nuevo servicio
    SELECT COUNT(*)
    INTO NUM_CIRUGIAS_EMPLEADO
    FROM SERVICIOS
    WHERE EMPLEADO = :NEW.EMPLEADO
    AND TIPO = 'C'
    AND TRUNC(FECHA) = TRUNC(:NEW.FECHA);

    -- Contar el número total de servicios para el empleado en la fecha del nuevo servicio
    SELECT COUNT(*)
    INTO NUM_SERVICIOS_EMPLEADO
    FROM SERVICIOS
    WHERE EMPLEADO = :NEW.EMPLEADO
    AND TRUNC(FECHA) = TRUNC(:NEW.FECHA);
    
    IF NUM_SERVICIOS_EMPLEADO >= MAX_SERVICIOS_EMPLEADO THEN
        RAISE_APPLICATION_ERROR(-20033, 'No se puede registrar servicios con este empleado, toda la agenda fue asignada');
    END IF;
    IF NUM_CIRUGIAS_EMPLEADO >= MAX_CIRUGIAS_EMPLEADO THEN
        -- Si ya tiene dos cirugías, permitir solo otros tipos de servicios
        IF :NEW.TIPO = 'C' THEN
            RAISE_APPLICATION_ERROR(-20013, 'El empleado ya tiene dos cirugías asignadas el dia de hoy, puede resgistrar otro tipo de servicios');
        END IF;
    END IF;
    IF NUM_SERVICIOS_EMPLEADO >= 5 and  NUM_CIRUGIAS_EMPLEADO >= MAX_CIRUGIAS_EMPLEADO THEN
        RAISE_APPLICATION_ERROR(-20014, 'No se puede registrar servicios con este empleado, toda la agenda fue asignada');
    END IF;
    -- Verificar si el empleado ha alcanzado el límite de cirugías
    IF NUM_CIRUGIAS_EMPLEADO >= MAX_CIRUGIAS_EMPLEADO THEN
        RAISE_APPLICATION_ERROR(-20013, 'El empleado ya tiene dos cirugías asignadas para este día');
    END IF;
    
    IF :NEW.FECHA < SYSTIMESTAMP OR :NEW.FECHA > SYSTIMESTAMP + INTERVAL '7' DAY THEN
        RAISE_APPLICATION_ERROR(-20005, 'La fecha del servicio está fuera del rango aceptado, que es máximo de 7 días a la fecha actual');
    END IF;
        
    SELECT COUNT(*) INTO EMPLEADOLIBRE
    FROM SERVICIOS
    WHERE :NEW.EMPLEADO = :NEW.EMPLEADO AND :NEW.FECHA >= FECHA AND :NEW.FECHA <= FECHAFIN;
    
    IF EMPLEADOLIBRE > 0 THEN
        RAISE_APPLICATION_ERROR(-20015, 'El empleado ya tiene un servicio agendado para esa fecha y hora');
    END IF;
    
    FECHAVALIDA := TO_DATE(:NEW.FECHA, 'YYYY-MM-DD');
    SELECT NVL(MAX(TO_NUMBER(REGEXP_SUBSTR(IDSERVICIO, '\d+'))), 0) + 1 INTO maximo 
    FROM SERVICIOS;
    :NEW.IDSERVICIO := 'S' || LPAD(maximo, 10, '0');  
    :NEW.nombre := 'desconocido';--

    IF :NEW.TIPO = 'C' THEN 
        :NEW.DURACIONESTIMADA := 0;
        :NEW.FECHAFIN := :NEW.FECHA + INTERVAL '4' HOUR;
    END IF;

    IF :NEW.TIPO = 'M' THEN 
        :NEW.DURACIONESTIMADA := 35;
        :NEW.FECHAFIN := :NEW.FECHA + INTERVAL '35' MINUTE;
    END IF;

    IF :NEW.TIPO = 'L' THEN 
        :NEW.DURACIONESTIMADA := 25;
        :NEW.FECHAFIN := :NEW.FECHA + INTERVAL '25' MINUTE;
    END IF;

    IF :NEW.TIPO = 'V' THEN 
        :NEW.DURACIONESTIMADA := 30;
        :NEW.FECHAFIN := :NEW.FECHA + INTERVAL '30' MINUTE;
    END IF;
END;
/

-- Ahora, hagamos un insert de prueba
CREATE OR REPLACE TRIGGER TR_INS_CITA
BEFORE INSERT ON CITAS
FOR EACH ROW
DECLARE
    maximo NUMBER(1);
    ASIGNADO NUMBER(1);
    DURACION NUMBER(7);
BEGIN
    SELECT DURACIONESTIMADA INTO DURACION
    FROM SERVICIOS
    WHERE IDSERVICIO = :NEW.idSERVICIO ;
    
    :NEW.DURACION := DURACION;
    :NEW.MOTIVO := 'DESCONOCIDO';
    :NEW.RECETAMEDICA := 'DESCONOCIDO';
    :NEW.FECHAPROXIMA := NULL;   
    SELECT COUNT(*) INTO MAXIMO 
    FROM SERVICIOS
    WHERE IDSERVICIO = :NEW.idSERVICIO AND TIPO = 'M';
    SELECT COUNT(*) INTO asignado 
    FROM SERVICIOS
    WHERE IDSERVICIO = :NEW.idSERVICIO AND TIPO IN ('C','L','V');
    IF (asignado > 0) THEN 
        RAISE_APPLICATION_ERROR(-20031, 'Este servicio no es una cita medica'); 
    END IF;
    IF (MAXIMO <1 ) THEN 
        RAISE_APPLICATION_ERROR(-20030, 'Este servicio ya fue asignada a otra cita'); 
    END IF;
    
END;
/

CREATE OR REPLACE TRIGGER TR_INS_LABORATORIOS
BEFORE INSERT ON LABORATORIOS
FOR EACH ROW
DECLARE
    maximo NUMBER(1);
    ASIGNADO NUMBER(1);
BEGIN
    :NEW.RESULTADOANALISIS := 'DESCONOCIDO';
    :NEW.LABREALIZADO := 'DESCONOCIDO';
    :NEW.MOTIVO := 'DESCONOCIDO';
    SELECT COUNT(*) INTO MAXIMO 
    FROM SERVICIOS
    WHERE IDSERVICIO = :NEW.idSERVICIO AND TIPO = 'L';
    SELECT COUNT(*) INTO asignado 
    FROM SERVICIOS
    WHERE IDSERVICIO = :NEW.idSERVICIO AND TIPO IN ('C','M','V');
    IF (asignado > 0) THEN 
        RAISE_APPLICATION_ERROR(-20030, 'Este servicio ya fue asignada a otro laboratorio'); 
    END IF;
    IF (MAXIMO < 1) THEN 
        RAISE_APPLICATION_ERROR(-20031, 'Este servicio no es un laboratorio'); 
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TR_INS_VACUNAS
BEFORE INSERT ON VACUNAS
FOR EACH ROW
DECLARE
    maximo NUMBER(1);
    ASIGNADO NUMBER(1);
BEGIN

    :NEW.LOTE := 'DESCONOCIDO';
    :NEW.DOSIS := 'NOmL';
    :NEW.FECHAPROXIMA := NULL;
    SELECT COUNT(*) INTO MAXIMO 
    FROM SERVICIOS
    WHERE IDSERVICIO = :NEW.idSERVICIO AND TIPO = 'V';
    SELECT COUNT(*) INTO asignado 
    FROM SERVICIOS
    WHERE IDSERVICIO = :NEW.idSERVICIO AND TIPO IN ('C','M','L');
    IF (asignado > 0) THEN 
        RAISE_APPLICATION_ERROR(-20030, 'Este servicio ya fue asignada a otro vacunacion'); 
    END IF;
    IF (MAXIMO <1 ) THEN 
        RAISE_APPLICATION_ERROR(-20031, 'Este servicio no es una vacunacion'); 
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TR_INS_CIRUGIAS
BEFORE INSERT ON CIRUGIAS
FOR EACH ROW
DECLARE
    maximo NUMBER(1);
    ASIGNADO NUMBER(1);
    FECHA DATE;
BEGIN
    SELECT FECHAFIN  INTO FECHA
    FROM SERVICIOS
    WHERE IDSERVICIO = :NEW.idSERVICIO ;
    :NEW.DURACION := 0;
    :NEW.EQUIPOQUIRURGICO := 'DESCONOCIDO';
    :NEW.COMPLICACIONES := 'DESCONOCIDO';
    :NEW.RECETAMEDICA := 'DESCONOCIDO';
    :NEW.ANESTESIA := 'DESCONOCIDO';
    :NEW.FECHAFIN := FECHA; 
    :NEW.ESTADOPOS := 'DESCONOCIDO';
    SELECT COUNT(*) INTO MAXIMO 
    FROM SERVICIOS
    WHERE IDSERVICIO = :NEW.idSERVICIO AND TIPO = 'C';
    SELECT COUNT(*) INTO asignado 
    FROM SERVICIOS
    WHERE IDSERVICIO = :NEW.idSERVICIO AND TIPO IN ('V','M','L');
    IF (asignado > 0) THEN 
        RAISE_APPLICATION_ERROR(-20030, 'Este servicio ya fue asignada a otra cirugia'); 
    END IF;
    IF (MAXIMO < 1) THEN 
        RAISE_APPLICATION_ERROR(-20031, 'Este servicio no es una cirugia'); 
    END IF;
END;
/


CREATE OR REPLACE TRIGGER TR_UP_SERVICIO
BEFORE UPDATE ON servicios
FOR EACH ROW
BEGIn
    IF :old.fecha < SYSTIMESTAMP THEN 
    RAISE_APPLICATION_ERROR(-20008, 'La fecha del servicio ya paso');    
    end if;
    
    IF (:old.estado != :new.estado OR :old.paciente != :new.paciente) = false  THEN
        RAISE_APPLICATION_ERROR(-20009, 'Solo se puede modificar el estado del servicio y el paciente');
    END IF;

    IF :old.ESTADO  = 'T' THEN 
        RAISE_APPLICATION_ERROR(-20037, 'El servicio ya fue asignado a otro paciente');    
    end if;
end;
/


CREATE OR REPLACE TRIGGER TR_UP_CITA
BEFORE UPDATE ON citas
FOR EACH ROW
declare
    duracion number(3);
    estadoS varchar(1);
BEGIN
    select duracionEstimada into duracion
    from servicios
    where idservicio = :old.idservicio;
    select estado into estadoS
    from servicios
    where idservicio = :old.idservicio;
    IF estadoS = 'F' THEN 
    RAISE_APPLICATION_ERROR(-20004, 'La cita nunca fue asignada a un paciente');    
    end if;
    IF :OLD.IDSERVICIO != :NEW.IDSERVICIO THEN 
    RAISE_APPLICATION_ERROR(-20005, 'El id de servicio no se puede modificar');    
    end if;
    IF :NEW.FECHAPROXIMA < SYSTIMESTAMP THEN 
    RAISE_APPLICATION_ERROR(-20006, 'La fecha de la proxima cita no es correcta');    
    end if;

    IF duracion > :new.duracion THEN 
    DBMS_OUTPUT.PUT_LINE('La cita duro mas de lo esperado'); 
    END IF;
    
END;
/

CREATE OR REPLACE TRIGGER TR_UP_VACUNAS
BEFORE UPDATE ON vacunas
FOR EACH ROW
BEGIN
    IF :OLD.IDSERVICIO != :NEW.IDSERVICIO THEN 
    RAISE_APPLICATION_ERROR(-20007, 'El id de servicio no se puede modificar');    
    end if;
    IF :NEW.FECHAPROXIMA < SYSTIMESTAMP THEN 
    RAISE_APPLICATION_ERROR(-20009, 'La fecha de la proxima cita no es correcta');    
    END IF;
END;
/

CREATE OR REPLACE TRIGGER TR_UP_LABORATORIO
BEFORE UPDATE ON vacunas
FOR EACH ROW
DECLARE 
    fecha2 date;
BEGIN
    SELECT FECHA INTO FECHA2 FROM SERVICIOS
    WHERE IDSERVICIO = :OLD.IDSERVICIO;
    
    IF :OLD.IDSERVICIO != :NEW.IDSERVICIO THEN 
    RAISE_APPLICATION_ERROR(-20007, 'El id de servicio no se puede modificar');    
    end if;
    
    IF (FECHA2 + 4) < SYSTIMESTAMP THEN
    RAISE_APPLICATION_ERROR(-20016, 'Todavia no se puede modificar los resultados del laboratorio');  
    end if;
END;
/

CREATE OR REPLACE TRIGGER TR_DE_SERVICIOS
BEFORE DELETE ON SERVICIOS
FOR EACH ROW
BEGIN 
     IF :OLD.TIPO = 'C' AND :OLD.ESTADO = 'F' THEN 
        DELETE FROM SERVICIOS
        WHERE IDSERVICIO = :OLD.IDSERVICIO;
        DELETE FROM CIRUGIAS
        WHERE IDSERVICIO = :OLD.IDSERVICIO;
    END IF;

    IF :NEW.TIPO = 'M' AND :OLD.ESTADO  = 'F'THEN 
        DELETE FROM SERVICIOS
        WHERE IDSERVICIO = :OLD.IDSERVICIO;
        DELETE FROM CITAS
        WHERE IDSERVICIO = :OLD.IDSERVICIO;
    END IF;

    IF :NEW.TIPO = 'L' AND :OLD.ESTADO = 'F' THEN 
        DELETE FROM SERVICIOS
        WHERE IDSERVICIO = :OLD.IDSERVICIO;
        DELETE FROM LABORATORIOS
        WHERE IDSERVICIO = :OLD.IDSERVICIO;
    END IF;

    IF :NEW.TIPO = 'V' AND :OLD.ESTADO = 'F' THEN 
        DELETE FROM VACUNAS
        WHERE IDSERVICIO = :OLD.IDSERVICIO;
    END IF;
    IF :OLD.estado = 'T' then
        RAISE_APPLICATION_ERROR(-20037, 'El servicio fue asignado, no se puede eliminar');  

    END IF;
END;
/

----------------HISTORIAL
CREATE OR REPLACE TRIGGER TR_INS_Historial
BEFORE INSERT ON historiales
FOR EACH ROW
DECLARE
    maximo NUMBER(10);
BEGIN
 SELECT NVL(MAX(TO_NUMBER(REGEXP_SUBSTR(idRegistro, '\d+'))), 0) + 1 
  INTO maximo 
 FROM HISTORIALES;
 :NEW.idRegistro := 'R'||LPAD(maximo, 10, '0');
 :NEW.fechaRegistro := SYSTIMESTAMP;
END;
/ 
CREATE OR REPLACE TRIGGER TR_UPD_Historial
BEFORE UPDATE ON historiales
FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20028, 'No está permitido actualizar registros en la tabla "historiales".');
END;
/

CREATE OR REPLACE TRIGGER TR_DEL_Historial
BEFORE DELETE ON historiales
FOR EACH ROW
BEGIN
    RAISE_APPLICATION_ERROR(-20029, 'No estÃ¡ permitido eliminar registros de la tabla "historiales".');
END;
/

------------------guarderia
CREATE OR REPLACE TRIGGER TR_INS_GUARDERIA
BEFORE INSERT ON guarderias
FOR EACH ROW
DECLARE
    maximo NUMBER(10);
BEGIN
 SELECT NVL(MAX(TO_NUMBER(REGEXP_SUBSTR(idGuarderia, '\d+'))), 0) + 1 
  INTO maximo 
 FROM guarderias;
 if (:NEW.fechaInicio >  SYSTIMESTAMP AND :NEW.fechafin > SYSTIMESTAMP) then
     RAISE_APPLICATION_ERROR(-20039, 'Fecha incorrecta');
 end if;
END;
/ 

-- Cliente
DROP TRIGGER TR_INS_CLIENTES;
DROP TRIGGER TR_UP_CLIENTES;
DROP TRIGGER TR_DE_CLIENTES;

-- Pacientes
DROP TRIGGER TR_INS_Directorio;
DROP TRIGGER TR_UP_DIRECTORIOS;
DROP TRIGGER TR_DE_DIRECTORIOS;
DROP TRIGGER TR_INS_Pacientes;
DROP TRIGGER TR_UP_Pacientes;
DROP TRIGGER TR_DE_PACIENTES;

-- Empleados
DROP TRIGGER TR_INS_EMPLEADOS;
DROP TRIGGER TR_UP_EMPLEADOS;
DROP TRIGGER TR_DE_EMPLEADOS;

-- Horarios Empleados
DROP TRIGGER TR_INS_HORARIOSEMPLEADOS;
DROP TRIGGER TR_UP_HORARIO_EMPLEADO;
DROP TRIGGER TR_DE_HORARIO_EMPLEADO;

-- Certificaciones
DROP TRIGGER TR_INS_CERTIFICACIONES;
DROP TRIGGER TR_UP_CERTIFICACIONES;
DROP TRIGGER TR_DE_CERTIFICACIONES;

-- Servicios
DROP TRIGGER TR_INS_SERVICIOS;
DROP TRIGGER TR_INS_CITA;
DROP TRIGGER TR_INS_LABORATORIOS;
DROP TRIGGER TR_INS_VACUNAS;
DROP TRIGGER TR_INS_CIRUGIAS;
DROP TRIGGER TR_UP_SERVICIO;
DROP TRIGGER TR_UP_CITA;
DROP TRIGGER TR_UP_VACUNAS;
DROP TRIGGER TR_UP_LABORATORIO;
DROP TRIGGER TR_DE_SERVICIOS;

-- Historiales
DROP TRIGGER TR_INS_Historial;
DROP TRIGGER TR_UPD_Historial;
DROP TRIGGER TR_DEL_Historial;
