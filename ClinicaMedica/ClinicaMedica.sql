reate database if not exists atencion_medicos;
use atencion_medicos;

create table Paciente (
    ID_paciente varchar(10) PRIMARY KEY,
    nombre varchar(50)
);

create table Especialidad (
    ID_especialidad varchar(10) PRIMARY KEY,
    nombre varchar(50)
);

create table Medico (
    ID_medico varchar(10) PRIMARY KEY,
    ID_especialidad varchar(10) not null,
    nombre varchar(50),
    FOREIGN KEY (ID_especialidad) references Especialidad(ID_especialidad)
);

create table Medicamento (
    ID_medicamento varchar(10) PRIMARY KEY,
    nombre varchar(50)
);

create table Citas (
    ID_cita varchar(10) PRIMARY KEY,
    Fecha date,
    Consultorio varchar(20),
    Hora time,
    ID_paciente varchar(10) not null,
    ID_medico varchar(10) not null,
    FOREIGN KEY (ID_paciente) references Paciente(ID_paciente),
    FOREIGN KEY (ID_medico) references Medico(ID_medico)
);

create table Receta (
    ID_receta varchar(10) PRIMARY KEY,
    Dosis varchar(50),
    Duración varchar(30),
    ID_cita varchar(10) not null,
    FOREIGN KEY (ID_cita) references Citas(ID_cita)
);

create table Receta_Medicamento (
    ID_receta varchar(10) not null,
    ID_medicamento varchar(10) not null,
    PRIMARY KEY (ID_receta, ID_medicamento),
    FOREIGN KEY (ID_receta) references Receta(ID_receta),
    FOREIGN KEY (ID_medicamento) references Medicamento(ID_medicamento)
);
