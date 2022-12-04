CREATE OR REPLACE PACKAGE BODY pkgElemento_Config
AS
PROCEDURE Registrar
(spNombre IN VARCHAR2,
spDescripcion IN VARCHAR2,
spPersona_responsable IN VARCHAR2,
spClasificacion IN NUMBER,
spNumero_version IN NUMBER,
spUbicacion IN NUMBER,
spEstado IN NUMBER,
reg_afectados OUT NUMBER,
cod_err OUT NUMBER,
msg_err OUT VARCHAR2)
IS
BEGIN
       cod_err := 0;
       msg_err := 'OK';  

       INSERT INTO Elementos_Config
                   (nombre,descripcion,persona_responsable,clasificacion,numero_version,ubicacion,estado) 
       VALUES
                   (spNombre,spDescripcion,spPersona_responsable,spClasificacion,spNumero_version,spUbicacion,spEstado);  

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
spPersona_responsable IN VARCHAR2,
spClasificacion IN NUMBER,
spUbicacion IN NUMBER,
spEstado IN NUMBER,
reg_afectados OUT NUMBER,
cod_err OUT NUMBER,
msg_err OUT VARCHAR2)
IS
BEGIN
       cod_err := 0;
       msg_err := 'OK';  

       UPDATE Elementos_Config 
       SET nombre=spNombre,descripcion=spDescripcion,persona_responsable=spPersona_responsable,clasificacion=spClasificacion,ubicacion=spUbicacion,estado=spEstado
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
OPEN cursorBuscar FOR SELECT ec.id, ec.nombre, ec.descripcion, cu.nombre AS "usuario", cl.categoria AS "categoria", cl.tipo AS "tipo", numero_version,
                             ub.tipo AS "tipo ubicacion", ub.localizacion AS "localizacion", es.categoria AS "tipo de estado", es.nombre AS "estado actual" 
				      FROM Elementos_Config ec, Cuenta_Usuarios cu, Clasificaciones cl, Ubicaciones ub, Estados es 
				      WHERE ec.nombre='%spNombre%';
END Buscar;

PROCEDURE Cargar(cursorCargar OUT t_cursor)
IS
BEGIN
OPEN cursorCargar FOR SELECT ec.id, ec.nombre, ec.descripcion, cu.nombre AS "usuario", cl.categoria AS "categoria", cl.tipo AS "tipo", numero_version, 
                             ub.tipo AS "tipo ubicacion", ub.localizacion AS "localizacion", es.categoria AS "tipo de estado", es.nombre AS "estado actual"
					  FROM Elementos_Config ec, Cuenta_Usuarios cu, Clasificaciones cl, Ubicaciones ub, Estados es;
END Cargar;
END pkgElemento_Config;​