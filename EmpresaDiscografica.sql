create database if not exists empresa_discografica;
use empresa_discografica;

create table Manager (
    identificador varchar(10) PRIMARY KEY,
    nombre varchar(50)
);

create table Evento_de_Promocion (
    ID varchar(10) PRIMARY KEY,
    fecha date,
    asistentes int
);

create table Artista (
    NIF varchar(10) PRIMARY KEY,
    nombre varchar(50),
    identificador_manager varchar(10) not null,
    FOREIGN KEY (identificador_manager) references Manager(identificador)
);

create table Artista_Evento (
    NIF varchar(10) not null,
    ID_evento varchar(10) not null,
    PRIMARY KEY (NIF, ID_evento),
    FOREIGN KEY (NIF) references Artista(NIF),
    FOREIGN KEY (ID_evento) references Evento_de_Promocion(ID)
);
