CREATE OR REPLACE PACKAGE BODY pkgCuenta_Usuario
AS
PROCEDURE Registrar
(spNombre IN VARCHAR2,
spClave IN VARCHAR2,
spUsuario IN NUMBER,
reg_afectados OUT NUMBER,
cod_err OUT NUMBER,
msg_err OUT VARCHAR2)
IS
BEGIN
       cod_err := 0;
       msg_err := 'OK'; 

       INSERT INTO Cuenta_Usuarios
                   (nombre,clave,usuario) 
       VALUES
                   (spNombre,spClave,spUsuario);  

       reg_afectados := SQL%ROWCOUNT;
       COMMIT;
EXCEPTION
       WHEN OTHERS THEN
            ROLLBACK;
            reg_afectados := 0;
            cod_err := SQLCODE;
            msg_err := SQLERRM;
END Registrar;

PROCEDURE Modificar
(spNombre IN VARCHAR2,
spClave IN VARCHAR2,
spUsuario IN NUMBER,
reg_afectados OUT NUMBER,
cod_err OUT NUMBER,
msg_err OUT VARCHAR2)
IS
spEdad INT;
BEGIN
       cod_err := 0;
       msg_err := 'OK';  

       UPDATE Cuenta_Usuarios 
       SET clave=spClave WHERE nombre=spNombre AND usuario=spUsuario; 
       
       reg_afectados := SQL%ROWCOUNT;
       COMMIT;
EXCEPTION
       WHEN OTHERS THEN
            ROLLBACK;
            reg_afectados := 0;
            cod_err := SQLCODE;
            msg_err := SQLERRM;
END Modificar;

PROCEDURE Buscar(spUsuario IN NUMBER, cursorBuscar OUT t_cursor)
IS
BEGIN
OPEN cursorBuscar FOR SELECT nombre, clave, usuario FROM Cuenta_Usuarios WHERE usuario=spUsuario;
END Buscar;

PROCEDURE Cargar(cursorCargar OUT t_cursor)
IS
BEGIN
OPEN cursorCargar FOR SELECT nombre, clave, usuario FROM Cuenta_Usuarios;
END Cargar;
END pkgCuenta_Usuario;