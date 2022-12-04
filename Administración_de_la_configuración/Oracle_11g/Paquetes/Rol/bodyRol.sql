CREATE OR REPLACE PACKAGE BODY pkgRol
AS
PROCEDURE Registrar
(spNombre IN VARCHAR2,
spDescripcion IN VARCHAR2,
reg_afectados OUT NUMBER,
cod_err OUT NUMBER,
msg_err OUT VARCHAR2)
IS
BEGIN
       cod_err := 0;
       msg_err := 'OK';  

       INSERT INTO Roles
                   (nombre,descripcion) 
       VALUES
                   (spNombre,spDescripcion);  

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
spNombre IN VARCHAR2,
spDescripcion IN VARCHAR2,
reg_afectados OUT NUMBER,
cod_err OUT NUMBER,
msg_err OUT VARCHAR2)
IS
spEdad INT;
BEGIN
       cod_err := 0;
       msg_err := 'OK';  

       UPDATE Roles 
       SET nombre=spNombre, descripcion=spDescripcion
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

PROCEDURE Buscar(spNombre IN VARCHAR2, cursorBuscar OUT t_cursor)
IS
BEGIN
OPEN cursorBuscar FOR SELECT id, nombre, descripcion FROM Roles WHERE nombre='%spNombre%'; 
END Buscar;

PROCEDURE Cargar(cursorCargar OUT t_cursor)
IS
BEGIN
OPEN cursorCargar FOR SELECT id, nombre, descripcion FROM Roles;
END Cargar;
END pkgRol;