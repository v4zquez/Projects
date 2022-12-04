CREATE SEQUENCE Seq_Estados
                START WITH 1
                INCREMENT BY 1
                NOMAXVALUE;

create or replace trigger "Trig_Estados"
BEFORE
insert on Estados
for each row
begin
SELECT Seq_Estados.NEXTVAL INTO :NEW.id FROM DUAL;
end;