CREATE SEQUENCE Seq_Ubicaciones
                START WITH 1
                INCREMENT BY 1
                NOMAXVALUE;

create or replace trigger "Trig_Ubicaciones"
BEFORE
insert on Ubicaciones
for each row
begin
SELECT Seq_Ubicaciones.NEXTVAL INTO :NEW.id FROM DUAL;
end;