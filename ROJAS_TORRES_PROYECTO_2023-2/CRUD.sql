-- CRUDE_Paciente
-- PC_Paciente (Package)
CREATE OR REPLACE PACKAGE PC_Paciente IS
    PROCEDURE adicionarPaciente (
        xcliente IN VARCHAR,
        xnombre IN VARCHAR,
        xespecie IN VARCHAR,
        xraza IN VARCHAR,
        xpeso IN NUMBER,
        xsexo IN CHAR,
        xfechaNacimiento IN DATE,
        xedad IN NUMBER,
        xcomportamiento IN VARCHAR,
        xnumeroChip IN VARCHAR,
        xesterilizado IN CHAR
    );
    
    PROCEDURE modificarPaciente (
        xidPaciente IN VARCHAR,
        xpeso IN NUMBER,
        xcomportamiento IN VARCHAR,
        xnumeroChip IN VARCHAR,
        xesterilizado IN CHAR
    );
    
    FUNCTION consultarPaciente (xidPaciente IN VARCHAR) RETURN SYS_REFCURSOR;
    
    PROCEDURE eliminarPaciente(xidPaciente IN VARCHAR);
END PC_Paciente;
/

-- PC_Paciente (Package Body)
CREATE OR REPLACE PACKAGE BODY PC_Paciente IS
    PROCEDURE adicionarPaciente (
        xcliente IN VARCHAR,
        xnombre IN VARCHAR,
        xespecie IN VARCHAR,
        xraza IN VARCHAR,
        xpeso IN NUMBER,
        xsexo IN CHAR,
        xfechaNacimiento IN DATE,
        xedad IN NUMBER,
        xcomportamiento IN VARCHAR,
        xnumeroChip IN VARCHAR,
        xesterilizado IN CHAR
    ) IS
    BEGIN
        INSERT INTO pacientes (
            cliente,
            nombrePac,
            especie,
            raza,
            peso,
            sexo,
            fechaNacimiento,
            edad,
            comportamiento,
            numeroChip,
            esterilizado
        )
        VALUES (
            xcliente,
            xnombre,
            xespecie,
            xraza,
            xpeso,
            xsexo,
            xfechaNacimiento,
            xedad,
            xcomportamiento,
            xnumeroChip,
            xesterilizado
        );
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
           ROLLBACK;
            RAISE_APPLICATION_ERROR(-20001, 'Error al insertar el paciente');
    END adicionarPaciente;

    PROCEDURE modificarPaciente (
        xidPaciente IN VARCHAR,
        xpeso IN NUMBER,
        xcomportamiento IN VARCHAR,
        xnumeroChip IN VARCHAR,
        xesterilizado IN CHAR
    ) IS
    BEGIN
        UPDATE pacientes SET
            peso = xpeso,
            comportamiento = xcomportamiento,
            numeroChip = xnumeroChip, -- Corregido aquÌ
            esterilizado = xesterilizado
        WHERE idPaciente = xidPaciente;

        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20002, 'Error al actualizar los datos en pacientes');
    END modificarPaciente;

    FUNCTION consultarPaciente (xidPaciente IN VARCHAR) RETURN SYS_REFCURSOR IS
        s_cursor SYS_REFCURSOR;
    BEGIN
        OPEN s_cursor FOR
            SELECT * FROM pacientes
            WHERE idPaciente = xidPaciente;

        RETURN s_cursor;
    END consultarPaciente;

    PROCEDURE eliminarPaciente (xidPaciente IN VARCHAR) IS
    BEGIN
        DELETE FROM pacientes WHERE idPaciente = xidPaciente;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20004, 'Error al eliminar un registro de la tabla de pacientes');
    END eliminarPaciente;
END PC_Paciente;
/

-- CRUDE_Historial
CREATE OR REPLACE PACKAGE PC_Historial IS
    PROCEDURE adicionarHistorial(xservicio IN VARCHAR);
    PROCEDURE modificarHistorial(xidRegistro IN VARCHAR);
    PROCEDURE eliminarHistorial(xidRegistro IN VARCHAR);
    FUNCTION consultarHistorial (xidRegistro IN VARCHAR) RETURN SYS_REFCURSOR;
END PC_Historial;
/
-- CRUDI_Historial
CREATE OR REPLACE PACKAGE BODY PC_Historial IS
    -- adicionarHistorial
    PROCEDURE adicionarHistorial (xservicio IN VARCHAR) IS
    BEGIN
        INSERT INTO historial (servicio)
        VALUES (xservicio);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20001, 'Error al insertar el registro en el historial');
    END adicionarHistorial;

    -- modificarHistorial
    PROCEDURE modificarHistorial (xidRegistro IN VARCHAR) IS
    BEGIN
        UPDATE historial SET idRegistro = xidRegistro WHERE idRegistro = xidRegistro;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20002, 'Error al actualizar en el historial');
    END modificarHistorial;

    -- eliminarHistorial
    PROCEDURE eliminarHistorial (xidRegistro IN VARCHAR) IS
    BEGIN
        DELETE FROM historial WHERE idRegistro = xidRegistro;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20003, 'Error al eliminar en el historial');
    END eliminarHistorial;

    -- consultarHistorial
    FUNCTION consultarHistorial (xidRegistro IN VARCHAR) RETURN SYS_REFCURSOR IS
        s_cursor SYS_REFCURSOR;
    BEGIN
        OPEN s_cursor FOR
            SELECT * FROM historial h
            WHERE h.idRegistro = xidRegistro;
        RETURN s_cursor;
    END consultarHistorial;

END PC_Historial;
/

-- CRUDE_Cliente
CREATE OR REPLACE PACKAGE PC_Cliente IS
    PROCEDURE adicionarCliente(xdocumentoId IN VARCHAR, xnombre IN DATE, xapellido IN VARCHAR, xcorreoElectronico IN VARCHAR, direccion IN VARCHAR, numTelefono IN VARCHAR);
    PROCEDURE modificarCliente(xdocumentoId IN VARCHAR, xnombre IN DATE, xapellido IN VARCHAR, xcorreoElectronico IN VARCHAR, direccion IN VARCHAR, numTelefono IN VARCHAR);
    PROCEDURE eliminarCliente(xdocumentoId IN VARCHAR);
    FUNCTION consultarCliente(xdocumentoId IN VARCHAR) RETURN SYS_REFCURSOR;
END PC_Cliente;
/
--CRUDI_Cliente
-- PC_Cliente (Package Body)
CREATE OR REPLACE PACKAGE BODY PC_Cliente IS
    -- adicionarCliente
    PROCEDURE adicionarCliente(xdocumentoId IN VARCHAR, xnombre IN DATE, xapellido IN VARCHAR, xcorreoElectronico IN VARCHAR, direccion IN VARCHAR, numTelefono IN VARCHAR) IS
    BEGIN
        INSERT INTO clientes (documentoId, nombre, apellido, correoElectronico, direccion, numTelefono)
        VALUES (xdocumentoId, xnombre, xapellido, xcorreoElectronico, direccion, numTelefono);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20001, 'Error al insertar el registro en la tabla de clientes');
    END adicionarCliente;

    -- modificarCliente
    PROCEDURE modificarCliente(xdocumentoId IN VARCHAR, xnombre IN DATE, xapellido IN VARCHAR, xcorreoElectronico IN VARCHAR, direccion IN VARCHAR, numTelefono IN VARCHAR) IS
        v_count NUMBER;
    BEGIN
        SELECT COUNT(*) INTO v_count FROM clientes WHERE nombre = xnombre AND apellido = xapellido;

        IF v_count > 0 THEN
            UPDATE clientes SET
                correoElectronico = xcorreoElectronico,
                direccion = direccion,
                numTelefono = numTelefono
            WHERE documentoId = xdocumentoId;
            COMMIT;
        ELSE
            RAISE_APPLICATION_ERROR(-20002, 'No se encontrÛ el cliente con el nombre y apellido dados');
        END IF;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20003, 'Error al modificar el registro en la tabla de clientes');
    END modificarCliente;

    -- eliminarCliente
    PROCEDURE eliminarCliente(xdocumentoId IN VARCHAR) IS
    BEGIN
        DELETE FROM clientes WHERE documentoId = xdocumentoId;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20004, 'Error al eliminar el registro en la tabla de clientes');
    END eliminarCliente;

    -- consultarCliente
    FUNCTION consultarCliente(xdocumentoId IN VARCHAR) RETURN SYS_REFCURSOR IS
        s_cursor SYS_REFCURSOR;
    BEGIN
        OPEN s_cursor FOR
            SELECT * FROM clientes c
            WHERE c.documentoId = xdocumentoId;
        RETURN s_cursor;
    END consultarCliente;

END PC_Cliente;
/


-- CRUDE_Servicio
CREATE OR REPLACE PACKAGE PC_Servicio IS
    PROCEDURE adicionarServicio(xfecha IN DATE, xcosto IN NUMBER, xtipo IN CHAR, xpersonal IN VARCHAR);
    PROCEDURE modificarServicio(xnombre IN VARCHAR, xidServicio IN VARCHAR);
    PROCEDURE eliminarServicio(xidServicio IN VARCHAR);
    FUNCTION consultarServicio(xidServicio IN VARCHAR) RETURN SYS_REFCURSOR;
END PC_Servicio;
/
-- CRUDI_Servicio
-- PC_Servicio (Package Body)
CREATE OR REPLACE PACKAGE BODY PC_Servicio IS
    -- adicionarServicio
    PROCEDURE adicionarServicio(xfecha IN DATE, xcosto IN NUMBER, xtipo IN CHAR, xpersonal IN VARCHAR) IS
    BEGIN
        INSERT INTO Servicios (fecha, costo, tipo, empleado)
        VALUES (xfecha, xcosto, xtipo, xpersonal);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20001, 'Error al insertar el registro en servicios');
    END adicionarServicio;

    -- modificarServicio
    PROCEDURE modificarServicio(xnombre IN VARCHAR, xidServicio IN VARCHAR) IS
    BEGIN
        UPDATE Servicios SET nombre = xnombre WHERE idServicio = xidServicio;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20002, 'Error al modificar el registro en servicios');
    END modificarServicio;

    -- eliminarServicio
    PROCEDURE eliminarServicio(xidServicio IN VARCHAR) IS
    BEGIN
        DELETE FROM Servicios WHERE idServicio = xidServicio;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20003, 'Error al eliminar el registro en servicios');
    END eliminarServicio;

    -- consultarServicio
    FUNCTION consultarServicio(xidServicio IN VARCHAR) RETURN SYS_REFCURSOR IS
        s_cursor SYS_REFCURSOR;
    BEGIN
        OPEN s_cursor FOR
            SELECT * FROM Servicios s
            WHERE s.idServicio = xidServicio;
        RETURN s_cursor;
    END consultarServicio;

END PC_Servicio;
/


-- CRUDE_Guarderia
CREATE OR REPLACE PACKAGE PC_Guarderia IS
    PROCEDURE adicionarGuarderia(xfechaInicio IN DATE, xfechaFin IN DATE, xpaciente IN VARCHAR);
    PROCEDURE modificarGuarderia(xestado IN CHAR, xidGuarderia IN VARCHAR);
    PROCEDURE eliminarGuarderia(xidGuarderia IN VARCHAR);
END PC_Guarderia;
/
-- CRUDI_Guarderia
-- PC_Guarderia (Package Body)
CREATE OR REPLACE PACKAGE BODY PC_Guarderia IS
    -- adicionarGuarderia
    PROCEDURE adicionarGuarderia(xfechaInicio IN DATE, xfechaFin IN DATE, xpaciente IN VARCHAR) IS
    BEGIN
        INSERT INTO guarderias (fechaInicio, fechaFin, paciente)
        VALUES (xfechaInicio, xfechaFin, xpaciente);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20001, 'Error al insertar el registro en guarderias');
    END adicionarGuarderia;

    -- modificarGuarderia
    PROCEDURE modificarGuarderia(xestado IN CHAR, xidGuarderia IN VARCHAR) IS
    BEGIN
        UPDATE guarderias SET estado = xestado WHERE idGuarderia = xidGuarderia;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20002, 'Error al modificar el registro en guarderias');
    END modificarGuarderia;

    -- eliminarGuarderia
    PROCEDURE eliminarGuarderia(xidGuarderia IN VARCHAR) IS
    BEGIN
        DELETE FROM guarderias WHERE idGuarderia = xidGuarderia;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20003, 'Error al eliminar el registro en guarderias');
    END eliminarGuarderia;

END PC_Guarderia;
/


-- CRUDE_Personal
-- PC_Personal (Package Specification)
CREATE OR REPLACE PACKAGE PC_Personal IS
    PROCEDURE adicionarPersonal(xnombre IN VARCHAR, xapellido IN VARCHAR, xfechaNacimiento IN DATE, xnumeroTelefono IN VARCHAR,
                                xcorreoElectronico IN VARCHAR, xempleado IN VARCHAR);
    PROCEDURE modificarPersonal(xidEmpleado IN VARCHAR, xcorreoElectronico IN VARCHAR, xnumeroTelefono IN VARCHAR, xestadoEmpleo IN CHAR);
    PROCEDURE eliminarPersonal(xidEmpleado IN VARCHAR);
    FUNCTION consultarPersonal(xidEmpleado IN VARCHAR) RETURN SYS_REFCURSOR;
END PC_Personal;
/

--CRUDI_Personal
-- PC_Personal (Package Body)
CREATE OR REPLACE PACKAGE BODY PC_Personal IS
    -- adicionarPersonal
    PROCEDURE adicionarPersonal(xnombre IN VARCHAR, xapellido IN VARCHAR, xfechaNacimiento IN DATE, xnumeroTelefono IN VARCHAR,
                                xcorreoElectronico IN VARCHAR, xempleado IN VARCHAR) IS
    BEGIN
        INSERT INTO empleados (nombre, apellido, fechaNacimiento, numeroTelefono, correoElectronico, estadoEmpleado)
        VALUES (xnombre, xapellido, xfechaNacimiento, xnumeroTelefono, xcorreoElectronico, xempleado);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20001, 'Error al insertar el registro en empleados');
    END adicionarPersonal;

    -- modificarPersonal
    PROCEDURE modificarPersonal(xidEmpleado IN VARCHAR, xcorreoElectronico IN VARCHAR, xnumeroTelefono IN VARCHAR, xestadoEmpleo IN CHAR) IS
    BEGIN
        UPDATE empleados SET correoElectronico = xcorreoElectronico, numeroTelefono = xnumeroTelefono, estadoEmpleo = xestadoEmpleo
        WHERE idEmpleado = xidEmpleado;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20002, 'Error al modificar el registro en empleados');
    END modificarPersonal;

    -- eliminarPersonal
    PROCEDURE eliminarPersonal(xidEmpleado IN VARCHAR) IS
    BEGIN
        DELETE FROM empleados WHERE idEmpleado = xidEmpleado;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20003, 'Error al eliminar el registro en empleados');
    END eliminarPersonal;

    -- consultarPersonal
    FUNCTION consultarPersonal(xidEmpleado IN VARCHAR) RETURN SYS_REFCURSOR IS
        s_cursor SYS_REFCURSOR;
    BEGIN
        OPEN s_cursor FOR
            SELECT * FROM empleados e
            WHERE e.idEmpleado = xidEmpleado;
        RETURN s_cursor;
    END consultarPersonal;

END PC_Personal;
/


-- CRUDOK_Paciente

INSERT INTO pacientes (idPaciente, cliente, nombrePac, especie, raza, fechaRegistro, peso, sexo, fechaNacimiento, edad, comportamiento, numeroChip, esterilizado, fechaActualizacion)
VALUES ('P1234567890', 'C1234567890', 'Buddy', 'Perro', '2', TO_DATE('2023-01-01', 'YYYY-MM-DD'), 15.0, 'M', TO_DATE('2022-01-01', 'YYYY-MM-DD'), 1, 'Juguet√≥n', null, 'F', TO_DATE('2023-01-01', 'YYYY-MM-DD'));




select * from pacientes;

    

EXECUTE PC_Paciente.adicionarPaciente ( 'C1234567890','Buddy', 'Perro','P0000000000000001' , 15.0, 'M', TO_DATE('2022-01-01', 'YYYY-MM-DD'), 1, 'Juguet√≥n', null, 'F');

EXECUTE PC_Paciente.modificarPaciente (xidPaciente, xpeso, xcomportamiento, xnumChip, xesterilizado);

VARIABLE consulta_uno REFCURSOR;
EXECUTE :consulta_uno:=PC_Paciente.consultarPaciente('P0000000007'); 
PRINT consulta_uno;

VARIABLE consulta_uno REFCURSOR;
EXECUTE :consulta_uno:=PC_Paciente.consultarPaciente(xidPaciente); 
PRINT consulta_uno;

EXECUTE PC_Paciente.eliminarPaciente('P0000000007');

VARIABLE consulta_uno REFCURSOR;
EXECUTE :consulta_uno:=PC_Paciente.consultarPaciente(xidPaciente); 
PRINT consulta_uno;

VARIABLE consulta_uno REFCURSOR;
EXECUTE :consulta_uno:=PC_Paciente.consultarPaciente(xidPaciente); 
PRINT consulta_uno;

-- CRUDNoOk

EXECUTE PC_bands.ad ('', 7, 'metal', 2);
EXECUTE PC_bands.ad ('The Beatles', 7, 'rock', 5);
EXECUTE PC_bands.ad ('Queen', 15, 'metal', 9);

EXECUTE PC_bands.up_type (7, 'Heavy Metal');
EXECUTE PC_bands.up_type (4, 'RockandRoll');
EXECUTE PC_bands.up_type (15, 'Heavy Metal');

EXECUTE PC_bands.up_ad_player (1, 1);
EXECUTE PC_bands.up_ad_player (40, 1);
EXECUTE PC_bands.up_ad_player (2, 13);

-- CRUDOK_Historial

EXECUTE PC_bands.ad ('Iron Maiden', 7, 'metal', 2);

EXECUTE PC_bands.up_type (10, 'rock');

EXECUTE PC_bands.up_ad_player (10, 2);

VARIABLE consulta_uno REFCURSOR;
EXECUTE :consulta_uno:=PC_bands.co_band(1); 
PRINT consulta_uno;

VARIABLE consulta_dos REFCURSOR;
EXECUTE :consulta_dos:=PC_bands.co_players(1); 
PRINT consulta_dos;

EXECUTE PC_bands.de (10);

VARIABLE consulta_tres REFCURSOR;
EXECUTE :consulta_tres:=PC_bands.co_byComposer(4); 
PRINT consulta_tres;

VARIABLE consulta_cuatro REFCURSOR;
EXECUTE :consulta_cuatro:=PC_bands.co_theBigOnes; 
PRINT consulta_cuatro;

-- CRUDNoOk

EXECUTE PC_bands.ad ('', 7, 'metal', 2);
EXECUTE PC_bands.ad ('The Beatles', 7, 'rock', 5);
EXECUTE PC_bands.ad ('Queen', 15, 'metal', 9);

EXECUTE PC_bands.up_type (7, 'Heavy Metal');
EXECUTE PC_bands.up_type (4, 'RockandRoll');
EXECUTE PC_bands.up_type (15, 'Heavy Metal');

EXECUTE PC_bands.up_ad_player (1, 1);
EXECUTE PC_bands.up_ad_player (40, 1);
EXECUTE PC_bands.up_ad_player (2, 13);
-- CRUDOK_Historial

EXECUTE PC_bands.ad ('Iron Maiden', 7, 'metal', 2);

EXECUTE PC_bands.up_type (10, 'rock');

EXECUTE PC_bands.up_ad_player (10, 2);

VARIABLE consulta_uno REFCURSOR;
EXECUTE :consulta_uno:=PC_bands.co_band(1); 
PRINT consulta_uno;

VARIABLE consulta_dos REFCURSOR;
EXECUTE :consulta_dos:=PC_bands.co_players(1); 
PRINT consulta_dos;

EXECUTE PC_bands.de (10);

VARIABLE consulta_tres REFCURSOR;
EXECUTE :consulta_tres:=PC_bands.co_byComposer(4); 
PRINT consulta_tres;

VARIABLE consulta_cuatro REFCURSOR;
EXECUTE :consulta_cuatro:=PC_bands.co_theBigOnes; 
PRINT consulta_cuatro;

-- CRUDNoOk

EXECUTE PC_bands.ad ('', 7, 'metal', 2);
EXECUTE PC_bands.ad ('The Beatles', 7, 'rock', 5);
EXECUTE PC_bands.ad ('Queen', 15, 'metal', 9);

EXECUTE PC_bands.up_type (7, 'Heavy Metal');
EXECUTE PC_bands.up_type (4, 'RockandRoll');
EXECUTE PC_bands.up_type (15, 'Heavy Metal');

EXECUTE PC_bands.up_ad_player (1, 1);
EXECUTE PC_bands.up_ad_player (40, 1);
EXECUTE PC_bands.up_ad_player (2, 13);


-- CRUDX

DROP PACKAGE PC_PACIENTE;
DROP PACKAGE PC_HISTORIAL;
DROP PACKAGE PC_CLIENTE;
DROP PACKAGE PC_SERVICIO;
DROP PACKAGE PC_GUARDERIA;
DROP PACKAGE PC_PERSONAL;