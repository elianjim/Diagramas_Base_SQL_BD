create database if not exists aerolinea;
use aerolinea;

create table Avion (
    ID_avión varchar(10) PRIMARY KEY,
    modelo varchar(30)
);

create table Pasajeros (
    ID_pasajero varchar(10) PRIMARY KEY,
    nombre varchar(50)
);

create table Vuelos (
    ID_vuelo varchar(10) PRIMARY KEY,
    número varchar(20),
    Origen varchar(50),
    Destino varchar(50),
    Fecha date,
    ID_avión varchar(10) not null,
    FOREIGN KEY (ID_avión) references Avion(ID_avión)
);

create table Reservas (
    ID_reserva varchar(10) PRIMARY KEY,
    Asiento varchar(10),
    Tarifa decimal(10,2),
    ID_vuelo varchar(10) not null,
    ID_pasajero varchar(10) not null,
    FOREIGN KEY (ID_vuelo) references Vuelos(ID_vuelo),
    FOREIGN KEY (ID_pasajero) references Pasajeros(ID_pasajero)
);
