-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2018-07-18 15:01:36.62
CREATE DATABASE BDTioJuanito
GO
USE BDTioJuanito
GO
-- tables
-- Table: Apoderado
CREATE TABLE Apoderado (
    idApod int  NOT NULL IDENTITY(1, 1),
    nomApod varchar(40)  NULL,
    Nino_idNino int  NOT NULL,
    CONSTRAINT Apoderado_pk PRIMARY KEY  (idApod)
);

-- Table: Asistente
CREATE TABLE Asistente (
    idAst int  NOT NULL IDENTITY(1, 1),
    nomAst varchar(40)  NOT NULL,
    CONSTRAINT Asistente_pk PRIMARY KEY  (idAst)
);

-- Table: Barrio
CREATE TABLE Barrio (
    idBarrio int  NOT NULL IDENTITY(1, 1),
    nomBarrio int  NULL,
    CONSTRAINT Barrio_pk PRIMARY KEY  (idBarrio)
);

-- Table: Chofer
CREATE TABLE Chofer (
    idChof int  NOT NULL IDENTITY(1, 1),
    nomChof varchar(40)  NOT NULL,
    CONSTRAINT Chofer_pk PRIMARY KEY  (idChof)
);

-- Table: Colegio
CREATE TABLE Colegio (
    idColg int  NOT NULL IDENTITY(1, 1),
    nomColg varchar(40)  NULL,
    CONSTRAINT Colegio_pk PRIMARY KEY  (idColg)
);

-- Table: Contrato
CREATE TABLE Contrato (
    idContr int  NOT NULL IDENTITY(1, 1),
    fecContr date  NULL,
    critContr varchar(40)  NULL,
    Apoderado_idApod int  NOT NULL,
    Modalidad_idModl int  NOT NULL,
    CONSTRAINT Contrato_pk PRIMARY KEY  (idContr)
);

-- Table: DetalleRecorrido
CREATE TABLE DetalleRecorrido (
    idDetRecor int  NOT NULL IDENTITY(1, 1),
    horaLlegarColg varchar(7)  NULL,
    horaRetorCoch varchar(7)  NULL,
    eventoRecor varchar(40)  NULL,
    kmInicio int  NOT NULL,
    kmFin int  NOT NULL,
    Recorrido_idRecor int  NOT NULL,
    MiniBus_idMiniBus int  NOT NULL,
    CONSTRAINT DetalleRecorrido_pk PRIMARY KEY  (idDetRecor)
);

-- Table: Jornada
CREATE TABLE Jornada (
    idJorn int  NOT NULL IDENTITY(1, 1),
    nomJorn varchar(30)  NULL,
    CONSTRAINT Jornada_pk PRIMARY KEY  (idJorn)
);

-- Table: MiniBus
CREATE TABLE MiniBus (
    idMiniBus int  NOT NULL IDENTITY(1, 1),
    nomMinBus varchar(30)  NOT NULL,
    Chofer_idChof int  NOT NULL,
    Asistente_idAst int  NOT NULL,
    CONSTRAINT MiniBus_pk PRIMARY KEY  (idMiniBus)
);

-- Table: Modalidad
CREATE TABLE Modalidad (
    idModl int  NOT NULL IDENTITY(1, 1),
    nomModl varchar(30)  NULL,
    Recorrido_idRecor int  NOT NULL,
    CONSTRAINT Modalidad_pk PRIMARY KEY  (idModl)
);

-- Table: Nino
CREATE TABLE Nino (
    idNino int  NOT NULL IDENTITY(1, 1),
    nomNino varchar(40)  NULL,
    dirNino varchar(40)  NULL,
    horaBuscar varchar(7)  NULL,
    horaDejar varchar(7)  NULL,
    Colegio_idColg int  NOT NULL,
    Barrio_idBarrio int  NOT NULL,
    CONSTRAINT Nino_pk PRIMARY KEY  (idNino)
);

-- Table: Recorrido
CREATE TABLE Recorrido (
    idRecor int  NOT NULL IDENTITY(1, 1),
    Barrio_idBarrio int  NOT NULL,
    Colegio_idColg int  NOT NULL,
    Jornada_idJorn int  NOT NULL,
    CONSTRAINT Recorrido_pk PRIMARY KEY  (idRecor)
);

-- foreign keys
-- Reference: Apoderado_Nino (table: Apoderado)
ALTER TABLE Apoderado ADD CONSTRAINT Apoderado_Nino
    FOREIGN KEY (Nino_idNino)
    REFERENCES Nino (idNino);

-- Reference: Contrato_Apoderado (table: Contrato)
ALTER TABLE Contrato ADD CONSTRAINT Contrato_Apoderado
    FOREIGN KEY (Apoderado_idApod)
    REFERENCES Apoderado (idApod);

-- Reference: Contrato_Modalidad (table: Contrato)
ALTER TABLE Contrato ADD CONSTRAINT Contrato_Modalidad
    FOREIGN KEY (Modalidad_idModl)
    REFERENCES Modalidad (idModl);

-- Reference: DetalleRecorrido_MiniBus (table: DetalleRecorrido)
ALTER TABLE DetalleRecorrido ADD CONSTRAINT DetalleRecorrido_MiniBus
    FOREIGN KEY (MiniBus_idMiniBus)
    REFERENCES MiniBus (idMiniBus);

-- Reference: DetalleRecorrido_Recorrido (table: DetalleRecorrido)
ALTER TABLE DetalleRecorrido ADD CONSTRAINT DetalleRecorrido_Recorrido
    FOREIGN KEY (Recorrido_idRecor)
    REFERENCES Recorrido (idRecor);

-- Reference: MiniBus_Asistente (table: MiniBus)
ALTER TABLE MiniBus ADD CONSTRAINT MiniBus_Asistente
    FOREIGN KEY (Asistente_idAst)
    REFERENCES Asistente (idAst);

-- Reference: MiniBus_Chofer (table: MiniBus)
ALTER TABLE MiniBus ADD CONSTRAINT MiniBus_Chofer
    FOREIGN KEY (Chofer_idChof)
    REFERENCES Chofer (idChof);

-- Reference: Modalidad_Recorrido (table: Modalidad)
ALTER TABLE Modalidad ADD CONSTRAINT Modalidad_Recorrido
    FOREIGN KEY (Recorrido_idRecor)
    REFERENCES Recorrido (idRecor);

-- Reference: Nino_Barrio (table: Nino)
ALTER TABLE Nino ADD CONSTRAINT Nino_Barrio
    FOREIGN KEY (Barrio_idBarrio)
    REFERENCES Barrio (idBarrio);

-- Reference: Nino_Colegio (table: Nino)
ALTER TABLE Nino ADD CONSTRAINT Nino_Colegio
    FOREIGN KEY (Colegio_idColg)
    REFERENCES Colegio (idColg);

-- Reference: Recorrido_Barrio (table: Recorrido)
ALTER TABLE Recorrido ADD CONSTRAINT Recorrido_Barrio
    FOREIGN KEY (Barrio_idBarrio)
    REFERENCES Barrio (idBarrio);

-- Reference: Recorrido_Colegio (table: Recorrido)
ALTER TABLE Recorrido ADD CONSTRAINT Recorrido_Colegio
    FOREIGN KEY (Colegio_idColg)
    REFERENCES Colegio (idColg);

-- Reference: Recorrido_Jornada (table: Recorrido)
ALTER TABLE Recorrido ADD CONSTRAINT Recorrido_Jornada
    FOREIGN KEY (Jornada_idJorn)
    REFERENCES Jornada (idJorn);

-- End of file.

