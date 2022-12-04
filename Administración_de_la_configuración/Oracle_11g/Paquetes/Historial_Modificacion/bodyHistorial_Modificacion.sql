CREATE OR REPLACE PACKAGE BODY pkgHistorial_Modificacion
AS
PROCEDURE Registrar
(spEC IN NUMBER, 
spModificacion IN VARCHAR2,
spDescripcion VARCHAR2,
spAdministrador IN NUMBER,
spArchivo_respaldo IN VARCHAR2,
reg_afectados OUT NUMBER,
cod_err OUT NUMBER,
msg_err OUT VARCHAR2)
IS
BEGIN
       cod_err := 0;
       msg_err := 'OK';  

       INSERT INTO Historial_Modificaciones
                   (elementoConfig,modificacion,descripcion,administrador,archivo_respaldo) 
       VALUES
                   (spEC,spModificacion,spDescripcion,spAdministrador,spArchivo_respaldo);  

       reg_afectados := SQL%ROWCOUNT;
       COMMIT;
EXCEPTION
       WHEN OTHERS THEN
            ROLLBACK;
            reg_afectados := 0;
            cod_err := SQLCODE;
            msg_err := SQLERRM;
END Registrar;

PROCEDURE Buscar(spEC IN VARCHAR2, cursorBuscar OUT t_cursor)
IS
BEGIN
OPEN cursorBuscar FOR SELECT hm.id AS "N. Registro", ec.nombre AS "Elemento Config", hm.fecha AS "Fecha", hm.modificacion AS "Modificacion", hm.descripcion AS "Descripcion", cu.nombre AS "Administrador", archivo_respaldo 
                      FROM Elementos_Config ec, Cuenta_Usuarios cu, Historial_Modificaciones hm WHERE ec.nombre='%spEC%';
END Buscar;

PROCEDURE Cargar(cursorCargar OUT t_cursor)
IS
BEGIN
OPEN cursorCargar FOR SELECT hm.id AS "N. Registro", ec.nombre AS "Elemento Config", hm.fecha AS "Fecha", hm.modificacion AS "Modificacion", hm.descripcion AS "Descripcion", cu.nombre AS "Administrador", archivo_respaldo 
                      FROM Elementos_Config ec, Cuenta_Usuarios cu, Historial_Modificaciones hm;
END Cargar;
END pkgHistorial_Modificacion;​