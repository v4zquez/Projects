CREATE PROCEDURE crearUsuario    
    @spCedula INT,
    @spNombre VARCHAR(40),
    @spApellido1 VARCHAR(20),
    @spApellido2 VARCHAR(20), 
    @spDireccion VARCHAR(100),
    @spFecha VARCHAR(15),
	@spEdad VARCHAR(3),
    @spSexo VARCHAR(9),
    @spTelefono VARCHAR(20),
    @spCorreo VARCHAR(100)  
AS     
    INSERT INTO Usuarios
	           (cedula,nombre,apellido1,apellido2,direccion,fecha_nacimiento,edad,sexo,telefono,correo) 
	VALUES
               (@spCedula,@spNombre,@spApellido1,@spApellido2,@spDireccion,@spFecha,@spEdad,@spSexo,@spTelefono,@spCorreo);


CREATE PROCEDURE modificarUsuario    
    @spCedula INT,
    @spNombre VARCHAR(40),
    @spApellido1 VARCHAR(20),
    @spApellido2 VARCHAR(20), 
    @spDireccion VARCHAR(100),
    @spFecha VARCHAR(15),
	@spEdad VARCHAR(3),
    @spSexo VARCHAR(9),
    @spTelefono VARCHAR(20),
    @spCorreo VARCHAR(100)  
AS     
    UPDATE Usuarios 
       SET nombre=@spNombre, apellido1=@spApellido1, apellido2=@spApellido2, direccion=@spDireccion, 
	       fecha_nacimiento=@spFecha, edad=@spEdad, sexo=@spSexo, telefono=@spTelefono, correo=@spCorreo
     WHERE cedula=@spCedula;

CREATE PROCEDURE cargarUsuario
AS
   SELECT cedula,nombre,apellido1,apellido2,direccion,fecha_nacimiento,edad,sexo,telefono,correo 
   FROM Usuarios;
          
CREATE PROCEDURE buscarUsuario
   @spCedula INT
AS
   SELECT cedula,nombre,apellido1,apellido2,direccion,fecha_nacimiento,edad,sexo,telefono, correo 
   FROM Usuarios WHERE cedula=@spCedula;