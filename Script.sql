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
/****** Object:  Database [AutoSalon]    Script Date: 22.10.2017 16:10:41 ******/
CREATE DATABASE [AutoSalon]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AutoSalon', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\AutoSalon.mdf' , SIZE = 6336KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'AutoSalon_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\AutoSalon_log.ldf' , SIZE = 2112KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [AutoSalon] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AutoSalon].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AutoSalon] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AutoSalon] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AutoSalon] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AutoSalon] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AutoSalon] SET ARITHABORT OFF 
GO
ALTER DATABASE [AutoSalon] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AutoSalon] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AutoSalon] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AutoSalon] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AutoSalon] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AutoSalon] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AutoSalon] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AutoSalon] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AutoSalon] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AutoSalon] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AutoSalon] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AutoSalon] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AutoSalon] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AutoSalon] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AutoSalon] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AutoSalon] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AutoSalon] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AutoSalon] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AutoSalon] SET  MULTI_USER 
GO
ALTER DATABASE [AutoSalon] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AutoSalon] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AutoSalon] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AutoSalon] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [AutoSalon] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'AutoSalon', N'ON'
GO
ALTER DATABASE [AutoSalon] SET QUERY_STORE = OFF
GO
USE [AutoSalon]
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
USE [AutoSalon]
GO
/****** Object:  User [NT Service\MSSQLSERVER]    Script Date: 22.10.2017 16:10:41 ******/
CREATE USER [NT Service\MSSQLSERVER] FOR LOGIN [NT Service\MSSQLSERVER] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [NT SERVICE\Winmgmt]    Script Date: 22.10.2017 16:10:41 ******/
CREATE USER [NT SERVICE\Winmgmt] FOR LOGIN [NT SERVICE\Winmgmt] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [NT SERVICE\SQLWriter]    Script Date: 22.10.2017 16:10:41 ******/
CREATE USER [NT SERVICE\SQLWriter] FOR LOGIN [NT SERVICE\SQLWriter] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [NT AUTHORITY\SYSTEM]    Script Date: 22.10.2017 16:10:41 ******/
CREATE USER [NT AUTHORITY\SYSTEM] FOR LOGIN [NT AUTHORITY\SYSTEM] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [BUILTIN\Users]    Script Date: 22.10.2017 16:10:41 ******/
CREATE USER [BUILTIN\Users] FOR LOGIN [BUILTIN\Users]
GO
ALTER ROLE [db_owner] ADD MEMBER [NT Service\MSSQLSERVER]
GO
ALTER ROLE [db_owner] ADD MEMBER [NT SERVICE\Winmgmt]
GO
ALTER ROLE [db_owner] ADD MEMBER [NT SERVICE\SQLWriter]
GO
ALTER ROLE [db_owner] ADD MEMBER [NT AUTHORITY\SYSTEM]
GO
ALTER ROLE [db_owner] ADD MEMBER [BUILTIN\Users]
GO
/****** Object:  Table [dbo].[Dijelovi]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dijelovi](
	[DioID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [nvarchar](30) NOT NULL,
	[Zalihe] [int] NOT NULL,
	[Cijena] [float] NOT NULL,
	[Sifra] [nvarchar](50) NOT NULL,
	[ProizvodjacID] [int] NOT NULL,
	[AutaProizvedena] [nvarchar](100) NOT NULL,
	[Opis] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[DioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Korisnici]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Korisnici](
	[KorisnikID] [int] IDENTITY(1,1) NOT NULL,
	[Ime] [nvarchar](30) NOT NULL,
	[Prezime] [nvarchar](30) NOT NULL,
	[Adresa] [nvarchar](30) NOT NULL,
	[Telefon] [nvarchar](30) NULL,
	[Email] [nvarchar](30) NOT NULL,
	[Status] [bit] NULL,
	[LozinkaHash] [nvarchar](30) NULL,
	[SalonID] [int] NULL,
	[LozinkaSalt] [nvarchar](30) NULL,
 CONSTRAINT [PK_ServisProdaja] PRIMARY KEY CLUSTERED 
(
	[KorisnikID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kupci]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kupci](
	[KupacID] [int] IDENTITY(1,1) NOT NULL,
	[Ime] [nvarchar](50) NOT NULL,
	[Prezime] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Telefon] [nvarchar](30) NOT NULL,
	[Adresa] [nvarchar](50) NOT NULL,
	[Lozinka] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[KupacID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kvarovi]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kvarovi](
	[KvarID] [int] IDENTITY(1,1) NOT NULL,
	[Opis] [nvarchar](200) NOT NULL,
	[KupacID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[KvarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Modeli]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Modeli](
	[ModelID] [int] IDENTITY(1,1) NOT NULL,
	[ProizvodjacID] [int] NOT NULL,
	[Naziv] [nvarchar](30) NOT NULL,
	[VrstaModela] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ModelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NaciniPlacanja]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NaciniPlacanja](
	[PlacanjeID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PlacanjeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notifikacija]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifikacija](
	[NotifikacijaID] [int] IDENTITY(1,1) NOT NULL,
	[Naslov] [nvarchar](30) NULL,
	[Opis] [nvarchar](200) NULL,
	[Vrijeme] [datetime] NULL,
	[KupacID] [int] NULL,
	[IsRead] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[NotifikacijaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pitanja]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pitanja](
	[PitanjeID] [int] IDENTITY(1,1) NOT NULL,
	[Opis] [nvarchar](200) NOT NULL,
	[KupacID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PitanjeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proizvodjaci]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proizvodjaci](
	[ProizvodjacID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [nvarchar](30) NOT NULL,
	[Adresa] [nvarchar](30) NOT NULL,
	[Telefon] [nvarchar](30) NOT NULL,
	[Email] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[ProizvodjacID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Racuni]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Racuni](
	[RacunID] [int] IDENTITY(1,1) NOT NULL,
	[KorisnikID] [int] NOT NULL,
	[Cijena] [float] NOT NULL,
	[Komentar] [nvarchar](100) NULL,
	[PDV] [float] NOT NULL,
	[Ukupno] [float] NOT NULL,
	[DatumFakture] [datetime] NOT NULL,
	[DatumIsporuke] [datetime] NULL,
	[NacinIsporuke] [nvarchar](30) NOT NULL,
	[PlacanjeID] [int] NOT NULL,
	[KupacID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RacunID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RacuniStavke]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RacuniStavke](
	[StavkaID] [int] IDENTITY(1,1) NOT NULL,
	[DijeloviID] [int] NULL,
	[VoziloID] [int] NULL,
	[RacunID] [int] NULL,
	[Kolicina] [int] NOT NULL,
	[Popust] [float] NULL,
	[Rabat] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[StavkaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalonAuta]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalonAuta](
	[SalonID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [nvarchar](50) NOT NULL,
	[Adresa] [nvarchar](50) NOT NULL,
	[Sjedište] [nvarchar](50) NOT NULL,
	[Telefon] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SalonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vozila]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vozila](
	[VoziloID] [int] IDENTITY(1,1) NOT NULL,
	[Naziv] [nvarchar](30) NOT NULL,
	[Godiste] [nvarchar](30) NOT NULL,
	[Boja] [nvarchar](30) NULL,
	[VrstaMotora] [nvarchar](30) NOT NULL,
	[EmisijaCO2] [nvarchar](20) NULL,
	[ModelID] [int] NOT NULL,
	[SlikaThumg] [varbinary](max) NOT NULL,
	[Slika] [varbinary](max) NOT NULL,
	[Cijena] [float] NOT NULL,
	[Oprema] [nvarchar](100) NOT NULL,
	[SnagaMotora] [nvarchar](20) NOT NULL,
	[BrojSasije] [nvarchar](50) NOT NULL,
	[ZapreminaMotora] [nvarchar](15) NOT NULL,
	[ZapreminaGepeka] [nvarchar](15) NULL,
	[Duzina] [nvarchar](15) NULL,
	[Tezina] [nvarchar](15) NULL,
	[Klima] [nvarchar](30) NULL,
	[BrojSjedista] [int] NULL,
	[Pogon] [nvarchar](15) NULL,
	[BrojVrata] [int] NULL,
	[OpisSigurnost] [nvarchar](200) NULL,
	[Mijenjac] [nvarchar](30) NULL,
	[Potrosnja] [nvarchar](20) NOT NULL,
	[ObrtniMoment] [nvarchar](50) NULL,
	[Sirina] [nvarchar](20) NULL,
	[Ubrzanje] [nvarchar](20) NULL,
	[MaksimalnaBrzina] [nvarchar](20) NULL,
	[Kolicina] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[VoziloID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Dijelovi]  WITH CHECK ADD FOREIGN KEY([ProizvodjacID])
REFERENCES [dbo].[Proizvodjaci] ([ProizvodjacID])
GO
ALTER TABLE [dbo].[Korisnici]  WITH CHECK ADD FOREIGN KEY([SalonID])
REFERENCES [dbo].[SalonAuta] ([SalonID])
GO
ALTER TABLE [dbo].[Kvarovi]  WITH CHECK ADD FOREIGN KEY([KupacID])
REFERENCES [dbo].[Kupci] ([KupacID])
GO
ALTER TABLE [dbo].[Modeli]  WITH CHECK ADD FOREIGN KEY([ProizvodjacID])
REFERENCES [dbo].[Proizvodjaci] ([ProizvodjacID])
GO
ALTER TABLE [dbo].[Notifikacija]  WITH CHECK ADD FOREIGN KEY([KupacID])
REFERENCES [dbo].[Kupci] ([KupacID])
GO
ALTER TABLE [dbo].[Pitanja]  WITH CHECK ADD FOREIGN KEY([KupacID])
REFERENCES [dbo].[Kupci] ([KupacID])
GO
ALTER TABLE [dbo].[Racuni]  WITH CHECK ADD FOREIGN KEY([KorisnikID])
REFERENCES [dbo].[Korisnici] ([KorisnikID])
GO
ALTER TABLE [dbo].[Racuni]  WITH CHECK ADD FOREIGN KEY([KupacID])
REFERENCES [dbo].[Kupci] ([KupacID])
GO
ALTER TABLE [dbo].[Racuni]  WITH CHECK ADD FOREIGN KEY([PlacanjeID])
REFERENCES [dbo].[NaciniPlacanja] ([PlacanjeID])
GO
ALTER TABLE [dbo].[RacuniStavke]  WITH CHECK ADD FOREIGN KEY([DijeloviID])
REFERENCES [dbo].[Dijelovi] ([DioID])
GO
ALTER TABLE [dbo].[RacuniStavke]  WITH CHECK ADD FOREIGN KEY([RacunID])
REFERENCES [dbo].[Racuni] ([RacunID])
GO
ALTER TABLE [dbo].[RacuniStavke]  WITH CHECK ADD FOREIGN KEY([VoziloID])
REFERENCES [dbo].[Vozila] ([VoziloID])
GO
ALTER TABLE [dbo].[Vozila]  WITH CHECK ADD FOREIGN KEY([ModelID])
REFERENCES [dbo].[Modeli] ([ModelID])
GO
/****** Object:  StoredProcedure [dbo].[ALLCars]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure   [dbo].[ALLCars]
@ime nvarchar(20)
as
begin
select v.VoziloID, v.Naziv, v.ModelID,v.Cijena,v.Kolicina,v.Boja,v.Godiste,v.VrstaMotora,v.EmisijaCO2,v.Slika,v.SlikaThumg,v.Oprema,v.SnagaMotora,v.BrojSasije,v.ZapreminaMotora,v.ZapreminaGepeka,v.Duzina,v.Tezina,v.Klima,v.BrojSjedista,v.Pogon,v.BrojVrata,v.OpisSigurnost,v.Mijenjac,v.Potrosnja,v.ObrtniMoment,v.Sirina,v.Ubrzanje,v.MaksimalnaBrzina
from Vozila as v 
where LOWER(v.Naziv) like LOWER(@ime) + '%'
end
GO
/****** Object:  StoredProcedure [dbo].[AutaALLGET]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AutaALLGET]
as
begin
select v.*
from Vozila as v
end

GO
/****** Object:  StoredProcedure [dbo].[AutaDelete]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[AutaDelete]
@voziloid int
as
begin
delete Vozila
where VoziloID=@voziloid
end
GO
/****** Object:  StoredProcedure [dbo].[AutaID]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE   [dbo].[AutaID]
(
 @idAuta int
 )
as

select v.*

from Vozila as v 

where VoziloID=@idAuta

GO
/****** Object:  StoredProcedure [dbo].[BrisanjeAuta]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[BrisanjeAuta]
@autoId int
as
begin

delete from Vozila
where VoziloID=@autoId
end
GO
/****** Object:  StoredProcedure [dbo].[DeleteKupac]    Script Date: 22.10.2017 16:10:42 ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteModel]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[DeleteModel]
@modelid int
as
begin

delete From Modeli
where ModelID=@modelid
end
GO
/****** Object:  StoredProcedure [dbo].[DeleteProizvodjac]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[DeleteProizvodjac]
@id int
as
begin
delete from Proizvodjaci
where ProizvodjacID=@id
end
GO
/****** Object:  StoredProcedure [dbo].[DijeloviAllGet]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[DijeloviAllGet]
as
begin
select d.*,p.Naziv as Proizvodjac
from Dijelovi as d inner join Proizvodjaci as p on d.ProizvodjacID=p.ProizvodjacID
end
GO
/****** Object:  StoredProcedure [dbo].[DijeloviDelete]    Script Date: 22.10.2017 16:10:42 ******/
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
where DioID=@dijeloviID
end

GO
/****** Object:  StoredProcedure [dbo].[DijeloviSearch]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[DijeloviSearch]
@naziv nvarchar(20),
@sifra nvarchar(50)
as
begin
select u.*
from Dijelovi as u
where  lower(u.Naziv) like lower(@naziv) +'%' 
  and
 lower(u.Sifra) like lower(@sifra) +'%' 


end

GO
/****** Object:  StoredProcedure [dbo].[DijeloviUpdate]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[DijeloviUpdate]
(
@dioid int,

@naziv nvarchar(30),
@zalihe int,
@cijena float,
@sifra nvarchar(20),
@proizvodjac int,
@autap  nvarchar(100),
@Opis nvarchar(200)



)
as
update Dijelovi
set

Naziv=@naziv,
Zalihe=@zalihe,
Cijena=@cijena,
Sifra=@sifra,
ProizvodjacID=@proizvodjac,
AutaProizvedena=@autap,
Opis=@Opis


where DioID=@dioid

GO
/****** Object:  StoredProcedure [dbo].[DijelovigetAll]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[DijelovigetAll]
@dioID int
as

begin
select d.*
from Dijelovi as d
where d.DioID=@dioID
end
GO
/****** Object:  StoredProcedure [dbo].[GETALLDijelove]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GETALLDijelove]
as
begin

select v.DioID, v.Naziv, v.Cijena,sum(a.Kolicina) as Prodato,v.Zalihe ,sum(a.Rabat) as Rabat,sum(a.Popust) as Popust
from Dijelovi as v 
inner join RacuniStavke as a on v.DioID=a.DijeloviID 
group by v.Zalihe, v.Naziv,v.Cijena,v.DioID

end
GO
/****** Object:  StoredProcedure [dbo].[GETDIJELOVE]    Script Date: 22.10.2017 16:10:42 ******/
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


    create table #TempDijelovi
     (
	

	   RedniBroj int identity(0,1),
	    DijeloviID int
	 
	   	 )

		 insert into #TempDijelovi
		 select DioID 
		 from Dijelovi
		 where (LOWER(Naziv) like LOWER(@Naziv) + '%' or @Naziv ='') 
		 order by Naziv


		  select @TotalRows =@@ROWCOUNT

		  select v.DioID,v.Naziv,v.Sifra,v.Zalihe,v.Cijena
		  	  from Dijelovi as v inner join #TempDijelovi as t
		 on    v.DioID=t.DijeloviID
		 where  t.RedniBroj between @Offset and(@Offset +@MaxRows-1)

		 drop table #TempDijelovi
		 return

GO
/****** Object:  StoredProcedure [dbo].[GETDijeloviID]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GETDijeloviID]
@dioID int
as

begin
select *
from Dijelovi as d
where d.DioID=@dioID
end
GO
/****** Object:  StoredProcedure [dbo].[GETProdajaInfo]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GETProdajaInfo]
as
begin

select count(d.Naziv) as 'Vrsta dijelova', Sum(d.Cijena*u.Kolicina) as 'Ostvaren profit', sum(u.Kolicina) as 'Ukupno prodatih dijelova'
from Dijelovi as d inner join RacuniStavke as u on d.DioID=u.DijeloviID
end
GO
/****** Object:  StoredProcedure [dbo].[GEtALLAuta]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GEtALLAuta]
as
begin
select v.*
from Vozila as v 


end

GO
/****** Object:  StoredProcedure [dbo].[GEtIDModel]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GEtIDModel]
@modelid int
as
begin
select m.*
from Modeli as m
where m.ModelID=@modelid
end
GO
/****** Object:  StoredProcedure [dbo].[GEtNarudzbaID]    Script Date: 22.10.2017 16:10:42 ******/
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
/****** Object:  StoredProcedure [dbo].[GEtNazivAutaALL]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GEtNazivAutaALL]
@naziv nvarchar(20)
as
begin
select v.VoziloID, v.Naziv,v.Cijena,sum(a.Kolicina) as Prodato,v.Kolicina ,sum(a.Rabat) as Rabat,sum(a.Popust) as Popust
from Vozila as v inner join RacuniStavke as a on v.VoziloID=a.VoziloID
where LOWER(v.Naziv) like LOWER(@naziv) +'%'  or
upper(v.Naziv) like upper(@naziv) +'%'
group by   v.Naziv,v.Cijena,v.Kolicina,v.VoziloID

end


GO
/****** Object:  StoredProcedure [dbo].[GEtNazivDijelovaALl]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GEtNazivDijelovaALl]
@naziv nvarchar(20)
as
begin
select  v.DioID,v.Naziv, v.Cijena,sum(a.Kolicina) as Prodato,v.Zalihe ,sum(a.Rabat) as Rabat,sum(a.Popust) as Popust
from Dijelovi as v 
inner join RacuniStavke as a on v.DioID=a.DijeloviID 
where LOWER(v.Naziv) like LOWER(@naziv) +'%' or
upper(v.Naziv) like upper(@naziv)+ '%'
group by v.Zalihe, v.Naziv,v.Cijena,v.DioID


end


GO
/****** Object:  StoredProcedure [dbo].[GetAllStavke]    Script Date: 22.10.2017 16:10:42 ******/
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
/****** Object:  StoredProcedure [dbo].[GetAutaRacunStavke]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetAutaRacunStavke]
@racunid int
as
begin
select d.VoziloID as Sifra,d.Naziv,r.Kolicina,d.Cijena,sum(d.Cijena *r.Kolicina) as 'Ukupna vrijednost',r.Rabat as Popust,
sum(d.Cijena *r.Kolicina)-r.Rabat as 'Ukupna vrijednost - popust',f.PDV, sum(d.Cijena *r.Kolicina)*0.17 as 'Iznos PDV-a',sum(d.Cijena *r.Kolicina)*0.17+sum(d.Cijena *r.Kolicina)-r.Rabat as 'Iznos za platiti',
t.DatumFakture,t.DatumIsporuke,t.NacinIsporuke,k.Ime,k.Prezime,n.Naziv as 'Nacin placanja'
from Vozila as d inner join RacuniStavke as r on d.VoziloID=r.VoziloID inner join Racuni as f on r.RacunID=f.RacunID inner join
Racuni as t on r.RacunID=t.RacunID inner join Kupci as k on
t.KupacID=k.KupacID inner join NaciniPlacanja as n on t.PlacanjeID=n.PlacanjeID
where r.RacunID=@racunid
group by d.VoziloID,d.Naziv,r.Kolicina,d.Cijena,r.Rabat,f.PDV,f.Ukupno,r.StavkaID,r.DijeloviID,r.VoziloID,r.RacunID,r.Popust,
k.Ime,k.Prezime,t.DatumFakture,t.DatumIsporuke,t.NacinIsporuke,n.Naziv

end

GO
/****** Object:  StoredProcedure [dbo].[GetAutaStavke]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetAutaStavke]
@racunid int
as
begin
select sum(d.Cijena*r.Kolicina) as 'Ukupna vrijednost',sum(r.Rabat) as Popust,sum(d.Cijena*r.Kolicina)- sum(r.Rabat) as 'Ukupna vrijednost - popust',sum(d.Cijena *r.Kolicina)*0.17 as 'Iznos PDV-a'
from Vozila as d inner join RacuniStavke as r on d.VoziloID=r.VoziloID
where r.RacunID=@racunid

end
GO
/****** Object:  StoredProcedure [dbo].[GetDijeloviRacunStavke]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetDijeloviRacunStavke]
@racunid int
as
begin
select d.DioID as Sifra,d.Naziv,r.Kolicina,d.Cijena,sum(d.Cijena *r.Kolicina) as 'Ukupna vrijednost',r.Rabat as Popust,
sum(d.Cijena *r.Kolicina)-r.Rabat as 'Ukupna vrijednost - popust',f.PDV, sum(d.Cijena *r.Kolicina)*0.17 as 'Iznos PDV-a',sum(d.Cijena *r.Kolicina)*0.17+sum(d.Cijena *r.Kolicina)-r.Rabat as 'Iznos za platiti',
t.DatumFakture,t.DatumIsporuke,t.NacinIsporuke,k.Ime,k.Prezime,n.Naziv as 'Nacin placanja'
from Dijelovi as d inner join RacuniStavke as r on d.DioID=r.DijeloviID inner join Racuni as f on r.RacunID=f.RacunID
inner join
Racuni as t on r.RacunID=t.RacunID inner join Kupci as k on
t.KupacID=k.KupacID inner join NaciniPlacanja as n on t.PlacanjeID=n.PlacanjeID
where r.RacunID=@racunid
group by d.DioID,d.Naziv,r.Kolicina,d.Cijena,r.Rabat,f.PDV,f.Ukupno,r.StavkaID,r.DijeloviID,r.VoziloID,r.RacunID,r.Popust,
k.Ime,k.Prezime,t.DatumFakture,t.DatumIsporuke,t.NacinIsporuke,n.Naziv

end

GO
/****** Object:  StoredProcedure [dbo].[GetDijeloviStavke]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetDijeloviStavke]
@racunid int
as
begin
select sum(d.Cijena*r.Kolicina) as 'Ukupna vrijednost',sum(r.Rabat) as Popust,sum(d.Cijena*r.Kolicina)- sum(r.Rabat) as 'Ukupna vrijednost - popust',sum(d.Cijena *r.Kolicina)*0.17 as 'Iznos PDV-a'
from Dijelovi as d inner join RacuniStavke as r on d.DioID=r.DijeloviID
where r.RacunID=@racunid

end
GO
/****** Object:  StoredProcedure [dbo].[GetIDKupacRacun]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetIDKupacRacun]
@kupacid int
as
begin
select r.*
from Racuni as r
where r.KorisnikID=@kupacid
order by r.RacunID desc
end

GO
/****** Object:  StoredProcedure [dbo].[GetInfo]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[GetInfo]

as begin

select  d.Naziv as Dio,sum(u.Kolicina) AS Prodato, sum(d.Cijena *u.Kolicina) AS Zarada,d.Zalihe as Zaliha

from Dijelovi as d inner join RacuniStavke as u on d.DioID=u.DijeloviID
where u.DijeloviID=d.DioID
group by d.Naziv,d.Zalihe




end
GO
/****** Object:  StoredProcedure [dbo].[GetInfoUkupno]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetInfoUkupno]

as begin

select   sum(k.Cijena*g.Kolicina) AS 'Ukupna zarada', sum(g.Kolicina) as 'Ukupno prodato'

from  RacuniStavke as g join Dijelovi as k on k.DioID=g.DijeloviID


end
GO
/****** Object:  StoredProcedure [dbo].[GetKupacIME]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetKupacIME]
@ime nvarchar(20)
as
begin
select k.*
from Kupci as k
where  LOWER(k.Ime) like LOWER(@ime) +'%' or
upper(k.Ime) like upper(@ime) +'%'

end

GO
/****** Object:  StoredProcedure [dbo].[GetModele]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetModele]
as
begin 
select m.*
from Modeli as m
end

GO
/****** Object:  StoredProcedure [dbo].[GetProzvodjac]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetProzvodjac]
as
begin
select p.*
from Proizvodjaci as p
end
GO
/****** Object:  StoredProcedure [dbo].[GetVoziloID]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[GetVoziloID]
@VoziloID int
as
begin 
select v.*
from Vozila as v 
where v.VoziloID= @VoziloID
end

GO
/****** Object:  StoredProcedure [dbo].[IDProizvodjac]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[IDProizvodjac]
@racun int
as
begin
select r.*
from Proizvodjaci as r
where r.ProizvodjacID=@racun
end

GO
/****** Object:  StoredProcedure [dbo].[InsertDijelove]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsertDijelove]
@naziv nvarchar(30),
@zalihe int,
@cijena float,
@sifra nvarchar(30),
@proizvodjacid int,
@autaproiz nvarchar(100),
@opis nvarchar(200)

as
begin
insert into Dijelovi(Naziv,Zalihe,Cijena,Sifra,ProizvodjacID,AutaProizvedena,Opis)
values(@naziv,@zalihe,@cijena,@sifra,@proizvodjacid,@autaproiz,@opis)
end

GO
/****** Object:  StoredProcedure [dbo].[InsertModel]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsertModel]
@proizovjdac int,
@naziv nvarchar(20),
@tip nvarchar(20)

as
begin
insert into Modeli(ProizvodjacID,Naziv,VrstaModela)
values(@proizovjdac,@naziv,@tip)
end

GO
/****** Object:  StoredProcedure [dbo].[InsertProizvodjac]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsertProizvodjac]
@naziv nvarchar(20),
@Adresa nvarchar(20),
@Telefon nvarchar(20),
@email nvarchar(20)

as
begin
insert into Proizvodjaci(Naziv,Adresa,Telefon,Email)
values(@naziv,@Adresa,@Telefon,@email)
end

GO
/****** Object:  StoredProcedure [dbo].[InsertRacun]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[InsertRacun]
@servisid int,

@cijena float,
@komenatar nvarchar(100),
@Pdv float,
@ukupno float,
@nacinisporuke nvarchar(50),
@datumFa datetime,
@datumI datetime,
@Placanje int,
@kupacid int

as
begin
insert into Racuni(KorisnikID,Cijena,Komentar,PDV,Ukupno,NacinIsporuke,DatumFakture,DatumIsporuke,PlacanjeID,KupacID)
values(@servisid,@cijena,@komenatar,@Pdv,@ukupno,@nacinisporuke,@datumFa,@datumI,@Placanje,@kupacid)
end

GO
/****** Object:  StoredProcedure [dbo].[InsertRacunStavke]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[InsertRacunStavke]
@Dio int,
@Vozilo int,
@Racun int,
@Kolicina float,
@popust float,
@rabat float
as
begin
insert into RacuniStavke(DijeloviID,VoziloID,RacunID,Kolicina,Popust,Rabat)
values (@Dio,@Vozilo,@Racun,@Kolicina,@popust,@rabat)
end
GO
/****** Object:  StoredProcedure [dbo].[IzmjenaAuta]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[IzmjenaAuta]

(
@VozID int,
@ModelID int,
@NAZIV NVARCHAR(30),
@Boja nvarchar(40),
@Godiste nvarchar(40),
@VrstaMotora nvarchar(40),
@Emisija nvarchar(40),
@Slika varbinary(max),
@SlikaThumb varbinary(max),
@Cijena float,
@oprema nvarchar(100),
@snagamotora nvarchar(20),
@brojsasije NVARCHAR(50),
@zapreminam NVARCHAR(15),
@bzapreminag NVARCHAR(15),
@duzina NVARCHAR(15),
@tezina NVARCHAR(15),
@klima NVARCHAR(30),
@brojsjedista int,
@pogon  NVARCHAR(15),
 @brojv int,
 @opisS NVARCHAR(200),
 @mijenjac  NVARCHAR(30),
 @potrosnja  NVARCHAR(20),
  @obrtnimoment  NVARCHAR(50),
  @sirina nvarchar(20),
   @ubrzanje  NVARCHAR(20),
    @maxbrzina  NVARCHAR(20),
	 @kolicina int
)
as
begin
update Vozila
set ModelID=@ModelID,
Naziv=@NAZIV,
Boja=@Boja,
Godiste=@Godiste,
VrstaMotora=@VrstaMotora,
EmisijaCO2=@Emisija,
Slika=@Slika,
SlikaThumg=SlikaThumg,
Cijena=@Cijena,
Oprema=@oprema,
SnagaMotora=@snagamotora,
BrojSasije=@brojsasije,
ZapreminaMotora=@zapreminam,
ZapreminaGepeka=@bzapreminag,
Duzina=@duzina,
Tezina=@tezina,
Klima=@klima,
BrojSjedista=@brojsjedista,
Pogon=@pogon,
BrojVrata=@brojv,
OpisSigurnost=@opisS,
Mijenjac=@mijenjac,
Potrosnja=@potrosnja,
ObrtniMoment=@obrtnimoment,
Sirina=@sirina,
Ubrzanje=@ubrzanje,
MaksimalnaBrzina=@maxbrzina,
Kolicina=@kolicina
where VoziloID=@VozID
end

GO
/****** Object:  StoredProcedure [dbo].[KupciGEtAll]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[KupciGEtAll]
as
begin
select k.*
from Kupci as k
end
GO
/****** Object:  StoredProcedure [dbo].[PretragaAuta]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PretragaAuta]
@naziv nvarchar(30)
as
begin
select v.VoziloID, v.Naziv,v.Cijena,sum(a.Kolicina) as Prodato,v.Kolicina ,sum(a.Rabat) as Rabat,sum(a.Popust) as Popust
from Vozila as v inner join RacuniStavke as a on v.VoziloID=a.VoziloID
where LOWER(v.Naziv) like LOWER(@naziv) +'%'  or
upper(v.Naziv) like upper(@naziv) +'%'
group by   v.Naziv,v.Cijena,v.Kolicina,v.VoziloID
end
GO
/****** Object:  StoredProcedure [dbo].[PretragaKupaca]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PretragaKupaca]
@ime nvarchar(50),
@prezime nvarchar(50)
as
begin
Select k.*
from Kupci as k
where LOWER(k.Ime) like LOWER(@ime) +'%' and
LOWER(k.Prezime) like LOWER(@prezime) +'%'
end
GO
/****** Object:  StoredProcedure [dbo].[PretragaPoNazivuAuta]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PretragaPoNazivuAuta]
@naziv nvarchar(20),
@sasija nvarchar(50)
as
begin
select v.*
from Vozila as v
where LOWER(v.Naziv) like LOWER(@naziv) +'%' and
 LOWER(v.BrojSasije) like LOWER(@sasija) +'%'  

end

GO
/****** Object:  StoredProcedure [dbo].[ProdajaAutaInfo]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ProdajaAutaInfo]
as
begin
select  v.Naziv, sum(a.Kolicina) as Prodato,Sum(a.Kolicina*v.Cijena) as Profit,v.Kolicina as Zaliha
from Vozila as v 
inner join RacuniStavke as a on v.VoziloID=a.VoziloID 
group by v.Kolicina, v.Naziv
end
GO
/****** Object:  StoredProcedure [dbo].[ProdajaAutaInfoU]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ProdajaAutaInfoU]
as
begin
select count(v.Naziv) as 'Broj modela', Sum(v.Cijena*a.Kolicina) as 'Ostvaren profit', sum(a.Kolicina) as 'Ukupno prodatih vozila'
from Vozila as v  inner join RacuniStavke as a on v.VoziloID=a.VoziloID

end

GO
/****** Object:  StoredProcedure [dbo].[ProizvodjaciUpdate]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ProizvodjaciUpdate]
@id int,
@naziv nvarchar(30),
@adresa nvarchar(30),
@telefon nvarchar(30),
@email nvarchar(30)
as
begin
update Proizvodjaci set
Naziv=@naziv,
Adresa=@adresa,
Telefon=@telefon,
Email=@email
where ProizvodjacID=@id
end
GO
/****** Object:  StoredProcedure [dbo].[RAcunaiiiiia]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[RAcunaiiiiia]
as
begin
select top 5 r.*
from Racuni as r
where YEAR(r.DatumFakture)=2015
order by r.Ukupno desc
end

GO
/****** Object:  StoredProcedure [dbo].[RacunGET]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[RacunGET]
as
begin
select r.*
from Racuni as r
end
GO
/****** Object:  StoredProcedure [dbo].[RacunSelectByDatum]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[RacunSelectByDatum]

@datumP datetime,
@datumI datetime
as 
begin
select r.*,SCOPE_IDENTITY() as IDKupac, k.Ime,k.Prezime,v.Naziv,g.RacunID as BrojRacun,g.Kolicina,g.VoziloID as IDVozila
from Racuni as r inner join NaciniPlacanja as n on r.PlacanjeID=n.PlacanjeID inner join
RacuniStavke as g on r.RacunID=g.RacunID inner join Vozila as v on g.VoziloID=v.VoziloID  inner join
Modeli as m on v.ModelID=m.ModelID inner join Kupci as k on r.KupacID=k.KupacID
where r.DatumFakture between @datumP and @datumI  
end
GO
/****** Object:  StoredProcedure [dbo].[RacuniAuta]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[RacuniAuta]
as
begin
select r.*,s.DijeloviID,s.RacunID as temp,s.Kolicina,s.Popust,s.Rabat
from Racuni as r inner join RacuniStavke as s on r.RacunID=s.RacunID 
where s.VoziloID !=0

end
GO
/****** Object:  StoredProcedure [dbo].[RacuniDijelovi]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[RacuniDijelovi]
as
begin
select r.*,s.DijeloviID,s.RacunID as temp,s.Kolicina,s.Popust,s.Rabat
from Racuni as r inner join RacuniStavke as s on r.RacunID=s.RacunID 
where s.DijeloviID !=0
end
GO
/****** Object:  StoredProcedure [dbo].[ReportRacunDijelovi]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[ReportRacunDijelovi]
@racun int
as
begin

select r.*,n.Naziv,n.PlacanjeID as ID
from Racuni as r inner join NaciniPlacanja as n on r.PlacanjeID=n.PlacanjeID
where r.RacunID=@racun

end

GO
/****** Object:  StoredProcedure [dbo].[SearchKupac]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SearchKupac]
@Ime nvarchar(20),
@Prezime nvarchar(20)
as
begin
Select k.*
from Kupci as k
where LOWER(k.Ime) like LOWER(@Ime) +'%' and
LOWER(k.Prezime) like LOWER(@Prezime) +'%'
end

GO
/****** Object:  StoredProcedure [dbo].[SearchVozila]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SearchVozila]
@vozilo nvarchar(10)
as
begin
Select v.*
from Vozila as v
where v.Naziv like @vozilo +'%' 

end

GO
/****** Object:  StoredProcedure [dbo].[SelectALLModele]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectALLModele]
@naziv nvarchar(30),
@vrstamodela nvarchar(30)
as
begin
select m.*
from Modeli as  m
where LOWER(m.Naziv) like LOWER(@naziv) +'%' and
 LOWER(m.VrstaModela) like LOWER(@vrstamodela) +'%'  
end

GO
/****** Object:  StoredProcedure [dbo].[SelectIDAuto]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectIDAuto]
(
 @ModelId int
 )
as

select v.*

from Vozila as v 

where ModelID=@ModelId

GO
/****** Object:  StoredProcedure [dbo].[SelectServis]    Script Date: 22.10.2017 16:10:42 ******/
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
/****** Object:  StoredProcedure [dbo].[Servis_IzmjenaPassworda]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Servis_IzmjenaPassworda]
(
@korisnik int,
@LozinkaSalt nvarchar(50),
@LozinkaHash nvarchar(50)

)
as
update Korisnici
set
LozinkaSalt=@LozinkaSalt,
LozinkaHash=@LozinkaHash

where KorisnikID=@korisnik


GO
/****** Object:  StoredProcedure [dbo].[Servis_Update]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Servis_Update]
(
@ServisID int,

@ime nvarchar(20),
@prezime nvarchar(20),
@Adresa nvarchar(20),
@Telefon nvarchar(20),
@Email nvarchar(20),
@status  bit,
@LozinkaHash nvarchar(50),
@Salon int,
@LozinkaSalt nvarchar(50)



)
as
update Korisnici
set

Ime=@ime,
Prezime=@prezime,
Adresa=@Adresa,
Telefon=@Telefon,
Email=@Email,
Status=@status,
LozinkaHash=@LozinkaHash,
SalonID=@Salon,
LozinkaSalt=@LozinkaSalt


where KorisnikID=@ServisID


GO
/****** Object:  StoredProcedure [dbo].[UpdateKupca]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UpdateKupca]
(
@ID int,
@Ime nvarchar(50),
@Prezime nvarchar(50),
@email nvarchar(50),
@telefon nvarchar(50),
@adresa nvarchar(50),
@lozinka nvarchar(50)
)
as
begin
update Kupci set
Ime=@Ime,
Prezime=@Prezime,
Email=@email,
Telefon=@telefon,
Adresa=@adresa,
Lozinka=@lozinka

where KupacID=@ID
end
GO
/****** Object:  StoredProcedure [dbo].[UpdateModel]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[UpdateModel]
@modelid int,
@proid int,
@naziv nvarchar(30),
@vrstamodela nvarchar(30)
as
begin
update Modeli set
ProizvodjacID=@proid,
Naziv=@naziv,
VrstaModela=@vrstamodela
where ModelID=@modelid
end

GO
/****** Object:  StoredProcedure [dbo].[VOZILA_MODEL]    Script Date: 22.10.2017 16:10:42 ******/
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



    create table #TempVozila
     (
	

	   RedniBroj int identity(0,1),
	   VoziloID int
	 
	   	 )

		 insert into #TempVozila
		 select VoziloID
		 from Vozila
		 where (ModelID=@ModelID or @ModelID=0) and
		 (LOWER(Naziv) like LOWER(@Naziv) + '%' or @Naziv ='') 
		 order by Naziv


		  select @TotalRows =@@ROWCOUNT

		  select v.VoziloID,v.Naziv,v.Boja,v.Godiste
		  	  from Vozila as v inner join #TempVozila as t
		 on    v.VoziloID=t.VoziloID
		 where  t.RedniBroj between @Offset and(@Offset +@MaxRows-1)

		 drop table #TempVozila
		 return

GO
/****** Object:  StoredProcedure [dbo].[deleteKorisnik]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[deleteKorisnik]
@korisnik int
as
begin
delete from Korisnici 
where KorisnikID=@korisnik
end
GO
/****** Object:  StoredProcedure [dbo].[esp_ServisSelectID]    Script Date: 22.10.2017 16:10:42 ******/
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

where KorisnikID=@ServisID
end
GO
/****** Object:  StoredProcedure [dbo].[esp_select_by_Name]    Script Date: 22.10.2017 16:10:42 ******/
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
where upper (s.Ime) like upper (@Name) + '%' or lower (s.Ime) like lower (@Name) + '%'

order by s.Ime
end


GO
/****** Object:  StoredProcedure [dbo].[esp_update_status]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[esp_update_status]
@korisnik int,
@Status bit
as
begin
update Korisnici
set Status=@Status
where KorisnikID=@korisnik
end
GO
/****** Object:  StoredProcedure [dbo].[getAllKupci]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getAllKupci]
as
begin
select k.*
from Kupci as k
end
GO
/****** Object:  StoredProcedure [dbo].[getAllProdajaAuta]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getAllProdajaAuta]
as 
begin
select sum(a.Kolicina*v.Cijena) as 'Ukupna zarada', sum(a.Kolicina) 'Ukupno prodato'
from Modeli as m inner join Vozila as v on m.ModelID=v.ModelID 
inner join RacuniStavke as a on v.VoziloID=a.VoziloID


end
GO
/****** Object:  StoredProcedure [dbo].[getAllServis]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getAllServis]
as
begin
select *
from   Korisnici as s
order by s.Ime
end

GO
/****** Object:  StoredProcedure [dbo].[getIDKupac]    Script Date: 22.10.2017 16:10:42 ******/
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
/****** Object:  StoredProcedure [dbo].[getRAcunID]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getRAcunID]
@racun int
as
begin
select r.*
from Racuni as r
where r.RacunID=@racun
end

GO
/****** Object:  StoredProcedure [dbo].[getRAcuniallFilter]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getRAcuniallFilter]
as
begin
Select top 5 r.*
from Racuni as r
where YEAR(r.DatumFakture)=2015
order by r.Ukupno desc

end

GO
/****** Object:  StoredProcedure [dbo].[getRacun1]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getRacun1]
as
begin
select r.*,n.Naziv
from Racuni as r inner join NaciniPlacanja as n on r.PlacanjeID=n.PlacanjeID
end
GO
/****** Object:  StoredProcedure [dbo].[getRacunStavke]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[getRacunStavke]
as
begin
select r.*
from RacuniStavke as r
end
GO
/****** Object:  StoredProcedure [dbo].[getRacuniStavke]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getRacuniStavke]
as
begin
select r.RacunID, r.Cijena,r.DatumFakture,r.DatumIsporuke,r.Komentar,r.KorisnikID,r.KupacID,r.PlacanjeID,r.PDV,r.Ukupno
from Racuni as r
order by  r.RacunID desc
end
GO
/****** Object:  StoredProcedure [dbo].[getUkupno]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getUkupno]
@racunid int
as
begin
select r.*,k.Ime,k.Prezime, n.Naziv as NacinPlacanja
from Racuni as r inner join Kupci as k on r.KupacID=k.KupacID inner join NaciniPlacanja as n on
r.PlacanjeID=n.PlacanjeID
where r.RacunID=@racunid
end

GO
/****** Object:  StoredProcedure [dbo].[getZalihe]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[getZalihe]
as 
begin
select   sum(d.Zalihe) as 'Ukupno zaliha'
from Dijelovi as d
end
GO
/****** Object:  StoredProcedure [dbo].[getZaliheAuta]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[getZaliheAuta]
as 
begin
select  sum(v.Kolicina) as 'Ukupno zaliha'
from Vozila as v

end
GO
/****** Object:  StoredProcedure [dbo].[insertKorisnik]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertKorisnik]
 
    @ime nvarchar(30),
	@prezime nvarchar(30),
    @Adresa     NVARCHAR (30) ,
    @Telefon     NVARCHAR (30),
    @Email       NVARCHAR (30) ,
	@Status bit,
    @LozinkaHash NVARCHAR (50) , 
	@SalonID int,
    @LozinkaSalt NVARCHAR (50) 


	as
	begin
	insert into Korisnici(Ime,Prezime,Adresa,Telefon,Email,Status,LozinkaHash,SalonID,LozinkaSalt)
	values(@ime,@prezime,@Adresa,@Telefon,@Email,@Status,@LozinkaHash,@SalonID,@LozinkaSalt)
	select @@IDENTITY
	end


GO
/****** Object:  StoredProcedure [dbo].[insertKupac]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[insertKupac]
(
@Ime nvarchar(50),
@Prezime nvarchar(50),
@Email nvarchar (50),
@telefon nvarchar(30),
@adresa nvarchar(50),
@lozinka  nvarchar(50)

)
as
insert into Kupci(Ime,Prezime,Email,Telefon,Adresa,Lozinka)
values(@Ime,@Prezime,@Email,@telefon,@adresa,@lozinka)

GO
/****** Object:  StoredProcedure [dbo].[insertServis]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertServis]
   @ime nvarchar(30),
	@prezime nvarchar(30),
    @Adresa     NVARCHAR (30) ,
    @Telefon     NVARCHAR (30),
    @Email       NVARCHAR (30) ,
	@Status bit,
    @LozinkaHash NVARCHAR (50) , 
	@SalonID int,
    @LozinkaSalt NVARCHAR (50) 


	as
	begin
	insert into Korisnici(Ime,Prezime,Adresa,Telefon,Email,Status,LozinkaHash,SalonID,LozinkaSalt)
	values(@ime,@prezime,@Adresa,@Telefon,@Email,@Status,@LozinkaHash,@SalonID,@LozinkaSalt)
	select @@IDENTITY
	end

GO
/****** Object:  StoredProcedure [dbo].[insertUsluge]    Script Date: 22.10.2017 16:10:42 ******/
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
/****** Object:  StoredProcedure [dbo].[insertVozilo]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertVozilo]


@ModelID int,
@NAZIV NVARCHAR(30),
@Boja nvarchar(40),
@Godiste nvarchar(40),
@VrstaMotora nvarchar(40),
@Emisija nvarchar(40),
@Slika varbinary(max),
@SlikaThumb varbinary(max),
@Cijena float,
@oprema nvarchar(100),
@snagamotora nvarchar(20),
@brojsasije NVARCHAR(50),
@zapreminam NVARCHAR(15),
@bzapreminag NVARCHAR(15),
@duzina NVARCHAR(15),
@tezina NVARCHAR(15),
@klima NVARCHAR(30),
@brojsjedista int,
@pogon  NVARCHAR(15),
 @brojv int,
 @opisS NVARCHAR(200),
 @mijenjac  NVARCHAR(30),
 @potrosnja  NVARCHAR(20),
  @obrtnimoment  NVARCHAR(50),
  @sirina nvarchar(20),
   @ubrzanje  NVARCHAR(20),
    @maxbrzina  NVARCHAR(20),
	 @kolicina int

as
begin
insert into Vozila(ModelID,Naziv,Boja,Godiste,VrstaMotora,EmisijaCO2,Slika,SlikaThumg,Cijena,Oprema,SnagaMotora,BrojSasije,ZapreminaMotora,ZapreminaGepeka,Duzina,Tezina,Klima,BrojSjedista,Pogon,BrojVrata,OpisSigurnost,Mijenjac,Potrosnja,ObrtniMoment,Sirina,Ubrzanje,MaksimalnaBrzina,Kolicina)
values(@ModelID,@NAZIV,@Boja,@Godiste,@VrstaMotora,@Emisija,@Slika,@SlikaThumb,@Cijena,@oprema,@snagamotora,@brojsasije,@zapreminam,@bzapreminag,@duzina,@tezina, @klima,@brojsjedista, @pogon,  @brojv, @opisS, @mijenjac, @potrosnja, @obrtnimoment,  @sirina, @ubrzanje,  @maxbrzina,  @kolicina)
end

GO
/****** Object:  StoredProcedure [dbo].[insertracuniStavke]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[insertracuniStavke]
@DioID int,
@Void int,
@RacunID int,
@kolicina int,
@popust float,
@rabat float
as
begin
 insert into RacuniStavke(DijeloviID,VoziloID,RacunID,Kolicina,Popust,Rabat)
 values(@DioID,@Void,@RacunID,@kolicina,@popust,@rabat)
 end
GO
/****** Object:  StoredProcedure [dbo].[pretragAuta]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[pretragAuta]
@auta nvarchar (30)
as
begin
select v.*
from Vozila as v
where LOWER(v.Naziv) like LOWER(@auta) +'%'
end

GO
/****** Object:  StoredProcedure [dbo].[pretragaDijelova]    Script Date: 22.10.2017 16:10:42 ******/
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
/****** Object:  StoredProcedure [dbo].[pretragaPoSifri]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[pretragaPoSifri]
@sfira nvarchar(50)
as
begin
Select d.*
from Dijelovi as d
end

GO
/****** Object:  StoredProcedure [dbo].[searchModel]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[searchModel]
@naziv nvarchar(30),
@sifra nvarchar(50)
as 
begin
select v.*
from Vozila as v 
where LOWER(v.Naziv) like LOWER(@naziv) +'%' and
LOWER(v.BrojSasije) like LOWER(@sifra) +'%'

end


GO
/****** Object:  StoredProcedure [dbo].[selectAllVozila]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[selectAllVozila]
 
as
begin
select v.Naziv,v.Cijena,v.EmisijaCO2,v.Godiste,v.SlikaThumg,v.VrstaMotora
from Vozila as v inner join Modeli as m on v.ModelID=m.ModelID

end
GO
/****** Object:  StoredProcedure [dbo].[selectIme]    Script Date: 22.10.2017 16:10:42 ******/
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
/****** Object:  StoredProcedure [dbo].[selectKorisnickoIme]    Script Date: 22.10.2017 16:10:42 ******/
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
where s.Ime=@ImeKorisnika 

GO
/****** Object:  StoredProcedure [dbo].[selectKupacKorisinickoIme]    Script Date: 22.10.2017 16:10:42 ******/
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
/****** Object:  StoredProcedure [dbo].[updateAuta]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[updateAuta]
(
@void int,
@kolicina int


)
as
begin
update Vozila
set Kolicina=@kolicina
where VoziloID=@void
end
GO
/****** Object:  StoredProcedure [dbo].[updateDijelovi]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[updateDijelovi]
(
@dijeID int,
@zalihe int


)
as
begin
update Dijelovi
set Zalihe=@zalihe
where DioID=@dijeID
end
GO
/****** Object:  StoredProcedure [dbo].[update_statusTrue]    Script Date: 22.10.2017 16:10:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[update_statusTrue]
@korisnik int,
@Status bit
as
begin
update Korisnici
set Status=@Status
where KorisnikID=@korisnik
end
GO
USE [master]
GO
ALTER DATABASE [AutoSalon] SET  READ_WRITE 
GO
