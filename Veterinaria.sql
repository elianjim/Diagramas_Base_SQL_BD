create database if not exists veterinaria;
use veterinaria;

create table Propietario (
    cédula varchar(10) PRIMARY KEY,
    nombres varchar(50),
    apellidos varchar(50),
    dirección varchar(100)
);

create table Propietario_Telefono (
    cédula varchar(10) not null,
    teléfono varchar(20) not null,
    PRIMARY KEY (cédula, teléfono),
    FOREIGN KEY (cédula) references Propietario(cédula)
);

create table Familiar_Contacto (
    cédula varchar(10) PRIMARY KEY,
    nombre varchar(50),
    teléfono varchar(20),
    cédula_propietario varchar(10) not null unique,
    FOREIGN KEY (cédula_propietario) references Propietario(cédula)
);

create table Mascota (
    identificador varchar(10) PRIMARY KEY,
    nombre varchar(50),
    fecha_nacimiento date,
    tipo varchar(30),
    cédula_propietario varchar(10) not null,
    FOREIGN KEY (cédula_propietario) references Propietario(cédula)
);

create table Personal_Clinica (
    código varchar(10) PRIMARY KEY,
    cédula varchar(10),
    nombres varchar(50)
);

create table Veterinario (
    código varchar(10) PRIMARY KEY,
    especialidad varchar(50),
    fecha_de_alta date,
    FOREIGN KEY (código) references Personal_Clinica(código)
);

create table Auxiliar (
    código varchar(10) PRIMARY KEY,
    base_de_cotización decimal(10,2),
    FOREIGN KEY (código) references Personal_Clinica(código)
);

create table Veterinario_Mascota (
    código_veterinario varchar(10) not null,
    identificador_mascota varchar(10) not null,
    fecha date,
    diagnóstico varchar(200),
    PRIMARY KEY (código_veterinario, identificador_mascota),
    FOREIGN KEY (código_veterinario) references Veterinario(código),
    FOREIGN KEY (identificador_mascota) references Mascota(identificador)
);
