create database if not exists labores_restaurante;
use labores_restaurante;

create table Cliente (
    ID_cliente varchar(10) PRIMARY KEY,
    nombre varchar(50)
);

create table Mesero (
    ID_mesero varchar(10) PRIMARY KEY,
    nombre varchar(50)
);

create table Categoria (
    ID_categoria varchar(10) PRIMARY KEY,
    nombre varchar(50)
);

create table Plato (
    ID_plato varchar(10) PRIMARY KEY,
    Precio decimal(10,2),
    cantidad int,
    ID_categoria varchar(10) not null,
    FOREIGN KEY (ID_categoria) references Categoria(ID_categoria)
);

create table Pedido (
    ID_pedido varchar(10) PRIMARY KEY,
    Precio_Unitario decimal(10,2),
    ID_cliente varchar(10) not null,
    ID_mesero varchar(10) not null,
    FOREIGN KEY (ID_cliente) references Cliente(ID_cliente),
    FOREIGN KEY (ID_mesero) references Mesero(ID_mesero)
);

create table Pedido_Plato (
    ID_pedido varchar(10) not null,
    ID_plato varchar(10) not null,
    PRIMARY KEY (ID_pedido, ID_plato),
    FOREIGN KEY (ID_pedido) references Pedido(ID_pedido),
    FOREIGN KEY (ID_plato) references Plato(ID_plato)
);
