CREATE PROCEDURE crearElemento_Config
   @spNombre VARCHAR(50),
   @spDescripcion VARCHAR(100),
   @spPersona_responsable VARCHAR(20), 
   @spClasificacion INT,
   @spNumero_version INT,
   @spUbicacion INT,
   @spEstado INT
AS     
   INSERT INTO Elementos_Config
               (nombre,descripcion,persona_responsable,clasificacion,numero_version,ubicacion,estado) 
   VALUES
               (@spNombre,@spDescripcion,@spPersona_responsable,@spClasificacion,@spNumero_version,@spUbicacion,@spEstado);  


CREATE PROCEDURE modificarElemento_Config
   @spID INT,
   @spNombre VARCHAR(50),
   @spDescripcion VARCHAR(100),
   @spPersona_responsable VARCHAR(20), 
   @spClasificacion INT,
   @spNumero_version INT,
   @spUbicacion INT,
   @spEstado INT
AS  
   UPDATE Elementos_Config 
   SET nombre=@spNombre,descripcion=@spDescripcion,persona_responsable=@spPersona_responsable,clasificacion=@spClasificacion,ubicacion=@spUbicacion,estado=@spEstado
   WHERE id=@spID; 

CREATE PROCEDURE cargarElemento_Config
AS
   SELECT ec.id, ec.nombre, ec.descripcion, cu.nombre AS "usuario", cl.categoria AS "categoria", cl.tipo AS "tipo", numero_version, 
          ub.tipo AS "tipo ubicacion", ub.localizacion AS "localizacion", es.categoria AS "tipo de estado", es.nombre AS "estado actual"
   FROM Elementos_Config ec, Cuenta_Usuarios cu, Clasificaciones cl, Ubicaciones ub, Estados es;
          
CREATE PROCEDURE buscarElemento_Config
   @spNombre VARCHAR(50)
AS
   SELECT ec.id, ec.nombre, ec.descripcion, cu.nombre AS "usuario", cl.categoria AS "categoria", cl.tipo AS "tipo", numero_version,
          ub.tipo AS "tipo ubicacion", ub.localizacion AS "localizacion", es.categoria AS "tipo de estado", es.nombre AS "estado actual" 
   FROM Elementos_Config ec, Cuenta_Usuarios cu, Clasificaciones cl, Ubicaciones ub, Estados es 
   WHERE ec.nombre='%@spNombre%';