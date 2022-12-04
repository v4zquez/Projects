CREATE OR REPLACE PACKAGE pkgEspecificacion
AS 
TYPE t_cursor IS REF CURSOR;

PROCEDURE Registrar(
spElementoConfig IN NUMBER,
spDetalle IN VARCHAR2,
reg_afectados OUT NUMBER,
cod_err OUT NUMBER,
msg_err OUT VARCHAR2);

PROCEDURE Modificar(
spElementoConfig IN NUMBER,
spDetalle IN VARCHAR2,
reg_afectados OUT NUMBER,
cod_err OUT NUMBER,
msg_err OUT VARCHAR2);

PROCEDURE Buscar(spElementoConfig IN NUMBER, cursorBuscar OUT t_cursor);

PROCEDURE Cargar(cursorCargar OUT t_cursor);
END pkgEspecificacion;