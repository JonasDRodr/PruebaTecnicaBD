-- =============================================
-- Crear base de datos
-- =============================================
CREATE DATABASE EncuestaBD;
GO

USE EncuestaBD;
GO

-- =============================================
-- Tablas
-- =============================================

CREATE TABLE Rol (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL
);
GO

CREATE TABLE [User] (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    UserName NVARCHAR(50) NOT NULL,
    Password NVARCHAR(255) NOT NULL,
    IdRol INT NOT NULL,
    IntentosFallidos INT NOT NULL DEFAULT 0,
    Bloqueado BIT NOT NULL DEFAULT 0,
    CONSTRAINT FK_User_Rol FOREIGN KEY (IdRol) REFERENCES Rol(Id),
    CONSTRAINT UQ_User_UserName UNIQUE (UserName)
);
GO

CREATE TABLE Encuesta (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL
);
GO

CREATE TABLE Pregunta (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    IdEncuesta INT NOT NULL,
    NumeroPregunta INT NOT NULL,
    Texto NVARCHAR(255) NOT NULL,
    Tipo NVARCHAR(50) NOT NULL,
    CONSTRAINT FK_Pregunta_Encuesta FOREIGN KEY (IdEncuesta) REFERENCES Encuesta(Id)
);
GO

CREATE TABLE Opcion (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    IdPregunta INT NOT NULL,
    NumeroOpcion INT NOT NULL,
    CONSTRAINT FK_Opcion_Pregunta FOREIGN KEY (IdPregunta) REFERENCES Pregunta(Id)
);
GO

CREATE TABLE Respuesta (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    IdOpcion INT NOT NULL,
    IdUser INT NOT NULL,
    CONSTRAINT FK_Respuesta_Opcion FOREIGN KEY (IdOpcion) REFERENCES Opcion(Id),
    CONSTRAINT FK_Respuesta_User FOREIGN KEY (IdUser) REFERENCES [User](Id)
);
GO

-- =============================================
-- Datos iniciales
-- =============================================

-- Roles
INSERT INTO Rol (Nombre) VALUES ('Admin');
INSERT INTO Rol (Nombre) VALUES ('User');
GO

-- Usuarios
-- Password: Pass123
INSERT INTO [User] (UserName, Password, IdRol)
VALUES ('Admin', '$2a$11$PxBeacVELgAql0MvApDZTurfPAONDF/9h1RJ9nyXa.nVbrk9BBl2a', 1);

-- Password: User123
INSERT INTO [User] (UserName, Password, IdRol)
VALUES ('User1', '$2a$11$B0uIb7FpFjch3ehxHr6bEedZ.SM9/qdgtnbzC1/9Z1MXYq13OsQgW', 2);
GO

-- Encuestas
INSERT INTO Encuesta (Nombre) VALUES ('Encuesta de Satisfacción');
INSERT INTO Encuesta (Nombre) VALUES ('Encuesta de Experiencia de Usuario');
GO

-- Preguntas Encuesta 1
INSERT INTO Pregunta (IdEncuesta, NumeroPregunta, Texto, Tipo)
VALUES (1, 1, '¿Del 1 al 10, qué tan satisfecho estás con nuestro servicio?', 'escala');
GO

-- Preguntas Encuesta 2
INSERT INTO Pregunta (IdEncuesta, NumeroPregunta, Texto, Tipo)
VALUES (2, 1, '¿Qué tan fácil fue navegar por nuestra plataforma?', 'escala');

INSERT INTO Pregunta (IdEncuesta, NumeroPregunta, Texto, Tipo)
VALUES (2, 2, '¿Cómo calificarías el diseño visual de la aplicación?', 'escala');

INSERT INTO Pregunta (IdEncuesta, NumeroPregunta, Texto, Tipo)
VALUES (2, 3, '¿Qué tan rápido encontraste lo que buscabas?', 'escala');

INSERT INTO Pregunta (IdEncuesta, NumeroPregunta, Texto, Tipo)
VALUES (2, 4, '¿Cómo evalúas la estabilidad y rendimiento de la app?', 'escala');

INSERT INTO Pregunta (IdEncuesta, NumeroPregunta, Texto, Tipo)
VALUES (2, 5, '¿Qué tan satisfecho estás con la experiencia general?', 'escala');
GO

-- Opciones Pregunta 1 (Encuesta 1)
INSERT INTO Opcion (IdPregunta, NumeroOpcion) VALUES (1, 1);
INSERT INTO Opcion (IdPregunta, NumeroOpcion) VALUES (1, 2);
INSERT INTO Opcion (IdPregunta, NumeroOpcion) VALUES (1, 3);
INSERT INTO Opcion (IdPregunta, NumeroOpcion) VALUES (1, 4);
INSERT INTO Opcion (IdPregunta, NumeroOpcion) VALUES (1, 5);
INSERT INTO Opcion (IdPregunta, NumeroOpcion) VALUES (1, 6);
INSERT INTO Opcion (IdPregunta, NumeroOpcion) VALUES (1, 7);
INSERT INTO Opcion (IdPregunta, NumeroOpcion) VALUES (1, 8);
INSERT INTO Opcion (IdPregunta, NumeroOpcion) VALUES (1, 9);
INSERT INTO Opcion (IdPregunta, NumeroOpcion) VALUES (1, 10);
GO

-- Opciones Pregunta 2 (Encuesta 2)
INSERT INTO Opcion (IdPregunta, NumeroOpcion) VALUES (2, 1);
INSERT INTO Opcion (IdPregunta, NumeroOpcion) VALUES (2, 2);
INSERT INTO Opcion (IdPregunta, NumeroOpcion) VALUES (2, 3);
INSERT INTO Opcion (IdPregunta, NumeroOpcion) VALUES (2, 4);
INSERT INTO Opcion (IdPregunta, NumeroOpcion) VALUES (2, 5);
INSERT INTO Opcion (IdPregunta, NumeroOpcion) VALUES (2, 6);
INSERT INTO Opcion (IdPregunta, NumeroOpcion) VALUES (2, 7);
INSERT INTO Opcion (IdPregunta, NumeroOpcion) VALUES (2, 8);
INSERT INTO Opcion (IdPregunta, NumeroOpcion) VALUES (2, 9);
INSERT INTO Opcion (IdPregunta, NumeroOpcion) VALUES (2, 10);
GO

-- Opciones Pregunta 3 (Encuesta 2)
INSERT INTO Opcion (IdPregunta, NumeroOpcion) VALUES (3, 1);
INSERT INTO Opcion (IdPregunta, NumeroOpcion) VALUES (3, 2);
INSERT INTO Opcion (IdPregunta, NumeroOpcion) VALUES (3, 3);
INSERT INTO Opcion (IdPregunta, NumeroOpcion) VALUES (3, 4);
INSERT INTO Opcion (IdPregunta, NumeroOpcion) VALUES (3, 5);
INSERT INTO Opcion (IdPregunta, NumeroOpcion) VALUES (3, 6);
INSERT INTO Opcion (IdPregunta, NumeroOpcion) VALUES (3, 7);
INSERT INTO Opcion (IdPregunta, NumeroOpcion) VALUES (3, 8);
INSERT INTO Opcion (IdPregunta, NumeroOpcion) VALUES (3, 9);
INSERT INTO Opcion (IdPregunta, NumeroOpcion) VALUES (3, 10);
GO

-- Opciones Pregunta 4 (Encuesta 2)
INSERT INTO Opcion (IdPregunta, NumeroOpcion) VALUES (4, 1);
INSERT INTO Opcion (IdPregunta, NumeroOpcion) VALUES (4, 2);
INSERT INTO Opcion (IdPregunta, NumeroOpcion) VALUES (4, 3);
INSERT INTO Opcion (IdPregunta, NumeroOpcion) VALUES (4, 4);
INSERT INTO Opcion (IdPregunta, NumeroOpcion) VALUES (4, 5);
INSERT INTO Opcion (IdPregunta, NumeroOpcion) VALUES (4, 6);
INSERT INTO Opcion (IdPregunta, NumeroOpcion) VALUES (4, 7);
INSERT INTO Opcion (IdPregunta, NumeroOpcion) VALUES (4, 8);
INSERT INTO Opcion (IdPregunta, NumeroOpcion) VALUES (4, 9);
INSERT INTO Opcion (IdPregunta, NumeroOpcion) VALUES (4, 10);
GO

-- Opciones Pregunta 5 (Encuesta 2)
INSERT INTO Opcion (IdPregunta, NumeroOpcion) VALUES (5, 1);
INSERT INTO Opcion (IdPregunta, NumeroOpcion) VALUES (5, 2);
INSERT INTO Opcion (IdPregunta, NumeroOpcion) VALUES (5, 3);
INSERT INTO Opcion (IdPregunta, NumeroOpcion) VALUES (5, 4);
INSERT INTO Opcion (IdPregunta, NumeroOpcion) VALUES (5, 5);
INSERT INTO Opcion (IdPregunta, NumeroOpcion) VALUES (5, 6);
INSERT INTO Opcion (IdPregunta, NumeroOpcion) VALUES (5, 7);
INSERT INTO Opcion (IdPregunta, NumeroOpcion) VALUES (5, 8);
INSERT INTO Opcion (IdPregunta, NumeroOpcion) VALUES (5, 9);
INSERT INTO Opcion (IdPregunta, NumeroOpcion) VALUES (5, 10);
GO

-- Opciones Pregunta 6 (Encuesta 2)
INSERT INTO Opcion (IdPregunta, NumeroOpcion) VALUES (6, 1);
INSERT INTO Opcion (IdPregunta, NumeroOpcion) VALUES (6, 2);
INSERT INTO Opcion (IdPregunta, NumeroOpcion) VALUES (6, 3);
INSERT INTO Opcion (IdPregunta, NumeroOpcion) VALUES (6, 4);
INSERT INTO Opcion (IdPregunta, NumeroOpcion) VALUES (6, 5);
INSERT INTO Opcion (IdPregunta, NumeroOpcion) VALUES (6, 6);
INSERT INTO Opcion (IdPregunta, NumeroOpcion) VALUES (6, 7);
INSERT INTO Opcion (IdPregunta, NumeroOpcion) VALUES (6, 8);
INSERT INTO Opcion (IdPregunta, NumeroOpcion) VALUES (6, 9);
INSERT INTO Opcion (IdPregunta, NumeroOpcion) VALUES (6, 10);
GO