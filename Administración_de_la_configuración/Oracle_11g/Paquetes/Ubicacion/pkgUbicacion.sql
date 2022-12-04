CREATE OR REPLACE PACKAGE pkgUbicacion
AS 
TYPE t_cursor IS REF CURSOR;

PROCEDURE Registrar(
spTipo IN VARCHAR2,
spLocalizacion IN VARCHAR2,
reg_afectados OUT NUMBER,
cod_err OUT NUMBER,
msg_err OUT VARCHAR2);

PROCEDURE Modificar(
spID IN NUMBER,
spTipo IN VARCHAR2,
spLocalizacion IN VARCHAR2,
reg_afectados OUT NUMBER,
cod_err OUT NUMBER,
msg_err OUT VARCHAR2);

PROCEDURE Buscar(spTipo IN VARCHAR2, cursorBuscar OUT t_cursor);

PROCEDURE Cargar(cursorCargar OUT t_cursor);
END pkgUbicacion;