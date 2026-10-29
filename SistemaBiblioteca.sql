create database if not exists prestamos_biblioteca;
use prestamos_biblioteca;

create table Libro (
    id_libro varchar(10) PRIMARY KEY,
    titulo varchar(100)
);

create table Autor (
    id_autor varchar(10) PRIMARY KEY,
    nombre varchar(50)
);

create table Socio (
    id_socio varchar(10) PRIMARY KEY,
    nombre varchar(50)
);

create table Autoria_Libro (
    id_libro varchar(10) not null,
    id_autor varchar(10) not null,
    PRIMARY KEY (id_libro, id_autor),
    FOREIGN KEY (id_libro) references Libro(id_libro),
    FOREIGN KEY (id_autor) references Autor(id_autor)
);

create table Prestamo_Libro_Socio (
    id_libro varchar(10) not null,
    id_socio varchar(10) not null,
    fecha_retiro date not null,
    fecha_devolucion date,
    PRIMARY KEY (id_libro, id_socio, fecha_retiro),
    FOREIGN KEY (id_libro) references Libro(id_libro),
    FOREIGN KEY (id_socio) references Socio(id_socio)
);
