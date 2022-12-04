CREATE OR REPLACE PACKAGE pkgRelacion
AS 
TYPE t_cursor IS REF CURSOR;

PROCEDURE Registrar(
spEC_origen IN NUMBER,
spEC_destino IN NUMBER,
spRelacion IN NUMBER,
reg_afectados OUT NUMBER,
cod_err OUT NUMBER,
msg_err OUT VARCHAR2);

PROCEDURE Modificar(
spEC_origen IN NUMBER,
spEC_destino IN NUMBER,
spRelacion IN NUMBER,
reg_afectados OUT NUMBER,
cod_err OUT NUMBER,
msg_err OUT VARCHAR2);

PROCEDURE Buscar(spParametro IN VARCHAR2, spOpcion IN VARCHAR2, cursorBuscar OUT t_cursor);

PROCEDURE Cargar(cursorCargar OUT t_cursor);
END pkgRelacion;