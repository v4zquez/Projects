CREATE OR REPLACE PACKAGE pkgUsuario
AS 
TYPE t_cursor IS REF CURSOR;

PROCEDURE Registrar(
spCedula IN NUMBER,
spNombre IN VARCHAR2,
spApellido1 IN VARCHAR2,
spApellido2 IN VARCHAR2,
spDireccion IN VARCHAR2,
spFecha IN VARCHAR2,
spSexo IN VARCHAR2,
spTelefono IN VARCHAR2,
spCorreo IN VARCHAR2,
reg_afectados OUT NUMBER,
cod_err OUT NUMBER,
msg_err OUT VARCHAR2);

PROCEDURE Modificar(
spCedula IN NUMBER,
spNombre IN VARCHAR2,
spApellido1 IN VARCHAR2,
spApellido2 IN VARCHAR2,
spDireccion IN VARCHAR2,
spFecha IN VARCHAR2,
spSexo IN VARCHAR2,
spTelefono IN VARCHAR2,
spCorreo IN VARCHAR2,
reg_afectados OUT NUMBER,
cod_err OUT NUMBER,
msg_err OUT VARCHAR2);

PROCEDURE Buscar(spCedula IN NUMBER, cursorBuscar OUT t_cursor);

PROCEDURE Cargar(cursorCargar OUT t_cursor);
END pkgUsuario;