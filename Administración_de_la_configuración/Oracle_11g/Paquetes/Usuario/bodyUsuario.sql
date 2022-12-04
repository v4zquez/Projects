CREATE OR REPLACE PACKAGE BODY pkgUsuario
AS
PROCEDURE Registrar
(spCedula IN NUMBER,
spNombre IN VARCHAR2,
spApellido1 IN VARCHAR2,
spApellido2 IN VARCHAR2,
spDireccion IN VARCHAR2,
spFecha IN VARCHAR2,
spSexo IN VARCHAR2,
spTelefono IN VARCHAR2,
spCorreo IN VARCHAR2,
reg_afectados OUT NUMBER,
cod_err OUT NUMBER,
msg_err OUT VARCHAR2)
IS
spEdad INT;
BEGIN
       cod_err := 0;
       msg_err := 'OK'; 

	   SELECT TRUNC((MONTHS_BETWEEN(SYSDATE,spFecha)/12)) INTO spEdad FROM SYS.DUAL;
       
       INSERT INTO Usuarios
                   (cedula,nombre,apellido1,apellido2,direccion,fecha_nacimiento,edad,sexo,telefono,correo) 
       VALUES
                   (spCedula,spNombre,spApellido1,spApellido2,spDireccion,spFecha,spEdad,spSexo,spTelefono,spCorreo);  

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
(spCedula IN NUMBER,
spNombre IN VARCHAR2,
spApellido1 IN VARCHAR2,
spApellido2 IN VARCHAR2,
spDireccion IN VARCHAR2,
spFecha IN VARCHAR2,
spSexo IN VARCHAR2,
spTelefono IN VARCHAR2,
spCorreo IN VARCHAR2,
reg_afectados OUT NUMBER,
cod_err OUT NUMBER,
msg_err OUT VARCHAR2)
IS
spEdad INT;
BEGIN
       cod_err := 0;
       msg_err := 'OK';    

	   SELECT TRUNC((MONTHS_BETWEEN(SYSDATE,spFecha)/12)) INTO spEdad FROM SYS.DUAL;

       UPDATE Usuarios 
       SET nombre=spNombre, apellido1=spApellido1, apellido2=spApellido2, direccion=spDireccion, 
	       fecha_nacimiento=spFecha, edad=spEdad, sexo=spSexo, telefono=spTelefono, correo=spCorreo
       WHERE cedula=spCedula; 
       
       reg_afectados := SQL%ROWCOUNT;
       COMMIT;
EXCEPTION
       WHEN OTHERS THEN
            ROLLBACK;
            reg_afectados := 0;
            cod_err := SQLCODE;
            msg_err := SQLERRM;
END Modificar;

PROCEDURE Buscar(spCedula IN NUMBER, cursorBuscar OUT t_cursor)
IS
BEGIN
OPEN cursorBuscar FOR SELECT cedula,nombre,apellido1,apellido2,direccion,fecha_nacimiento,edad,sexo, 
                      telefono, correo FROM Usuarios WHERE cedula=spCedula;
END Buscar;

PROCEDURE Cargar(cursorCargar OUT t_cursor)
IS
BEGIN
OPEN cursorCargar FOR SELECT cedula,nombre,apellido1,apellido2,direccion,fecha_nacimiento,edad,sexo,
                      telefono,correo FROM Usuarios;
END Cargar;
END pkgUsuario;