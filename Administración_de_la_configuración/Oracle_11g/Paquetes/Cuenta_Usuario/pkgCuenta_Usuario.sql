CREATE OR REPLACE PACKAGE pkgCuenta_Usuario
AS 
TYPE t_cursor IS REF CURSOR;

PROCEDURE Registrar(
spNombre IN VARCHAR2,
spClave IN VARCHAR2,
spUsuario IN NUMBER,
reg_afectados OUT NUMBER,
cod_err OUT NUMBER,
msg_err OUT VARCHAR2);

PROCEDURE Modificar(
spNombre IN VARCHAR2,
spClave IN VARCHAR2,
spUsuario IN NUMBER,
reg_afectados OUT NUMBER,
cod_err OUT NUMBER,
msg_err OUT VARCHAR2);

PROCEDURE Buscar(spUsuario IN NUMBER, cursorBuscar OUT t_cursor);

PROCEDURE Cargar(cursorCargar OUT t_cursor);
END pkgCuenta_Usuario;