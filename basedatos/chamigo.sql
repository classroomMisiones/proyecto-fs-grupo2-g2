USE [master]
GO
/****** Object:  Database [Chamigo]    Script Date: 12/9/2021 19:38:34 ******/
CREATE DATABASE [Chamigo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Chamigo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Chamigo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Chamigo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Chamigo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Chamigo] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Chamigo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Chamigo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Chamigo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Chamigo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Chamigo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Chamigo] SET ARITHABORT OFF 
GO
ALTER DATABASE [Chamigo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Chamigo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Chamigo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Chamigo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Chamigo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Chamigo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Chamigo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Chamigo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Chamigo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Chamigo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Chamigo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Chamigo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Chamigo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Chamigo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Chamigo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Chamigo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Chamigo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Chamigo] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Chamigo] SET  MULTI_USER 
GO
ALTER DATABASE [Chamigo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Chamigo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Chamigo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Chamigo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Chamigo] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Chamigo] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Chamigo] SET QUERY_STORE = OFF
GO
USE [Chamigo]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 12/9/2021 19:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
	[NombreCliente] [nchar](30) NOT NULL,
	[Email] [nchar](30) NOT NULL,
	[Password] [nchar](70) NOT NULL,
	[Dni] [int] NULL,
	[Telefono] [int] NULL,
	[TelefonoAlternativo] [int] NULL,
	[CalleDomicilio] [nchar](30) NULL,
	[NumeroCalle] [smallint] NULL,
	[PisoDepartamento] [nchar](20) NULL,
	[IdProvincia] [smallint] NULL,
	[Localidad] [nchar](30) NULL,
	[CodigoPostal] [smallint] NULL,
	[Referencia] [nchar](40) NULL,
	[IdCuenta] [int] NULL,
	[FechaUltimoMovimiento] [datetime] NULL,
	[UrlFoto] [nchar](150) NULL,
	[Respuesta1] [nchar](50) NULL,
	[Respuesta2] [nchar](50) NULL,
	[Respuesta3] [nchar](50) NULL,
 CONSTRAINT [PK_clientes] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Configuraciones]    Script Date: 12/9/2021 19:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Configuraciones](
	[IdConfiguracion] [smallint] IDENTITY(1,1) NOT NULL,
	[MonedaPrincipal] [smallint] NOT NULL,
	[SimboloMonedaPrincipal] [nchar](4) NULL,
	[DecimalesMonedaPrincipal] [tinyint] NULL,
 CONSTRAINT [PK_Configuraciones] PRIMARY KEY CLUSTERED 
(
	[IdConfiguracion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CuentaMonedas]    Script Date: 12/9/2021 19:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CuentaMonedas](
	[IdCuentaMoneda] [int] IDENTITY(1,1) NOT NULL,
	[IdCuenta] [int] NOT NULL,
	[IdMoneda] [smallint] NOT NULL,
	[TotalCuentaMoneda] [decimal](18, 8) NOT NULL,
 CONSTRAINT [PK_CuentaMonedas] PRIMARY KEY CLUSTERED 
(
	[IdCuentaMoneda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cuentas]    Script Date: 12/9/2021 19:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cuentas](
	[IdCuenta] [int] IDENTITY(1,1) NOT NULL,
	[Cvu] [nchar](22) NOT NULL,
	[Alias] [nchar](20) NOT NULL,
	[FechaAlta] [datetime] NOT NULL,
	[Estado] [nchar](20) NOT NULL,
 CONSTRAINT [PK_cuentas] PRIMARY KEY CLUSTERED 
(
	[IdCuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetalleTransacciones]    Script Date: 12/9/2021 19:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleTransacciones](
	[IdDetalleTransaccion] [int] IDENTITY(1,1) NOT NULL,
	[IdTransaccion] [smallint] NOT NULL,
	[FechaTransaccion] [datetime] NOT NULL,
	[DescripcionTransaccion] [nchar](70) NULL,
	[IdCuentaIngreso] [int] NOT NULL,
	[IdMonedaIngreso] [int] NOT NULL,
	[MontoIngreso] [decimal](18, 8) NOT NULL,
	[IdCuentaEgreso] [int] NULL,
	[IdMonedaEgreso] [int] NULL,
	[MontoEgreso] [decimal](18, 8) NULL,
 CONSTRAINT [PK_DetalleTransacciones] PRIMARY KEY CLUSTERED 
(
	[IdDetalleTransaccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Estados]    Script Date: 12/9/2021 19:38:34 ******/
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
/****** Object:  Table [dbo].[Monedas]    Script Date: 12/9/2021 19:38:34 ******/
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
/****** Object:  Table [dbo].[Provincias]    Script Date: 12/9/2021 19:38:34 ******/
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
/****** Object:  Table [dbo].[Transacciones]    Script Date: 12/9/2021 19:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transacciones](
	[idTransaccion] [smallint] IDENTITY(1,1) NOT NULL,
	[NombreTransaccion] [nchar](20) NULL,
 CONSTRAINT [PK_Transacciones] PRIMARY KEY CLUSTERED 
(
	[idTransaccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CuentaMonedas] ADD  CONSTRAINT [DF_CuentaMonedas_TotalCuentaMoneda]  DEFAULT ((0)) FOR [TotalCuentaMoneda]
GO
ALTER TABLE [dbo].[Cuentas] ADD  CONSTRAINT [DF_Cuentas_FechaAlta]  DEFAULT (getdate()) FOR [FechaAlta]
GO
ALTER TABLE [dbo].[DetalleTransacciones] ADD  CONSTRAINT [DF_DetalleTransacciones_FechaTransaccion]  DEFAULT (getdate()) FOR [FechaTransaccion]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_Cuentas] FOREIGN KEY([IdCuenta])
REFERENCES [dbo].[Cuentas] ([IdCuenta])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [FK_Clientes_Cuentas]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_clientes_provincias] FOREIGN KEY([IdProvincia])
REFERENCES [dbo].[Provincias] ([IdProvincia])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [FK_clientes_provincias]
GO
/****** Object:  StoredProcedure [dbo].[spAgregaCliente]    Script Date: 12/9/2021 19:38:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spAgregaCliente]
    @nombre AS VARCHAR(30),
    @email AS VARCHAR(30),
    @password AS VARCHAR(70),
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

				INSERT INTO dbo.Clientes (NombreCliente, Email, Password, IdCuenta) VALUES (@nombre, @email, @password, @idCuenta)

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
USE [master]
GO
ALTER DATABASE [Chamigo] SET  READ_WRITE 
GO
