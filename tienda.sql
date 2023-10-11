DROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda CHARACTER SET utf8mb4;
USE tienda;

CREATE TABLE fabricante (
    id          INT UNSIGNED    AUTO_INCREMENT PRIMARY KEY,
    nombre      VARCHAR(100)    NOT NULL
);

CREATE TABLE producto (
    id              INT UNSIGNED    AUTO_INCREMENT PRIMARY KEY,
    nombre          VARCHAR(100)    NOT NULL,
    precio          DOUBLE          NOT NULL,
    id_fabricante   INT UNSIGNED    NOT NULL,
    FOREIGN KEY (id_fabricante) REFERENCES fabricante(id)
);

INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');

INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);

-- Lista el nombre de todos los productos que hay en la tabla producto
SELECT nombre
FROM producto;

-- Lista los nombres y los precios de todos los productos de la tabla producto
SELECT nombre,
       precio
FROM producto;

-- Lista todas las columnas de la tabla producto
SELECT *
FROM producto;

-- Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD)
SELECT nombre,
       ROUND(precio/3.79, 2) AS precio_dolares,
       ROUND(precio/3.98, 2) AS precio_euros
FROM producto;

-- Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula
SELECT UPPER(nombre) AS nombre,
       precio
FROM producto;

-- Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula
SELECT LOWER(nombre) AS nombre,
       precio
FROM producto;

-- Listar los nombres con la primera letra en mayuscula
SELECT CONCAT(UCASE(LEFT(nombre, 1)),LCASE(SUBSTRING(nombre,2))) AS nombre
FROM producto;

-- Lista el nombre de todos los fabricantes en una columna,
-- y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante
SELECT nombre,
       CONCAT(UCASE(LEFT(nombre, 2)),LCASE(SUBSTRING(nombre, 3))) AS nombre_c
FROM fabricante;

-- Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio
SELECT nombre,
       ROUND(precio) AS precio
FROM producto;

-- Lista los nombres y los precios de todos los productos de la tabla producto,
-- truncando el valor del precio para mostrarlo sin ninguna cifra decimal
SELECT nombre,
       TRUNCATE(precio, 0)
FROM producto;

-- Lista el identificador de los fabricantes que tienen productos en la tabla producto
SELECT id_fabricante
FROM producto;

-- Lista el identificador de los fabricantes que tienen productos en la tabla producto,
-- eliminando los identificadores que aparecen repetidos
SELECT DISTINCT id_fabricante
FROM producto;

-- Lista los nombres de los fabricantes ordenados de forma ascendente
SELECT nombre
FROM fabricante
ORDER BY nombre;

-- Lista los nombres de los fabricantes ordenados de forma descendente
SELECT nombre
FROM fabricante
ORDER BY nombre DESC;

-- Lista los nombres de los productos ordenados en primer lugar por el
-- nombre de forma ascendente y en segundo lugar por el precio de forma descendente
SELECT
    nombre
FROM
    producto
ORDER BY
    nombre,
    precio DESC;

-- Devuelve una lista con las 5 primeras filas de la tabla fabricante
SELECT
    *
FROM
    fabricante
LIMIT 5;

-- Devuelve una lista con 2 filas a partir de la cuarta fila de la
-- tabla fabricante. La cuarta fila también se debe incluir en la respuesta
SELECT
    *
FROM
    fabricante
LIMIT 2 OFFSET 3;
-- other form LIMIT start, size;

-- Lista el nombre y el precio del producto más barato.
-- (Utilice solamente las cláusulas ORDER BY y LIMIT)
SELECT
    nombre,
    precio
FROM
    producto
ORDER BY
    precio
LIMIT
    1;

-- Lista el nombre y el precio del producto más caro.
-- (Utilice solamente las cláusulas ORDER BY y LIMIT)
SELECT
    nombre,
    precio
FROM
    producto
ORDER BY
    precio DESC
LIMIT  1;

-- Lista el nombre de todos los productos del fabricante
-- cuyo identificador de fabricante es igual a 2
SELECT
    nombre
FROM
    producto
WHERE
    id_fabricante = 2;

-- Lista el nombre de los productos que tienen un precio menor o igual a 120€
SELECT
    nombre
FROM
    producto
WHERE
    precio <= 120;

-- Lista el nombre de los productos que tienen un precio mayor o igual a 400€
SELECT
    nombre
FROM
    producto
WHERE
    precio >= 400;

-- Lista el nombre de los productos que no tienen un precio mayor o igual a 400€
SELECT
    nombre
FROM
    producto
WHERE
    precio < 400;

-- Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN
SELECT
    nombre
FROM
    producto
WHERE
    precio > 80 AND precio < 300;

SELECT
    nombre
FROM
    producto
WHERE
    precio BETWEEN 80 AND 300;

-- Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN
SELECT
    nombre
FROM
    producto
WHERE
    precio > 60 AND precio < 200;

-- Lista todos los productos que tengan un precio mayor que 200€ y que el identificador de fabricante sea igual a 6
SELECT
    nombre
FROM
    producto
WHERE
    precio > 200
  AND
    id_fabricante = 6;

-- Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Sin utilizar el operador IN
SELECT
    *
FROM
    producto
WHERE
    id_fabricante = 1
   OR
    id_fabricante = 3
   OR
    id_fabricante = 5;

-- Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Utilizando el operador IN
SELECT
    nombre
FROM
    producto
WHERE
     id_fabricante IN (1, 3, 5);

-- Lista los nombres de los fabricantes cuyo nombre empiece por la letra S
SELECT
    *
FROM
    fabricante
WHERE
    nombre LIKE 'A%';

-- SOLUTION A
SELECT
    *
FROM
    fabricante
WHERE
    nombre RLIKE '^[ABC]';
-- OTHER FORM
SELECT
    *
FROM
    fabricante
WHERE
    nombre LIKE 'A%'
   OR
    nombre LIKE 'B%'
   OR
    nombre LIKE 'C%';

-- OTHER FORM
SELECT
    *
FROM
    fabricante
WHERE
    SUBSTR(nombre, 1, 1) IN ('A', 'B', 'C');

-- Lista los nombres de los fabricantes cuyo nombre termine por la vocal e
SELECT
    *
FROM
    fabricante
WHERE
    nombre LIKE '%e';

-- Lista los nombres de los fabricantes cuyo nombre contenga el carácter w
SELECT
    *
FROM
    fabricante
WHERE
    nombre LIKE '%w%';

-- Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres
SELECT
    nombre
FROM
    fabricante
WHERE
    LENGTH(nombre) = 4;

-- Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre
SELECT
    GROUP_CONCAT(nombre SEPARATOR ', ') AS lista
FROM
    producto
WHERE
    nombre LIKE '%Portátil%'