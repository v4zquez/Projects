CREATE PROCEDURE crearAdministrador  
    @spUsuario INT,
    @spRol INT
AS     
    INSERT INTO Administradores
                (usuario,rol) 
    VALUES      
	            (@spUsuario,@spRol); 


CREATE PROCEDURE modificarAdministrador
    @spUsuario INT,
    @spRol INT 
AS   
    UPDATE Administradores 
    SET rol=@spRol
    WHERE usuario=@spUsuario; 

CREATE PROCEDURE cargarAdministrador
AS
   SELECT cedula, u.nombre, apellido1, c.nombre AS "USUARIO", r.nombre AS "ROL" 
   FROM Usuarios u, Cuenta_Usuarios c, Roles r, Administradores a 
   WHERE a.usuario=cedula;
          
CREATE PROCEDURE buscarAdministrador
   @spParametro VARCHAR(50), 
   @spOpcion VARCHAR(5)
AS
   IF (@spOpcion='Rol')
       BEGIN
            SELECT cedula, u.nombre, apellido1, c.nombre AS "USUARIO", r.nombre AS "ROL" 
            FROM Usuarios u, Cuenta_Usuarios c, Roles r, Administradores a 
            WHERE r.nombre='spParametro';
       END
   ELSE
       BEGIN
            SELECT cedula, u.nombre, apellido1, c.nombre AS "USUARIO", r.nombre AS "ROL" 
            FROM Usuarios u, Cuenta_Usuarios c, Roles r, Administradores a 
            WHERE a.usuario=cedula AND c.nombre='spParametro';
       END

CREATE PROCEDURE validarLogin  
    @spUsuario VARCHAR(20),
    @spRol VARCHAR(50)
AS  
    SELECT count(*)
	FROM Administradores 
	WHERE usuario=(SELECT usuario 
	               FROM Cuenta_Usuarios 
				   WHERE nombre='@spUsuario') 
    AND rol=(SELECT id 
	         FROM Roles 
			 WHERE nombre='@spRol');