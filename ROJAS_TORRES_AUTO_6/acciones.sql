/* Los eventos se pueden eliminar si y solo si no esta asociado a un teaches*/

ALTER TABLE teaches DROP CONSTRAINT FK_TEACHES_EVENT;
ALTER TABLE teaches ADD CONSTRAINT FK_TEACHES_EVENT FOREIGN KEY (event) REFERENCES event(id_e) ON DELETE CASCADE;

/*validar acciones (accionesOK)*/

DELETE FROM event WHERE id_e = 'co12004.L01';

/*consultas para validar que efectivamente el registro ya no se encuentra*/
select * from event 
where id_e = 'co12004.L01';

select * from event 
where id_e != 'co12004.L01';