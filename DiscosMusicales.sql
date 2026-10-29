create database if not exists discos_musicales;
use discos_musicales;

create table Genero (
    identificador varchar(10) PRIMARY KEY,
    nombre varchar(50)
);

create table Cantante (
    ID_cantante varchar(10) PRIMARY KEY,
    nombre varchar(50),
    país varchar(50)
);

create table Cancion (
    identificador varchar(10) PRIMARY KEY,
    título varchar(100)
);

create table Disco (
    ID_disco varchar(10) PRIMARY KEY,
    titulo varchar(100),
    precio decimal(10,2),
    identificador_genero varchar(10) not null,
    ID_cantante varchar(10) not null,
    FOREIGN KEY (identificador_genero) references Genero(identificador),
    FOREIGN KEY (ID_cantante) references Cantante(ID_cantante)
);

create table Disco_Cancion (
    ID_disco varchar(10) not null,
    identificador_cancion varchar(10) not null,
    posición int,
    PRIMARY KEY (ID_disco, identificador_cancion),
    FOREIGN KEY (ID_disco) references Disco(ID_disco),
    FOREIGN KEY (identificador_cancion) references Cancion(identificador)
);
