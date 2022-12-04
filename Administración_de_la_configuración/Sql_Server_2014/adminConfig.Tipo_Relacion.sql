CREATE PROCEDURE crearTipo_Relacion
   @spDescripcion VARCHAR(100)
AS     
   INSERT INTO Tipo_Relaciones
               (descripcion) 
   VALUES
               (@spDescripcion);  


CREATE PROCEDURE modificarTipo_Relacion
   @spID INT,
   @spDescripcion VARCHAR(100)
AS  
   UPDATE Tipo_Relaciones 
   SET descripcion=@spDescripcion
   WHERE id=@spID; 

CREATE PROCEDURE cargarTipo_Relacion
AS
   SELECT id, descripcion 
   FROM Tipo_Relaciones;
          
CREATE PROCEDURE buscarTipo_Relacion
   @spID INT
AS
   SELECT id, descripcion 
   FROM Tipo_Relaciones 
   WHERE id=@spID;