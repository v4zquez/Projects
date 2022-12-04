CREATE PROCEDURE registrarCliente    
    @spCedula INT,
    @spNombre VARCHAR(50),
    @spApellidos VARCHAR(100),
	@spFecha_Nacimiento DATE,
	@spDireccion VARCHAR(100),
    @spTelefono VARCHAR(20),
    @spEmail VARCHAR(100)
AS  
	DECLARE @edad INT
	SET @edad = (SELECT (cast(datediff(dd,@spFecha_Nacimiento,getdate()) / 365.25 AS INT)));

    IF @edad >= 18
	   BEGIN
			INSERT INTO Cliente
					    (cedula,nombre,apellidos,fecha_nacimiento,direccion,telefono,email) 
		    VALUES
						(@spCedula,@spNombre,@spApellidos,@spFecha_Nacimiento,@spDireccion,@spTelefono,@spEmail);
	   END
	ELSE
	   BEGIN
	        PRINT 'El cliente debe ser mayor de edad'
	   END
---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------
CREATE PROCEDURE registrarFactura    
    @spCliente INT,
    @spModoPago INT
AS  
    INSERT INTO Factura
			    (cliente,modo_pago) 
    VALUES
				(@spCliente,@spModoPago);
----------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------
CREATE PROCEDURE registrarDetalle    
    @spFactura INT,
	@spAlquiler INT,
	@spSeguro INT,
	@spExtra INT,
	@spFecha_Salida DATETIME,
	@spFecha_Entrada DATETIME
AS  
    DECLARE @valorSeguro INT
	DECLARE @valorVehiculo INT
	DECLARE @diasAlquiler INT
	DECLARE @montoPagar FLOAT
	DECLARE @valorExtra INT
	
	SET @valorSeguro = (SELECT precio FROM Seguro WHERE id_seguro=@spSeguro);
	SET @valorVehiculo = (SELECT precio 
	                      FROM Vehiculo 
	                      WHERE placa=(SELECT vehiculo FROM Alquiler WHERE id_alquiler=@spAlquiler));
	SET @valorExtra = (SELECT precio FROM Extra WHERE id_extra=@spExtra);
	SET @diasAlquiler = (SELECT (datediff(day, @spFecha_Salida, @spFecha_Entrada)));
	SET @montoPagar = (@valorSeguro + @valorExtra + (@valorVehiculo * @diasAlquiler));

	INSERT INTO Detalle
		       (factura, alquiler, seguro, extra, monto_pagar) 
    VALUES
				(@spFactura,@spAlquiler,@spSeguro,@spExtra,@montoPagar);