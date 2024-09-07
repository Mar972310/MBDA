--TuplasOK
INSERT INTO directorios (idRazaEspecie, tipoAnimal, nombreRaza, origen, tamanoPromedio, esperanzaVida, caracteristicasFisicas, comportamientoCaracteristico, alimentacionRecomendada, enfermedadesComunes, regulacionLegal, habitad)
VALUES ('1', 'Perro', 'Labrador Retriever', 'Inglaterra', 'Grande', 12, 'Pelaje corto, orejas caídas', 'Amigable, inteligente, obediente', 'Balanceada', 'Displasia de cadera', 'S', 'Terrestre');

INSERT INTO directorios (idRazaEspecie, tipoAnimal, nombreRaza, origen, tamanoPromedio, esperanzaVida, caracteristicasFisicas, comportamientoCaracteristico, alimentacionRecomendada, enfermedadesComunes, regulacionLegal, habitad)
VALUES ('2', 'Gato', 'Siamés', 'Tailandia', 'Mediano', 15, 'Pelaje corto, color punto', 'Carácter extrovertido, vocal', 'Balanceada', 'Obesidad', 'S', 'Doméstico');

INSERT INTO directorios (idRazaEspecie, tipoAnimal, nombreRaza, origen, tamanoPromedio, esperanzaVida, caracteristicasFisicas, comportamientoCaracteristico, alimentacionRecomendada, enfermedadesComunes, regulacionLegal, habitad)
VALUES ('3', 'Conejo', 'Canario', 'Islas Canarias', 'Pequeño', 10, 'Plumaje brillante, canto melodioso', 'Sociable, activo', 'Semillas, frutas', 'Parásitos intestinales', 'N', 'Aéreo');

INSERT INTO directorios (idRazaEspecie, tipoAnimal, nombreRaza, origen, tamanoPromedio, esperanzaVida, caracteristicasFisicas, comportamientoCaracteristico, alimentacionRecomendada, enfermedadesComunes, regulacionLegal, habitad)
VALUES ('4', 'Gato', 'Persa', 'Irán', 'Mediano', 14, 'Pelaje largo y sedoso', 'Tranquilo, cariñoso', 'Alimentación especial para el pelaje', 'Problemas respiratorios', 'S', 'Doméstico');

INSERT INTO directorios (idRazaEspecie, tipoAnimal, nombreRaza, origen, tamanoPromedio, esperanzaVida, caracteristicasFisicas, comportamientoCaracteristico, alimentacionRecomendada, enfermedadesComunes, regulacionLegal, habitad)
VALUES ('5', 'Perro', 'Bulldog Francés', 'Francia', 'Pequeño', 11, 'Cuerpo compacto, orejas grandes', 'Juguetón, afectuoso', 'Alimentación equilibrada', 'Problemas respiratorios', 'S', 'Terrestre');

INSERT INTO directorios (idRazaEspecie, tipoAnimal, nombreRaza, origen, tamanoPromedio, esperanzaVida, caracteristicasFisicas, comportamientoCaracteristico, alimentacionRecomendada, enfermedadesComunes, regulacionLegal, habitad)
VALUES ('6', 'Conejo', 'Periquito', 'Australia', 'Pequeño', 7, 'Plumaje brillante, variedad de colores', 'Sociable, curioso', 'Semillas, frutas, verduras', 'Resfriados', 'N', 'Aéreo');

-- Insertar clientes
INSERT INTO clientes (documentoId, nombre, apellido, numTelefono, activo, direccion, correoElectronico)
VALUES ('C1234567890', 'Nuevo', 'Cliente', '987654321', 'T', 'Calle 456', 'nuevo_cliente@example.com');

INSERT INTO clientes (documentoId, nombre, apellido, numTelefono, activo, direccion, correoElectronico)
VALUES ('C2345678901', 'Cliente', 'Dos', '987654322', 'T', 'Calle 789', 'cliente_dos@example.com');

INSERT INTO clientes (documentoId, nombre, apellido, numTelefono, activo, direccion, correoElectronico)
VALUES ('C3456789012', 'Cliente', 'Tres', '987654323', 'T', 'Calle 1011', 'cliente_tres@example.com');

INSERT INTO clientes (documentoId, nombre, apellido, numTelefono, activo, direccion, correoElectronico)
VALUES ('C4567890123', 'Cliente', 'Cuatro', '987654324', 'T', 'Calle 1213', 'cliente_cuatro@example.com');

INSERT INTO clientes (documentoId, nombre, apellido, numTelefono, activo, direccion, correoElectronico)
VALUES ('C5678901234', 'Cliente', 'Cinco', '987654325', 'T', 'Calle 1415', 'cliente_cinco@example.com');

INSERT INTO clientes (documentoId, nombre, apellido, numTelefono, activo, direccion, correoElectronico)
VALUES ('C6789012345', 'Cliente', 'Seis', '987654326', 'T', 'Calle 1617', 'cliente_seis@example.com');

-- Insertar empleados
INSERT INTO empleados (idEmpleado, nombre, apellido, fechaNacimiento, fechaRegistro, numeroTelefono, correoElectronico, salario, estadoEmpleado, empleado)
VALUES ('E1234567890', 'Nuevo', 'Empleado', TO_DATE('1995-08-25', 'YYYY-MM-DD'), TO_DATE('2023-01-15', 'YYYY-MM-DD'), '5551112233', 'nuevo_empleado@example.com', 55000, 'A', 'V');

INSERT INTO empleados (idEmpleado, nombre, apellido, fechaNacimiento, fechaRegistro, numeroTelefono, correoElectronico, salario, estadoEmpleado, empleado)
VALUES ('E2345678901', 'Empleado', 'Dos', TO_DATE('1990-05-15', 'YYYY-MM-DD'), TO_DATE('2023-01-16', 'YYYY-MM-DD'), '5552223344', 'empleado_dos@example.com', 60000, 'A', 'V');

INSERT INTO empleados (idEmpleado, nombre, apellido, fechaNacimiento, fechaRegistro, numeroTelefono, correoElectronico, salario, estadoEmpleado, empleado)
VALUES ('E3456789012', 'Empleado', 'Tres', TO_DATE('1985-08-20', 'YYYY-MM-DD'), TO_DATE('2023-01-17', 'YYYY-MM-DD'), '5553334455', 'empleado_tres@example.com', 70000, 'A', 'R');

INSERT INTO empleados (idEmpleado, nombre, apellido, fechaNacimiento, fechaRegistro, numeroTelefono, correoElectronico, salario, estadoEmpleado, empleado)
VALUES ('E4567890123', 'Empleado', 'Cuatro', TO_DATE('1992-02-10', 'YYYY-MM-DD'), TO_DATE('2023-01-18', 'YYYY-MM-DD'), '5554445566', 'empleado_cuatro@example.com', 80000, 'A', 'G');

INSERT INTO empleados (idEmpleado, nombre, apellido, fechaNacimiento, fechaRegistro, numeroTelefono, correoElectronico, salario, estadoEmpleado, empleado)
VALUES ('E5678901234', 'Empleado', 'Cinco', TO_DATE('1988-11-25', 'YYYY-MM-DD'), TO_DATE('2023-01-19', 'YYYY-MM-DD'), '5555556677', 'empleado_cinco@example.com', 90000, 'A', 'L');

INSERT INTO empleados (idEmpleado, nombre, apellido, fechaNacimiento, fechaRegistro, numeroTelefono, correoElectronico, salario, estadoEmpleado, empleado)
VALUES ('E6789012345', 'Empleado', 'Seis', TO_DATE('1994-04-30', 'YYYY-MM-DD'), TO_DATE('2023-01-20', 'YYYY-MM-DD'), '5556667788', 'empleado_seis@example.com', 100000, 'A', 'P');

-- Insertar horarioEmpleados
INSERT INTO horarioEmpleados (idHorario, empleado, fechaInicio, fechaFin, diaSemana, ocupado, rol)
VALUES ('HO0000000001', 'E1234567890', TO_DATE('2023-01-15', 'YYYY-MM-DD'), TO_DATE('2023-12-31', 'YYYY-MM-DD'), 'M', 'F', 'U');

INSERT INTO horarioEmpleados (idHorario, empleado, fechaInicio, fechaFin, diaSemana, ocupado, rol)
VALUES ('HO0000000002', 'E1234567890', TO_DATE('2023-01-15 08:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2023-01-15 17:00', 'YYYY-MM-DD HH24:MI'), 'M', 'F', 'U');

INSERT INTO horarioEmpleados (idHorario, empleado, fechaInicio, fechaFin, diaSemana, ocupado, rol)
VALUES ('HO0000000003', 'E2345678901', TO_DATE('2023-01-16 09:30', 'YYYY-MM-DD HH24:MI'), TO_DATE('2023-01-16 18:30', 'YYYY-MM-DD HH24:MI'), 'W', 'F', 'A');

INSERT INTO horarioEmpleados (idHorario, empleado, fechaInicio, fechaFin, diaSemana, ocupado, rol)
VALUES ('HO0000000004', 'E3456789012', TO_DATE('2023-01-17 07:45', 'YYYY-MM-DD HH24:MI'), TO_DATE('2023-01-17 16:15', 'YYYY-MM-DD HH24:MI'), 'J', 'F', 'U');

INSERT INTO horarioEmpleados (idHorario, empleado, fechaInicio, fechaFin, diaSemana, ocupado, rol)
VALUES ('HO0000000005', 'E4567890123', TO_DATE('2023-01-18 10:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2023-01-18 19:00', 'YYYY-MM-DD HH24:MI'), 'V', 'F', 'A');

INSERT INTO horarioEmpleados (idHorario, empleado, fechaInicio, fechaFin, diaSemana, ocupado, rol)
VALUES ('HO0000000006', 'E5678901234', TO_DATE('2023-01-19 08:30', 'YYYY-MM-DD HH24:MI'), TO_DATE('2023-01-19 17:30', 'YYYY-MM-DD HH24:MI'), 'S', 'F', 'U');


-- Insertar certificaciones
INSERT INTO certificaciones (idCertificacion, numRegistroCertificacion, urlCertificacion, fechaEmision, fechaVencimiento, tipoCertificacion, institucionPersonaEmite, nombreCertificacion, contactoInstitucionPersona, documentoFisico, categoria, empleado)
VALUES ('CERTI1234567890', 987654, 'https://certificacionejemplo.com', TO_DATE('2023-01-01', 'YYYY-MM-DD'), TO_DATE('2024-01-01', 'YYYY-MM-DD'), 'A', 'Instituto Certificador', 'Certificación Ejemplo', 5553334444, 'certificado.pdf', 'A', 'E1234567890');

INSERT INTO certificaciones (idCertificacion, numRegistroCertificacion, urlCertificacion, fechaEmision, fechaVencimiento, tipoCertificacion, institucionPersonaEmite, nombreCertificacion, contactoInstitucionPersona, documentoFisico, categoria, empleado)
VALUES ('CERTI1234567891', 987655, 'https://certificacionejemplo1.com', TO_DATE('2023-02-01', 'YYYY-MM-DD'), TO_DATE('2024-02-01', 'YYYY-MM-DD'), 'F', 'Instituto Certificador', 'Certificación Ejemplo 1', 5553334445, 'certificado1.pdf', 'B', 'E2345678901');

INSERT INTO certificaciones (idCertificacion, numRegistroCertificacion, urlCertificacion, fechaEmision, fechaVencimiento, tipoCertificacion, institucionPersonaEmite, nombreCertificacion, contactoInstitucionPersona, documentoFisico, categoria, empleado)
VALUES ('CERTI1234567892', 987656, 'https://certificacionejemplo2.com', TO_DATE('2023-03-01', 'YYYY-MM-DD'), TO_DATE('2024-03-01', 'YYYY-MM-DD'), 'I', 'Otro Instituto', 'Certificación Ejemplo 2', 5553334446, 'certificado2.pdf', 'C', 'E3456789012');

INSERT INTO certificaciones (idCertificacion, numRegistroCertificacion, urlCertificacion, fechaEmision, fechaVencimiento, tipoCertificacion, institucionPersonaEmite, nombreCertificacion, contactoInstitucionPersona, documentoFisico, categoria, empleado)
VALUES ('CERTI1234567893', 987657, 'https://certificacionejemplo3.com', TO_DATE('2023-04-01', 'YYYY-MM-DD'), TO_DATE('2024-04-01', 'YYYY-MM-DD'), 'A', 'Instituto de Certificación Internacional', 'Certificación Ejemplo 3', 5553334447, 'certificado3.pdf', 'A', 'E4567890123');

INSERT INTO certificaciones (idCertificacion, numRegistroCertificacion, urlCertificacion, fechaEmision, fechaVencimiento, tipoCertificacion, institucionPersonaEmite, nombreCertificacion, contactoInstitucionPersona, documentoFisico, categoria, empleado)
VALUES ('CERTI1234567894', 987658, 'https://certificacionejemplo4.com', TO_DATE('2023-05-01', 'YYYY-MM-DD'), TO_DATE('2024-05-01', 'YYYY-MM-DD'), 'F', 'Instituto Certificador', 'Certificación Ejemplo 4', 5553334448, 'certificado4.pdf', 'B', 'E5678901234');

INSERT INTO certificaciones (idCertificacion, numRegistroCertificacion, urlCertificacion, fechaEmision, fechaVencimiento, tipoCertificacion, institucionPersonaEmite, nombreCertificacion, contactoInstitucionPersona, documentoFisico, categoria, empleado)
VALUES ('CERTI1234567895', 987659, 'https://certificacionejemplo5.com', TO_DATE('2023-06-01', 'YYYY-MM-DD'), TO_DATE('2024-06-01', 'YYYY-MM-DD'), 'I', 'Otro Instituto', 'Certificación Ejemplo 5', 5553334449, 'certificado5.pdf', 'C', 'E6789012345');

-- Insertar pacientes
INSERT INTO pacientes (idPaciente, cliente, nombrePac, especie, raza, fechaRegistro, peso, sexo, fechaNacimiento, edad, comportamiento, numeroChip, esterilizado, fechaActualizacion)
VALUES ('P1234567890', 'C1234567890', 'Buddy', 'Perro', '2', TO_DATE('2023-01-01', 'YYYY-MM-DD'), 15.0, 'M', TO_DATE('2022-01-01', 'YYYY-MM-DD'), 1, 'Juguetón', null, 'F', TO_DATE('2023-01-01', 'YYYY-MM-DD'));

INSERT INTO pacientes (idPaciente, cliente, nombrePac, especie, raza, fechaRegistro, peso, sexo, fechaNacimiento, edad, comportamiento, numeroChip, esterilizado, fechaActualizacion)
VALUES ('P1234565891', 'C1234567890', 'Buddy', 'Perro', '2', TO_DATE('2023-01-01', 'YYYY-MM-DD'), 15.0, 'M', TO_DATE('2022-01-01', 'YYYY-MM-DD'), 1, 'Juguetón', null, 'F', TO_DATE('2023-01-01', 'YYYY-MM-DD'));

INSERT INTO pacientes (idPaciente, cliente, nombrePac, especie, raza, fechaRegistro, peso, sexo, fechaNacimiento, edad, comportamiento, numeroChip, esterilizado, fechaActualizacion)
VALUES ('P2345678991', 'C2345678901', 'Max', 'Gato', '2', TO_DATE('2023-02-01', 'YYYY-MM-DD'), 8.0, 'M', TO_DATE('2022-03-01', 'YYYY-MM-DD'), 2, 'Tranquilo', 'ABC123456789098', 'T', TO_DATE('2023-02-01', 'YYYY-MM-DD'));

INSERT INTO pacientes (idPaciente, cliente, nombrePac, especie, raza, fechaRegistro, peso, sexo, fechaNacimiento, edad, comportamiento, numeroChip, esterilizado, fechaActualizacion)
VALUES ('P3456789017', 'C3456789012', 'Luna', 'Perro', '1', TO_DATE('2023-03-10', 'YYYY-MM-DD'), 20.0, 'H', TO_DATE('2021-02-15', 'YYYY-MM-DD'), 3, 'Energético', 'XYZ987654321123', 'F', TO_DATE('2023-03-10', 'YYYY-MM-DD'));

INSERT INTO pacientes (idPaciente, cliente, nombrePac, especie, raza, fechaRegistro, peso, sexo, fechaNacimiento, edad, comportamiento, numeroChip, esterilizado, fechaActualizacion)
VALUES ('P4567890123', 'C4567890123', 'Oreo', 'Gato', '2', TO_DATE('2023-04-20', 'YYYY-MM-DD'), 10.0, 'H', TO_DATE('2022-05-10', 'YYYY-MM-DD'), 2, 'Curioso', 'PQR789012345567', 'T', TO_DATE('2023-04-20', 'YYYY-MM-DD'));

INSERT INTO pacientes (idPaciente, cliente, nombrePac, especie, raza, fechaRegistro, peso, sexo, fechaNacimiento, edad, comportamiento, numeroChip, esterilizado, fechaActualizacion)
VALUES ('P5678901234', 'C5678901234', 'Simba', 'Perro', '4', TO_DATE('2023-05-30', 'YYYY-MM-DD'), 18.0, 'M', TO_DATE('2022-04-05', 'YYYY-MM-DD'), 1, 'Leal', 'LMN567890123364', 'F', TO_DATE('2023-05-30', 'YYYY-MM-DD'));


--servicios
INSERT INTO servicios (idServicio, nombre, costo, empleado, tipo, fecha, fechaFin, paciente, estado, duracionEstimada, observaciones)
VALUES ('S1234567890', 'Consulta General', 50.00, 'E1234567890', 'C', TO_DATE('2023-01-02', 'YYYY-MM-DD'), TO_DATE('2023-01-02', 'YYYY-MM-DD'), 'P1234567890', 'F', 30, 'Ninguna');

INSERT INTO servicios (idServicio, nombre, costo, empleado, tipo, fecha, fechaFin, paciente, estado, duracionEstimada, observaciones)
VALUES ('S2345678901', 'Vacunación Anual', 35.00, 'E2345678901', 'V', TO_DATE('2023-01-21 09:30', 'YYYY-MM-DD HH24:MI'), TO_DATE('2023-01-21 10:00', 'YYYY-MM-DD HH24:MI'), 'P1234567890', 'F', 30, 'Ninguna');

INSERT INTO servicios (idServicio, nombre, costo, empleado, tipo, fecha, fechaFin, paciente, estado, duracionEstimada, observaciones)
VALUES ('S3456789012', 'Cirugía de Esterilización', 120.00, 'E3456789012', 'C', TO_DATE('2023-01-22 11:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2023-01-22 14:00', 'YYYY-MM-DD HH24:MI'), 'P2345678901', 'F', 180, 'Se requiere ayuno de 12 horas');

INSERT INTO servicios (idServicio, nombre, costo, empleado, tipo, fecha, fechaFin, paciente, estado, duracionEstimada, observaciones)
VALUES ('S4567890123', 'Consulta de Urgencia', 75.00, 'E4567890123', 'C', TO_DATE('2023-01-23 15:45', 'YYYY-MM-DD HH24:MI'), TO_DATE('2023-01-23 16:15', 'YYYY-MM-DD HH24:MI'), 'P3456789012', 'F', 30, 'Historial médico disponible');

INSERT INTO servicios (idServicio, nombre, costo, empleado, tipo, fecha, fechaFin, paciente, estado, duracionEstimada, observaciones)
VALUES ('S5678901234', 'Examen de Sangre', 50.00, 'E5678901234', 'L', TO_DATE('2023-01-24 10:30', 'YYYY-MM-DD HH24:MI'), TO_DATE('2023-01-24 11:15', 'YYYY-MM-DD HH24:MI'), 'P4567890123', 'F', 45, 'Resultados en 48 horas');

INSERT INTO servicios (idServicio, nombre, costo, empleado, tipo, fecha, fechaFin, paciente, estado, duracionEstimada, observaciones)
VALUES ('S6789012345', 'Cuidado Postoperatorio', 60.00, 'E6789012345', 'C', TO_DATE('2023-01-25 12:00', 'YYYY-MM-DD HH24:MI'), TO_DATE('2023-01-25 14:30', 'YYYY-MM-DD HH24:MI'), 'P5678901234', 'F', 150, 'Seguimiento requerido');

-- Insertar historial
INSERT INTO historial (idRegistro, fechaRegistro, servicio)
VALUES ('H1234567890', TO_DATE('2023-01-02', 'YYYY-MM-DD'), 'S1234567890');

INSERT INTO historial (idRegistro, fechaRegistro, servicio)
VALUES ('H1234567891', TO_DATE('2023-01-02 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'S1234567890');

INSERT INTO historial (idRegistro, fechaRegistro, servicio)
VALUES ('H1234567892', TO_DATE('2023-01-03 10:45:00', 'YYYY-MM-DD HH24:MI:SS'), 'S2345678901');

INSERT INTO historial (idRegistro, fechaRegistro, servicio)
VALUES ('H1234567893', TO_DATE('2023-01-04 16:15:00', 'YYYY-MM-DD HH24:MI:SS'), 'S3456789012');

INSERT INTO historial (idRegistro, fechaRegistro, servicio)
VALUES ('H1234567894', TO_DATE('2023-01-05 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'S4567890123');

INSERT INTO historial (idRegistro, fechaRegistro, servicio)
VALUES ('H1234567895', TO_DATE('2023-01-06 09:30:00', 'YYYY-MM-DD HH24:MI:SS'), 'S5678901234');


-- Insertar vacunas
INSERT INTO vacunas (idServicio, fechaProxima, dosis, lote)
VALUES ('S1234567890', TO_DATE('2023-02-01', 'YYYY-MM-DD'), '0.5mL', 'Lote789');

INSERT INTO vacunas (idServicio, fechaProxima, dosis, lote)
VALUES ('S2345678901', TO_DATE('2023-03-15', 'YYYY-MM-DD'), '1mL', 'Lote890');

INSERT INTO vacunas (idServicio, fechaProxima, dosis, lote)
VALUES ('S3456789012', TO_DATE('2023-04-20', 'YYYY-MM-DD'), '0.8mL', 'Lote901');

INSERT INTO vacunas (idServicio, fechaProxima, dosis, lote)
VALUES ('S4567890123', TO_DATE('2023-05-30', 'YYYY-MM-DD'), '1.2mL', 'Lote012');

INSERT INTO vacunas (idServicio, fechaProxima, dosis, lote)
VALUES ('S5678901234', TO_DATE('2023-06-10', 'YYYY-MM-DD'), '0.7mL', 'Lote123');

-- Insertar guarderias
INSERT INTO guarderias (idGuarderia, fechaInicio, paciente, fechaFin, estado)
VALUES ('G1234567890', TO_DATE('2023-01-15', 'YYYY-MM-DD'), 'P1234567890', TO_DATE('2023-01-20', 'YYYY-MM-DD'), 'A');

INSERT INTO guarderias (idGuarderia, fechaInicio, paciente, fechaFin, estado)
VALUES ('G2345678901', TO_DATE('2023-02-01', 'YYYY-MM-DD'), 'P2345678991', TO_DATE('2023-02-05', 'YYYY-MM-DD'), 'C');

INSERT INTO guarderias (idGuarderia, fechaInicio, paciente, fechaFin, estado)
VALUES ('G3456789012', TO_DATE('2023-03-10', 'YYYY-MM-DD'), 'P3456789017', TO_DATE('2023-03-15', 'YYYY-MM-DD'), 'A');

INSERT INTO guarderias (idGuarderia, fechaInicio, paciente, fechaFin, estado)
VALUES ('G4567890123', TO_DATE('2023-04-20', 'YYYY-MM-DD'), 'P4567890123', TO_DATE('2023-04-25', 'YYYY-MM-DD'), 'F');

INSERT INTO guarderias (idGuarderia, fechaInicio, paciente, fechaFin, estado)
VALUES ('G5678901234', TO_DATE('2023-05-30', 'YYYY-MM-DD'), 'P5678901234', TO_DATE('2023-06-05', 'YYYY-MM-DD'), 'A');

--Insert cita
INSERT INTO citas (idServicio, duracion, motivo, recetaMedica, fechaProxima)
VALUES ('S1234567890', 1, 'Inicio quimioterapia', 'Medicamento Q', TO_DATE('2022-09-20', 'YYYY-MM-DD'));

INSERT INTO citas (idServicio, duracion, motivo, recetaMedica, fechaProxima)
VALUES ('S2345678901', 1, 'Fisioterapia postoperatoria', 'N/A', TO_DATE('2022-10-25', 'YYYY-MM-DD'));

INSERT INTO citas (idServicio, duracion, motivo, recetaMedica, fechaProxima)
VALUES ('S3456789012', 1, 'Consulta dermatológica', 'N/A', TO_DATE('2022-11-20', 'YYYY-MM-DD'));

INSERT INTO citas (idServicio, duracion, motivo, recetaMedica, fechaProxima)
VALUES ('S4567890123', 2, 'Terapia de comportamiento avanzada', 'N/A', TO_DATE('2022-12-15', 'YYYY-MM-DD'));

INSERT INTO citas (idServicio, duracion, motivo, recetaMedica, fechaProxima)
VALUES ('S5678901234', 2, 'Seguimiento radioterapia', 'N/A', TO_DATE('2023-01-25', 'YYYY-MM-DD'));

--INSERT CIRUGIA
INSERT INTO cirugias (idServicio, duracion, equipoQuirurgico, complicaciones, recetaMedica, anestesia, fechaFin, estadoPos)
VALUES ('S1234567890', 3, 'Equipo A', 'Ninguna', 'Antibiótico A', 'General', TO_DATE('2022-01-03', 'YYYY-MM-DD'), 'Recuperándose');

INSERT INTO cirugias (idServicio, duracion, equipoQuirurgico, complicaciones, recetaMedica, anestesia, fechaFin, estadoPos)
VALUES ('S2345678901', 2, 'Equipo B', 'Ninguna', 'Analgesico B', 'Local', TO_DATE('2022-02-16', 'YYYY-MM-DD'), 'Recuperándose');

INSERT INTO cirugias (idServicio, duracion, equipoQuirurgico, complicaciones, recetaMedica, anestesia, fechaFin, estadoPos)
VALUES ('S3456789012', 4, 'Equipo C', 'Infección leve', 'Antibiótico C', 'General', TO_DATE('2022-03-22', 'YYYY-MM-DD'), 'Recuperándose');

INSERT INTO cirugias (idServicio, duracion, equipoQuirurgico, complicaciones, recetaMedica, anestesia, fechaFin, estadoPos)
VALUES ('S4567890123', 2, 'Equipo D', 'Ninguna', 'Analgesico D', 'Local', TO_DATE('2022-04-05', 'YYYY-MM-DD'), 'Recuperándose');

-- Inserciones en la tabla laboratorios con nuevos códigos de idServicio
INSERT INTO laboratorios (idServicio, resultadoAnalisis, labRealizado, motivo)
VALUES ('S1234567890', 'Análisis de sangre normal', 'Laboratorio ABC', 'Perfil de salud');

INSERT INTO laboratorios (idServicio, resultadoAnalisis, labRealizado, motivo)
VALUES ('S2345678901', 'Resultados dentro de los parámetros', 'Laboratorio XYZ', 'Pruebas adicionales');

INSERT INTO laboratorios (idServicio, resultadoAnalisis, labRealizado, motivo)
VALUES ('S3456789012', 'Sin anomalías detectadas', 'Laboratorio 123', 'Panel de control preoperatorio');

INSERT INTO laboratorios (idServicio, resultadoAnalisis, labRealizado, motivo)
VALUES ('S4567890123', 'Análisis de orina normal', 'Laboratorio DEF', 'Perfil metabólico');

--TuplasNOOK
INSERT INTO directorios (idRazaEspecie, tipoAnimal, nombreRaza, origen, tamanoPromedio, esperanzaVida, caracteristicasFisicas, comportamientoCaracteristico, alimentacionRecomendada, enfermedadesComunes, regulacionLegal, habitad)
VALUES ('1', 'ornitorrinco', 'Labrador Retriever', 'Inglaterra', 'Grande', 12, 'Pelaje corto, orejas caídas', 'Amigable, inteligente, obediente', 'Balanceada', 'Displasia de cadera', 'S', 'Terrestre');

INSERT INTO clientes (documentoId, nombre, apellido, numTelefono, activo, direccion, correoElectronico)
VALUES ('12345678901', 'Juan', 'Perez', '987654321', 'S', 'Calle 123', 'juan@example.com');

INSERT INTO clientes (documentoId, nombre, apellido, numTelefono, activo, direccion, correoElectronico)
VALUES ('C93456789012', 'Ana', 'González', '876543210', 'S', 'Avenida Principal', 'anaxample.com');

INSERT INTO clientes (documentoId, nombre, apellido, numTelefono, activo, direccion, correoElectronico)
VALUES ('C34597890123', 'Carlos', 'Martínez', '765432109', 'S', 'Plaza Central', 'carlos@example.com');

INSERT INTO pacientes (idPaciente, cliente, nombrePac, especie, raza, fechaRegistro, peso, sexo, fechaNacimiento, edad, comportamiento, numeroChip, esterilizado, fechaActualizacion)
VALUES ('P6', '45678901234', 'Kiara', 'Perro', '1', TO_DATE('2022-06-20', 'YYYY-MM-DD'), 6.3, 'H', TO_DATE('2021-06-20', 'YYYY-MM-DD'), 1, 'Cariñosa, juguetona', 'null', 'F', TO_DATE('2022-06-20', 'YYYY-MM-DD'));

INSERT INTO pacientes (idPaciente, cliente, nombrePac, especie, raza, fechaRegistro, peso, sexo, fechaNacimiento, edad, comportamiento, numeroChip, esterilizado, fechaActualizacion)
VALUES ('P1111111111', '56789012345', 'Maximus', 'Gato', '2', TO_DATE('2022-07-25', 'YYYY-MM-DD'), 5.5, 'M', TO_DATE('2021-07-25', 'YYYY-MM-DD'), 1, 'Aventurero, independiente', '567890123456789', 'T', TO_DATE('2022-07-25', 'YYYY-MM-DD'));

INSERT INTO pacientes (idPaciente, cliente, nombrePac, especie, raza, fechaRegistro, peso, sexo, fechaNacimiento, edad, comportamiento, numeroChip, esterilizado, fechaActualizacion)
VALUES ('P8888888888', '67890123456', 'Lola', 'Perro', '1', TO_DATE('2022-08-30', 'YYYY-MM-DD'), 12.1, 'H', TO_DATE('2021-08-30', 'YYYY-MM-DD'), 2, 'Amigable, protectora', 'null', 'S', TO_DATE('2022-08-30', 'YYYY-MM-DD'));

INSERT INTO empleados (idEmpleado, nombre, apellido, fechaNacimiento, fechaRegistro, numeroTelefono, correoElectronico, salario, estadoEmpleado, empleado)
VALUES ('E1', 'Maria', 'Gomez', TO_DATE('1990-05-15', 'YYYY-MM-DD'), TO_DATE('2022-01-01', 'YYYY-MM-DD'), '5551234567', 'maria@example.com', 50000, 'A', 'S');

INSERT INTO empleados (idEmpleado, nombre, apellido, fechaNacimiento, fechaRegistro, numeroTelefono, correoElectronico, salario, estadoEmpleado, empleado)
VALUES ('E2222222222', 'Luis', 'Hernández', TO_DATE('1985-10-20', 'YYYY-MM-DD'), TO_DATE('2022-01-05', 'YYYY-MM-DD'), '5559876543', 'luis@example.com', 60000, 'M', 'V');

INSERT INTO empleados (idEmpleado, nombre, apellido, fechaNacimiento, fechaRegistro, numeroTelefono, correoElectronico, salario, estadoEmpleado, empleado)
VALUES ('E3333333333', 'Ana', 'Ramírez', TO_DATE('1992-03-08', 'YYYY-MM-DD'), TO_DATE('2022-02-10', 'YYYY-MM-DD'), '5552223333', 'ana@example.com', 55000, 'A', 'W');

INSERT INTO empleados (idEmpleado, nombre, apellido, fechaNacimiento, fechaRegistro, numeroTelefono, correoElectronico, salario, estadoEmpleado, empleado)
VALUES ('E3333333333', 'Ana', 'Ramírez', TO_DATE('1992-03-08', 'YYYY-MM-DD'), TO_DATE('2022-02-10', 'YYYY-MM-DD'), '5552223333', 'anexample.com', 55000, 'A', 'L');

INSERT INTO certificaciones (idCertificacion, numRegistroCertificacion, urlCertificacion, fechaEmision, fechaVencimiento, tipoCertificacion, institucionPersonaEmite, nombreCertificacion, contactoInstitucionPersona, documentoFisico, categoria, empleado)
VALUES ('C1', 123456, 'http://example.com/cert', TO_DATE('2022-01-01', 'YYYY-MM-DD'), TO_DATE('2023-01-01', 'YYYY-MM-DD'), 'A', 'Instituto Veterinario', 'Certificación Veterinaria', 5559876543, 'cert.pdf', 'V', 'E1');

INSERT INTO certificaciones (idCertificacion, numRegistroCertificacion, urlCertificacion, fechaEmision, fechaVencimiento, tipoCertificacion, institucionPersonaEmite, nombreCertificacion, contactoInstitucionPersona, documentoFisico, categoria, empleado)
VALUES ('CERTI2222222222', 789012, 'htexample.com/cert2', TO_DATE('2022-02-01', 'YYYY-MM-DD'), TO_DATE('2023-02-01', 'YYYY-MM-DD'), 'A', 'Asociación Médica', 'Certificación Cirugía', 5551234567, 'cert2.pdf', 'C', 'E2');

INSERT INTO certificaciones (idCertificacion, numRegistroCertificacion, urlCertificacion, fechaEmision, fechaVencimiento, tipoCertificacion, institucionPersonaEmite, nombreCertificacion, contactoInstitucionPersona, documentoFisico, categoria, empleado)
VALUES ('CERTI3333333333', 456789, 'http://example.com/cert3', TO_DATE('2022-03-01', 'YYYY-MM-DD'), TO_DATE('2023-03-01', 'YYYY-MM-DD'), 'W', 'Instituto de Análisis', 'Certificación Laboratorio', 5552223333, 'cert3.pdf', 'L', 'E3');

INSERT INTO servicios (idServicio, nombre, costo, empleado, tipo, fecha, fechaFin, paciente, estado, duracionEstimada, observaciones)
VALUES ('S1', 'Consulta General', 50.00, 'E1', 'M', TO_DATE('2022-01-02', 'YYYY-MM-DD'), TO_DATE('2022-01-02', 'YYYY-MM-DD'), 'P1', 'C', 30, 'Ninguna');

INSERT INTO servicios (idServicio, nombre, costo, empleado, tipo, fecha, fechaFin, paciente, estado, duracionEstimada, observaciones)
VALUES ('S22222222222222', 'Vacunación', 30.00, 'E2', 'M', TO_DATE('2022-02-15', 'YYYY-MM-DD'), TO_DATE('2022-02-15', 'YYYY-MM-DD'), 'P5678901234', 'W', 15, 'Vacuna contra la rabia');

INSERT INTO servicios (idServicio, nombre, costo, empleado, tipo, fecha, fechaFin, paciente, estado, duracionEstimada, observaciones)
VALUES ('S3', 'Cirugía de Emergencia', 200.00, 'E3', 'Q', TO_DATE('2022-03-20', 'YYYY-MM-DD'), TO_DATE('2022-03-21', 'YYYY-MM-DD'), 'P5678901234', 'F', 120, 'Apendicitis felina');



--DisparadoresOK

-- TriggerOK insert clientes
INSERT INTO clientes (documentoId, nombre, apellido, numTelefono, direccion, correoElectronico)
VALUES ('1234567890', 'John', 'Doe', '1234567890', '123 Main St', 'john.doe@example.com');

INSERT INTO clientes (documentoId, nombre, apellido, numTelefono, direccion, correoElectronico)
VALUES ('2345678901', 'Jane', 'Smith', '2345678901', '456 Oak St', 'jane.smith@example.com');

INSERT INTO clientes (documentoId, nombre, apellido, numTelefono, direccion, correoElectronico)
VALUES ('3456789012', 'Bob', 'Johnson', '3456789012', '789 Pine St', 'bob.johnson@example.com');

INSERT INTO clientes (documentoId, nombre, apellido, numTelefono, direccion, correoElectronico)
VALUES ('9876543210', 'Alice', 'Williams', '9876543210', '321 Elm St', 'alice.williams@example.com');

INSERT INTO clientes (documentoId, nombre, apellido, numTelefono, direccion, correoElectronico)
VALUES ('8765432109', 'Charlie', 'Brown', '8765432109', '654 Birch St', 'charlie.brown@example.com');

INSERT INTO clientes (documentoId, nombre, apellido, numTelefono, direccion, correoElectronico)
VALUES ('7654321098', 'Eva', 'Davis', '7654321098', '987 Maple St', 'eva.davis@example.com');

INSERT INTO clientes (documentoId, nombre, apellido, numTelefono, direccion, correoElectronico)
VALUES ('1122334455', 'Sophia', 'Martinez', '1122334455', '555 Cedar St', 'sophia.martinez@example.com');

INSERT INTO clientes (documentoId, nombre, apellido, numTelefono, direccion, correoElectronico)
VALUES ('2233445566', 'Liam', 'Taylor', '2233445566', '666 Pine St', 'liam.taylor@example.com');

INSERT INTO clientes (documentoId, nombre, apellido, numTelefono, direccion, correoElectronico)
VALUES ('3344556677', 'Olivia', 'Anderson', '3344556677', '777 Oak St', 'olivia.anderson@example.com');

INSERT INTO clientes (documentoId, nombre, apellido, numTelefono, direccion, correoElectronico)
VALUES ('4455667788', 'Noah', 'Miller', '4455667788', '888 Birch St', 'noah.miller@example.com');

--actualizar clientes
UPDATE clientes
SET nombre = 'UpdatedName'
WHERE documentoId = 'C1234567890';

UPDATE clientes
SET documentoId = 'C9999999999'
WHERE documentoId = 'C2345678901';

UPDATE clientes
SET activo = 'F'
WHERE documentoId = 'C3456789012';

DELETE FROM clientes
WHERE documentoid = 'C3456789012';

SELECT * from clientes;



---------triggers de directorio

INSERT INTO directorios (tipoAnimal, nombreRaza, origen, tamanoPromedio, esperanzaVida, caracteristicasFisicas, comportamientoCaracteristico, alimentacionRecomendada, enfermedadesComunes, regulacionLegal, habitad)
VALUES ('Perro', 'Labrador', 'Origen Labrador', 'Grande', 12, 'Pelaje corto, color negro', 'Amigable y juguetón', 'Balanceada', 'Dermatitis', 'S', 'Casa');

INSERT INTO directorios (tipoAnimal, nombreRaza, origen, tamanoPromedio, esperanzaVida, caracteristicasFisicas, comportamientoCaracteristico, alimentacionRecomendada, enfermedadesComunes, regulacionLegal, habitad)
VALUES ('Gato', 'Siamés', 'Origen Siamés', 'Mediano', 15, 'Pelaje corto, color beige', 'Independiente y curioso', 'Balanceada', 'Parásitos intestinales', 'S', 'Casa');

INSERT INTO directorios (tipoAnimal, nombreRaza, origen, tamanoPromedio, esperanzaVida, caracteristicasFisicas, comportamientoCaracteristico, alimentacionRecomendada, enfermedadesComunes, regulacionLegal, habitad)
VALUES ('Reptil', 'Iguana', 'América Central', 'Mediano', 10, 'Escamas, color verde', 'Tranquilo y territorial', 'Vegetariana', 'Desnutrición', 'S', 'Terrario');

INSERT INTO directorios (tipoAnimal, nombreRaza, origen, tamanoPromedio, esperanzaVida, caracteristicasFisicas, comportamientoCaracteristico, alimentacionRecomendada, enfermedadesComunes, regulacionLegal, habitad)
VALUES ('Roedor', 'Hámster', 'Origen Siria', 'Pequeño', 2, 'Pelaje corto, color marrón', 'Nocturno y curioso', 'Semillas y frutas', 'Obesidad', 'S', 'Jaula');

INSERT INTO directorios (tipoAnimal, nombreRaza, origen, tamanoPromedio, esperanzaVida, caracteristicasFisicas, comportamientoCaracteristico, alimentacionRecomendada, enfermedadesComunes, regulacionLegal, habitad)
VALUES ('Conejo', 'Holandés', 'Origen Países Bajos', 'Mediano', 8, 'Pelaje corto, color blanco y negro', 'Sociable y juguetón', 'Heno y verduras', 'Maloclusión dental', 'S', 'Jaula');

INSERT INTO directorios (tipoAnimal, nombreRaza, origen, tamanoPromedio, esperanzaVida, caracteristicasFisicas, comportamientoCaracteristico, alimentacionRecomendada, enfermedadesComunes, regulacionLegal, habitad)
VALUES ('Pez', 'Betta', 'Sudeste Asiático', 'Pequeño', 3, 'Colores variados', 'Agresivo y territorial', 'Alimentos específicos para bettas', 'Enfermedades parasitarias', 'S', 'Acuario');

INSERT INTO directorios (tipoAnimal, nombreRaza, origen, tamanoPromedio, esperanzaVida, caracteristicasFisicas, comportamientoCaracteristico, alimentacionRecomendada, enfermedadesComunes, regulacionLegal, habitad)
VALUES ('Roedor', 'Cobaya', 'América del Sur', 'Mediano', 5, 'Pelaje largo, variedad de colores', 'Sociable y tranquilo', 'Heno, frutas y verduras', 'Infecciones respiratorias', 'S', 'Jaula');

INSERT INTO directorios (tipoAnimal, nombreRaza, origen, tamanoPromedio, esperanzaVida, caracteristicasFisicas, comportamientoCaracteristico, alimentacionRecomendada, enfermedadesComunes, regulacionLegal, habitad)
VALUES ('Roedor', 'Ratón', 'Procedencia incierta', 'Pequeño', 2, 'Pelaje corto, colores variados', 'Curioso y ágil', 'Semillas y proteínas', 'Enfermedades respiratorias', 'S', 'Jaula');

INSERT INTO directorios (tipoAnimal, nombreRaza, origen, tamanoPromedio, esperanzaVida, caracteristicasFisicas, comportamientoCaracteristico, alimentacionRecomendada, enfermedadesComunes, regulacionLegal, habitad)
VALUES ('Roedor', 'Cuyo', 'América del Sur', 'Mediano', 6, 'Pelaje largo, variedad de colores', 'Sociable y juguetón', 'Heno, frutas y verduras', 'Problemas dentales', 'S', 'Jaula');

INSERT INTO directorios (tipoAnimal, nombreRaza, origen, tamanoPromedio, esperanzaVida, caracteristicasFisicas, comportamientoCaracteristico, alimentacionRecomendada, enfermedadesComunes, regulacionLegal, habitad)
VALUES ('Conejo', 'Angora', 'Turquía', 'Mediano', 7, 'Pelaje largo y suave', 'Tranquilo y cariñoso', 'Heno y verduras', 'Obesidad', 'S', 'Jaula');

INSERT INTO directorios (tipoAnimal, nombreRaza, origen, tamanoPromedio, esperanzaVida, caracteristicasFisicas, comportamientoCaracteristico, alimentacionRecomendada, enfermedadesComunes, regulacionLegal, habitad)
VALUES ('Conejo', 'Californiano', 'Estados Unidos', 'Mediano', 8, 'Pelaje corto, blanco y negro', 'Energético y juguetón', 'Heno y pellets', 'Maloclusión dental', 'S', 'Jaula');

INSERT INTO directorios (tipoAnimal, nombreRaza, origen, tamanoPromedio, esperanzaVida, caracteristicasFisicas, comportamientoCaracteristico, alimentacionRecomendada, enfermedadesComunes, regulacionLegal, habitad)
VALUES ('Conejo', 'Rex', 'Francia', 'Pequeño', 6, 'Pelaje corto y suave', 'Sociable y curioso', 'Heno y verduras', 'Problemas de espalda', 'S', 'Jaula');

INSERT INTO directorios (tipoAnimal, nombreRaza, origen, tamanoPromedio, esperanzaVida, caracteristicasFisicas, comportamientoCaracteristico, alimentacionRecomendada, enfermedadesComunes, regulacionLegal, habitad)
VALUES ('Pez', 'Guppy', 'América del Sur', 'Pequeño', 2, 'Colores variados', 'Pacífico y activo', 'Alimentos específicos para guppies', 'Enfermedades parasitarias', 'S', 'Acuario');

INSERT INTO directorios (tipoAnimal, nombreRaza, origen, tamanoPromedio, esperanzaVida, caracteristicasFisicas, comportamientoCaracteristico, alimentacionRecomendada, enfermedadesComunes, regulacionLegal, habitad)
VALUES ('Pez', 'Tetra Neón', 'América del Sur', 'Pequeño', 5, 'Color azul eléctrico', 'Pacífico y gregario', 'Alimentos en escamas y vivos', 'Enfermedades bacterianas', 'S', 'Acuario');

INSERT INTO directorios (tipoAnimal, nombreRaza, origen, tamanoPromedio, esperanzaVida, caracteristicasFisicas, comportamientoCaracteristico, alimentacionRecomendada, enfermedadesComunes, regulacionLegal, habitad)
VALUES ('Pez', 'Goldfish', 'Asia Oriental', 'Mediano', 10, 'Colores variados', 'Sociable y glotón', 'Alimentos específicos para goldfish', 'Enfermedades de vejiga natatoria', 'S', 'Acuario');

INSERT INTO directorios (tipoAnimal, nombreRaza, origen, tamanoPromedio, esperanzaVida, caracteristicasFisicas, comportamientoCaracteristico, alimentacionRecomendada, enfermedadesComunes, regulacionLegal, habitad)
VALUES ('Perro', 'Labrador Retriever', 'Reino Unido', 'Grande', 12, 'Pelaje corto y denso', 'Amigable y juguetón', 'Alimento balanceado para perros', 'Displasia de cadera', 'S', 'Casa con patio');

INSERT INTO directorios (tipoAnimal, nombreRaza, origen, tamanoPromedio, esperanzaVida, caracteristicasFisicas, comportamientoCaracteristico, alimentacionRecomendada, enfermedadesComunes, regulacionLegal, habitad)
VALUES ('Perro', 'Bulldog Francés', 'Francia', 'Pequeño', 10, 'Cuerpo compacto, orejas grandes', 'Relajado y afectuoso', 'Alimento específico para bulldogs', 'Problemas respiratorios', 'S', 'Apartamento');

INSERT INTO directorios (tipoAnimal, nombreRaza, origen, tamanoPromedio, esperanzaVida, caracteristicasFisicas, comportamientoCaracteristico, alimentacionRecomendada, enfermedadesComunes, regulacionLegal, habitad)
VALUES ('Perro', 'Border Collie', 'Reino Unido', 'Mediano', 14, 'Pelaje doble, variado en colores', 'Inteligente y activo', 'Alimento balanceado de alta calidad', 'Epilepsia', 'S', 'Casa con jardín');

INSERT INTO directorios (tipoAnimal, nombreRaza, origen, tamanoPromedio, esperanzaVida, caracteristicasFisicas, comportamientoCaracteristico, alimentacionRecomendada, enfermedadesComunes, regulacionLegal, habitad)
VALUES ('Gato', 'Siames', 'Tailandia', 'Mediano', 15, 'Pelaje corto, color claro y oscuro', 'Sociable y vocal', 'Alimento específico para gatos', 'Enfermedades renales', 'S', 'Interior con juguetes');

INSERT INTO directorios (tipoAnimal, nombreRaza, origen, tamanoPromedio, esperanzaVida, caracteristicasFisicas, comportamientoCaracteristico, alimentacionRecomendada, enfermedadesComunes, regulacionLegal, habitad)
VALUES ('Gato', 'Maine Coon', 'Estados Unidos', 'Grande', 12, 'Pelaje largo y tupido', 'Docil y amigable', 'Alimento balanceado para gatos', 'Cardiomiopatía', 'S', 'Casa con espacio para trepar');

INSERT INTO directorios (tipoAnimal, nombreRaza, origen, tamanoPromedio, esperanzaVida, caracteristicasFisicas, comportamientoCaracteristico, alimentacionRecomendada, enfermedadesComunes, regulacionLegal, habitad)
VALUES ('Gato', 'Persa', 'Irán', 'Pequeño', 14, 'Pelaje largo y sedoso', 'Tranquilo y cariñoso', 'Alimento específico para gatos', 'Problemas respiratorios', 'S', 'Interior con cuidados especiales');

INSERT INTO directorios (tipoAnimal, nombreRaza, origen, tamanoPromedio, esperanzaVida, caracteristicasFisicas, comportamientoCaracteristico, alimentacionRecomendada, enfermedadesComunes, regulacionLegal, habitad)
VALUES ('Reptil', 'Iguana', 'América Central y del Sur', 'Grande', 20, 'Escamas y cola larga', 'Sociable y territorial', 'Frutas, verduras y grillos', 'Problemas metabólicos', 'S', 'Terrario con iluminación');

INSERT INTO directorios (tipoAnimal, nombreRaza, origen, tamanoPromedio, esperanzaVida, caracteristicasFisicas, comportamientoCaracteristico, alimentacionRecomendada, enfermedadesComunes, regulacionLegal, habitad)
VALUES ('Reptil', 'Tortuga de Tierra', 'Varios lugares', 'Mediano', 50, 'Caparazón y patas fuertes', 'Tranquila y herbívora', 'Vegetales y frutas', 'Obesidad', 'S', '�?rea con sustrato y escondites');

INSERT INTO directorios (tipoAnimal, nombreRaza, origen, tamanoPromedio, esperanzaVida, caracteristicasFisicas, comportamientoCaracteristico, alimentacionRecomendada, enfermedadesComunes, regulacionLegal, habitad)
VALUES ('Reptil', 'Serpiente de Maíz', 'América del Norte', 'Pequeño', 15, 'Escamas suaves y colores variados', 'Solitaria y cazadora', 'Ratones y aves pequeñas', 'Problemas digestivos', 'S', 'Terrario con escondite');

UPDATE directorios
SET idRazaEspecie = 'P0000000002'
WHERE idRazaEspecie = 'P0000000000000001';

UPDATE directorios
SET nombreRaza = 'Golden Retriever'
WHERE idRazaEspecie = 'P0000000000000001';

UPDATE directorios
SET tipoAnimal = 'Gato'
WHERE idRazaEspecie = 'P0000000000000001';

UPDATE directorios
SET origen = 'Nuevo Origen'
WHERE idRazaEspecie = 'P0000000000000001';

UPDATE directorios
SET tamanoPromedio = 'Mediano'
WHERE idRazaEspecie = 'G0000000000000001';

UPDATE directorios
SET esperanzaVida = 15
WHERE idRazaEspecie = 'R0000000000000001';

DELETE FROM directorios WHERE idRazaEspecie = 'P0000000000000001';

select * from directorios;
-----trigger pacientes
select * from clientes;
-- Inserts para la tabla pacientes
INSERT INTO pacientes (cliente, nombrePac, especie, raza, peso, sexo, edad, comportamiento, fechaNacimiento, numeroChip, esterilizado)
VALUES ('C1234567890', 'Max', 'Perro', 'P0000000000000001', 30.5, 'M', 3, 'Juguetón', TO_DATE('2020-05-15', 'YYYY-MM-DD'), 'ABC123456712389', 'T');


INSERT INTO pacientes (cliente, nombrePac, especie, raza, peso, sexo, edad, comportamiento, fechaNacimiento, numeroChip, esterilizado)
VALUES ('C3456789012', 'Buddy', 'Perro', 'P0000000000000003', 22.8, 'M', 4, 'Leal', TO_DATE('2019-10-10', 'YYYY-MM-DD'), NULL, 'F');

INSERT INTO pacientes (cliente, nombrePac, especie, raza, peso, sexo, edad, comportamiento, fechaNacimiento, numeroChip, esterilizado)
VALUES ('C9876543210', 'Mittens', 'Gato', 'G0000000000000003', 6.5, 'H', 3, 'Curioso', TO_DATE('2020-12-01', 'YYYY-MM-DD'), 'JKL456789012564', 'T');

INSERT INTO pacientes (cliente, nombrePac, especie, raza, peso, sexo, edad, comportamiento, fechaNacimiento, numeroChip, esterilizado)
VALUES ('C8765432109', 'Nibbles', 'Roedor', 'Z0000000000000002', 0.2, 'H', 1, 'Pequeño y Juguetón', TO_DATE('2022-02-01', 'YYYY-MM-DD'), 'MNO567890123123', 'F');

INSERT INTO pacientes (cliente, nombrePac, especie, raza, peso, sexo, edad, comportamiento, fechaNacimiento, numeroChip, esterilizado)
VALUES ('C7654321098', 'Oreo', 'Perro', 'P0000000000000001', 25.0, 'M', 2, 'Energético', TO_DATE('2021-06-18', 'YYYY-MM-DD'), 'PQR678901234456', 'T');

INSERT INTO pacientes (cliente, nombrePac, especie, raza, peso, sexo, edad, comportamiento, fechaNacimiento, numeroChip, esterilizado)
VALUES ('C1122334455', 'Snickers', 'Roedor', 'Z0000000000000004', 1.5, 'H', 1, 'Cauteloso', TO_DATE('2022-01-10', 'YYYY-MM-DD'), 'STU789012345789', 'F');

SELECT * FROM pacientes;

---TRIGGER EMPLEADO 

INSERT INTO empleados (IDEMPLEADO, nombre, apellido, correoElectronico, numeroTelefono,  fechaNacimiento, salario, empleado)
VALUES ('1234567890', 'Nuevo', 'Empleado', 'nuevo.empleado@dominio.com', '9876543210', TO_DATE('1995-05-15', 'YYYY-MM-DD'), 60000, 'V');

INSERT INTO empleados (IDEMPLEADO, nombre, apellido, correoElectronico, numeroTelefono, fechaNacimiento, salario, empleado)
VALUES ('2345678901', 'Empleado1', 'Apellido1', 'empleado1@dominio.com', '1234567890', TO_DATE('1990-01-01', 'YYYY-MM-DD'), 55000, 'V');

INSERT INTO empleados (IDEMPLEADO, nombre, apellido, correoElectronico, numeroTelefono, fechaNacimiento, salario, empleado)
VALUES ('3456789012', 'Empleado2', 'Apellido2', 'empleado2@dominio.com', '2345678901', TO_DATE('1985-02-15', 'YYYY-MM-DD'), 60000, 'A');

INSERT INTO empleados (IDEMPLEADO, nombre, apellido, correoElectronico, numeroTelefono, fechaNacimiento, salario, empleado)
VALUES ('4567890123', 'Empleado3', 'Apellido3', 'empleado3@dominio.com', '3456789012', TO_DATE('1992-03-20', 'YYYY-MM-DD'), 62000, 'R');

INSERT INTO empleados (IDEMPLEADO, nombre, apellido, correoElectronico, numeroTelefono, fechaNacimiento, salario, empleado)
VALUES ('5678901234', 'Empleado4', 'Apellido4', 'empleado4@dominio.com', '4567890123', TO_DATE('1988-04-10', 'YYYY-MM-DD'), 58000, 'G');

INSERT INTO empleados (IDEMPLEADO, nombre, apellido, correoElectronico, numeroTelefono, fechaNacimiento, salario, empleado)
VALUES ('6789012345', 'Empleado5', 'Apellido5', 'empleado5@dominio.com', '5678901234', TO_DATE('1993-05-25', 'YYYY-MM-DD'), 63000, 'L');

INSERT INTO empleados (IDEMPLEADO, nombre, apellido, correoElectronico, numeroTelefono, fechaNacimiento, salario, empleado)
VALUES ('7890123456', 'Empleado6', 'Apellido6', 'empleado6@dominio.com', '6789012345', TO_DATE('1987-06-05', 'YYYY-MM-DD'), 60000, 'P');

INSERT INTO empleados (IDEMPLEADO, nombre, apellido, correoElectronico, numeroTelefono, fechaNacimiento, salario, empleado)
VALUES ('8901234567', 'Empleado7', 'Apellido7', 'empleado7@dominio.com', '7890123456', TO_DATE('1995-07-15', 'YYYY-MM-DD'), 65000, 'B');

INSERT INTO empleados (IDEMPLEADO, nombre, apellido, correoElectronico, numeroTelefono, fechaNacimiento, salario, empleado)
VALUES ('9012345678', 'Empleado8', 'Apellido8', 'empleado8@dominio.com', '8901234567', TO_DATE('1991-08-20', 'YYYY-MM-DD'), 59000, 'V');

--

INSERT INTO horarioEmpleados (empleado, fechaInicio, fechaFin, diaSemana, ocupado, rol) 
VALUES ('E1234567890', GREATEST(SYSTIMESTAMP, SYSTIMESTAMP + INTERVAL '1' HOUR), GREATEST(SYSTIMESTAMP, SYSTIMESTAMP + INTERVAL '2' HOUR), 'L', 'F', 'U');
INSERT INTO horarioEmpleados (empleado, fechaInicio, fechaFin, diaSemana, ocupado, rol) 
VALUES ('E2345678901', GREATEST(SYSTIMESTAMP, SYSTIMESTAMP + INTERVAL '2' HOUR), GREATEST(SYSTIMESTAMP, SYSTIMESTAMP + INTERVAL '3' HOUR), 'M', 'F', 'A');

INSERT INTO horarioEmpleados (empleado, fechaInicio, fechaFin, diaSemana, ocupado, rol) 
VALUES ('E3456789012', GREATEST(SYSTIMESTAMP, SYSTIMESTAMP + INTERVAL '3' HOUR), GREATEST(SYSTIMESTAMP, SYSTIMESTAMP + INTERVAL '4' HOUR), 'W', 'T', 'U');

INSERT INTO horarioEmpleados (empleado, fechaInicio, fechaFin, diaSemana, ocupado, rol) 
VALUES ('E4567890123', GREATEST(SYSTIMESTAMP, SYSTIMESTAMP + INTERVAL '4' HOUR), GREATEST(SYSTIMESTAMP, SYSTIMESTAMP + INTERVAL '5' HOUR), 'J', 'F', 'A');

INSERT INTO horarioEmpleados (empleado, fechaInicio, fechaFin, diaSemana, ocupado, rol) 
VALUES ('E5678901234', GREATEST(SYSTIMESTAMP, SYSTIMESTAMP + INTERVAL '5' HOUR), GREATEST(SYSTIMESTAMP, SYSTIMESTAMP + INTERVAL '6' HOUR), 'V', 'T', 'U');

INSERT INTO horarioEmpleados (empleado, fechaInicio, fechaFin, diaSemana, ocupado, rol) 
VALUES ('E6789012345', GREATEST(SYSTIMESTAMP, SYSTIMESTAMP + INTERVAL '6' HOUR), GREATEST(SYSTIMESTAMP, SYSTIMESTAMP + INTERVAL '7' HOUR), 'S', 'F', 'A');

--CERTIFICACIONES 
INSERT INTO certificaciones (numRegistroCertificacion, urlCertificacion, fechaEmision, tipoCertificacion, institucionPersonaEmite, nombreCertificacion, contactoInstitucionPersona, documentoFisico, categoria, empleado)
VALUES (123456789, 'https://example.com/certification', TO_DATE('2023-12-15', 'YYYY-MM-DD'), 'A', 'Instituto XYZ', 'Certificación XYZ', 9876543210, 'path/to/document.pdf', 'B', 'E1234567890');

INSERT INTO certificaciones (numRegistroCertificacion, urlCertificacion, fechaEmision, tipoCertificacion, institucionPersonaEmite, nombreCertificacion, contactoInstitucionPersona, documentoFisico, categoria, empleado)
VALUES (234567890, 'https://example.com/certification2', TO_DATE('2023-12-16', 'YYYY-MM-DD'), 'F', 'Instituto ABC', 'Certificación ABC', 8765432109, 'path/to/document2.pdf', 'C', 'E2345678901');

INSERT INTO certificaciones (numRegistroCertificacion, urlCertificacion, fechaEmision, tipoCertificacion, institucionPersonaEmite, nombreCertificacion, contactoInstitucionPersona, documentoFisico, categoria, empleado)
VALUES (345678901, 'https://example.com/certification3', TO_DATE('2023-12-17', 'YYYY-MM-DD'), 'I', 'Instituto DEF', 'Certificación DEF', 7654321098, 'path/to/document3.pdf', 'A', 'E3456789012');

INSERT INTO certificaciones (numRegistroCertificacion, urlCertificacion, fechaEmision, tipoCertificacion, institucionPersonaEmite, nombreCertificacion, contactoInstitucionPersona, documentoFisico, categoria, empleado)
VALUES (456789012, 'https://example.com/certification4', TO_DATE('2023-12-18', 'YYYY-MM-DD'), 'A', 'Instituto GHI', 'Certificación GHI', 6543210987, 'path/to/document4.pdf', 'D', 'E4567890123');

INSERT INTO certificaciones (numRegistroCertificacion, urlCertificacion, fechaEmision, tipoCertificacion, institucionPersonaEmite, nombreCertificacion, contactoInstitucionPersona, documentoFisico, categoria, empleado)
VALUES (567890123, 'https://example.com/certification5', TO_DATE('2023-12-19', 'YYYY-MM-DD'), 'I', 'Instituto JKL', 'Certificación JKL', 5432109876, 'path/to/document5.pdf', 'E', 'E5678901234');

INSERT INTO certificaciones (numRegistroCertificacion, urlCertificacion, fechaEmision, tipoCertificacion, institucionPersonaEmite, nombreCertificacion, contactoInstitucionPersona, documentoFisico, categoria, empleado)
VALUES (678901234, 'https://example.com/certification6', TO_DATE('2023-12-20', 'YYYY-MM-DD'), 'F', 'Instituto MNO', 'Certificación MNO', 4321098765, 'path/to/document6.pdf', 'F', 'E6789012345');


SELECT * FROM EMPLEADOS;
-- Actualización válida (correoElectronico y salario)
UPDATE EMPLEADOS SET correoElectronico = 'nuevo.correo@dominio.com', salario = 70000 WHERE IDEMPLEADO = 'E1234567890';

-- Intento de actualizar el número de teléfono
UPDATE EMPLEADOS SET numeroTelefono = '9876543210' WHERE IDEMPLEADO = 'E9012345678';

-- Intento de actualizar el estadoEmpleado
UPDATE EMPLEADOS SET estadoEmpleado = 'D' WHERE IDEMPLEADO = 'E1234567890';

-- Intento de actualizar correoElectronico, número de teléfono y salario al mismo tiempo (debería fallar)
UPDATE EMPLEADOS SET correoElectronico = 'otro.correo@dominio.com', numeroTelefono = '1234567890', salario = 80000 WHERE IDEMPLEADO = 'E1234567890';

-- Intento de actualizar salario y estadoEmpleado al mismo tiempo 
UPDATE EMPLEADOS SET salario = 90000, estadoEmpleado = 'D' WHERE IDEMPLEADO = 'E1234567890';

-- Actualización válida 
UPDATE EMPLEADOS SET salario = 75000 WHERE IDEMPLEADO = 'E1234567890';

-- Intento de actualizar el estadoEmpleado sin despedir al empleado 
UPDATE EMPLEADOS SET estadoEmpleado = 'A' WHERE IDEMPLEADO = 'E1234567890';

-- Intento de actualizar el IDEMPLEADO 
UPDATE EMPLEADOS SET IDEMPLEADO = 'E9876543210' WHERE IDEMPLEADO = 'E1234567890';

UPDATE EMPLEADOS SET estadoEmpleado = 'D' WHERE IDEMPLEADO =  'E1234567890';
-- Intento de eliminar un empleado 
DELETE FROM EMPLEADOS WHERE IDEMPLEADO = 'E1234567890';
---------------------------------------------------------------------TRIGGERS SERVICO-----------------------------------------------------------------------------------
INSERT INTO servicios (costo, empleado, tipo, fecha, paciente, estado, observaciones)
VALUES (50.00, 'E1234567890', 'C', TO_DATE('2023-12-20 15:30:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 'F', NULL);
INSERT INTO servicios (costo, empleado, tipo, fecha, paciente, estado, observaciones)
VALUES (50.00, 'E1234567890', 'C', TO_DATE('2023-12-20 20:30:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 'F', NULL);
---EL EMPLEADO YA TIENE DOS CIRUGIAS, NO PUEDE TENER MAS DE DOS CIRUGIAS
INSERT INTO servicios (costo, empleado, tipo, fecha, paciente, estado, observaciones)
VALUES (50.00, 'E1234567890', 'C', TO_DATE('2023-12-20 12:30:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 'F', NULL);
---adicionar 5 SERVICOS DE OTRO TIPO
INSERT INTO servicios (costo, empleado, tipo, fecha, paciente, estado, observaciones)
VALUES (50.00, 'E1234567890', 'L', TO_DATE('2023-12-19 09:30:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 'F', NULL);
INSERT INTO servicios (costo, empleado, tipo, fecha, paciente, estado, observaciones)
VALUES (50.00, 'E1234567890', 'L', TO_DATE('2023-12-19 5:30:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 'F', NULL);
INSERT INTO servicios (costo, empleado, tipo, fecha, paciente, estado, observaciones)
VALUES (50.00, 'E1234567890', 'M', TO_DATE('2023-12-19 02:30:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 'F', NULL);
INSERT INTO servicios (costo, empleado, tipo, fecha, paciente, estado, observaciones)
VALUES (30.00, 'E1234567890', 'L', TO_DATE('2023-12-19 00:30:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 'F', NULL);
INSERT INTO servicios (costo, empleado, tipo, fecha, paciente, estado, observaciones)
VALUES (30.00, 'E1234567890', 'L', TO_DATE('2023-12-19 01:30:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 'F', NULL);

SELECT * FROM SERVICIOS;

--------------------
-- Inserta 15 servicios de tipo 'C' para el mismo empleado en un solo d�a
DECLARE
    fecha_inicio DATE := TO_DATE('2023-12-18 09:00:00', 'YYYY-MM-DD HH24:MI:SS');
    fecha_fin DATE := TO_DATE('2023-12-18 23:00:00', 'YYYY-MM-DD HH24:MI:SS');
BEGIN
    FOR i IN 1..15 LOOP
        INSERT INTO servicios (costo, empleado, tipo, fecha, paciente, estado, observaciones)
        VALUES (30.00, 'E5678901234', 'M', fecha_inicio + (i-1)*(1/24), NULL, 'F', NULL);
    END LOOP;
END;
/



-- Deber�a mostrar un mensaje de error por la condici�n VETERINARIOCIRU > 14

------------------------
INSERT INTO servicios (costo, empleado, tipo, fecha, paciente, estado, observaciones)
VALUES (30.00, 'E1234567890', 'L', TO_DATE('2023-12-16 06:30:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 'F', NULL);

INSERT INTO servicios (costo, empleado, tipo, fecha, paciente, estado, observaciones)
VALUES (30.00, 'E1234567890', 'M', TO_DATE('2023-12-16 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 'F', NULL);

INSERT INTO servicios (costo, empleado, tipo, fecha, paciente, estado, observaciones)
VALUES (30.00, 'E1234567890', 'L', TO_DATE('2023-12-16 00:00:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 'F', NULL);

INSERT INTO servicios (costo, empleado, tipo, fecha, paciente, estado, observaciones)
VALUES (30.00, 'E1234567890', 'V', TO_DATE('2023-12-16 00:40:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 'F', NULL);

INSERT INTO servicios (costo, empleado, tipo, fecha, paciente, estado, observaciones)
VALUES (30.00, 'E1234567890', 'M', TO_DATE('2023-12-16 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 'F', NULL);

INSERT INTO servicios (costo, empleado, tipo, fecha, paciente, estado, observaciones)
VALUES (30.00, 'E1234567890', 'C', TO_DATE('2023-12-16 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 'F', NULL);

INSERT INTO servicios (costo, empleado, tipo, fecha, paciente, estado, observaciones)
VALUES (30.00, 'E1234567890', 'C', TO_DATE('2023-12-16 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 'F', NULL);
----------------------completo su agenda no puede hacer este servicio
INSERT INTO servicios (costo, empleado, tipo, fecha, paciente, estado, observaciones)
VALUES (30.00, 'E1234567890', 'L', TO_DATE('2023-12-16 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 'F', NULL);

-------SERVICIO EN TIEMPO DE OTRO SERVICIO
INSERT INTO servicios (costo, empleado, tipo, fecha, paciente, estado, observaciones)
VALUES (30.00, 'E2345678901', 'L', TO_DATE('2023-12-20 09:10:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 'F', NULL);

INSERT INTO servicios (costo, empleado, tipo, fecha, paciente, estado, observaciones)
VALUES (30.00, 'E2345678901', 'M', TO_DATE('2023-12-20 10:25:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 'F', NULL);

INSERT INTO servicios (costo, empleado, tipo, fecha, paciente, estado, observaciones)
VALUES (30.00, 'E2345678901', 'C', TO_DATE('2023-12-20 12:10:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 'F', NULL);

INSERT INTO servicios (costo, empleado, tipo, fecha, paciente, estado, observaciones)
VALUES (30.00, 'E2345678901', 'C', TO_DATE('2023-12-21 22:25:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 'F', NULL);

INSERT INTO servicios (costo, empleado, tipo, fecha, paciente, estado, observaciones)
VALUES (30.00, 'E2345678901', 'C', TO_DATE('2023-12-20 22:25:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 'F', NULL);

INSERT INTO servicios (costo, empleado, tipo, fecha, paciente, estado, observaciones)
VALUES (30.00, 'E2345678901', 'C', TO_DATE('2023-12-15 22:25:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 'F', NULL);

INSERT INTO servicios (costo, empleado, tipo, fecha, paciente, estado, observaciones)
VALUES (30.00, 'E2345678901', 'V', TO_DATE('2023-12-15 16:25:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 'F', NULL);

INSERT INTO servicios (costo, empleado, tipo, fecha, paciente, estado, observaciones)
VALUES (30.00, 'E2345678901', 'V', TO_DATE('2023-12-17 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 'F', NULL);

INSERT INTO servicios (costo, empleado, tipo, fecha, paciente, estado, observaciones)
VALUES (30.00, 'E2345678901', 'V', TO_DATE('2023-12-17 13:30:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 'F', NULL);

INSERT INTO servicios (costo, empleado, tipo, fecha, paciente, estado, observaciones)
VALUES (30.00, 'E2345678901', 'V', TO_DATE('2023-12-17 16:45:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 'F', NULL);

INSERT INTO servicios (costo, empleado, tipo, fecha, paciente, estado, observaciones)
VALUES (30.00, 'E2345678901', 'C', TO_DATE('2023-12-17 11:15:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 'F', NULL);

INSERT INTO servicios (costo, empleado, tipo, fecha, paciente, estado, observaciones)
VALUES (40.00, 'E4567890123', 'L', TO_DATE('2023-12-17 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 'F', NULL);

INSERT INTO servicios (costo, empleado, tipo, fecha, paciente, estado, observaciones)
VALUES (40.00, 'E4567890123', 'L', TO_DATE('2023-12-17 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 'F', NULL);

INSERT INTO servicios (costo, empleado, tipo, fecha, paciente, estado, observaciones)
VALUES (40.00, 'E4567890123', 'L', TO_DATE('2023-12-17 00:45:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 'F', NULL);

INSERT INTO servicios (costo, empleado, tipo, fecha, paciente, estado, observaciones)
VALUES (30.00, 'E4567890123', 'V', TO_DATE('2023-12-18 12:50:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 'F', NULL);


INSERT INTO citas (idServicio)
VALUES ('S0000000005');

INSERT INTO citas (idServicio)
VALUES ('S0000000011');

INSERT INTO citas (idServicio)
VALUES ('S0000000022');
-------------ESTE SERVICIO NO ES UNA CITA MEDICA
INSERT INTO citas (idServicio)
VALUES ('S0000000007');
-------------
INSERT INTO LABORATORIOS (idServicio)
VALUES ('S0000000004');

INSERT INTO VACUNAS (idServicio)
VALUES ('S0000000026');

INSERT INTO VACUNAS (idServicio)
VALUES ('S0000000034');

---------ASIGNACION DE UN SERVICIO A UN PACIENTE 
UPDATE servicios
SET estado = 'C', paciente = 'Paciente1'
WHERE idservicio = 'S0000000001';

-- Insertar otro servicio para luego actualizarlo
INSERT INTO servicios (costo, empleado, tipo, fecha, paciente, estado, observaciones)
VALUES (30.00, 'E2345678901', 'C', TO_DATE('2023-12-21 22:25:00', 'YYYY-MM-DD HH24:MI:SS'), NULL, 'F', NULL);

UPDATE servicios
SET estado = 'T', paciente = 'P0000000001'
WHERE idservicio = 'S0000000002';

UPDATE servicios
SET estado = 'T', paciente = 'P0000000006'
WHERE idservicio = 'S0000000002';

UPDATE servicios
SET estado = 'T', paciente = 'P0000000006'
WHERE idservicio = 'S0000000034';

DELETE FROM servicios
WHERE idservicio = 'S0000000005';


DELETE FROM servicios
WHERE idservicio = 'S0000000003';

SELECT * FROM SERVICIOS;

SELECT * FROM CITAS;
SELECT * FROM EMPLEADOS;
SELECT * FROM CITAS;
SELECT * FROM pacientes;
SELECT * FROM HORARIOEMPLEADOS;

DELETE FROM HORARIOEMPLEADOS 
WHERE EMPLEADO = 'E1234567890';

DELETE FROM HORARIOEMPLEADOS 
WHERE EMPLEADO = 'E2345678901';

SELECT * FROM EMPLEADOS;

-----------------------triggers de 

TRUNCATE TABLE guarderias CASCADE;
TRUNCATE TABLE historial CASCADE;
TRUNCATE TABLE laboratorios CASCADE;
TRUNCATE TABLE cirugias CASCADE;
TRUNCATE TABLE vacunas CASCADE;
TRUNCATE TABLE citas CASCADE;
TRUNCATE TABLE servicios CASCADE;
TRUNCATE TABLE pacientes CASCADE;
TRUNCATE TABLE clientes CASCADE;
TRUNCATE TABLE horarioEmpleados CASCADE;
TRUNCATE TABLE certificaciones CASCADE;
TRUNCATE TABLE empleados CASCADE;
TRUNCATE TABLE directorios CASCADE;
