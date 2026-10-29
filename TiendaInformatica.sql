create database if not exists tienda_informatica;
use tienda_informatica;

create table Cliente (
    código varchar(10) PRIMARY KEY,
    nombre varchar(50),
    apellidos varchar(50),
    dirección varchar(100),
    teléfono varchar(20)
);

create table Producto (
    código varchar(10) PRIMARY KEY,
    descripción varchar(100),
    precio decimal(10,2),
    stock int
);

create table Proveedor (
    código varchar(10) PRIMARY KEY,
    nombres varchar(50),
    apellidos varchar(50),
    dirección varchar(100),
    provincia varchar(50),
    teléfono varchar(20)
);

create table Cliente_Producto (
    código_cliente varchar(10) not null,
    código_producto varchar(10) not null,
    fecha date,
    PRIMARY KEY (código_cliente, código_producto),
    FOREIGN KEY (código_cliente) references Cliente(código),
    FOREIGN KEY (código_producto) references Producto(código)
);

create table Producto_Proveedor (
    código_producto varchar(10) not null,
    código_proveedor varchar(10) not null,
    PRIMARY KEY (código_producto, código_proveedor),
    FOREIGN KEY (código_producto) references Producto(código),
    FOREIGN KEY (código_proveedor) references Proveedor(código)
);
