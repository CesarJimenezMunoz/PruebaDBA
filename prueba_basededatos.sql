USE [master]
GO
/****** Object:  Database [Prueba_CesarJimenez]    Script Date: 20-10-2023 4:32:53 PM ******/
CREATE DATABASE [Prueba_CesarJimenez]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Prueba_CesarJimenez', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Prueba_CesarJimenez.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Prueba_CesarJimenez_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Prueba_CesarJimenez_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Prueba_CesarJimenez] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Prueba_CesarJimenez].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Prueba_CesarJimenez] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Prueba_CesarJimenez] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Prueba_CesarJimenez] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Prueba_CesarJimenez] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Prueba_CesarJimenez] SET ARITHABORT OFF 
GO
ALTER DATABASE [Prueba_CesarJimenez] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Prueba_CesarJimenez] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Prueba_CesarJimenez] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Prueba_CesarJimenez] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Prueba_CesarJimenez] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Prueba_CesarJimenez] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Prueba_CesarJimenez] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Prueba_CesarJimenez] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Prueba_CesarJimenez] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Prueba_CesarJimenez] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Prueba_CesarJimenez] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Prueba_CesarJimenez] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Prueba_CesarJimenez] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Prueba_CesarJimenez] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Prueba_CesarJimenez] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Prueba_CesarJimenez] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Prueba_CesarJimenez] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Prueba_CesarJimenez] SET RECOVERY FULL 
GO
ALTER DATABASE [Prueba_CesarJimenez] SET  MULTI_USER 
GO
ALTER DATABASE [Prueba_CesarJimenez] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Prueba_CesarJimenez] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Prueba_CesarJimenez] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Prueba_CesarJimenez] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Prueba_CesarJimenez] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Prueba_CesarJimenez] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Prueba_CesarJimenez', N'ON'
GO
ALTER DATABASE [Prueba_CesarJimenez] SET QUERY_STORE = ON
GO
ALTER DATABASE [Prueba_CesarJimenez] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Prueba_CesarJimenez]
GO
/****** Object:  UserDefinedFunction [dbo].[validaaccion]    Script Date: 20-10-2023 4:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE function [dbo].[validaaccion]
(@accion int
)
returns int
as
begin
	declare @dato int

	select	@dato=count(*)
	from	tiposmovimiento
	where	IdMovimiento = @accion

	return @dato
end
GO
/****** Object:  UserDefinedFunction [dbo].[validapaciente]    Script Date: 20-10-2023 4:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create function [dbo].[validapaciente]
(@paciente int
)
returns int
as
begin
	declare @dato int

	select	@dato=count(*)
	from	paciente
	where	IdPaciente = @paciente

	return @dato
end
GO
/****** Object:  Table [dbo].[movimiento]    Script Date: 20-10-2023 4:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[movimiento](
	[IdMovimiento] [int] IDENTITY(1,1) NOT NULL,
	[TipoMovimiento] [int] NOT NULL,
	[IdPaciente] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Hora] [smalldatetime] NOT NULL,
	[DatoAnterior] [varchar](200) NOT NULL,
	[DatoActual] [varchar](200) NOT NULL,
 CONSTRAINT [PK_movimiento] PRIMARY KEY CLUSTERED 
(
	[IdMovimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[paciente]    Script Date: 20-10-2023 4:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[paciente](
	[IdPaciente] [int] IDENTITY(1,1) NOT NULL,
	[Documento] [int] NOT NULL,
	[Nombres] [varchar](60) NOT NULL,
	[Apellidos] [varchar](60) NOT NULL,
	[Direccion] [varchar](100) NOT NULL,
	[Telefono] [int] NOT NULL,
	[Sexo] [char](1) NOT NULL,
	[Ciudad] [varchar](50) NOT NULL,
	[RH] [char](3) NOT NULL,
	[Contacto] [varchar](50) NOT NULL,
	[Parentezco_contacto] [varchar](50) NOT NULL,
	[Telefono_contacto] [int] NOT NULL,
 CONSTRAINT [PK_paciente] PRIMARY KEY CLUSTERED 
(
	[IdPaciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tiposmovimiento]    Script Date: 20-10-2023 4:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tiposmovimiento](
	[IdMovimiento] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tiposmovimiento] PRIMARY KEY CLUSTERED 
(
	[IdMovimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[movimiento]  WITH CHECK ADD  CONSTRAINT [FK_movimiento_paciente] FOREIGN KEY([IdPaciente])
REFERENCES [dbo].[paciente] ([IdPaciente])
GO
ALTER TABLE [dbo].[movimiento] CHECK CONSTRAINT [FK_movimiento_paciente]
GO
ALTER TABLE [dbo].[movimiento]  WITH CHECK ADD  CONSTRAINT [FK_movimiento_tiposmovimiento] FOREIGN KEY([IdMovimiento])
REFERENCES [dbo].[tiposmovimiento] ([IdMovimiento])
GO
ALTER TABLE [dbo].[movimiento] CHECK CONSTRAINT [FK_movimiento_tiposmovimiento]
GO
/****** Object:  StoredProcedure [dbo].[ejecutarcambio]    Script Date: 20-10-2023 4:32:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ejecutarcambio](
@accion int,
@IdPaciente int,
@Documento int,
@Nombres varchar(60),
@Apellidos varchar(60),
@Direccion varchar(100),
@Telefono int,
@Sexo char(1),
@Ciudad varchar(50),
@RH char(3),
@Contacto varchar(50),
@Parentezco_contacto varchar(50),
@Telefono_contacto int
)
as
begin
	
	declare @valida int 
	set @valida =(select dbo.validaaccion (@accion)) 

	if @valida >0
	begin
		if @valida = 1
		begin
		 INSERT INTO dbo.paciente(Documento,Nombres,Apellidos,Direccion,Telefono,Sexo,Ciudad,RH,Contacto,Parentezco_contacto,Telefono_contacto)
		 VALUES  (@Documento,@Nombres,@Apellidos ,@Direccion, @Telefono, @Sexo, @Ciudad,@RH, @Contacto ,@Parentezco_contacto ,@Telefono_contacto )
		end
		else
		if @valida = 2
		begin
		 update  dbo.paciente set	 Documento=@Documento,
									 Nombres=@Nombres,
									 Apellidos=@Apellidos,
									 Direccion=@Direccion,
									 Telefono=@Telefono,
									 Sexo=@Sexo,
									 Ciudad=@Ciudad,
									 RH=@RH,
									 Contacto=@Contacto,
									 Parentezco_contacto=@Parentezco_contacto,
									 Telefono_contacto=@Telefono_contacto
		    where	IdPaciente=@IdPaciente
		end
		if @valida = 3
		begin

		 delete  
		 from dbo.paciente 
		 where	IdPaciente=@IdPaciente

		end
	end

end

GO
USE [master]
GO
ALTER DATABASE [Prueba_CesarJimenez] SET  READ_WRITE 
GO
