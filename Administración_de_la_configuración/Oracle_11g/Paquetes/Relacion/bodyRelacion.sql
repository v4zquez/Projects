CREATE OR REPLACE PACKAGE BODY pkgRelacion
AS
PROCEDURE Registrar
(spEC_origen IN NUMBER,
spEC_destino IN NUMBER,
spRelacion IN NUMBER,
reg_afectados OUT NUMBER,
cod_err OUT NUMBER,
msg_err OUT VARCHAR2)
IS
BEGIN
       cod_err := 0;
       msg_err := 'OK';  

       INSERT INTO Relaciones
                   (EC_origen, EC_destino, relacion) 
       VALUES
                   (spEC_origen, spEC_destino, spRelacion);  

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
(spEC_origen IN NUMBER,
spEC_destino IN NUMBER,
spRelacion IN NUMBER,
reg_afectados OUT NUMBER,
cod_err OUT NUMBER,
msg_err OUT VARCHAR2)
IS
BEGIN
       cod_err := 0;
       msg_err := 'OK';  

       UPDATE Relaciones 
       SET relacion=spRelacion
       WHERE EC_origen=spEC_origen AND EC_destino=spEC_destino;  
       
       reg_afectados := SQL%ROWCOUNT;
       COMMIT;
EXCEPTION
       WHEN OTHERS THEN
            ROLLBACK;
            reg_afectados := 0;
            cod_err := SQLCODE;
            msg_err := SQLERRM;
END Modificar;

PROCEDURE Buscar(spParametro IN VARCHAR2, spOpcion IN VARCHAR2, cursorBuscar OUT t_cursor)
IS
BEGIN
IF (spOpcion='ElementoConfig') THEN
    OPEN cursorBuscar FOR SELECT ec.nombre, tp.descripcion, ec.nombre 
                          FROM Elementos_Config ec, Tipo_Relaciones tp
					      WHERE ec.nombre='%spParametro%';
ELSE
    OPEN cursorBuscar FOR SELECT ec.nombre, tp.descripcion, ec.nombre 
                          FROM Elementos_Config ec, Tipo_Relaciones tp
					      WHERE tp.descripcion='%spParametro%';
END IF;
END Buscar;

PROCEDURE Cargar(cursorCargar OUT t_cursor)
IS
BEGIN
OPEN cursorCargar FOR SELECT ec.nombre, tp.descripcion, ec.nombre 
                      FROM Elementos_Config ec, Tipo_Relaciones tp;
END Cargar;
END pkgRelacion;​