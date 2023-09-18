CREATE DATABASE aulas;
USE aulas;

CREATE table validacion_documento(
    id_documento INT NOT NULL,
    tipo_documento VARCHAR(45) NOT NULL,
    PRIMARY KEY (id_documento)
);

CREATE table usuario(
    id_usuario INT NOT NULL,
    validacion_documento_id_documento INT NOT NULL,
    Nombre VARCHAR(45) NOT NULL,
    Email VARCHAR(45) NOT NULL,
    Contraseña VARCHAR(45) NOT NULL,
    PRIMARY KEY (id_usuario, validacion_documento_id_documento)
);

CREATE TABLE administrador (
    id_admin INT NOT NULL,
    usuario_validacion_documento_id_documento INT NOT NULL,
    PRIMARY KEY (id_admin, usuario_validacion_documento_id_documento)
);

CREATE TABLE Vendedor(
    id_usuario_papeleria INT NOT NULL,
    usuario_validacion_documento_id_documento INT NOT NULL,
    PRIMARY KEY (id_usuario_papeleria, usuario_validacion_documento_id_documento)
);

CREATE TABLE proveedores(
    id_proveedor INT NOT NULL,
    usuario_validacion_documento_id_documento INT NOT NULL,
    producto VARCHAR(45) NOT NULL,
    detalles_productos VARCHAR(45) NOT NULL,
    PRIMARY KEY (id_proveedor, usuario_validacion_documento_id_documento)
);

CREATE TABLE informes(
    id_informe int NOT NULL,
    fecha_creacion DATETIME NOT NULL,
    categoria VARCHAR(45) NOT NULL,
    detalles_informe VARCHAR(45) NOT NULL,
    archivo_pdf VARCHAR(45),
    vendedor_id_usuario_papeleria INT,
    PRIMARY KEY (id_informe)
);

CREATE TABLE factura(
    id_factura INT NOT NULL,
    vendedor_usuario_validacion_documento_id_documento INT NOT NULL,
    precio_total VARCHAR(45) NOT NULL,
    descripcion VARCHAR(45) NOT NULL,
    fecha DATETIME NOT NULL,
    PRIMARY KEY (id_factura, vendedor_usuario_validacion_documento_id_documento)
);
