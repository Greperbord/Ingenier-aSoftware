##Created 29/10/2023
#Created by: Enrique Perez Gallardo
#Defintion: Crear una base de datos para controlar la informacion de ventas de productos de estudiantes

CREATE DATABASE IF NOT EXISTS ventas_db;

USE ventas_db;

CREATE TABLE IF NOT EXISTS estudiante( 
	est_id INT NOT NULL AUTO_INCREMENT,
    est_nombre VARCHAR(50) NOT NULL,
    est_ap_pat VARCHAR(50) NOT NULL,
    est_ap_mat VARCHAR(50) NOT NULL,
    est_carrera VARCHAR(7) NOT NULL COMMENT 'solo dar las iniciales de la carrera, pe e.j, LISC o LICE',
    est_correo VARCHAR(50) NOT NULL,
    PRIMARY KEY (est_id)
);

CREATE TABLE IF NOT EXISTS producto(
	pro_id INT NOT NULL AUTO_INCREMENT,
    pro_nombre VARCHAR(60) NOT NULL,
    pro_marca VARCHAR(50),
    pro_precio_venta DECIMAL(10,2) NOT NULL COMMENT 'Pesos MXN',
    pro_stock SMALLINT NOT NULL COMMENT 'Unidades',
    pro_descripcion TEXT,
    pro_estado ENUM('0','1') NOT NULL,
    PRIMARY KEY (pro_id),
    INDEX idx_nombre(pro_nombre),
    INDEX idx_marca(pro_marca),
    INDEX idx_estado(pro_estado)
);

CREATE TABLE IF NOT EXISTS puesto(
	pue_id INT NOT NULL AUTO_INCREMENT,
    pue_nombre VARCHAR(50) NOT NULL,
    pue_ubicacion VARCHAR(50) NOT NULL,
    pue_dinero_ganado INT NOT NULL,
    pue_cambio_disponible INT NOT NULL,
    pue_est_id INT NOT NULL,
    pue_pro_id INT NOT NULL,
    PRIMARY KEY (pue_id),
    CONSTRAINT fk_est_pue
		FOREIGN KEY (pue_est_id)
        REFERENCES estudiante(est_id)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT,
	CONSTRAINT fk_pro_pue
		FOREIGN KEY (pue_pro_id)
        REFERENCES producto(pro_id)
        ON DELETE RESTRICT
        ON UPDATE RESTRICT
);