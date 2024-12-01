-- Creación de la base de datos
CREATE DATABASE VentaBoletosEventos;
USE VentaBoletosEventos;

-- Tabla: Sede
CREATE TABLE Sede (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Calle VARCHAR(100) NOT NULL,
    Ciudad VARCHAR(50) NOT NULL,
    Codigo_Postal VARCHAR(10) NOT NULL,
    Capacidad INT NOT NULL
);

-- Tabla: Evento
CREATE TABLE Evento (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Fecha DATE NOT NULL,
    Hora TIME NOT NULL,
    ID_Sede INT NOT NULL,
    FOREIGN KEY (ID_Sede) REFERENCES Sede(ID) ON DELETE CASCADE
);

-- Tabla: Cliente
CREATE TABLE Cliente (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Correo_Electronico VARCHAR(100) NOT NULL UNIQUE,
    Telefono VARCHAR(15) UNIQUE
);

-- Tabla: Boleto
CREATE TABLE Boleto (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    ID_Cliente INT NOT NULL,
    ID_Evento INT NOT NULL,
    Numero_Asiento VARCHAR(10) NOT NULL,
    Precio DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID) ON DELETE CASCADE,
    FOREIGN KEY (ID_Evento) REFERENCES Evento(ID) ON DELETE CASCADE
);
