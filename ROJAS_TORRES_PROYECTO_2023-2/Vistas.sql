CREATE OR REPLACE VIEW VVacunasMascota AS
    SELECT s.idServicio AS idServicio, s.nombre AS nombre, s.costo AS costo, v.dosis AS numeroDosis, v.lote AS lote
    FROM servicios s, vacunas v
    WHERE s.tipo = 'V';

CREATE OR REPLACE VIEW VServicioProx AS
    SELECT s.idServicio AS idServicio, s.tipo AS tipo, s.nombre AS nombre, s.paciente AS idPaciente, c.fechaProxima AS fechaProxima
    FROM servicios s
    JOIN citas c ON s.idServicio = c.idServicio
    ORDER BY fechaProxima;
    
CREATE OR REPLACE VIEW VSPacientesDia AS
    SELECT s.idServicio AS idServicio, s.paciente AS idPaciente, s.nombre AS servicio
    FROM servicios s
    WHERE TRUNC(s.fecha) = TRUNC(SYSDATE);

------indices--------

CREATE INDEX idx_estado_cliente
ON Clientes (activo);

CREATE INDEX idx_estado_paciente
ON pacientes (activo);

CREATE INDEX idx_estado_empleado
ON empleados (estadoEmpleado);

CREATE INDEX idx_estado_servicio
ON servicios (estado);

SELECT * FROM VVacunasMascota;
SELECT * FROM VServicioProx;
SELECT * FROM VSPacientesDia;


DROP VIEW VVacunasMascota;
DROP VIEW VServicioProx;
DROP VIEW VSPacientesDia;
DROP INDEX idx_estado_cliente;
DROP INDEX idx_estado_paciente;
DROP INDEX idx_estado_empleado;
DROP INDEX idx_estado_servicio;
    
