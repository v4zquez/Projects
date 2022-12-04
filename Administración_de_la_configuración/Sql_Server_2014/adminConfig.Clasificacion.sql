CREATE PROCEDURE crearClasificacion
    @spCategoria VARCHAR(50),
    @spTipo VARCHAR(50)
AS     
    INSERT INTO Clasificaciones
                (categoria,tipo) 
    VALUES
                (@spCategoria,@spTipo);


CREATE PROCEDURE modificarClasificacion
    @spID INT,
	@spCategoria VARCHAR(50),
    @spTipo VARCHAR(50) 
AS   
    UPDATE Clasificaciones 
    SET categoria=@spCategoria, tipo=@spTipo
    WHERE id=@spID; 

CREATE PROCEDURE cargarClasificacion
AS
   SELECT id, categoria, tipo 
   FROM Clasificaciones;
          
CREATE PROCEDURE buscarClasificacion
   @spCategoria VARCHAR(50)
AS
   SELECT id, categoria, tipo 
   FROM Clasificaciones 
   WHERE categoria=@spCategoria;