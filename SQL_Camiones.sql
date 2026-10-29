create database if not exists camiones;
use camiones;

create table Camionero (
    cédula varchar(10) PRIMARY KEY,
    nombre varchar(30),
    dirección varchar(50),
    salario decimal(10,2),
    población varchar(50)
);

create table Camion (
    matricula varchar(10) PRIMARY KEY,
    modelo varchar(30),
    tipo varchar(30),
    potencia varchar(20)
);

create table Provincia (
    código_provincia varchar(10) PRIMARY KEY,
    nombre varchar(50)
);

create table Paquetes (
    id_paquete varchar(10) PRIMARY KEY,
    descripción varchar(50),
    destinatario varchar(50),
    dirección_destinatario varchar(100),
    cédula varchar(10) not null,
    código_provincia varchar(10) not null,
    FOREIGN KEY (cédula) references Camionero(cédula),
    FOREIGN KEY (código_provincia) references Provincia(código_provincia)
);

create table Camionero_Camion (
    cédula varchar(10) not null,
    matricula varchar(10) not null,
    fecha date,
    PRIMARY KEY (cédula, matricula),
    FOREIGN KEY (cédula) references Camionero(cédula),
    FOREIGN KEY (matricula) references Camion(matricula)
);
