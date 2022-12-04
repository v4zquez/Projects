CREATE PROCEDURE crearEspecificacion
   @spElementoConfig INT,
   @spDetalle VARCHAR(1000)
AS     
   INSERT INTO Especificaciones
               (elementoConfig,detalle) 
   VALUES
               (@spElementoConfig,@spDetalle);  


CREATE PROCEDURE modificarEspecificacion
   @spElementoConfig INT,
   @spDetalle VARCHAR(1000)
AS  
   UPDATE Especificaciones 
   SET detalle=@spDetalle
   WHERE elementoConfig=@spElementoConfig; 

CREATE PROCEDURE cargarEspecificacion
AS
   SELECT elementoConfig, detalle 
   FROM Especificaciones;
          
CREATE PROCEDURE buscarEspecificacion
   @spElementoConfig INT
AS
   SELECT detalle 
   FROM Especificaciones 
   WHERE elementoConfig=@spElementoConfig;