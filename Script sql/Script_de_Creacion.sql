use Proyecto1

CREATE TABLE Cliente (
    cedula VARCHAR(20) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    apellido_1 VARCHAR(100) NOT NULL,
    apellido_2 VARCHAR(100),
    correo VARCHAR(150),
    tipo_identificacion VARCHAR(50),
    pais_residencia VARCHAR(100),
    direccion VARCHAR(200),
    fecha_nacimiento DATE,
    telefono VARCHAR(20),
    CONSTRAINT PK_Cliente PRIMARY KEY (cedula)
);

CREATE TABLE Hotel (
    cedula VARCHAR(20) NOT NULL,
    nombre VARCHAR(150) NOT NULL,
    tipo VARCHAR(50),
    correo VARCHAR(150),
    url VARCHAR(200),
    redes VARCHAR(200),
    servicios VARCHAR(300),
    direccion VARCHAR(200),
    gps VARCHAR(100),
    telefonos VARCHAR(50),
    CONSTRAINT PK_Hotel PRIMARY KEY (cedula)
);

CREATE TABLE Habitacion (
    numero INT NOT NULL,
    tipo VARCHAR(50),
    estado VARCHAR(50),
    cedula_hotel VARCHAR(20),
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
    precio DECIMAL(10,2),
    fotos VARCHAR(300),
    tipo_cama VARCHAR(50),
    comodidades VARCHAR(300),
    numero_habitacion INT,
    CONSTRAINT PK_TipoHabitacion PRIMARY KEY (nombre),
    CONSTRAINT FK_TipoHabitacion_Habitacion
        FOREIGN KEY (numero_habitacion) REFERENCES Habitacion(numero)
);

CREATE TABLE Actividades (
    cedula VARCHAR(20) NOT NULL,
    nombre VARCHAR(150) NOT NULL,
    contacto VARCHAR(100),
    correo VARCHAR(150),
    tipo_actividad VARCHAR(100),
    descripcion VARCHAR(300),
    direccion VARCHAR(200),
    precio DECIMAL(10,2),
    telefono VARCHAR(20),
    cedula_cliente VARCHAR(20),
    CONSTRAINT PK_Actividades PRIMARY KEY (cedula),
    CONSTRAINT FK_Actividades_Cliente
        FOREIGN KEY (cedula_cliente) REFERENCES Cliente(cedula)
);
