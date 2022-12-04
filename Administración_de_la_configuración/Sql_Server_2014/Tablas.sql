CREATE TABLE Usuarios (             
             cedula NUMBER,           
             nombre VARCHAR2(40) NOT NULL,
             apellido1 VARCHAR2(20) NOT NULL,
             apellido2 VARCHAR2(20),
             direccion VARCHAR2(100) NOT NULL,
             fecha_nacimiento VARCHAR2(15) NOT NULL,
			 edad VARCHAR2(3),
             sexo VARCHAR2(9) NOT NULL,
			 telefono VARCHAR2(20) NOT NULL,
			 correo VARCHAR2(100) NOT NULL,
			 PRIMARY KEY(cedula),
			 UNIQUE (telefono, correo)
);

CREATE TABLE Cuenta_Usuarios (
             nombre VARCHAR2(20),
             clave VARCHAR2(100) NOT NULL,
             usuario NUMBER NOT NULL,
             CONSTRAINT FK_cedula_usuario FOREIGN KEY (usuario) REFERENCES Usuarios(cedula),
			 PRIMARY KEY(nombre)
);

CREATE TABLE Roles (
             id NUMBER,
			 nombre VARCHAR2(50) NOT NULL,
			 descripcion VARCHAR2(100) NOT NULL,
			 PRIMARY KEY(id),
			 UNIQUE (nombre)
);

CREATE TABLE Administradores (
             usuario NUMBER,
			 rol NUMBER,
			 CONSTRAINT FK_cedula_admin FOREIGN KEY (usuario) REFERENCES Usuarios(cedula),
			 CONSTRAINT FK_rol_admin FOREIGN KEY (rol) REFERENCES Roles(id),
			 PRIMARY KEY (usuario, rol)
);

CREATE TABLE Clasificaciones (
             id NUMBER,
			 categoria VARCHAR2(50) NOT NULL,
			 tipo VARCHAR2(50) NOT NULL,
			 PRIMARY KEY(id),
			 UNIQUE (categoria)
);

CREATE TABLE Ubicaciones (
             id NUMBER,
			 tipo VARCHAR2(10) NOT NULL,
			 localizacion VARCHAR2(1000) NOT NULL,
			 PRIMARY KEY(id),
			 UNIQUE (tipo)
);

CREATE TABLE Estados (
             id NUMBER,
			 categoria NUMBER NOT NULL,
			 nombre VARCHAR2(50) NOT NULL,
			 descripcion VARCHAR2(100) NOT NULL,
			 CONSTRAINT FK_tipo_clasificacion FOREIGN KEY (categoria) REFERENCES Clasificaciones(id),
			 PRIMARY KEY(id),
			 UNIQUE (nombre)
);

CREATE TABLE Elementos_Config (
             id NUMBER,
			 nombre VARCHAR2(50) NOT NULL,
			 descripcion VARCHAR2(100) NOT NULL,
			 persona_responsable VARCHAR2(20),
			 clasificacion NUMBER,
			 numero_version NUMBER,
			 ubicacion NUMBER,
			 estado NUMBER,
			 CONSTRAINT FK_responsable FOREIGN KEY (persona_responsable) REFERENCES Cuenta_Usuarios(nombre),
			 CONSTRAINT FK_clasif FOREIGN KEY (clasificacion) REFERENCES Clasificaciones(id),
			 CONSTRAINT FK_ubicacion FOREIGN KEY (ubicacion) REFERENCES Ubicaciones(id),
			 CONSTRAINT FK_estado FOREIGN KEY (estado) REFERENCES Estados(id),
			 PRIMARY KEY(id),
			 UNIQUE (nombre)
);

CREATE TABLE Especificaciones (
             elementoConfig NUMBER,
			 detalle VARCHAR2(1000) NOT NULL,
             CONSTRAINT FK_EC_especificacion FOREIGN KEY (elementoConfig) REFERENCES Elementos_Config(id),
			 PRIMARY KEY(elementoConfig)
);

CREATE TABLE Tipo_Relaciones (
             id NUMBER,
			 descripcion VARCHAR2(100) NOT NULL,
			 PRIMARY KEY(id),
			 UNIQUE (descripcion)
);

CREATE TABLE Relaciones (
             EC_origen NUMBER,
			 EC_destino NUMBER,
			 relacion NUMBER,
			 CONSTRAINT FK_EC_origen FOREIGN KEY (EC_origen) REFERENCES Elementos_Config(id),
			 CONSTRAINT FK_EC_destino FOREIGN KEY (EC_destino) REFERENCES Elementos_Config(id),
			 CONSTRAINT FK_relaciones FOREIGN KEY (relacion) REFERENCES Tipo_Relaciones(id),
			 PRIMARY KEY(EC_origen, EC_destino)
);

CREATE TABLE Historial_Estados (
             elementoConfig NUMBER,
			 fecha DATE DEFAULT SYSDATE,
			 nuevo_estado NUMBER NOT NULL,
			 descripcion VARCHAR2(100) NOT NULL,
			 CONSTRAINT FK_elmentoConfig_Estados FOREIGN KEY (elementoConfig) REFERENCES Elementos_Config(id),
			 CONSTRAINT FK_nuevoEstado FOREIGN KEY (nuevo_estado) REFERENCES Estados(id),
			 PRIMARY KEY(elementoConfig, fecha) 
);

CREATE TABLE Historial_Modificaciones (
             id NUMBER,
             elementoConfig NUMBER, 
			 fecha DATE DEFAULT SYSDATE,
			 modificacion VARCHAR2(100) NOT NULL,
			 descripcion VARCHAR2(1000) NOT NULL,
			 administrador VARCHAR2(20) NOT NULL,
			 archivo_respaldo VARCHAR2(1000) NOT NULL,
			 CONSTRAINT FK_elmentoConfig_Modifs FOREIGN KEY (elementoConfig) REFERENCES Elementos_Config(id),
			 CONSTRAINT FK_administrador FOREIGN KEY (administrador) REFERENCES Cuenta_Usuarios(nombre),
			 PRIMARY KEY(id,elementoConfig)
);