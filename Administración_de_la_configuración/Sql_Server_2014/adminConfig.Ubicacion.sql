CREATE PROCEDURE crearUbicacion
   @spTipo VARCHAR(10),
   @spLocalizacion VARCHAR(1000)
AS     
   INSERT INTO Ubicaciones
               (tipo,localizacion) 
   VALUES
               (@spTipo,@spLocalizacion);


CREATE PROCEDURE modificarUbicacion
   @spID INT,
   @spTipo VARCHAR(10),
   @spLocalizacion VARCHAR(1000)
AS  
   UPDATE Ubicaciones 
   SET tipo=@spTipo, localizacion=@spLocalizacion
   WHERE id=@spID; 

CREATE PROCEDURE cargarUbicacion
AS
   SELECT id, tipo, localizacion 
   FROM Ubicaciones;
          
CREATE PROCEDURE buscarUbicacion
   @spTipo VARCHAR(10)
AS
   SELECT id, tipo, localizacion 
   FROM Ubicaciones 
   WHERE tipo=@spTipo;