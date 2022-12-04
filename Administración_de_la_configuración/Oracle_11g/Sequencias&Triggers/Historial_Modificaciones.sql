CREATE SEQUENCE Seq_Historial_Modificaciones
                START WITH 1
                INCREMENT BY 1
                NOMAXVALUE;

create or replace trigger "Trig_Historial_Modificaciones"
BEFORE
insert on Historial_Modificaciones
for each row
begin
SELECT Seq_Historial_Modificaciones.NEXTVAL INTO :NEW.id FROM DUAL;
end;