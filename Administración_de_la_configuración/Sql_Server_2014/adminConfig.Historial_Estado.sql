CREATE PROCEDURE crearHistorial_Estado
   @spEC INT,
   @spNuevo_estado INT,
   @spDescripcion VARCHAR(100)
AS     
   INSERT INTO Historial_Estados
               (elementoConfig,nuevo_estado,descripcion) 
   VALUES
               (@spEC,@spNuevo_estado,@spDescripcion);  

CREATE PROCEDURE cargarHistorial_Estado
AS
   SELECT ec.nombre AS "Elemento Config", he.fecha AS "Fecha", es.nombre AS "Estado", es.descripcion AS "Descripcion" 
   FROM Elementos_Config ec, Estados es, Historial_Estados he;
          
CREATE PROCEDURE buscarHistorial_Estado
   @spEC VARCHAR(50)
AS
   SELECT ec.nombre AS "Elemento Config", he.fecha AS "Fecha", es.nombre AS "Estado", es.descripcion AS "Descripcion" 
   FROM Elementos_Config ec, Estados es, Historial_Estados he WHERE ec.nombre='%@spEC%';