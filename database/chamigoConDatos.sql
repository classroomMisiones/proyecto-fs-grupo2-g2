USE [Chamigo]
GO
/****** Object:  Table [dbo].[Configuraciones]    Script Date: 19/10/2021 10:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configuraciones](
	[IdConfiguracion] [smallint] IDENTITY(1,1) NOT NULL,
	[MonedaPrincipal] [smallint] NOT NULL,
	[SimboloMonedaPrincipal] [nchar](4) NULL,
	[DecimalesMonedaPrincipal] [tinyint] NULL,
	[Descubierto] [decimal](18, 2) NULL,
	[Pregunta1] [nchar](50) NULL,
	[Pregunta2] [nchar](50) NULL,
	[Pregunta3] [nchar](50) NULL,
 CONSTRAINT [PK_Configuraciones] PRIMARY KEY CLUSTERED 
(
	[IdConfiguracion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estados]    Script Date: 19/10/2021 10:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Estados](
	[IdEstado] [smallint] IDENTITY(1,1) NOT NULL,
	[Estado] [nchar](20) NULL,
	[Habilitado] [bit] NULL,
 CONSTRAINT [PK_Estados] PRIMARY KEY CLUSTERED 
(
	[IdEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Monedas]    Script Date: 19/10/2021 10:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Monedas](
	[IdMoneda] [smallint] IDENTITY(1,1) NOT NULL,
	[NombreMoneda] [nchar](20) NULL,
	[SimboloMoneda] [nchar](4) NULL,
	[UrlLogoMoneda] [nchar](50) NULL,
	[Abreviatura] [nchar](10) NULL,
	[Criptomoneda] [bit] NULL,
	[Decimales] [tinyint] NULL,
 CONSTRAINT [PK_monedas] PRIMARY KEY CLUSTERED 
(
	[IdMoneda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provincias]    Script Date: 19/10/2021 10:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provincias](
	[IdProvincia] [smallint] IDENTITY(1,1) NOT NULL,
	[NombreProvincia] [nchar](30) NULL,
 CONSTRAINT [PK_provincias] PRIMARY KEY CLUSTERED 
(
	[IdProvincia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transacciones]    Script Date: 19/10/2021 10:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transacciones](
	[idTransaccion] [smallint] NOT NULL,
	[NombreTransaccion] [nchar](20) NULL,
 CONSTRAINT [PK_Transacciones] PRIMARY KEY CLUSTERED 
(
	[idTransaccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Configuraciones] ON 

INSERT [dbo].[Configuraciones] ([IdConfiguracion], [MonedaPrincipal], [SimboloMonedaPrincipal], [DecimalesMonedaPrincipal], [Descubierto], [Pregunta1], [Pregunta2], [Pregunta3]) VALUES (1, 1, N'$   ', 2, CAST(5000.00 AS Decimal(18, 2)), N'Lugar preferido para vacacionar                   ', N'Apellido materno                                  ', N'Comida favorita                                   ')
SET IDENTITY_INSERT [dbo].[Configuraciones] OFF
GO
SET IDENTITY_INSERT [dbo].[Estados] ON 

INSERT [dbo].[Estados] ([IdEstado], [Estado], [Habilitado]) VALUES (1, N'Pendiente           ', 1)
INSERT [dbo].[Estados] ([IdEstado], [Estado], [Habilitado]) VALUES (2, N'Habilitado          ', 1)
INSERT [dbo].[Estados] ([IdEstado], [Estado], [Habilitado]) VALUES (3, N'Suspendido          ', 0)
SET IDENTITY_INSERT [dbo].[Estados] OFF
GO
SET IDENTITY_INSERT [dbo].[Monedas] ON 

INSERT [dbo].[Monedas] ([IdMoneda], [NombreMoneda], [SimboloMoneda], [UrlLogoMoneda], [Abreviatura], [Criptomoneda], [Decimales]) VALUES (1, N'Pesos               ', N'$   ', N'assets/imagenes/peso.png                          ', N'pesos     ', 0, 2)
INSERT [dbo].[Monedas] ([IdMoneda], [NombreMoneda], [SimboloMoneda], [UrlLogoMoneda], [Abreviatura], [Criptomoneda], [Decimales]) VALUES (2, N'Bitcoin             ', N'BTC ', N'assets/imagenes/bitcoin.png                       ', N'bitcoin   ', 1, 6)
INSERT [dbo].[Monedas] ([IdMoneda], [NombreMoneda], [SimboloMoneda], [UrlLogoMoneda], [Abreviatura], [Criptomoneda], [Decimales]) VALUES (3, N'Ethereum            ', N'ETH ', N'assets/imagenes/ethereum.png                      ', N'ethereum  ', 1, 6)
INSERT [dbo].[Monedas] ([IdMoneda], [NombreMoneda], [SimboloMoneda], [UrlLogoMoneda], [Abreviatura], [Criptomoneda], [Decimales]) VALUES (4, N'USD Coin            ', N'USDC', N'assets/imagenes/usdc.png                          ', N'usd-coin  ', 1, 6)
SET IDENTITY_INSERT [dbo].[Monedas] OFF
GO
SET IDENTITY_INSERT [dbo].[Provincias] ON 

INSERT [dbo].[Provincias] ([IdProvincia], [NombreProvincia]) VALUES (1, N'Misiones                      ')
INSERT [dbo].[Provincias] ([IdProvincia], [NombreProvincia]) VALUES (2, N'Córdoba                       ')
INSERT [dbo].[Provincias] ([IdProvincia], [NombreProvincia]) VALUES (3, N'Buenos Aires                  ')
INSERT [dbo].[Provincias] ([IdProvincia], [NombreProvincia]) VALUES (4, N'Chaco                         ')
INSERT [dbo].[Provincias] ([IdProvincia], [NombreProvincia]) VALUES (5, N'Corrientes                    ')
INSERT [dbo].[Provincias] ([IdProvincia], [NombreProvincia]) VALUES (6, N'Santa Fé                      ')
INSERT [dbo].[Provincias] ([IdProvincia], [NombreProvincia]) VALUES (12, N'Mendoza                       ')
INSERT [dbo].[Provincias] ([IdProvincia], [NombreProvincia]) VALUES (13, N'Entre Ríos                    ')
INSERT [dbo].[Provincias] ([IdProvincia], [NombreProvincia]) VALUES (14, N'Tierra del Fuego              ')
INSERT [dbo].[Provincias] ([IdProvincia], [NombreProvincia]) VALUES (21, N'Neuquén                       ')
SET IDENTITY_INSERT [dbo].[Provincias] OFF
GO
INSERT [dbo].[Transacciones] ([idTransaccion], [NombreTransaccion]) VALUES (1, N'Ingreso             ')
INSERT [dbo].[Transacciones] ([idTransaccion], [NombreTransaccion]) VALUES (2, N'Retiro              ')
INSERT [dbo].[Transacciones] ([idTransaccion], [NombreTransaccion]) VALUES (3, N'Transferencia       ')
INSERT [dbo].[Transacciones] ([idTransaccion], [NombreTransaccion]) VALUES (4, N'Compra              ')
INSERT [dbo].[Transacciones] ([idTransaccion], [NombreTransaccion]) VALUES (5, N'Venta               ')
INSERT [dbo].[Transacciones] ([idTransaccion], [NombreTransaccion]) VALUES (6, N'Intercambio         ')
GO
/****** Object:  StoredProcedure [dbo].[spRegistroCliente]    Script Date: 19/10/2021 10:16:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spRegistroCliente]
    @nombre AS VARCHAR(30),
    @email AS VARCHAR(30),
    @password AS VARCHAR(70),
	@pregunta1 AS VARCHAR(50),
    @respuesta1 AS VARCHAR(50),
    @pregunta2 AS VARCHAR(50),
    @respuesta2 AS VARCHAR(50),
    @pregunta3 AS VARCHAR(50),
    @respuesta3 AS VARCHAR(50),
    @cvu AS VARCHAR(22),
    @alias AS VARCHAR(20),
    @estado AS VARCHAR(20),
	@codRetorno AS INT OUTPUT

AS
BEGIN

    SET NOCOUNT ON;

    Begin Tran Tadd

    Begin Try
		DECLARE @nroCliente int = (SELECT COUNT(*) FROM Clientes WHERE Email=@email);
		DECLARE @nroCuenta int = (SELECT COUNT(*) FROM Cuentas WHERE Cvu=@cvu OR Alias=@alias);
		IF @nroCliente=0 AND @nroCuenta=0
		BEGIN
				INSERT INTO dbo.Cuentas (Cvu, Alias, Estado) VALUES (@cvu, @alias, @estado)
				DECLARE @idCuenta AS INT
				SET @idCuenta = SCOPE_IDENTITY()	

				--DECLARE @tempMoneda TABLE(IdMoneda int)
				--INSERT INTO @tempMoneda(IdMoneda) SELECT IdMoneda FROM Monedas
				--DECLARE @rowsMoneda int = (SELECT count(*) FROM @tempMoneda)
				--WHILE @rowsMoneda > 0
				--	BEGIN
				--		DECLARE @idMoneda int = (SELECT TOP(1) IdMoneda FROM @tempMoneda)
				--		INSERT INTO dbo.CuentaMonedas(IdCuenta, IdMoneda) VALUES (@idCuenta, @idMoneda)
				--		DELETE @tempMoneda WHERE IdMoneda=@idMoneda
				--		SET @rowsMoneda = (SELECT count(*) FROM @tempMoneda)
				--	END

				INSERT INTO dbo.Clientes (NombreCliente, Email, Password, IdCuenta, Pregunta1, Respuesta1, Pregunta2, Respuesta2, Pregunta3, Respuesta3) 
								  VALUES (@nombre, @email, @password, @idCuenta, @pregunta1, @respuesta1, @pregunta2, @respuesta2, @pregunta3, @respuesta3)

				COMMIT TRAN Tadd
				SET @codRetorno = 200
		END
		ELSE
		BEGIN
			IF @nroCliente > 0
			BEGIN
			    Rollback TRAN Tadd
				SET @codRetorno =  1
			END
			ELSE
			BEGIN
			    Rollback TRAN Tadd
				SET @codRetorno =  2
			END
		END
    End try

    Begin Catch
        Rollback TRAN Tadd
		SET @codRetorno =  3
    End Catch

END
GO
