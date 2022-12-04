CREATE OR REPLACE PACKAGE BODY pkgEstado
AS
PROCEDURE Registrar
(spCategoria IN NUMBER,
spNombre IN VARCHAR2,
spDescripcion IN VARCHAR2,
reg_afectados OUT NUMBER,
cod_err OUT NUMBER,
msg_err OUT VARCHAR2)
IS
BEGIN
       cod_err := 0;
       msg_err := 'OK';  

       INSERT INTO Estados
                   (categoria,nombre,descripcion) 
       VALUES
                   (spCategoria,spNombre,spDescripcion);  

       reg_afectados := SQL%ROWCOUNT;
       COMMIT;
EXCEPTION
       WHEN OTHERS THEN
            ROLLBACK;
            reg_afectados := 0;
            cod_err := SQLCODE;
            msg_err := SQLERRM;
END Registrar;

PROCEDURE Modificar
(spID IN NUMBER,
spCategoria IN NUMBER,
spNombre IN VARCHAR2,
spDescripcion IN VARCHAR2,
reg_afectados OUT NUMBER,
cod_err OUT NUMBER,
msg_err OUT VARCHAR2)
IS
BEGIN
       cod_err := 0;
       msg_err := 'OK';  

       UPDATE Estados 
       SET categoria=spCategoria, nombre=spNombre, descripcion=spDescripcion 
       WHERE id=spID;  
       
       reg_afectados := SQL%ROWCOUNT;
       COMMIT;
EXCEPTION
       WHEN OTHERS THEN
            ROLLBACK;
            reg_afectados := 0;
            cod_err := SQLCODE;
            msg_err := SQLERRM;
END Modificar;

PROCEDURE Buscar(spCategoria IN VARCHAR2, cursorBuscar OUT t_cursor)
IS
BEGIN
OPEN cursorBuscar FOR SELECT id, categoria, nombre, descripcion 
                      FROM Estados 
                      WHERE categoria=spCategoria;
END Buscar;

PROCEDURE Cargar(cursorCargar OUT t_cursor)
IS
BEGIN
OPEN cursorCargar FOR SELECT id, categoria, nombre, descripcion 
                      FROM Estados;
END Cargar;
END pkgEstado;​