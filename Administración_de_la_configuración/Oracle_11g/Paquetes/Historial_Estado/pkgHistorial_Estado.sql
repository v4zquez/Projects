CREATE OR REPLACE PACKAGE pkgHistorial_Estado
AS 
TYPE t_cursor IS REF CURSOR;

PROCEDURE Registrar(
spEC IN NUMBER,
spNuevo_estado IN NUMBER,
spDescripcion IN VARCHAR2,
reg_afectados OUT NUMBER,
cod_err OUT NUMBER,
msg_err OUT VARCHAR2);

PROCEDURE Buscar(spEC IN VARCHAR2, cursorBuscar OUT t_cursor);

PROCEDURE Cargar(cursorCargar OUT t_cursor);
END pkgHistorial_Estado;