CREATE TABLE IF NOT EXISTS Cuadrante (
    id_cuadrante INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS FormaGeometrica (
    id_forma INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Calzado (
    id_calzado INT AUTO_INCREMENT PRIMARY KEY,
    categoria VARCHAR(50) NOT NULL,
    marca VARCHAR(100) NOT NULL,
    modelo VARCHAR(100) NOT NULL,
    talle VARCHAR(10) NOT NULL,
    ancho DECIMAL(5,2) NOT NULL,
    alto DECIMAL(5,2) NOT NULL,
    colores VARCHAR(100) NOT NULL,
    tipo_registro ENUM('indubitada_proveedor', 'indubitada_comisaria', 'dubitada') NOT NULL
);

CREATE TABLE IF NOT EXISTS Suela (
    id_suela INT AUTO_INCREMENT PRIMARY KEY,
    id_calzado INT NOT NULL,
    descripcion_general TEXT,
    FOREIGN KEY (id_calzado) REFERENCES Calzado(id_calzado) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS DetalleSuela (
    id_detalle INT AUTO_INCREMENT PRIMARY KEY,
    id_suela INT NOT NULL,
    id_cuadrante INT NOT NULL,
    id_forma INT NOT NULL,
    detalle_adicional TEXT,
    FOREIGN KEY (id_suela) REFERENCES Suela(id_suela) ON DELETE CASCADE,
    FOREIGN KEY (id_cuadrante) REFERENCES Cuadrante(id_cuadrante),
    FOREIGN KEY (id_forma) REFERENCES FormaGeometrica(id_forma)
);
