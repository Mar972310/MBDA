CREATE OR REPLACE PACKAGE PK_CLIENTE AS
  PROCEDURE ADClientes(p_documentoId IN VARCHAR, p_nombre IN VARCHAR, p_apellido IN VARCHAR, p_numTelefono IN NUMBER, P_DIRECCION IN VARCHAR, p_correo IN VARCHAR);
  PROCEDURE ADMascota(p_cliente IN VARCHAR, p_nombrePac IN VARCHAR, p_especie IN VARCHAR, p_raza IN VARCHAR, p_peso IN NUMBER, p_sexo IN CHAR, p_fechaNacimiento IN DATE, p_edad IN NUMBER, p_comportamiento IN VARCHAR, p_numeroChip IN VARCHAR, p_esterilizado IN CHAR);
  PROCEDURE UPCliente(p_documentoId IN VARCHAR, p_nuevoNombre IN VARCHAR DEFAULT NULL, p_nuevoApellido IN VARCHAR DEFAULT NULL, p_nuevoTelefono IN NUMBER DEFAULT NULL, p_nuevoActivo IN CHAR DEFAULT NULL, p_nuevoCorreo IN VARCHAR DEFAULT NULL);
  FUNCTION consultarDatosPersonales(p_documentoid IN VARCHAR) RETURN SYS_REFCURSOR;
  FUNCTION consultarDatosMascota(p_idPaciente IN VARCHAR) RETURN SYS_REFCURSOR;
  FUNCTION citasProximasMascota(p_idPaciente IN VARCHAR) RETURN SYS_REFCURSOR;
  FUNCTION vacunasAplicadasMascota(p_idPaciente IN VARCHAR) RETURN SYS_REFCURSOR;
END PK_CLIENTE;
/
CREATE OR REPLACE PACKAGE PK_GERENTE AS
  FUNCTION SERVICIOSMASUSADOS RETURN SYS_REFCURSOR;
  FUNCTION PACIENTESLAB RETURN SYS_REFCURSOR;
END PK_GERENTE;
/
CREATE OR REPLACE PACKAGE PK_PASEADORMASCOTAS IS
    PROCEDURE adicionarGuarderia(xfechaInicio IN DATE, xfechaFin IN DATE, xpaciente IN VARCHAR);
    PROCEDURE modificarGuarderia(xestado IN CHAR, xidGuarderia IN VARCHAR);
    PROCEDURE eliminarGuarderia(xidGuarderia IN VARCHAR);
END PK_PASEADORMASCOTAS;
/
CREATE OR REPLACE PACKAGE PK_RECEPCIONISTA AS 
  PROCEDURE ADPaciente(p_cliente IN VARCHAR, p_nombrePac IN VARCHAR, p_especie IN VARCHAR, p_raza IN VARCHAR, p_peso IN NUMBER, p_sexo IN CHAR, p_fechaNacimiento IN DATE, p_edad IN NUMBER , p_comportamiento IN VARCHAR, p_numeroChip IN VARCHAR, p_esterilizado IN CHAR);
  --PROCEDURE ADDirectorios(p_tipoAnimal IN VARCHAR, p_nombreRaza IN VARCHAR, p_origen IN VARCHAR, p_tamanoPromedio IN VARCHAR, p_esperanzaVida IN NUMBER, p_caracteristicasFisicas IN VARCHAR, p_comportamientoCaracteristico IN VARCHAR, p_alimentacionRecomendada IN VARCHAR, p_enfermedadesComunes IN VARCHAR, p_regulacionLegal IN CHAR, p_habitad IN VARCHAR);
  PROCEDURE UPPaciente(p_idPaciente IN VARCHAR, activo IN CHAR);
  PROCEDURE ADServicio(p_costo IN VARCHAR, p_empleado IN VARCHAR, p_tipo IN CHAR, p_fecha IN DATE, p_duracionEstimada IN NUMBER);
  PROCEDURE UPServicio(p_servicio IN VARCHAR, p_estado IN CHAR, p_paciente IN VARCHAR);
  PROCEDURE DEServicio(p_idServicio IN VARCHAR);
  PROCEDURE ADEmpleado(pNombre IN VARCHAR, pApellido IN VARCHAR, pFechaNacimiento IN DATE, pNumeroTelefono IN NUMBER, pCorreoElectronico IN VARCHAR, pSalario IN NUMBER, pEmpleado IN CHAR);
  FUNCTION  consultarHistorial(p_idPaciente IN VARCHAR) RETURN SYS_REFCURSOR;
  FUNCTION  consultarPaciente(p_idPaciente IN VARCHAR) RETURN SYS_REFCURSOR;
  FUNCTION  ConsultarServicio(p_idServicio IN VARCHAR) RETURN SYS_REFCURSOR;
END PK_RECEPCIONISTA;
/


CREATE OR REPLACE PACKAGE PK_VETERINARIO AS 
  PROCEDURE UPservicio(p_idServicio IN VARCHAR, p_nombre IN VARCHAR );
  PROCEDURE UPpersonal(p_idEmpleado IN VARCHAR, p_numeroTelefono IN VARCHAR DEFAULT NULL, p_correoElectronico IN VARCHAR DEFAULT NULL);
  PROCEDURE UPcitas(p_idServicio IN VARCHAR, p_duracion IN NUMBER DEFAULT NULL, p_motivo IN VARCHAR DEFAULT NULL, p_recetaMedica IN VARCHAR DEFAULT NULL, fechaProxima IN DATE DEFAULT NULL);
  PROCEDURE UPcirugia(p_idServicio IN VARCHAR, p_duracion IN VARCHAR DEFAULT NULL, p_equipoQuirurgico IN VARCHAR DEFAULT NULL, p_complicaciones IN VARCHAR DEFAULT NULL, p_recetamedica IN VARCHAR DEFAULT NULL, p_anestesia IN VARCHAR DEFAULT NULL, p_fechaFin IN DATE DEFAULT NULL, p_estadopos IN VARCHAR DEFAULT NULL);
  PROCEDURE UPlaboratorios(p_idServicio IN VARCHAR, p_resultadoAnalisis IN VARCHAR DEFAULT NULL, p_labrealizado IN VARCHAR DEFAULT NULL, p_motivo IN VARCHAR DEFAULT NULL);
  PROCEDURE UPvacunas(p_idServicio IN VARCHAR, p_fechaProxima IN DATE DEFAULT NULL, p_dosis IN VARCHAR DEFAULT NULL, p_lote IN VARCHAR DEFAULT NULL);
  PROCEDURE UPpaciente(p_idpaciente IN VARCHAR, p_peso IN NUMBER DEFAULT NULL, p_esterilizado IN CHAR DEFAULT NULL);
END PK_VETERINARIO;
/
CREATE OR REPLACE PACKAGE PK_ASISTENTEVETERINARIO AS
  PROCEDURE UPservicio(p_idServicio IN VARCHAR, p_nombre IN VARCHAR );
  PROCEDURE UPpersonal(p_idEmpleado IN VARCHAR, p_numeroTelefono IN VARCHAR DEFAULT NULL, p_correoElectronico IN VARCHAR DEFAULT NULL);
  PROCEDURE UPcitas(p_idServicio IN VARCHAR, p_duracion IN NUMBER DEFAULT NULL, p_motivo IN VARCHAR DEFAULT NULL, p_recetaMedica IN VARCHAR DEFAULT NULL, fechaProxima IN DATE DEFAULT NULL);
  PROCEDURE UPcirugia(p_idServicio IN VARCHAR, p_duracion IN VARCHAR DEFAULT NULL, p_equipoQuirurgico IN VARCHAR DEFAULT NULL, p_complicaciones IN VARCHAR DEFAULT NULL, p_recetamedica IN VARCHAR DEFAULT NULL, p_anestesia IN VARCHAR DEFAULT NULL, p_fechaFin IN DATE DEFAULT NULL, p_estadopos IN VARCHAR DEFAULT NULL);
  PROCEDURE UPlaboratorios(p_idServicio IN VARCHAR, p_resultadoAnalisis IN VARCHAR DEFAULT NULL, p_labrealizado IN VARCHAR DEFAULT NULL, p_motivo IN VARCHAR DEFAULT NULL);
  PROCEDURE UPvacunas(p_idServicio IN VARCHAR, p_fechaProxima IN DATE DEFAULT NULL, p_dosis IN VARCHAR DEFAULT NULL, p_lote IN VARCHAR DEFAULT NULL);
  PROCEDURE UPpaciente(p_idpaciente IN VARCHAR, p_peso IN NUMBER DEFAULT NULL, p_esterilizado IN CHAR DEFAULT NULL);
END PK_ASISTENTEVETERINARIO;
/

CREATE OR REPLACE PACKAGE BODY PK_CLIENTE AS
  PROCEDURE ADClientes(p_documentoId IN VARCHAR, p_nombre IN VARCHAR, p_apellido IN VARCHAR, p_numTelefono IN NUMBER, P_DIRECCION IN VARCHAR, p_correo IN VARCHAR) IS
  BEGIN
    INSERT INTO clientes (documentoId, nombre, apellido, numTelefono, direccion, correoElectronico)
    VALUES (p_documentoId, p_nombre, p_apellido, p_numTelefono, P_DIRECCION, p_correo);
    COMMIT;
        
    EXCEPTION
      WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20033, 'Error al INSERTAR LOS CLIENTES');
  END ADClientes;

  PROCEDURE ADMascota(p_cliente IN VARCHAR, p_nombrePac IN VARCHAR, p_especie IN VARCHAR, p_raza IN VARCHAR, p_peso IN NUMBER, p_sexo IN CHAR, p_fechaNacimiento IN DATE, p_edad IN NUMBER, p_comportamiento IN VARCHAR, p_numeroChip IN VARCHAR, p_esterilizado IN CHAR) IS
  BEGIN
    INSERT INTO pacientes (cliente, nombrePac, especie, raza, peso, sexo, fechaNacimiento, edad, comportamiento, numeroChip, esterilizado)
    VALUES (p_cliente, p_nombrePac, p_especie, p_raza, p_peso, p_sexo, p_fechaNacimiento, p_edad, p_comportamiento, p_numeroChip, p_esterilizado);
    COMMIT;
        
    EXCEPTION
      WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20034, 'Error al insertar pacientes');
  END ADMascota;

  PROCEDURE UPCliente(p_documentoId IN VARCHAR, p_nuevoNombre IN VARCHAR DEFAULT NULL, p_nuevoApellido IN VARCHAR DEFAULT NULL, p_nuevoTelefono IN NUMBER DEFAULT NULL, p_nuevoActivo IN CHAR DEFAULT NULL, p_nuevoCorreo IN VARCHAR DEFAULT NULL) IS
  BEGIN
    UPDATE clientes
    SET
      nombre = NVL(p_nuevoNombre, nombre),
      apellido = NVL(p_nuevoApellido, apellido),
      numTelefono = NVL(p_nuevoTelefono, numTelefono),
      activo = NVL(p_nuevoActivo, activo),
      correoElectronico = NVL(p_nuevoCorreo, correoElectronico)
    WHERE documentoId = p_documentoId;
    COMMIT;
        
    EXCEPTION
      WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20035, 'Error al modificar');
  END UPCliente;

  FUNCTION consultarDatosPersonales(p_documentoid IN VARCHAR) RETURN SYS_REFCURSOR IS
    v_cursor SYS_REFCURSOR;
  BEGIN
    OPEN v_cursor FOR
    SELECT *
    FROM Clientes
    WHERE documentoId = p_documentoid;

    RETURN v_cursor;
  END consultarDatosPersonales;

  FUNCTION consultarDatosMascota(p_idPaciente IN VARCHAR) RETURN SYS_REFCURSOR IS
    v_cursor SYS_REFCURSOR;
  BEGIN
    OPEN v_cursor FOR
    SELECT *
    FROM pacientes
    WHERE idPaciente = p_idPaciente;

    RETURN v_cursor;
  END consultarDatosMascota;

  FUNCTION citasProximasMascota(p_idPaciente IN VARCHAR) RETURN SYS_REFCURSOR IS
    v_cursor SYS_REFCURSOR;
  BEGIN
    OPEN v_cursor FOR
    SELECT *
    FROM servicios
    WHERE paciente = p_idPaciente
      AND tipo IN ('M', 'L', 'V')
      AND fecha >= SYSTIMESTAMP
    ORDER BY fecha;

    RETURN v_cursor;
  END citasProximasMascota;

  FUNCTION vacunasAplicadasMascota(p_idPaciente IN VARCHAR) RETURN SYS_REFCURSOR IS
    v_cursor SYS_REFCURSOR;
  BEGIN
    -- Implementación vacía
    RETURN v_cursor;
  END vacunasAplicadasMascota;
END PK_CLIENTE;
/

-- Cuerpo del paquete PK_RECEPCIONISTA
CREATE OR REPLACE PACKAGE BODY PK_RECEPCIONISTA AS
  PROCEDURE ADPaciente(
    p_cliente IN VARCHAR,
    p_nombrePac IN VARCHAR,
    p_especie IN VARCHAR,
    p_raza IN VARCHAR,
    p_peso IN NUMBER,
    p_sexo IN CHAR,
    p_fechaNacimiento IN DATE,
    p_edad IN NUMBER,
    p_comportamiento IN VARCHAR,
    p_numeroChip IN VARCHAR,
    p_esterilizado IN CHAR
  ) IS
  BEGIN
    PC_PACIENTE.adicionarPaciente(
      p_cliente,
      p_nombrePac,
      p_especie,
      p_raza,
      p_peso,
      p_sexo,
      p_fechaNacimiento,
      p_edad,
      p_comportamiento,
      p_numeroChip,
      p_esterilizado
    );
  END ADPaciente;

  PROCEDURE UPPaciente(p_idPaciente IN VARCHAR, activo IN CHAR) IS
  BEGIN
     UPDATE pacientes SET
            peso = xpeso,
            comportamiento = xcomportamiento,
            numeroChip = xnumeroChip, -- Corregido aquí
            esterilizado = xesterilizado
        WHERE idPaciente =p_idPaciente;

        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20002, 'Error al actualizar los datos en pacientes');
  END UPPaciente;

  PROCEDURE ADServicio(
    p_costo IN VARCHAR,
    p_empleado IN VARCHAR,
    p_tipo IN CHAR,
    p_fecha IN DATE,
    p_duracionEstimada IN NUMBER
  ) IS
  BEGIN
    INSERT INTO Servicios (fecha, costo, tipo, empleado)
        VALUES (xfecha, xcosto, xtipo, xpersonal);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20001, 'Error al insertar el registro en servicios');
  END ADServicio;

  PROCEDURE UPServicio(p_servicio IN VARCHAR, p_estado IN CHAR, p_paciente IN VARCHAR) IS
  BEGIN
    UPDATE Servicios SET nombre = xnombre WHERE idServicio = xidServicio;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20002, 'Error al modificar el registro en servicios');
  END UPServicio;

  PROCEDURE DEServicio(p_idServicio IN VARCHAR) IS
  BEGIN
        DELETE FROM Servicios WHERE idServicio = xidServicio;
        COMMIT;
     EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20003, 'Error al eliminar el registro en servicios');
  END DEServicio;

  PROCEDURE ADEmpleado(
    pNombre IN VARCHAR,
    pApellido IN VARCHAR,
    pFechaNacimiento IN DATE,
    pNumeroTelefono IN NUMBER,
    pCorreoElectronico IN VARCHAR,
    pSalario IN NUMBER,
    pEmpleado IN CHAR
  ) IS
  BEGIN
    INSERT INTO empleados (nombre, apellido, fechaNacimiento, numeroTelefono, correoElectronico, estadoEmpleado)
        VALUES (xnombre, xapellido, xfechaNacimiento, xnumeroTelefono, xcorreoElectronico, xempleado);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20001, 'Error al insertar el registro en empleados');
  END ADEmpleado;

  FUNCTION consultarHistorial(p_idPaciente IN VARCHAR) RETURN SYS_REFCURSOR IS
    v_cursor SYS_REFCURSOR;
  BEGIN
    OPEN v_cursor FOR
      SELECT *
      FROM historial
      WHERE idPaciente = p_idPaciente;
    RETURN v_cursor;
  END consultarHistorial;

  FUNCTION consultarPaciente(p_idPaciente IN VARCHAR) RETURN SYS_REFCURSOR IS
    v_cursor SYS_REFCURSOR;
  BEGIN
    OPEN v_cursor FOR
      SELECT *
      FROM pacientes
      WHERE idPaciente = p_idPaciente;
    RETURN v_cursor;
  END consultarPaciente;

  FUNCTION ConsultarServicio(p_idServicio IN VARCHAR) RETURN SYS_REFCURSOR IS
    v_cursor SYS_REFCURSOR;
  BEGIN
    OPEN v_cursor FOR
      SELECT *
      FROM servicios
      WHERE idServicio = p_idServicio;
    RETURN v_cursor;
  END ConsultarServicio;
END PK_RECEPCIONISTA;
/

-- Cuerpo del paquete PK_VETERINARIO
CREATE OR REPLACE PACKAGE BODY PK_VETERINARIO AS
  PROCEDURE UPservicio(p_idServicio IN VARCHAR, p_nombre IN VARCHAR) IS
  BEGIN
    UPDATE servicios
    set nombre = p_nombre
    where idServicio = p_idservicio;
     COMMIT;
        
    EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20027, 'Error al modificar el servicio');
  END UPservicio;

  PROCEDURE UPpersonal(p_idEmpleado IN VARCHAR, p_numeroTelefono IN VARCHAR DEFAULT NULL, p_correoElectronico IN VARCHAR DEFAULT NULL) IS
  BEGIN
    UPDATE Empleados
    SET 
      numeroTelefono = NVL(p_numeroTelefono, numeroTelefono),
      correoElectronico = NVL(p_correoElectronico, correoElectronico)
    WHERE idEmpleado = p_idEmpleado;
    COMMIT;
        
    EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20028, 'Error al modificar el empleado');
  END UPpersonal;

  PROCEDURE UPcitas(p_idServicio IN VARCHAR, p_duracion IN NUMBER DEFAULT NULL, p_motivo IN VARCHAR DEFAULT NULL, p_recetaMedica IN VARCHAR DEFAULT NULL, fechaProxima IN DATE DEFAULT NULL) IS
  BEGIN
    UPDATE Citas
    SET 
      duracion = NVL(p_duracion, duracion),
      motivo = NVL(p_motivo, motivo),
      recetaMedica = NVL(p_recetaMedica, recetaMedica),
      fechaProxima = NVL(fechaProxima, fechaProxima)
    WHERE idServicio = p_idServicio;
    COMMIT;
        
    EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20028, 'Error al modificar citas');
  END UPcitas;

  PROCEDURE UPcirugia(p_idServicio IN VARCHAR, p_duracion IN VARCHAR DEFAULT NULL, p_equipoQuirurgico IN VARCHAR DEFAULT NULL, p_complicaciones IN VARCHAR DEFAULT NULL, p_recetamedica IN VARCHAR DEFAULT NULL, p_anestesia IN VARCHAR DEFAULT NULL, p_fechaFin IN DATE DEFAULT NULL, p_estadopos IN VARCHAR DEFAULT NULL) IS
  BEGIN
     UPDATE Cirugias
    SET 
      duracion = NVL(p_duracion, duracion),
      equipoQuirurgico = NVL(p_equipoQuirurgico, equipoQuirurgico),
      complicaciones = NVL(p_complicaciones, complicaciones),
      recetamedica = NVL(p_recetamedica, recetamedica),
      anestesia = NVL(p_anestesia, anestesia),
      fechaFin = NVL(p_fechaFin, fechaFin),
      estadopos = NVL(p_estadopos, estadopos)
    WHERE idServicio = p_idServicio;
    COMMIT;
        
    EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20029, 'Error al modificar cirugias');
  END UPcirugia;

  PROCEDURE UPlaboratorios(p_idServicio IN VARCHAR, p_resultadoAnalisis IN VARCHAR DEFAULT NULL, p_labrealizado IN VARCHAR DEFAULT NULL, p_motivo IN VARCHAR DEFAULT NULL) IS
  BEGIN
    UPDATE Laboratorios
    SET 
      resultadoAnalisis = NVL(p_resultadoAnalisis, resultadoAnalisis),
      labrealizado = NVL(p_labrealizado, labrealizado),
      motivo = NVL(p_motivo, motivo)
    WHERE idServicio = p_idServicio;
    COMMIT;
        
    EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20030, 'Error al modificar laboratorios');
 
   
  END UPlaboratorios;

  PROCEDURE UPvacunas(p_idServicio IN VARCHAR, p_fechaProxima IN DATE DEFAULT NULL, p_dosis IN VARCHAR DEFAULT NULL, p_lote IN VARCHAR DEFAULT NULL) IS
  BEGIN
   UPDATE Vacunas
    SET 
      fechaProxima = NVL(p_fechaProxima, fechaProxima),
      dosis = NVL(p_dosis, dosis),
      lote = NVL(p_lote, lote)
    WHERE idServicio = p_idServicio;
    COMMIT;
        
    EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20031, 'Error al modificar vacunas');
  END UPvacunas;

  PROCEDURE UPpaciente(p_idPaciente IN VARCHAR, p_peso IN NUMBER DEFAULT NULL, p_esterilizado IN CHAR DEFAULT NULL) IS
  BEGIN
    UPDATE Pacientes
    SET 
      peso = NVL(p_peso, peso),
      esterilizado = NVL(p_esterilizado, esterilizado)
    WHERE idpaciente = p_idpaciente;
    COMMIT;
        
    EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20032, 'Error al modificar pacientes');
  END UPpaciente;
END PK_VETERINARIO;
/

-- Cuerpo del paquete PK_ASISTENTEVETERINARIO
CREATE OR REPLACE PACKAGE BODY PK_ASISTENTEVETERINARIO AS
  PROCEDURE UPservicio(p_idServicio IN VARCHAR, p_nombre IN VARCHAR) IS
  BEGIN
    UPDATE servicios
    set nombre = p_nombre
    where idServicio = p_idservicio;
     COMMIT;
        
    EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20027, 'Error al modificar el servicio');
  END UPservicio;

  PROCEDURE UPpersonal(p_idEmpleado IN VARCHAR, p_numeroTelefono IN VARCHAR DEFAULT NULL, p_correoElectronico IN VARCHAR DEFAULT NULL) IS
  BEGIN
    UPDATE Empleados
    SET 
      numeroTelefono = NVL(p_numeroTelefono, numeroTelefono),
      correoElectronico = NVL(p_correoElectronico, correoElectronico)
    WHERE idEmpleado = p_idEmpleado;
    COMMIT;
        
    EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20028, 'Error al modificar el empleado');
  END UPpersonal;

  PROCEDURE UPcitas(p_idServicio IN VARCHAR, p_duracion IN NUMBER DEFAULT NULL, p_motivo IN VARCHAR DEFAULT NULL, p_recetaMedica IN VARCHAR DEFAULT NULL, fechaProxima IN DATE DEFAULT NULL) IS
  BEGIN
    UPDATE Citas
    SET 
      duracion = NVL(p_duracion, duracion),
      motivo = NVL(p_motivo, motivo),
      recetaMedica = NVL(p_recetaMedica, recetaMedica),
      fechaProxima = NVL(fechaProxima, fechaProxima)
    WHERE idServicio = p_idServicio;
    COMMIT;
        
    EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20028, 'Error al modificar citas');
  END UPcitas;

  PROCEDURE UPcirugia(p_idServicio IN VARCHAR, p_duracion IN VARCHAR DEFAULT NULL, p_equipoQuirurgico IN VARCHAR DEFAULT NULL, p_complicaciones IN VARCHAR DEFAULT NULL, p_recetamedica IN VARCHAR DEFAULT NULL, p_anestesia IN VARCHAR DEFAULT NULL, p_fechaFin IN DATE DEFAULT NULL, p_estadopos IN VARCHAR DEFAULT NULL) IS
  BEGIN
     UPDATE Cirugias
    SET 
      duracion = NVL(p_duracion, duracion),
      equipoQuirurgico = NVL(p_equipoQuirurgico, equipoQuirurgico),
      complicaciones = NVL(p_complicaciones, complicaciones),
      recetamedica = NVL(p_recetamedica, recetamedica),
      anestesia = NVL(p_anestesia, anestesia),
      fechaFin = NVL(p_fechaFin, fechaFin),
      estadopos = NVL(p_estadopos, estadopos)
    WHERE idServicio = p_idServicio;
    COMMIT;
        
    EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20029, 'Error al modificar cirugias');
  END UPcirugia;

  PROCEDURE UPlaboratorios(p_idServicio IN VARCHAR, p_resultadoAnalisis IN VARCHAR DEFAULT NULL, p_labrealizado IN VARCHAR DEFAULT NULL, p_motivo IN VARCHAR DEFAULT NULL) IS
  BEGIN
    UPDATE Laboratorios
    SET 
      resultadoAnalisis = NVL(p_resultadoAnalisis, resultadoAnalisis),
      labrealizado = NVL(p_labrealizado, labrealizado),
      motivo = NVL(p_motivo, motivo)
    WHERE idServicio = p_idServicio;
    COMMIT;
        
    EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20030, 'Error al modificar laboratorios');
 
   
  END UPlaboratorios;

  PROCEDURE UPvacunas(p_idServicio IN VARCHAR, p_fechaProxima IN DATE DEFAULT NULL, p_dosis IN VARCHAR DEFAULT NULL, p_lote IN VARCHAR DEFAULT NULL) IS
  BEGIN
   UPDATE Vacunas
    SET 
      fechaProxima = NVL(p_fechaProxima, fechaProxima),
      dosis = NVL(p_dosis, dosis),
      lote = NVL(p_lote, lote)
    WHERE idServicio = p_idServicio;
    COMMIT;
        
    EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20031, 'Error al modificar vacunas');
  END UPvacunas;

  PROCEDURE UPpaciente(p_idpaciente IN VARCHAR, p_peso IN NUMBER DEFAULT NULL, p_esterilizado IN CHAR DEFAULT NULL) IS
  BEGIN
    UPDATE Pacientes
    SET 
      peso = NVL(p_peso, peso),
      esterilizado = NVL(p_esterilizado, esterilizado)
    WHERE idpaciente = p_idpaciente;
    COMMIT;
        
    EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20032, 'Error al modificar pacientes');
  END UPpaciente;
END PK_ASISTENTEVETERINARIO;
/


CREATE OR REPLACE PACKAGE BODY PK_PASEADORMASCOTAS IS
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

END PK_PASEADORMASCOTAS;
/

CREATE OR REPLACE PACKAGE BODY PK_GERENTE AS
  -- Función para obtener los servicios más usados
  FUNCTION SERVICIOSMASUSADOS RETURN SYS_REFCURSOR IS
    v_cursor SYS_REFCURSOR;
  BEGIN
    OPEN v_cursor FOR
      SELECT tipo, COUNT(*) AS cantidad
      FROM servicios
      WHERE estado = 't'
      GROUP BY tipo
      ORDER BY cantidad DESC;

    RETURN v_cursor;
  END SERVICIOSMASUSADOS;

  -- Función para obtener los pacientes que han utilizado servicios de laboratorio
  FUNCTION PACIENTESLAB RETURN SYS_REFCURSOR IS
    v_cursor SYS_REFCURSOR;
  BEGIN
    OPEN v_cursor FOR
      SELECT DISTINCT s.paciente
      FROM servicios s
      WHERE s.tipo = 'L' AND s.estado = 't';

    RETURN v_cursor;
  END PACIENTESLAB;
END PK_GERENTE;
/

-- Llamada a la función SERVICIOSMASUSADOS
VAR rc1 REFCURSOR
EXEC :rc1 := PK_GERENTE.SERVICIOSMASUSADOS;

PRINT rc1;

-- Llamada a la función PACIENTESLAB
VAR rc2 REFCURSOR
EXEC :rc2 := PK_GERENTE.PACIENTESLAB;

PRINT rc2;


-- Para el paquete PK_VETERINARIO
DROP PACKAGE PK_VETERINARIO;

-- Para el paquete PK_ASISTENTEVETERINARIO
DROP PACKAGE PK_ASISTENTEVETERINARIO;

-- Para el paquete PK_CLIENTE
DROP PACKAGE PK_CLIENTE;

-- Para el paquete PK_RECEPCIONISTA
DROP PACKAGE PK_RECEPCIONISTA;

