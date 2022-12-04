CREATE OR REPLACE PACKAGE BODY pkgHistorial_Estado
AS
PROCEDURE Registrar
(spEC IN NUMBER,
spNuevo_estado IN NUMBER,
spDescripcion IN VARCHAR2,
reg_afectados OUT NUMBER,
cod_err OUT NUMBER,
msg_err OUT VARCHAR2)
IS
BEGIN
       cod_err := 0;
       msg_err := 'OK';  

       INSERT INTO Historial_Estados
                   (elementoConfig,nuevo_estado,descripcion) 
       VALUES
                   (spEC,spNuevo_estado,spDescripcion);  

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
OPEN cursorBuscar FOR SELECT ec.nombre AS "Elemento Config", he.fecha AS "Fecha", es.nombre AS "Estado", es.descripcion AS "Descripcion" 
                      FROM Elementos_Config ec, Estados es, Historial_Estados he WHERE ec.nombre='%spEC%';
END Buscar;

PROCEDURE Cargar(cursorCargar OUT t_cursor)
IS
BEGIN
OPEN cursorCargar FOR SELECT ec.nombre AS "Elemento Config", he.fecha AS "Fecha", es.nombre AS "Estado", es.descripcion AS "Descripcion" 
                      FROM Elementos_Config ec, Estados es, Historial_Estados he;
END Cargar;
END pkgHistorial_Estado;​