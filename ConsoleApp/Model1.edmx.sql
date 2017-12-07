
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 12/06/2017 23:10:17
-- Generated from EDMX file: C:\Users\dnlro\Documents\Visual Studio 2015\Projects\ValaisBooking\ConsoleApp\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [ValaisBookingDB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Hotels'
CREATE TABLE [dbo].[Hotels] (
    [IdHotel] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [Location] nvarchar(max)  NOT NULL,
    [Category] int  NOT NULL,
    [HasWifi] bit  NOT NULL,
    [Phone] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [Website] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Rooms'
CREATE TABLE [dbo].[Rooms] (
    [IdRoom] int IDENTITY(1,1) NOT NULL,
    [IdHotel] int  NOT NULL,
    [Number] int  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [Type] int  NOT NULL,
    [Price] decimal(18,0)  NOT NULL,
    [HasTV] bit  NOT NULL,
    [HasHairDryer] bit  NOT NULL
);
GO

-- Creating table 'Pictures'
CREATE TABLE [dbo].[Pictures] (
    [IdPicture] int IDENTITY(1,1) NOT NULL,
    [IdRoom] int  NOT NULL,
    [Url] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [IdHotel] in table 'Hotels'
ALTER TABLE [dbo].[Hotels]
ADD CONSTRAINT [PK_Hotels]
    PRIMARY KEY CLUSTERED ([IdHotel] ASC);
GO

-- Creating primary key on [IdRoom] in table 'Rooms'
ALTER TABLE [dbo].[Rooms]
ADD CONSTRAINT [PK_Rooms]
    PRIMARY KEY CLUSTERED ([IdRoom] ASC);
GO

-- Creating primary key on [IdPicture] in table 'Pictures'
ALTER TABLE [dbo].[Pictures]
ADD CONSTRAINT [PK_Pictures]
    PRIMARY KEY CLUSTERED ([IdPicture] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [IdHotel] in table 'Rooms'
ALTER TABLE [dbo].[Rooms]
ADD CONSTRAINT [FK_HotelRoom]
    FOREIGN KEY ([IdHotel])
    REFERENCES [dbo].[Hotels]
        ([IdHotel])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_HotelRoom'
CREATE INDEX [IX_FK_HotelRoom]
ON [dbo].[Rooms]
    ([IdHotel]);
GO

-- Creating foreign key on [IdRoom] in table 'Pictures'
ALTER TABLE [dbo].[Pictures]
ADD CONSTRAINT [FK_RoomPicture]
    FOREIGN KEY ([IdRoom])
    REFERENCES [dbo].[Rooms]
        ([IdRoom])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RoomPicture'
CREATE INDEX [IX_FK_RoomPicture]
ON [dbo].[Pictures]
    ([IdRoom]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------