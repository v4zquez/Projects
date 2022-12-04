CREATE PROCEDURE crearHistorial_Modificacion
   @spEC INT, 
   @spModificacion VARCHAR(100),
   @spDescripcion VARCHAR(1000),
   @spAdministrador VARCHAR(20),
   @spArchivo_respaldo VARCHAR(1000)
AS     
   INSERT INTO Historial_Modificaciones
               (elementoConfig,modificacion,descripcion,administrador,archivo_respaldo) 
   VALUES
               (@spEC,@spModificacion,@spDescripcion,@spAdministrador,@spArchivo_respaldo);  

CREATE PROCEDURE cargarHistorial_Modificacion
AS
   SELECT hm.id AS "N. Registro", ec.nombre AS "Elemento Config", hm.fecha AS "Fecha", hm.modificacion AS "Modificacion", hm.descripcion AS "Descripcion", cu.nombre AS "Administrador", archivo_respaldo 
   FROM Elementos_Config ec, Cuenta_Usuarios cu, Historial_Modificaciones hm;
          
CREATE PROCEDURE buscarHistorial_Modificacion
   @spEC VARCHAR(50)
AS
   SELECT hm.id AS "N. Registro", ec.nombre AS "Elemento Config", hm.fecha AS "Fecha", hm.modificacion AS "Modificacion", hm.descripcion AS "Descripcion", cu.nombre AS "Administrador", archivo_respaldo 
   FROM Elementos_Config ec, Cuenta_Usuarios cu, Historial_Modificaciones hm 
   WHERE ec.nombre='%@spEC%';