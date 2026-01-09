create database Proyecto1
GO;

use Proyecto1

CREATE TABLE Cliente (
    cedula VARCHAR(20) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL,
    apellido_1 VARCHAR(100) NOT NULL,
    apellido_2 VARCHAR(100),
    correo VARCHAR(150) NOT NULL,
    tipo_identificacion VARCHAR(50) NOT NULL,
    pais_residencia VARCHAR(100) NOT NULL,
    direccion VARCHAR(200) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    CONSTRAINT PK_Cliente PRIMARY KEY (cedula)
);

CREATE TABLE Hotel (
    cedula VARCHAR(20) NOT NULL,
    nombre VARCHAR(150) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    correo VARCHAR(150) NOT NULL UNIQUE,
    url VARCHAR(200) NOT NULL,
    redes VARCHAR(200),
    servicios VARCHAR(300) NOT NULL,
    direccion VARCHAR(200) NOT NULL,
    gps VARCHAR(100),
    telefonos VARCHAR(50) NOT NULL,
    CONSTRAINT PK_Hotel PRIMARY KEY (cedula)
);

CREATE TABLE Habitacion (
    numero INT NOT NULL UNIQUE,
    tipo VARCHAR(50) NOT NULL,
    estado VARCHAR(50) NOT NULL,
    cedula_hotel VARCHAR(20)NOT NULL,
    cedula_cliente VARCHAR(20),
    CONSTRAINT PK_Habitacion PRIMARY KEY (numero),
    CONSTRAINT FK_Habitacion_Hotel
        FOREIGN KEY (cedula_hotel) REFERENCES Hotel(cedula),
    CONSTRAINT FK_Habitacion_Cliente
        FOREIGN KEY (cedula_cliente) REFERENCES Cliente(cedula)
);

CREATE TABLE TipoHabitacion (
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(300),
    precio DECIMAL(10,2) NOT NULL,
    fotos VARCHAR(300) NOT NULL,
    tipo_cama VARCHAR(50) NOT NULL,
    comodidades VARCHAR(300),
    numero_habitacion INT UNIQUE,
    CONSTRAINT PK_TipoHabitacion PRIMARY KEY (nombre),
    CONSTRAINT FK_TipoHabitacion_Habitacion
        FOREIGN KEY (numero_habitacion) REFERENCES Habitacion(numero)
);

CREATE TABLE Actividades (
    cedula VARCHAR(20) NOT NULL UNIQUE,
    nombre VARCHAR(150) NOT NULL,
    contacto VARCHAR(100) NOT NULL,
    correo VARCHAR(150) NOT NULL,
    tipo_actividad VARCHAR(100) NOT NULL,
    descripcion VARCHAR(300),
    direccion VARCHAR(200) NOT NULL,
    precio DECIMAL(10,2) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    cedula_cliente VARCHAR(20),
    CONSTRAINT PK_Actividades PRIMARY KEY (cedula),
    CONSTRAINT FK_Actividades_Cliente
        FOREIGN KEY (cedula_cliente) REFERENCES Cliente(cedula)
);
