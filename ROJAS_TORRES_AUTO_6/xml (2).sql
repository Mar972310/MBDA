--A) 
/*Tablas*/
DROP TABLE occurs;
DROP TABLE teaches;
DROP TABLE event;
DROP TABLE staff;
DROP TABLE modle;

CREATE TABLE staff(
    id_s        VARCHAR(20) NOT NULL,
    name        VARCHAR(50)
);

CREATE TABLE modle(
    id_m        VARCHAR(20) NOT NULL,
    name        VARCHAR(50)
);

CREATE TABLE event(
    id_e        VARCHAR(20) NOT NULL,
    modle       VARCHAR(20),
    kind        CHAR(1),
    dow         VARCHAR(15),
    tod         CHAR(5),
    duration    NUMBER(11),
    room        VARCHAR(20),
    detalle     XMLTYPE
);

CREATE TABLE teaches(
    staff       VARCHAR(20) NOT NULL,
    event       VARCHAR(20) NOT NULL
);
CREATE TABLE occurs (
    event       VARCHAR(20) NOT NULL, 
    week        VARCHAR(20) NOT NULL
);

/*RESTRICCIONES*/

ALTER TABLE staff ADD CONSTRAINT PK_staff PRIMARY KEY(id_s);
ALTER TABLE modle ADD CONSTRAINT PK_modle PRIMARY KEY(id_m);
ALTER TABLE event ADD CONSTRAINT PK_EVENT PRIMARY KEY(id_e);
ALTER TABLE teaches ADD CONSTRAINT PK_TEACHES PRIMARY KEY(staff,event);
ALTER TABLE occurs ADD CONSTRAINT PK_occurs PRIMARY KEY(event,week);

ALTER TABLE teaches ADD CONSTRAINT FK_TEACHES_STAFF FOREIGN KEY (staff) REFERENCES staff(id_s);
ALTER TABLE teaches ADD CONSTRAINT FK_TEACHES_EVENT FOREIGN KEY (event) REFERENCES event(id_e);
ALTER TABLE occurs ADD CONSTRAINT FK_occurs FOREIGN KEY (event) REFERENCES event(id_e);
ALTER TABLE event ADD CONSTRAINT FK_EVENT_MODLE FOREIGN KEY (modle) REFERENCES modle(id_m);

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
/
--insert event xml
INSERT INTO modle (id_m, name) VALUES ('co12004', 'Applications Workshop');
INSERT INTO modle (id_m, name) VALUES ('co12005', 'Software Development 1B');
INSERT INTO modle (id_m, name) VALUES ('co12006', 'Mathematics');
INSERT INTO modle (id_m, name) VALUES ('M2', 'History');
INSERT INTO modle (id_m, name) VALUES ('M3', 'Science');
INSERT INTO modle (id_m, name) VALUES ('M12345678901234', 'Mathematics1234567890123456789');
INSERT INTO modle (id_m, name) VALUES ('M2345678901234567890', 'History1234567890123456789012');
INSERT INTO modle (id_m, name) VALUES ('M3456789012345678901', 'Science1234567890123456789012');
INSERT INTO EVENT (modle, kind, dow, tod, duration, room, detalle) VALUES
('co12006', 'L', 'Monday', '09:00', 2, 'cr.123',
'<Detalle>
    <Evaluacion>1</Evaluacion>
    <Comentarios>
        <Comentario>"Estuvo genial, interesante y motivacional"</Comentario>
        <Comentario>"Estuvo aburrido"</Comentario>
        <Comentario>"El docente no explica muy bien"</Comentario>
    </Comentarios>
    <Bibliografias>
        <Bibliografia titulo="Top Herramientas de Inteligencia Artificial (Que No Son ChatGPT)" direccion="https://www.youtube.com/watch?v=FmUmJuM1Y3s" tipo="Video"/>
        <Bibliografia titulo="el mar azul" direccion="https://www.tiempo.com/noticias/ciencia/por-que-el-mar-es-de-color-azul-agua-transparente.html" tipo="Texto"/>
    </Bibliografias>
    <Recomendaciones>
        <Recomendacion>Cambiar las actividades para que no se vuelva repetitivo el evento</Recomendacion>
    </Recomendaciones>
    <EstudianteDestacados>
        <estudianteDestacado nombre="Daniel Rojas" documento="1234567890" motivo="Buen trabajo de clase"/>
        <estudianteDestacado nombre="Valentina Torres" documento="1034567890" motivo="Buen trabajo de clase"/>
    </EstudianteDestacados>
</Detalle>');

INSERT INTO EVENT (modle, kind, dow, tod, duration, room, detalle) VALUES
('co12004', 'T', 'Wednesday', '11:00', 1, 'cr.SMH',
'<Detalle>
    <Evaluacion>1</Evaluacion>
    <Comentarios>
        <Comentario>Estuvo genial, interesante y motivacional</Comentario>
        <Comentario>Estuvo aburrido</Comentario>
        <Comentario>El docente no explica muy bien</Comentario>
    </Comentarios>
    <Bibliografias>
        <Bibliografia titulo="Top Herramientas de Inteligencia Artificial (Que No Son ChatGPT)" direccion="https://www.youtube.com/watch?v=FmUmJuM1Y3s" tipo="Video"></Bibliografia>
        <Bibliografia titulo="IA hoy en d�a" direccion="https://ellisalicante.org/book/inteligencia-artificial-hoy-en-dia" tipo="Texto"></Bibliografia>
    </Bibliografias>
    <Recomendaciones>
        <Recomendacion>Cambiar las actividades para que no se vuelva repetitivo el evento</Recomendacion>
    </Recomendaciones>
    <EstudianteDestacados>
        <estudianteDestacado nombre="Daniel Rojas" documento="1234567890" motivo="Buen trabajo de clase"></estudianteDestacado>
        <estudianteDestacado nombre="Valentina Torres" documento="1034567890" motivo="Buen trabajo de clase"></estudianteDestacado>
    </EstudianteDestacados>
</Detalle>');

INSERT INTO EVENT (modle, kind, dow, tod, duration, room, detail) VALUES
( 'M12345678901234', 'T', 'Tuesday', '15:00', 2, 'co.B7',
'<Detalle>
    <Evaluacion>5</Evaluacion>
    <Comentarios>
        <Comentario>Estuvo genial</Comentario>
        <Comentario>Estuvo aburrido</Comentario>
        <Comentario>El docente no explica muy bien, puede mejorar</Comentario>
    </Comentarios>
    <Bibliografias>
        <Bibliografia titulo="Top Herramientas de Inteligencia Artificial (Que No Son ChatGPT)" direccion="https://www.youtube.com/watch?v=FmUmJuM1Y3s" tipo="Video"></Bibliografia>
    </Bibliografias>
    <Recomendaciones>
        <Recomendacion>Salenos con mas implementos para el desarrollo del curso</Recomendacion>
    </Recomendaciones>
    <EstudianteDestacados>
        <estudianteDestacado nombre="Felipe Rojas" documento="1234567890" motivo="Buen trabajo de clase"></estudianteDestacado>
        <estudianteDestacado nombre="Maria Torres" documento="1034567890" motivo="Buen trabajo de clase"></estudianteDestacado>
    </EstudianteDestacados>
</Detalle>');
INSERT INTO event ( modle, kind, dow, tod, duration, room, detail) VALUES
('co12005', 'L', 'Thursday', '14:00', 2, 'cr.456',
'<Detalle>
    <Evaluacion>4</Evaluacion>
    <Comentarios>
        <Comentario>Estuvo interesante y educativo</Comentario>
        <Comentario>Algunas partes fueron un poco confusas</Comentario>
        <Comentario>Buena interacci�n con los estudiantes</Comentario>
    </Comentarios>
    <Bibliografias>
        <Bibliografia titulo="Introducci�n a la Ciencia de Datos" direccion="https://www.coursera.org/learn/introduction-to-data-science" tipo="Curso"></Bibliografia>
        <Bibliografia titulo="Deep Learning: An MIT Press book" direccion="https://www.deeplearningbook.org/" tipo="Libro"></Bibliografia>
    </Bibliografias>
    <Recomendaciones>
        <Recomendacion>Explorar m�s temas en profundidad</Recomendacion>
    </Recomendaciones>
    <EstudianteDestacados>
        <estudianteDestacado nombre="Ana L�pez" documento="5678901234" motivo="Participaci�n activa en clase"></estudianteDestacado>
        <estudianteDestacado nombre="Carlos Ramirez" documento="6789012345" motivo="Presentaci�n excepcional"></estudianteDestacado>
    </EstudianteDestacados>
</Detalle>');

INSERT INTO event ( modle, kind, dow, tod, duration, room, detail) VALUES
('co12006', 'T', 'Friday', '10:00', 2, 'cr.789',
'<Detalle>
    <Evaluacion>3</Evaluacion>
    <Comentarios>
        <Comentario>Interesante pero podr�a mejorar</Comentario>
        <Comentario>Buena interacci�n con los estudiantes</Comentario>
        <Comentario>Falta de material de apoyo</Comentario>
    </Comentarios>
    <Bibliografias>
        <Bibliografia titulo="Machine Learning in Practice" direccion="https://www.coursera.org/learn/machine-learning-in-practice" tipo="Curso"></Bibliografia>
        <Bibliografia titulo="Python Crash Course" direccion="https://nostarch.com/pythoncrashcourse" tipo="Libro"></Bibliografia>
    </Bibliografias>
    <Recomendaciones>
        <Recomendacion>Proporcionar m�s material de apoyo</Recomendacion>
    </Recomendaciones>
    <EstudianteDestacados>
        <estudianteDestacado nombre="Laura Gonz�lez" documento="3456789012" motivo="Participaci�n activa en discusiones"></estudianteDestacado>
        <estudianteDestacado nombre="Roberto Mart�nez" documento="4567890123" motivo="Mejora continua en las tareas"></estudianteDestacado>
    </EstudianteDestacados>
</Detalle>');


--consultas
--bibliografia
SELECT id_e AS Banda FROM event
    WHERE extractvalue(detalle,'/Detalle/Bibliografia/Bibliografia/@tipo') = 'Video';
SELECT *
FROM (
    SELECT 
        EXTRACTVALUE(detalle,'/Detalle/Bibliografia/@titulo') AS Titulo,
        EXTRACTVALUE(detalle,'/Detalle/Bibliografia/@direccion') AS direccion,
        EXTRACTVALUE(detalle,'/Detalle/Bibliografia/@tipo') AS Tipo
        FROM event
        //where id_e = 'co12006.L61'
    );
    
SELECT 
    XMLQuery('/Detalle/Bibliografia/@titulo' PASSING detail RETURNING CONTENT) AS Titulo,
    XMLQuery('/Detalle/Bibliografia/@direccion' PASSING detail RETURNING CONTENT) AS Direccion,
    XMLQuery('/Detalle/Bibliografia/@tipo' PASSING detail RETURNING CONTENT) AS Tipo
FROM event
WHERE id_e = 'co12006.L61';

truncate table event;
select * from event;
