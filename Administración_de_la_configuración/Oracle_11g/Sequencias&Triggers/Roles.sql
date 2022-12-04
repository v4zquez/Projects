CREATE SEQUENCE Seq_Roles
                START WITH 1
                INCREMENT BY 1
                NOMAXVALUE;

create or replace trigger "Trig_Roles"
BEFORE
insert on Roles
for each row
begin
SELECT Seq_Roles.NEXTVAL INTO :NEW.id FROM DUAL;
end;