CREATE TABLE Usuarios (             
             cedula INT,           
             nombre VARCHAR(40) NOT NULL,
             apellido1 VARCHAR(20) NOT NULL,
             apellido2 VARCHAR(20),
             direccion VARCHAR(100) NOT NULL,
             fecha_nacimiento VARCHAR(15) NOT NULL,
			 edad VARCHAR(3),
             sexo VARCHAR(9) NOT NULL,
			 telefono VARCHAR(20) NOT NULL,
			 correo VARCHAR(100) NOT NULL,
			 PRIMARY KEY(cedula),
			 UNIQUE (telefono, correo)
);

CREATE TABLE Cuenta_Usuarios (
             nombre VARCHAR(20),
             clave VARCHAR(100) NOT NULL,
             usuario INT NOT NULL,
             CONSTRAINT FK_cedula_usuario FOREIGN KEY (usuario) REFERENCES Usuarios(cedula),
			 PRIMARY KEY(nombre)
);

CREATE TABLE Roles (
             id INT IDENTITY(1,1),
			 nombre VARCHAR(50) NOT NULL,
			 descripcion VARCHAR(100) NOT NULL,
			 PRIMARY KEY(id),
			 UNIQUE (nombre)
);

CREATE TABLE Administradores (
             usuario INT,
			 rol INT,
			 CONSTRAINT FK_cedula_admin FOREIGN KEY (usuario) REFERENCES Usuarios(cedula),
			 CONSTRAINT FK_rol_admin FOREIGN KEY (rol) REFERENCES Roles(id),
			 PRIMARY KEY (usuario, rol)
);

CREATE TABLE Clasificaciones (
             id INT IDENTITY(1,1),
			 categoria VARCHAR(50) NOT NULL,
			 tipo VARCHAR(50) NOT NULL,
			 PRIMARY KEY(id),
			 UNIQUE (categoria)
);

CREATE TABLE Ubicaciones (
             id INT IDENTITY(1,1),
			 tipo VARCHAR(10) NOT NULL,
			 localizacion VARCHAR(1000) NOT NULL,
			 PRIMARY KEY(id),
			 UNIQUE (tipo)
);

CREATE TABLE Estados (
             id INT IDENTITY(1,1),
			 categoria INT NOT NULL,
			 nombre VARCHAR(50) NOT NULL,
			 descripcion VARCHAR(100) NOT NULL,
			 CONSTRAINT FK_tipo_clasificacion FOREIGN KEY (categoria) REFERENCES Clasificaciones(id),
			 PRIMARY KEY(id),
			 UNIQUE (nombre)
);

CREATE TABLE Elementos_Config (
             id INT IDENTITY(1,1),
			 nombre VARCHAR(50) NOT NULL,
			 descripcion VARCHAR(100) NOT NULL,
			 persona_responsable VARCHAR(20),
			 clasificacion INT,
			 numero_version INT,
			 ubicacion INT,
			 estado INT,
			 CONSTRAINT FK_responsable FOREIGN KEY (persona_responsable) REFERENCES Cuenta_Usuarios(nombre),
			 CONSTRAINT FK_clasif FOREIGN KEY (clasificacion) REFERENCES Clasificaciones(id),
			 CONSTRAINT FK_ubicacion FOREIGN KEY (ubicacion) REFERENCES Ubicaciones(id),
			 CONSTRAINT FK_estado FOREIGN KEY (estado) REFERENCES Estados(id),
			 PRIMARY KEY(id),
			 UNIQUE (nombre)
);

CREATE TABLE Especificaciones (
             elementoConfig INT,
			 detalle VARCHAR(1000) NOT NULL,
             CONSTRAINT FK_EC_especificacion FOREIGN KEY (elementoConfig) REFERENCES Elementos_Config(id),
			 PRIMARY KEY(elementoConfig)
);

CREATE TABLE Tipo_Relaciones (
             id INT IDENTITY(1,1),
			 descripcion VARCHAR(100) NOT NULL,
			 PRIMARY KEY(id),
			 UNIQUE (descripcion)
);

CREATE TABLE Relaciones (
             EC_origen INT,
			 EC_destino INT,
			 relacion INT,
			 CONSTRAINT FK_EC_origen FOREIGN KEY (EC_origen) REFERENCES Elementos_Config(id),
			 CONSTRAINT FK_EC_destino FOREIGN KEY (EC_destino) REFERENCES Elementos_Config(id),
			 CONSTRAINT FK_relaciones FOREIGN KEY (relacion) REFERENCES Tipo_Relaciones(id),
			 PRIMARY KEY(EC_origen, EC_destino)
);

CREATE TABLE Historial_Estados (
             elementoConfig INT,
			 fecha DATETIME DEFAULT GETDATE(),
			 nuevo_estado INT NOT NULL,
			 descripcion VARCHAR(100) NOT NULL,
			 CONSTRAINT FK_elmentoConfig_Estados FOREIGN KEY (elementoConfig) REFERENCES Elementos_Config(id),
			 CONSTRAINT FK_nuevoEstado FOREIGN KEY (nuevo_estado) REFERENCES Estados(id),
			 PRIMARY KEY(elementoConfig, fecha) 
);

CREATE TABLE Historial_Modificaciones (
             id INT IDENTITY(1,1),
             elementoConfig INT, 
			 fecha DATETIME DEFAULT GETDATE(),
			 modificacion VARCHAR(100) NOT NULL,
			 descripcion VARCHAR(1000) NOT NULL,
			 administrador VARCHAR(20) NOT NULL,
			 archivo_respaldo VARCHAR(1000) NOT NULL,
			 CONSTRAINT FK_elmentoConfig_Modifs FOREIGN KEY (elementoConfig) REFERENCES Elementos_Config(id),
			 CONSTRAINT FK_administrador FOREIGN KEY (administrador) REFERENCES Cuenta_Usuarios(nombre),
			 PRIMARY KEY(id,elementoConfig)
);