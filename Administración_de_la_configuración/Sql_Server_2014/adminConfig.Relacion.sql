CREATE PROCEDURE crearRelacion
   @spEC_origen INT,
   @spEC_destino INT,
   @spRelacion INT
AS     
   INSERT INTO Relaciones
               (EC_origen, EC_destino, relacion) 
   VALUES
               (@spEC_origen, @spEC_destino, @spRelacion);  


CREATE PROCEDURE modificarRelacion
   @spEC_origen INT,
   @spEC_destino INT,
   @spRelacion INT
AS  
   UPDATE Relaciones 
   SET relacion=@spRelacion
   WHERE EC_origen=@spEC_origen AND EC_destino=@spEC_destino; 

CREATE PROCEDURE cargarRelacion
AS
   SELECT ec.nombre, tp.descripcion, ec.nombre 
   FROM Elementos_Config ec, Tipo_Relaciones tp;
          
CREATE PROCEDURE buscarRelacion
   @spParametro VARCHAR(50), 
   @spOpcion VARCHAR(20)
AS
   IF (@spOpcion='ElementoConfig')
      BEGIN 
	       SELECT ec.nombre, tp.descripcion, ec.nombre 
           FROM Elementos_Config ec, Tipo_Relaciones tp
           WHERE ec.nombre='%@spParametro%';
	  END
  ELSE
      BEGIN
	      SELECT ec.nombre, tp.descripcion, ec.nombre 
          FROM Elementos_Config ec, Tipo_Relaciones tp
		  WHERE tp.descripcion='%@spParametro%';
	  END