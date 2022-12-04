CREATE OR REPLACE PACKAGE BODY pkgUbicacion
AS
PROCEDURE Registrar
(spTipo IN VARCHAR2,
spLocalizacion IN VARCHAR2,
reg_afectados OUT NUMBER,
cod_err OUT NUMBER,
msg_err OUT VARCHAR2)
IS
BEGIN
       cod_err := 0;
       msg_err := 'OK';  

       INSERT INTO Ubicaciones
                   (tipo,localizacion) 
       VALUES
                   (spTipo,spLocalizacion);  

       reg_afectados := SQL%ROWCOUNT;
       COMMIT;
EXCEPTION
       WHEN OTHERS THEN
            ROLLBACK;
            reg_afectados := 0;
            cod_err := SQLCODE;
            msg_err := SQLERRM;
END Registrar;

PROCEDURE Modificar
(spID IN NUMBER,
spTipo IN VARCHAR2,
spLocalizacion IN VARCHAR2,
reg_afectados OUT NUMBER,
cod_err OUT NUMBER,
msg_err OUT VARCHAR2)
IS
BEGIN
       cod_err := 0;
       msg_err := 'OK';  

       UPDATE Ubicaciones 
       SET tipo=spTipo, localizacion=spLocalizacion
       WHERE id=spID;  
       
       reg_afectados := SQL%ROWCOUNT;
       COMMIT;
EXCEPTION
       WHEN OTHERS THEN
            ROLLBACK;
            reg_afectados := 0;
            cod_err := SQLCODE;
            msg_err := SQLERRM;
END Modificar;

PROCEDURE Buscar(spTipo IN VARCHAR2, cursorBuscar OUT t_cursor)
IS
BEGIN
OPEN cursorBuscar FOR SELECT id, tipo, localizacion 
                      FROM Ubicaciones 
                      WHERE tipo=spTipo;
END Buscar;

PROCEDURE Cargar(cursorCargar OUT t_cursor)
IS
BEGIN
OPEN cursorCargar FOR SELECT id, tipo, localizacion 
                      FROM Ubicaciones;
END Cargar;
END pkgUbicacion;​