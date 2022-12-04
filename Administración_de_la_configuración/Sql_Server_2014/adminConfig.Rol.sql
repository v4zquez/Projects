CREATE PROCEDURE crearRol  
    @spNombre VARCHAR(50),
    @spDescripcion VARCHAR(100)
AS     
    INSERT INTO Roles
                   (nombre,descripcion) 
    VALUES
                   (@spNombre,@spDescripcion);  


CREATE PROCEDURE modificarRol
    @spID INT,
    @spNombre VARCHAR(50),
    @spDescripcion VARCHAR(100) 
AS   
    UPDATE Roles 
    SET nombre=@spNombre, descripcion=@spDescripcion
    WHERE id=@spID; 

CREATE PROCEDURE cargarRol
AS
   SELECT id, nombre, descripcion 
   FROM Roles;
          
CREATE PROCEDURE buscarRol
   @spNombre  VARCHAR(50)
AS
   SELECT id, nombre, descripcion 
   FROM Roles 
   WHERE nombre='%@spNombre%';

CREATE PROCEDURE parametroRol
   @spNombre  VARCHAR(50),
   @spOpcion VARCHAR(10)
AS
   IF (@spOpcion='id')
      BEGIN
           SELECT id
           FROM Roles 
           WHERE nombre='@spNombre';
      END
   ELSE
      BEGIN
           SELECT descripcion
           FROM Roles 
           WHERE nombre='@spNombre';
      END