CREATE OR REPLACE PACKAGE pkgClasificacion
AS 
TYPE t_cursor IS REF CURSOR;

PROCEDURE Registrar(
spCategoria IN VARCHAR2,
spTipo IN VARCHAR2,
reg_afectados OUT NUMBER,
cod_err OUT NUMBER,
msg_err OUT VARCHAR2);

PROCEDURE Modificar(
spID IN NUMBER,
spCategoria IN VARCHAR2,
spTipo IN VARCHAR2,
reg_afectados OUT NUMBER,
cod_err OUT NUMBER,
msg_err OUT VARCHAR2);

PROCEDURE Buscar(spCategoria IN VARCHAR2, cursorBuscar OUT t_cursor);

PROCEDURE Cargar(cursorCargar OUT t_cursor);
END pkgClasificacion;