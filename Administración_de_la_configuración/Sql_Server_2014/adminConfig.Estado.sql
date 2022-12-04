CREATE PROCEDURE crearEstado
   @spCategoria INT,
   @spNombre VARCHAR(50),
   @spDescripcion VARCHAR(100)
AS     
   INSERT INTO Estados
               (categoria,nombre,descripcion) 
   VALUES
               (@spCategoria,@spNombre,@spDescripcion);


CREATE PROCEDURE modificarEstado
   @spID INT,
   @spCategoria INT,
   @spNombre VARCHAR(50),
   @spDescripcion VARCHAR(100)
AS  
   UPDATE Estados 
   SET categoria=@spCategoria, nombre=@spNombre, descripcion=@spDescripcion 
   WHERE id=@spID; 

CREATE PROCEDURE cargarEstado
AS
   SELECT id, categoria, nombre, descripcion 
   FROM Estados;
          
CREATE PROCEDURE buscarEstado
   @spCategoria INT
AS
   SELECT id, categoria, nombre, descripcion 
   FROM Estados 
   WHERE categoria=@spCategoria;