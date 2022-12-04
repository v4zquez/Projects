CREATE SEQUENCE Seq_Elementos_Config
                START WITH 1
                INCREMENT BY 1
                NOMAXVALUE;

create or replace trigger "Trig_Elementos_Config"
BEFORE
insert on Elementos_Config
for each row
begin
SELECT Seq_Elementos_Config.NEXTVAL INTO :NEW.id FROM DUAL;
end;