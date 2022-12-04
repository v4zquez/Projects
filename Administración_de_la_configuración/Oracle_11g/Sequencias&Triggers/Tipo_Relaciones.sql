CREATE SEQUENCE Seq_Tipo_Relaciones
                START WITH 1
                INCREMENT BY 1
                NOMAXVALUE;

create or replace trigger "Trig_Tipo_Relaciones"
BEFORE
insert on Tipo_Relaciones
for each row
begin
SELECT Seq_Tipo_Relaciones.NEXTVAL INTO :NEW.id FROM DUAL;
end;