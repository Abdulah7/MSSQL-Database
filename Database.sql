/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.4001)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2017
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [master]
GO
/****** Object:  Database [PEP]    Script Date: 22.10.2017 16:11:50 ******/
CREATE DATABASE [PEP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PEP', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\PEP.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PEP_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\PEP_log.ldf' , SIZE = 1280KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PEP] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PEP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PEP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PEP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PEP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PEP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PEP] SET ARITHABORT OFF 
GO
ALTER DATABASE [PEP] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PEP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PEP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PEP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PEP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PEP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PEP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PEP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PEP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PEP] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PEP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PEP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PEP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PEP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PEP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PEP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PEP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PEP] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PEP] SET  MULTI_USER 
GO
ALTER DATABASE [PEP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PEP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PEP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PEP] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [PEP] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PEP', N'ON'
GO
ALTER DATABASE [PEP] SET QUERY_STORE = OFF
GO
USE [PEP]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [PEP]
GO
/****** Object:  Table [dbo].[Dijelovi]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dijelovi](
	[DijeloviID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [nvarchar](30) NULL,
	[Model] [nvarchar](30) NULL,
	[Zalihe] [nvarchar](30) NULL,
	[Cijena] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[DijeloviID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IzvrseneUsluge]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IzvrseneUsluge](
	[IzvrseneUslugeID] [int] IDENTITY(1,1) NOT NULL,
	[ServisID] [int] NULL,
	[UslugaID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IzvrseneUslugeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Korisnici]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Korisnici](
	[ServisID] [int] IDENTITY(1,1) NOT NULL,
	[ImeKorisnika] [nvarchar](30) NULL,
	[Naziv] [nvarchar](30) NULL,
	[Adresa] [nvarchar](30) NULL,
	[Telefon] [nvarchar](30) NULL,
	[Email] [nvarchar](30) NULL,
	[Status] [bit] NULL,
	[LozinkaHash] [nvarchar](30) NULL,
	[LozinkaSalt] [nvarchar](30) NULL,
	[SalonID] [int] NULL,
 CONSTRAINT [PK_ServisProdaja] PRIMARY KEY CLUSTERED 
(
	[ServisID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [cs_Email] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [cs_ImeKorisnika] UNIQUE NONCLUSTERED 
(
	[ImeKorisnika] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kupci]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kupci](
	[KupacID] [int] IDENTITY(1,1) NOT NULL,
	[Ime] [nvarchar](50) NULL,
	[Prezime] [nvarchar](50) NULL,
	[DatumRegistracije] [datetime] NULL,
	[Email] [nvarchar](100) NULL,
	[LozinkaHash] [nvarchar](50) NULL,
	[LozinkaSalt] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[KupacID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Model]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Model](
	[ModelID] [int] IDENTITY(1,1) NOT NULL,
	[ProizvodjacID] [int] NULL,
	[Naziv] [nvarchar](30) NULL,
	[VrstaModela] [nvarchar](30) NULL,
	[Kolicina] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ModelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NacinPlacanja]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NacinPlacanja](
	[PlacanjeID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[PlacanjeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Narudzba]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Narudzba](
	[NarudzbaID] [int] IDENTITY(1,1) NOT NULL,
	[KupacID] [int] NULL,
	[BrojNarudzbe] [nvarchar](30) NULL,
	[Datum] [datetime] NULL,
	[Status] [bit] NULL,
	[Otkazano] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[NarudzbaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NarudzbaStavke]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NarudzbaStavke](
	[NarudzbaStavkaID] [int] IDENTITY(1,1) NOT NULL,
	[NarudzbaID] [int] NULL,
	[VoziloID] [int] NULL,
	[Kolicina] [int] NULL,
	[DijeloviID] [int] NULL,
 CONSTRAINT [PK_NarudzbaStavke] PRIMARY KEY CLUSTERED 
(
	[NarudzbaStavkaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ocjene]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ocjene](
	[OcjenaId] [int] IDENTITY(1,1) NOT NULL,
	[KupacID] [int] NULL,
	[VoziloID] [int] NULL,
	[Ocjena] [int] NULL,
	[Datum] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[OcjenaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proizvodjac]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proizvodjac](
	[ProizvodjacID] [int] IDENTITY(1,1) NOT NULL,
	[NazivProizvodjaca] [nvarchar](30) NULL,
	[Adresa] [nvarchar](30) NULL,
	[Telefon] [nvarchar](30) NULL,
	[Email] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProizvodjacID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Racun]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Racun](
	[RacunID] [int] IDENTITY(1,1) NOT NULL,
	[ServisID] [int] NULL,
	[Opis] [nvarchar](30) NULL,
	[Cijena] [float] NULL,
	[Komentar] [nvarchar](100) NULL,
	[PDV] [float] NULL,
	[Ukupno] [float] NULL,
	[DatumFakture] [datetime] NULL,
	[DatumIsporuke] [datetime] NULL,
	[NacinIsporuke] [nvarchar](30) NULL,
	[PlacanjeID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[RacunID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalonServis]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalonServis](
	[SalonID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [nvarchar](50) NULL,
	[Adresa] [nvarchar](50) NULL,
	[Sjedište] [nvarchar](50) NULL,
	[Telefon] [nvarchar](20) NULL,
	[Email] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[SalonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UgradjeniDijelovi]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UgradjeniDijelovi](
	[UgradjeniID] [int] IDENTITY(1,1) NOT NULL,
	[ServisID] [int] NULL,
	[DijeloviID] [int] NULL,
	[Kolicina] [int] NULL,
 CONSTRAINT [PK__Ugradjen__4362D137AE0FC5E2] PRIMARY KEY CLUSTERED 
(
	[UgradjeniID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usluge]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usluge](
	[UslugaID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [nvarchar](30) NULL,
	[Cijena] [float] NULL,
	[Komentar] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[UslugaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vozilo]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vozilo](
	[VoziloID] [int] IDENTITY(1,1) NOT NULL,
	[ServisID] [int] NULL,
	[Naziv] [nvarchar](30) NULL,
	[Godiste] [nvarchar](30) NULL,
	[Boja] [nvarchar](30) NULL,
	[VrstaMotora] [nvarchar](30) NULL,
	[EmisijaCO2] [nvarchar](20) NULL,
	[ModelID] [int] NULL,
	[SlikaThumg] [varbinary](max) NULL,
	[Slika] [varbinary](max) NULL,
	[Cijena] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[VoziloID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[IzvrseneUsluge]  WITH CHECK ADD FOREIGN KEY([ServisID])
REFERENCES [dbo].[Korisnici] ([ServisID])
GO
ALTER TABLE [dbo].[IzvrseneUsluge]  WITH CHECK ADD FOREIGN KEY([UslugaID])
REFERENCES [dbo].[Usluge] ([UslugaID])
GO
ALTER TABLE [dbo].[Korisnici]  WITH CHECK ADD FOREIGN KEY([SalonID])
REFERENCES [dbo].[SalonServis] ([SalonID])
GO
ALTER TABLE [dbo].[Model]  WITH CHECK ADD FOREIGN KEY([ProizvodjacID])
REFERENCES [dbo].[Proizvodjac] ([ProizvodjacID])
GO
ALTER TABLE [dbo].[Narudzba]  WITH CHECK ADD FOREIGN KEY([KupacID])
REFERENCES [dbo].[Kupci] ([KupacID])
GO
ALTER TABLE [dbo].[NarudzbaStavke]  WITH CHECK ADD FOREIGN KEY([DijeloviID])
REFERENCES [dbo].[Dijelovi] ([DijeloviID])
GO
ALTER TABLE [dbo].[NarudzbaStavke]  WITH CHECK ADD FOREIGN KEY([NarudzbaID])
REFERENCES [dbo].[Narudzba] ([NarudzbaID])
GO
ALTER TABLE [dbo].[NarudzbaStavke]  WITH CHECK ADD FOREIGN KEY([VoziloID])
REFERENCES [dbo].[Vozilo] ([VoziloID])
GO
ALTER TABLE [dbo].[Ocjene]  WITH CHECK ADD FOREIGN KEY([KupacID])
REFERENCES [dbo].[Kupci] ([KupacID])
GO
ALTER TABLE [dbo].[Ocjene]  WITH CHECK ADD FOREIGN KEY([VoziloID])
REFERENCES [dbo].[Vozilo] ([VoziloID])
GO
ALTER TABLE [dbo].[Racun]  WITH CHECK ADD FOREIGN KEY([PlacanjeID])
REFERENCES [dbo].[NacinPlacanja] ([PlacanjeID])
GO
ALTER TABLE [dbo].[Racun]  WITH CHECK ADD FOREIGN KEY([ServisID])
REFERENCES [dbo].[Korisnici] ([ServisID])
GO
ALTER TABLE [dbo].[UgradjeniDijelovi]  WITH CHECK ADD  CONSTRAINT [FK__Ugradjeni__Dijel__267ABA7A] FOREIGN KEY([DijeloviID])
REFERENCES [dbo].[Dijelovi] ([DijeloviID])
GO
ALTER TABLE [dbo].[UgradjeniDijelovi] CHECK CONSTRAINT [FK__Ugradjeni__Dijel__267ABA7A]
GO
ALTER TABLE [dbo].[UgradjeniDijelovi]  WITH CHECK ADD  CONSTRAINT [FK__Ugradjeni__Servi__30C33EC3] FOREIGN KEY([ServisID])
REFERENCES [dbo].[Korisnici] ([ServisID])
GO
ALTER TABLE [dbo].[UgradjeniDijelovi] CHECK CONSTRAINT [FK__Ugradjeni__Servi__30C33EC3]
GO
ALTER TABLE [dbo].[Vozilo]  WITH CHECK ADD FOREIGN KEY([ModelID])
REFERENCES [dbo].[Model] ([ModelID])
GO
ALTER TABLE [dbo].[Vozilo]  WITH CHECK ADD FOREIGN KEY([ServisID])
REFERENCES [dbo].[Korisnici] ([ServisID])
GO
/****** Object:  StoredProcedure [dbo].[ALLCars]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure   [dbo].[ALLCars]
@ime nvarchar(20)
as
begin
select v.*
from Vozilo as v
where LOWER(v.Naziv) like LOWER(@ime) + '%'
end
GO
/****** Object:  StoredProcedure [dbo].[BrisanjeAuta]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[BrisanjeAuta]
@autoId int
as
begin

delete from Vozilo 
where VoziloID=@autoId
end
GO
/****** Object:  StoredProcedure [dbo].[BrisiNarudzbe]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[BrisiNarudzbe]
@NarudzbaID int
as
begin

delete from Narudzba
where NarudzbaID=@NarudzbaID
end
GO
/****** Object:  StoredProcedure [dbo].[BrisiNarudzbeStavke]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[BrisiNarudzbeStavke]
@NarudzbastavkeID int
as
begin

delete from NarudzbaStavke
where NarudzbaStavkaID=@NarudzbastavkeID
end
GO
/****** Object:  StoredProcedure [dbo].[DeleteKupac]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[DeleteKupac]
@KupacId int
as
begin
delete
from Kupci 
where KupacID=@KupacId
end
GO
/****** Object:  StoredProcedure [dbo].[DijeloviDelete]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[DijeloviDelete]
@dijeloviID int
as
begin
delete
from Dijelovi
where  DijeloviID=@dijeloviID
end
GO
/****** Object:  StoredProcedure [dbo].[DijeloviSearch]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[DijeloviSearch]
@naziv nvarchar(20)
as
begin
select u.*
from Dijelovi as u
where  lower(u.Naziv) like lower(@naziv) +'%'
end
GO
/****** Object:  StoredProcedure [dbo].[GETDIJELOVE]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[GETDIJELOVE]
(


 @Naziv nvarchar(30),
  @Offset int,
  @MaxRows int,
 @TotalRows int OUTPUT
 )
AS


 
     set fmtonly off
    create table #TempDijelovi
     (
	

	   RedniBroj int identity(0,1),
	    DijeloviID int
	 
	   	 )
		 
  
		 insert into #TempDijelovi
		 select DijeloviID 
		 from Dijelovi
		 where (LOWER(Naziv) like LOWER(@Naziv) + '%' or @Naziv ='') 
		 order by Naziv


		  select @TotalRows =@@ROWCOUNT

		  select v.DijeloviID,v.Naziv,v.Model,v.Zalihe,v.Cijena
		  	  from Dijelovi as v inner join #TempDijelovi as t
		 on    v.DijeloviID=t.DijeloviID
		 where  t.RedniBroj between @Offset and(@Offset +@MaxRows-1)

		 drop table #TempDijelovi
		 return
GO
/****** Object:  StoredProcedure [dbo].[GETDijeloviID]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GETDijeloviID]
@dioID int
as

begin
select *
from Dijelovi as d
where d.DijeloviID=@dioID
end
GO
/****** Object:  StoredProcedure [dbo].[GEtALLAuta]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GEtALLAuta]
as
begin
select * 
from Vozilo
end
GO
/****** Object:  StoredProcedure [dbo].[GEtNarudzbaID]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GEtNarudzbaID]
@Idnarudzba int
as
begin
select n.*
from Narudzba as n
where n.NarudzbaID=@Idnarudzba
end
GO
/****** Object:  StoredProcedure [dbo].[GEtNazivDijelovaALl]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GEtNazivDijelovaALl]
@naziv nvarchar(20)
as
begin
select d.DijeloviID,d.Naziv,d.Model,d.Cijena,d.Zalihe
from Dijelovi as d
where LOWER(d.Naziv) like LOWER(@naziv)  or
upper(d.Naziv) like upper(@naziv) 
end

GO
/****** Object:  StoredProcedure [dbo].[GetAllStavke]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetAllStavke]
as
begin
Select *
from NarudzbaStavke
end 
GO
/****** Object:  StoredProcedure [dbo].[GetKupacIME]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetKupacIME]
@ime nvarchar(20)
as
begin
select k.*
from Kupci as k
where k.Ime=@ime
end
GO
/****** Object:  StoredProcedure [dbo].[GetVoziloID]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetVoziloID]
@VoziloID int
as
begin 
select v.*
from Vozilo as v 
where v.VoziloID= @VoziloID
end
GO
/****** Object:  StoredProcedure [dbo].[InsertDijelove]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsertDijelove]
@naziv nvarchar(30),
@model nvarchar(30),
@zalihe nvarchar(30),
@cijena float
as
begin
insert into Dijelovi(Naziv,Model,Zalihe,Cijena)
values(@naziv,@model,@zalihe,@cijena)
end
GO
/****** Object:  StoredProcedure [dbo].[InsertModel]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsertModel]
@proizovjdac int,
@naziv nvarchar(20),
@tip nvarchar(20),
@kolicina int

as
begin
insert into Model(ProizvodjacID,Naziv,VrstaModela,Kolicina)
values(@proizovjdac,@naziv,@tip,@kolicina)
end
GO
/****** Object:  StoredProcedure [dbo].[InsertProizvodjac]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsertProizvodjac]
@naziv nvarchar(20),
@Adresa nvarchar(20),
@Telefon nvarchar(20),
@email nvarchar(20)

as
begin
insert into Proizvodjac(NazivProizvodjaca,Adresa,Telefon,Email)
values(@naziv,@Adresa,@Telefon,@email)
end
GO
/****** Object:  StoredProcedure [dbo].[InsertRacun]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsertRacun]
@servisid int,
@Opis nvarchar(30),
@cijena float,
@komenatar nvarchar(100),
@Pdv float,
@ukupno float,
@nacinisporuke nvarchar(50),
@datumFa datetime,
@datumI datetime,
@Placanje int

as
begin
insert into Racun(ServisID,Opis,Cijena,Komentar,PDV,Ukupno,NacinIsporuke,DatumFakture,DatumIsporuke,PlacanjeID)
values(@servisid,@Opis,@cijena,@komenatar,@Pdv,@ukupno,@nacinisporuke,@datumFa,@datumI,@Placanje)
end
GO
/****** Object:  StoredProcedure [dbo].[InsertUgradjeniDijelovi]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsertUgradjeniDijelovi]
@servisID int,
@DijeloviID int,
@Kolicina int

as
begin
insert into UgradjeniDijelovi (ServisID,DijeloviID,Kolicina)
values (@servisID,@DijeloviID,@Kolicina)
end
GO
/****** Object:  StoredProcedure [dbo].[Ocjena_insert]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Ocjena_insert]
@KupacID int,
@VoziloID int,
@Ocjena int,
@Datum datetime

as
insert into Ocjene(KupacID,VoziloID,Ocjena,Datum)
values(@KupacID,@VoziloID,@Ocjena,@Datum)
GO
/****** Object:  StoredProcedure [dbo].[PretragaAuta]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PretragaAuta]
@naziv nvarchar(20)
as
begin
select v.*
 from Vozilo as v
where lower (v.Naziv) like  lower(@naziv)+ '%'
end
GO
/****** Object:  StoredProcedure [dbo].[PretragaNArudzbi]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PretragaNArudzbi]
@broj nvarchar(20)
as
begin
Select n.*
from Narudzba as n
where n.BrojNarudzbe=@broj
end

GO
/****** Object:  StoredProcedure [dbo].[PretragaNarudzbi]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PretragaNarudzbi]
@BRNarudzba nvarchar(20)
as
begin
select n.*
from Narudzba as n
where  LOWER(n.BrojNarudzbe) like LOWER(@BRNarudzba) +'%'
end
GO
/****** Object:  StoredProcedure [dbo].[PretragaNarudzbiStavki]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PretragaNarudzbiStavki]

as
begin
select n.*
from NarudzbaStavke as n

end
GO
/****** Object:  StoredProcedure [dbo].[RAcunaiiiiia]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[RAcunaiiiiia]
as
begin
select top 5 r.*
from Racun as r
where YEAR(r.DatumFakture)=2015
order by r.Ukupno desc
end
GO
/****** Object:  StoredProcedure [dbo].[RacunSelectByDatum]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[RacunSelectByDatum]

@datumP datetime,
@datumI datetime
as 
begin
select r.*
from Racun as r 
where r.DatumFakture between @datumP and @datumI
end
GO
/****** Object:  StoredProcedure [dbo].[SearchKupac]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SearchKupac]
@Ime nvarchar(20)
as
begin
Select k.*
from Kupci as k
where LOWER(k.Ime) like LOWER(@Ime) +'%'
end
GO
/****** Object:  StoredProcedure [dbo].[SearchVozila]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SearchVozila]
@vozilo nvarchar(10)
as
begin
Select v.Boja,v.Cijena,v.EmisijaCO2,v.Godiste,v.Naziv,v.VrstaMotora
from NarudzbaStavke as s inner join Narudzba as n on s.NarudzbaID=n.NarudzbaID inner join
Vozilo as v on v.VoziloID=s.VoziloID
where v.Naziv like @vozilo +'%' 
group by v.Boja,v.Cijena,v.EmisijaCO2,v.Godiste,v.Naziv,v.VrstaMotora
having count(s.VoziloID)>=1
end
GO
/****** Object:  StoredProcedure [dbo].[SelectALLModele]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectALLModele]
as
begin
select m.*
from Model as m
end
GO
/****** Object:  StoredProcedure [dbo].[SelectIDAuto]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectIDAuto]
(
 @ModelID int
 )
as

select v.VoziloID,v.Naziv,v.Boja,v.Godiste,v.EmisijaCO2,v.SlikaThumg,v.VrstaMotora,v.ServisID,v.ModelID

from Vozilo as v 

where ModelID=@ModelID
GO
/****** Object:  StoredProcedure [dbo].[SelectServis]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectServis]
as
begin
select s.*
from Korisnici as s
end
GO
/****** Object:  StoredProcedure [dbo].[Servis_IzmjenaPassworda]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Servis_IzmjenaPassworda]
(
@ServisID int,
@LozinkaSalt nvarchar(50),
@LozinkaHash nvarchar(50)

)
as
update Korisnici
set
LozinkaSalt=@LozinkaSalt,
LozinkaHash=@LozinkaHash

where ServisID=@ServisID

GO
/****** Object:  StoredProcedure [dbo].[Servis_Update]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Servis_Update]
(
@ServisID int,

@Naziv nvarchar(20),
@Adresa nvarchar(20),
@Telefon nvarchar(20),
@Email nvarchar(20)
)
as
update Korisnici
set

Naziv=@Naziv,
Adresa=@Adresa,
Telefon=@Telefon,
Email=@Email
where ServisID=@ServisID

GO
/****** Object:  StoredProcedure [dbo].[UgradjeniDijeloviDelete]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UgradjeniDijeloviDelete]
@ugradjeni int
as
begin
delete 
from UgradjeniDijelovi
where UgradjeniID=@ugradjeni
end
GO
/****** Object:  StoredProcedure [dbo].[UgradjeniDijeloviPretraga]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[UgradjeniDijeloviPretraga]
as
begin
select u.*
from UgradjeniDijelovi as u
end
GO
/****** Object:  StoredProcedure [dbo].[VOZILA_MODEL]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[VOZILA_MODEL]
(

 @ModelID int,
 @Naziv nvarchar(30),
  @Offset int,
  @MaxRows int,
 @TotalRows int OUTPUT
 )
AS


     set fmtonly off
    create table #TempVozila
     (
	

	   RedniBroj int identity(0,1),
	   VoziloID int
	 
	   	 )

		 insert into #TempVozila
		 select VoziloID
		 from Vozilo
		 where (ModelID=@ModelID or @ModelID=0) and
		 (LOWER(Naziv) like LOWER(@Naziv) + '%' or @Naziv ='') 
		 order by Naziv


		  select @TotalRows =@@ROWCOUNT

		  select v.VoziloID,v.Naziv,v.Boja,v.Godiste
		  	  from Vozilo as v inner join #TempVozila as t
		 on    v.VoziloID=t.VoziloID
		 where  t.RedniBroj between @Offset and(@Offset +@MaxRows-1)

		 drop table #TempVozila
		 return
GO
/****** Object:  StoredProcedure [dbo].[esp_ServisSelectID]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[esp_ServisSelectID]
@ServisID int
as
begin

select *
from Korisnici

where ServisID=@ServisID
end
GO
/****** Object:  StoredProcedure [dbo].[esp_select_by_Name]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[esp_select_by_Name]

@Name nvarchar(50)
as
begin

select s.*
from Korisnici as s 
where upper (s.ImeKorisnika) like upper (@Name) + '%' or lower (s.ImeKorisnika) like lower (@Name) + '%'

order by s.ImeKorisnika
end

GO
/****** Object:  StoredProcedure [dbo].[esp_update_status]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[esp_update_status]
@ServisID int,
@Status bit
as
begin
update Korisnici
set Status=@Status
where ServisID=@ServisID
end
GO
/****** Object:  StoredProcedure [dbo].[getAllServis]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getAllServis]
as
begin
select *
from   Korisnici as s
order by s.Naziv
end
GO
/****** Object:  StoredProcedure [dbo].[getAllUsluge]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getAllUsluge]
as
begin
select *
from   Usluge  as u
order by u.Naziv
end
GO
/****** Object:  StoredProcedure [dbo].[getIDKupac]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getIDKupac]
@kupacID int
as
begin
select k.*
from Kupci as k
where k.KupacID=@kupacID
end
GO
/****** Object:  StoredProcedure [dbo].[getNArudzbaHistori]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getNArudzbaHistori]

as
begin
select *
from  Narudzba as n

end
GO
/****** Object:  StoredProcedure [dbo].[getNArudzbaIDHistoriy]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getNArudzbaIDHistoriy]
@narudzbaID int
as
begin
select *
from  Narudzba as n
where n.NarudzbaID=@narudzbaID

end
GO
/****** Object:  StoredProcedure [dbo].[getRAcuniallFilter]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getRAcuniallFilter]
as
begin
Select top 5 r.*
from Racun as r
where YEAR(r.DatumFakture)=2015
order by r.Ukupno desc

end
GO
/****** Object:  StoredProcedure [dbo].[getaLLNarudzbe]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getaLLNarudzbe]
as
begin
select n.*
from Narudzba as n
end
GO
/****** Object:  StoredProcedure [dbo].[insertIzvrseneUsluge]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertIzvrseneUsluge]
@ServisID int,
@UslugaID int



as
begin
insert into IzvrseneUsluge(ServisID,UslugaID)
values(@ServisID,@UslugaID)

end
GO
/****** Object:  StoredProcedure [dbo].[insertKupac]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[insertKupac]
(
@Ime nvarchar(50),
@Prezime nvarchar(50),
@Datum datetime,
@Email nvarchar (100),
@LozinkaH nvarchar(50),
@LozinkaSalt nvarchar(50)
)
as
insert into Kupci(Ime,Prezime,DatumRegistracije,Email,LozinkaHash,LozinkaSalt)
values(@Ime,@Prezime,@Datum,@Email,@LozinkaH,@LozinkaSalt)
GO
/****** Object:  StoredProcedure [dbo].[insertServis]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertServis]
 
    @Naziv nvarchar(30),
    @Adresa     NVARCHAR (30) ,
    @Telefon     NVARCHAR (30),
    @Email       NVARCHAR (30) ,
	@Status bit,
    @LozinkaHash NVARCHAR (50) , 
    @LozinkaSalt NVARCHAR (50) ,
	@ImeKorisnika nvarchar(50)

	as
	begin
	insert into Korisnici(Naziv,Adresa,Telefon,Email,Status,LozinkaHash,LozinkaSalt,ImeKorisnika)
	values(@Naziv,@Adresa,@Telefon,@Email,@Status,@LozinkaHash,@LozinkaSalt,@ImeKorisnika)
	select @@IDENTITY
	end

GO
/****** Object:  StoredProcedure [dbo].[insertUsluge]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[insertUsluge]
@Naziv nvarchar(30),
@Cijena float,
@Komentar nvarchar(30)
as
begin
insert into Usluge(Naziv,Cijena,Komentar)
values(@Naziv,@Cijena,@Komentar)

end
GO
/****** Object:  StoredProcedure [dbo].[insertVozilo]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertVozilo]

@ServisID int,
@ModelID int,
@NAZIV NVARCHAR(30),
@Boja nvarchar(40),
@Godiste nvarchar(40),
@VrstaMotora nvarchar(40),
@Emisija nvarchar(40),
@Slika varbinary(max),
@SlikaThumb varbinary(max),
@Cijena decimal(18,2)
as
begin
insert into Vozilo(ServisID,ModelID,Naziv,Boja,Godiste,VrstaMotora,EmisijaCO2,Slika,SlikaThumg,Cijena)
values(@ServisID,@ModelID,@NAZIV,@Boja,@Godiste,@VrstaMotora,@Emisija,@Slika,@SlikaThumb,@Cijena)
end
GO
/****** Object:  StoredProcedure [dbo].[pretragAuta]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[pretragAuta]
@auta nvarchar (30)
as
begin
select v.*
from Vozilo as v
where LOWER(v.Naziv) like LOWER(@auta) +'%'
end
GO
/****** Object:  StoredProcedure [dbo].[pretragaDijelova]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[pretragaDijelova]
@dio nvarchar (30)
as
begin
select v.*
from Dijelovi as v
where LOWER(v.Naziv) like LOWER(@dio) +'%'
end
GO
/****** Object:  StoredProcedure [dbo].[selectAllVozila]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[selectAllVozila]
 
as
begin
select v.Naziv,v.Cijena,v.EmisijaCO2,v.Godiste,v.SlikaThumg,v.VrstaMotora
from Vozilo as v inner join Model as m on v.ModelID=m.ModelID

end
GO
/****** Object:  StoredProcedure [dbo].[selectIme]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create  PROCEDURE [dbo].[selectIme]
(
@ImeKorisnika nvarchar(50)

)
as
select *
from Kupci  as s
where s.Ime=@ImeKorisnika 
GO
/****** Object:  StoredProcedure [dbo].[selectKorisnickoIme]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[selectKorisnickoIme]
(
@ImeKorisnika nvarchar(50)

)
as
select *
from Korisnici  as s
where s.ImeKorisnika=@ImeKorisnika 
GO
/****** Object:  StoredProcedure [dbo].[selectKupacKorisinickoIme]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[selectKupacKorisinickoIme]
 @ime nvarchar(20)
 as
 begin

select *
from Kupci as k
where k.Ime=@ime
end
GO
/****** Object:  StoredProcedure [dbo].[updateNarudzba]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[updateNarudzba]
@narudzbaID int,
@izmjena bit
as
begin

update Narudzba 
set Otkazano=@izmjena 
where  NarudzbaID=@narudzbaID
end
GO
/****** Object:  StoredProcedure [dbo].[updateNarudzbaStatus]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[updateNarudzbaStatus]
@narudzbaID int,
@izmjena bit
as
begin

update Narudzba 
set Status=@izmjena 
where  NarudzbaID=@narudzbaID
end
GO
/****** Object:  StoredProcedure [dbo].[vijezba]    Script Date: 22.10.2017 16:11:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[vijezba]
as
begin
select k.DatumRegistracije,k.Email,k.Ime,k.Prezime,s.Kolicina
from Kupci as k inner join Narudzba as n
on k.KupacID=n.KupacID inner join
NarudzbaStavke as s on n.NarudzbaID=s.NarudzbaID
where n.Otkazano=0
group by k.DatumRegistracije,k.DatumRegistracije,k.Email,k.Ime,k.Prezime,s.Kolicina
having COUNT(s.VoziloID)>4 and COUNT(s.Kolicina)>=5
end
GO
USE [master]
GO
ALTER DATABASE [PEP] SET  READ_WRITE 
GO
