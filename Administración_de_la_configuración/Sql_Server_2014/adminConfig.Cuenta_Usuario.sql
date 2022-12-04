CREATE PROCEDURE crearCuenta_Usuario  
    @spNombre VARCHAR(20),
    @spClave VARCHAR(100),
	@spUsuario INT 
AS     
    INSERT INTO Cuenta_Usuarios
                (nombre,clave,usuario) 
    VALUES
                (@spNombre,@spClave,@spUsuario);  


CREATE PROCEDURE modificarCuenta_Usuario
    @spNombre VARCHAR(20),
    @spClave VARCHAR(100),
	@spUsuario INT 
AS     
    UPDATE Cuenta_Usuarios 
    SET clave=@spClave 
	WHERE nombre=@spNombre AND usuario=@spUsuario; 

CREATE PROCEDURE cargarCuenta_Usuario
AS
   SELECT nombre, clave, usuario 
   FROM Cuenta_Usuarios;
          
CREATE PROCEDURE buscaCuenta_Usuario
   @spUsuario INT
AS
   SELECT nombre, clave, usuario 
   FROM Cuenta_Usuarios 
   WHERE usuario=@spUsuario;