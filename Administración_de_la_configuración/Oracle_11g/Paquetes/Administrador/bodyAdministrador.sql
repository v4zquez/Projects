CREATE OR REPLACE PACKAGE BODY pkgAdministrador
AS
PROCEDURE Registrar
(spUsuario IN NUMBER,
spRol IN NUMBER,
reg_afectados OUT NUMBER,
cod_err OUT NUMBER,
msg_err OUT VARCHAR2)
IS
BEGIN
       cod_err := 0;
       msg_err := 'OK';  

       INSERT INTO Administradores
                   (usuario,rol) 
       VALUES
                   (spUsuario,spRol);  

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
(spUsuario IN NUMBER,
spRol IN NUMBER,
reg_afectados OUT NUMBER,
cod_err OUT NUMBER,
msg_err OUT VARCHAR2)
IS
BEGIN
       cod_err := 0;
       msg_err := 'OK';  

       UPDATE Administradores 
       SET rol=spRol
       WHERE usuario=spUsuario;  
       
       reg_afectados := SQL%ROWCOUNT;
       COMMIT;
EXCEPTION
       WHEN OTHERS THEN
            ROLLBACK;
            reg_afectados := 0;
            cod_err := SQLCODE;
            msg_err := SQLERRM;
END Modificar;

PROCEDURE Buscar(spParametro IN VARCHAR2, spOpcion IN VARCHAR2, cursorBuscar OUT t_cursor)
IS
BEGIN
IF (spOpcion='Rol') THEN
   OPEN cursorBuscar FOR SELECT cedula, u.nombre, apellido1, c.nombre AS "USUARIO", r.nombre AS "ROL" 
                         FROM Usuarios u, Cuenta_Usuarios c, Roles r, Administradores a 
                         WHERE r.nombre='spParametro';
ELSE
   OPEN cursorBuscar FOR SELECT cedula, u.nombre, apellido1, c.nombre AS "USUARIO", r.nombre AS "ROL" 
                         FROM Usuarios u, Cuenta_Usuarios c, Roles r, Administradores a 
                         WHERE a.usuario=cedula AND c.nombre='spParametro';
END IF;
END Buscar;

PROCEDURE Cargar(cursorCargar OUT t_cursor)
IS
BEGIN
OPEN cursorCargar FOR SELECT cedula, u.nombre, apellido1, c.nombre AS "USUARIO", r.nombre AS "ROL" 
                      FROM Usuarios u, Cuenta_Usuarios c, Roles r, Administradores a 
                      WHERE a.usuario=cedula;
END Cargar;
END pkgAdministrador;​