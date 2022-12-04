create or replace PACKAGE pkgTipo_Relacion 
AS  
TYPE t_cursor IS REF CURSOR; 
 
PROCEDURE Registrar( 
spDescripcion VARCHAR2, 
reg_afectados OUT NUMBER, 
cod_err OUT NUMBER, 
msg_err OUT VARCHAR2); 
 
PROCEDURE Modificar( 
spID IN NUMBER,
spDescripcion VARCHAR2, 
reg_afectados OUT NUMBER, 
cod_err OUT NUMBER, 
msg_err OUT VARCHAR2); 
 
PROCEDURE Buscar(spID IN NUMBER, cursorBuscar OUT t_cursor); 
 
PROCEDURE Cargar(cursorCargar OUT t_cursor); 
END pkgTipo_Relacion;