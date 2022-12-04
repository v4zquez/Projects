CREATE SEQUENCE Seq_Clasificaciones
                START WITH 1
                INCREMENT BY 1
                NOMAXVALUE;

create or replace trigger "Trig_Clasificaciones"
BEFORE
insert on Clasificaciones
for each row
begin
SELECT Seq_Clasificaciones.NEXTVAL INTO :NEW.id FROM DUAL;
end;