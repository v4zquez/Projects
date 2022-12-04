CREATE OR REPLACE PACKAGE BODY pkgEspecificacion
AS
PROCEDURE Registrar
(spElementoConfig IN NUMBER,
spDetalle IN VARCHAR2,
reg_afectados OUT NUMBER,
cod_err OUT NUMBER,
msg_err OUT VARCHAR2)
IS
BEGIN
       cod_err := 0;
       msg_err := 'OK';  

       INSERT INTO Especificaciones
                   (elementoConfig,detalle) 
       VALUES
                   (spElementoConfig,spDetalle);  

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
(spElementoConfig IN NUMBER,
spDetalle IN VARCHAR2,
reg_afectados OUT NUMBER,
cod_err OUT NUMBER,
msg_err OUT VARCHAR2)
IS
BEGIN
       cod_err := 0;
       msg_err := 'OK';  

       UPDATE Especificaciones 
       SET detalle=spDetalle
       WHERE elementoConfig=spElementoConfig;  
       
       reg_afectados := SQL%ROWCOUNT;
       COMMIT;
EXCEPTION
       WHEN OTHERS THEN
            ROLLBACK;
            reg_afectados := 0;
            cod_err := SQLCODE;
            msg_err := SQLERRM;
END Modificar;

PROCEDURE Buscar(spElementoConfig IN NUMBER, cursorBuscar OUT t_cursor)
IS
BEGIN
OPEN cursorBuscar FOR SELECT detalle 
                      FROM Especificaciones 
					  WHERE elementoConfig=spElementoConfig;
END Buscar;

PROCEDURE Cargar(cursorCargar OUT t_cursor)
IS
BEGIN
OPEN cursorCargar FOR SELECT elementoConfig, detalle 
                      FROM Especificaciones;
END Cargar;
END pkgEspecificacion;​