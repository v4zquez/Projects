CREATE OR REPLACE PACKAGE pkgRol
AS 
TYPE t_cursor IS REF CURSOR;

PROCEDURE Registrar(
spNombre IN VARCHAR2,
spDescripcion IN VARCHAR2,
reg_afectados OUT NUMBER,
cod_err OUT NUMBER,
msg_err OUT VARCHAR2);

PROCEDURE Modificar(
spID IN NUMBER,
spNombre IN VARCHAR2,
spDescripcion IN VARCHAR2,
reg_afectados OUT NUMBER,
cod_err OUT NUMBER,
msg_err OUT VARCHAR2);

PROCEDURE Buscar(spNombre IN VARCHAR2, cursorBuscar OUT t_cursor);

PROCEDURE Cargar(cursorCargar OUT t_cursor);
END pkgRol;