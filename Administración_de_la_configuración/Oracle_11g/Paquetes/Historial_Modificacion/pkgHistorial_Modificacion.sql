CREATE OR REPLACE PACKAGE pkgHistorial_Modificacion
AS 
TYPE t_cursor IS REF CURSOR;

PROCEDURE Registrar(
spEC IN NUMBER, 
spModificacion IN VARCHAR2,
spDescripcion VARCHAR2,
spAdministrador IN NUMBER,
spArchivo_respaldo IN VARCHAR2,
reg_afectados OUT NUMBER,
cod_err OUT NUMBER,
msg_err OUT VARCHAR2);

PROCEDURE Buscar(spEC IN VARCHAR2, cursorBuscar OUT t_cursor);

PROCEDURE Cargar(cursorCargar OUT t_cursor);
END pkgHistorial_Modificacion;