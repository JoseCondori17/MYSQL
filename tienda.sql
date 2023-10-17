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
    nombre LIKE '%Portátil%';

-- Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €
SELECT
    nombre
FROM
    producto
WHERE
    nombre LIKE '%Monitor%' AND
    precio < 215;

-- Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€.
-- Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)
SELECT
    nombre,
    precio
FROM
    producto
WHERE
    precio >= 180
ORDER BY
    precio DESC,
    nombre;

-- Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
SELECT
    P.nombre,
    P.precio,
    F.nombre as nombre_fabricante
FROM
    producto P INNER JOIN fabricante F ON P.id_fabricante = F.id;

-- Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
-- Ordene el resultado por el nombre del fabricante, por orden alfabético.
SELECT
    P.nombre,
    P.precio,
    F.nombre AS nombre_fabricante
FROM
    producto P INNER JOIN fabricante F ON P.id_fabricante = F.id
ORDER BY
    nombre_fabricante;

-- Devuelve una lista con el identificador del producto, nombre del producto, identificador del fabricante y nombre del fabricante,
 -- de todos los productos de la base de datos.
SELECT
    P.id AS id_producto,
    P.nombre AS nombre_producto,
    F.id AS id_fabricante,
    F.nombre AS nombre_fabricante
FROM
    producto P INNER JOIN fabricante F ON P.id_fabricante = F.id;

-- Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
SELECT
    P.nombre AS nombre_producto,
    P.precio,
    F.nombre AS nombre_fabricante
FROM
    producto P INNER JOIN fabricante F ON P.id_fabricante = F.id
ORDER BY
    P.precio
LIMIT 1;

-- OTra forma usando cross join para obtener el mas barato
SELECT
    *
FROM
    producto
WHERE
    nombre NOT IN(
        SELECT
            P1.nombre
        FROM
            producto P1,
            producto P2
        WHERE P1.precio > P2.precio
    );

-- Usando right join para obtener el mas barato
SELECT
    DISTINCT P2.id, P2.nombre, P2.precio
FROM
    producto P1 RIGHT JOIN producto P2 ON P1.precio < P2.precio
WHERE
    P1.nombre IS NULL;

-- Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro
SELECT
    P.nombre AS nombre_producto,
    P.precio,
    F.nombre AS nombre_fabricante
FROM
    producto P INNER JOIN fabricante F ON P.id_fabricante = F.id
ORDER BY
    precio DESC
LIMIT 1;

-- Devuelve una lista de todos los productos del fabricante Lenovo - eficiente
SELECT
    id,
    nombre,
    precio
FROM
    producto
WHERE
    id_fabricante = (
        SELECT
            F.id
        FROM
            fabricante F
        WHERE
            F.nombre = 'Lenovo'
        );

-- Otra forma
SELECT
    P.id,
    P.nombre,
    P.precio
FROM
    producto P INNER JOIN fabricante F ON P.id_fabricante = F.id
WHERE
    F.nombre = 'Lenovo';

-- Otra forma
SELECT
    P.nombre
FROM
    producto P LEFT JOIN fabricante F ON P.id_fabricante = F.id
WHERE
    F.nombre = 'Lenovo';

-- Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€
SELECT
    P.id,
    P.nombre,
    P.precio
FROM
    producto P
WHERE
    P.precio > 200 AND
    P.id_fabricante = (
        SELECT
            F.id
        FROM
            fabricante F
        WHERE
            F.nombre = 'Crucial'
        );

-- Otra forma
SELECT
    P.id,
    P.nombre,
    P.precio
FROM
    producto P LEFT JOIN fabricante F ON P.id_fabricante = F.id
WHERE
    P.precio > 200 AND
    F.nombre = 'Crucial';

-- Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packard y Seagate. Sin utilizar el operador IN
SELECT
    P.id,
    P.nombre,
    P.precio
FROM
    producto P LEFT JOIN fabricante F ON P.id_fabricante = F.id
WHERE
    F.nombre = 'Asus' OR
    F.nombre = 'Hewlett-Packard' OR
    F.nombre = 'Seagate';

-- OTRA FORMA
SELECT
    P.id,
    P.nombre,
    P.precio
FROM
    producto P
WHERE
    P.id_fabricante = ANY(
        SELECT
            F.id
        FROM
            fabricante F
        WHERE
            F.nombre = 'Asus' OR
            F.nombre = 'Hewlett-Packard' OR
            F.nombre = 'Seagate'
    );

-- Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Utilizando el operador IN
SELECT
    P.id,
    P.nombre,
    P.precio
FROM
    producto P
WHERE
    P.id_fabricante IN(
        SELECT
            F.id
        FROM
            fabricante F
        WHERE
            F.nombre = 'Asus' OR
            F.nombre = 'Hewlett-Packard' OR
            F.nombre = 'Seagate'
    );

-- OTRA FORMA
SELECT
    P.id,
    P.nombre,
    P.precio
FROM
    producto P LEFT JOIN fabricante F ON P.id_fabricante = F.id
WHERE
    F.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');

-- Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e
SELECT
    P.id,
    P.nombre,
    P.precio
FROM
    producto P INNER JOIN fabricante F ON P.id_fabricante = F.id
WHERE
    F.nombre LIKE '%e';

-- OTRA FORMA
SELECT
    P.id,
    P.nombre,
    P.precio
FROM
    producto P
WHERE
    P.id_fabricante IN (
        SELECT
            F.id
        FROM
            fabricante F
        WHERE
            F.nombre LIKE '%e'
        );

-- Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.
SELECT
    P.id,
    P.nombre,
    P.precio
FROM
    producto P INNER JOIN fabricante F ON P.id_fabricante = F.id
WHERE
    F.nombre LIKE '%w%';

-- Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€.
-- Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)
SELECT
    P.id,
    P.nombre AS nombre_producto,
    P.precio,
    F.nombre AS nombre_fabricante
FROM
    producto P LEFT JOIN fabricante F ON P.id_fabricante = F.id
WHERE
    P.precio >= 180
ORDER BY
    P.precio DESC,
    P.nombre;

-- Devuelve un listado con el identificador y el nombre de fabricante,
-- solamente de aquellos fabricantes que tienen productos asociados en la base de datos.
SELECT F.id, F.nombre
FROM fabricante F
WHERE EXISTS (
    SELECT 1
    FROM producto P
    WHERE P.id_fabricante = F.id
);

-- Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos.
-- El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados
SELECT F.nombre, GROUP_CONCAT(P.nombre SEPARATOR ', ') AS productos
FROM fabricante F LEFT JOIN producto P ON F.id = P.id_fabricante
GROUP BY F.nombre;

-- Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado
SELECT F.nombre
FROM fabricante F LEFT JOIN producto P on F.id = P.id_fabricante
WHERE P.nombre IS NULL;

-- Calcula el número total de productos que hay en la tabla productos
SELECT COUNT(*) AS total_productos
FROM producto;

-- Calcula el número total de fabricantes que hay en la tabla fabricante
SELECT COUNT(*) AS total_fabricantes
FROM fabricante;

-- otra forma es almacenando en una variable(no recomendable)
SET @total = (SELECT COUNT(*) FROM producto);
SELECT @total AS total_productos;

-- con la informacion de la tabla (desventaja solo nos da la cantidad de filas, puede haber elementos repetidos)
-- SELECT TABLE_ROWS AS total_productos
-- FROM information_schema.TABLES
-- WHERE TABLE_SCHEMA = 'tienda' AND TABLE_NAME = 'producto';

-- Calcula el número de valores distintos de identificador de fabricante aparecen en la tabla productos
SELECT COUNT(DISTINCT id_fabricante) AS valores_distintos
FROM producto;

-- Calcula la media del precio de todos los productos
SELECT ROUND(AVG(precio), 3) AS promedio
FROM producto;

-- Calcula el precio más barato de todos los productos
SELECT MIN(precio) AS precio_barato
FROM producto;

-- Calcula el precio más caro de todos los productos
SELECT MAX(precio) AS precio_caro
FROM producto;

-- Lista el nombre y el precio del producto más barato
SELECT nombre, precio
FROM producto
WHERE precio = (SELECT MIN(precio) FROM producto);

-- Lista el nombre y el precio del producto más caro.
SELECT nombre, precio
FROM producto
WHERE precio = (SELECT MAX(precio) FROM producto);

-- Calcula la suma de los precios de todos los productos.
SELECT SUM(precio) AS total
FROM producto;

-- Calcula el número de productos que tiene el fabricante Asus
SELECT COUNT(*) AS total_productos
FROM producto P
WHERE P.id_fabricante = (SELECT F.id
                         FROM fabricante F
                         WHERE F.nombre = 'Asus');

-- Calcula la media del precio de todos los productos del fabricante Asus
SELECT AVG(P.precio) AS media
FROM producto P
WHERE P.id_fabricante = (SELECT F.id
                         FROM fabricante F
                         WHERE F.nombre = 'Asus');

-- Calcula el precio más barato de todos los productos del fabricante Asus
-- FORMA 1
SELECT P.nombre, P.precio
FROM producto P LEFT JOIN fabricante f on P.id_fabricante = f.id
WHERE f.nombre = 'Asus'
ORDER BY precio
LIMIT 1;
-- FORMA 2
SELECT p.nombre,p.precio
FROM producto p LEFT JOIN fabricante f on f.id = p.id_fabricante
WHERE f.nombre = 'Asus' AND
      p.precio = (SELECT MIN(p.precio)
                  FROM producto p LEFT JOIN fabricante f ON f.id = p.id_fabricante
                  WHERE f.nombre = 'Asus');
-- FORMA 3
SELECT p.nombre, p.precio
FROM producto p
JOIN fabricante f ON f.id = p.id_fabricante
WHERE f.nombre = 'Asus'
AND p.precio = (SELECT MIN(precio)
                FROM producto
                WHERE id_fabricante = f.id);

-- Calcula la suma de todos los productos del fabricante Asus
SELECT SUM(p.precio) AS total
FROM producto p INNER JOIN fabricante f on p.id_fabricante = f.id
WHERE f.nombre = 'Asus';

-- Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que tiene el fabricante Crucial
SELECT MIN(p.precio) AS precio_minimo,
       MAX(p.precio) AS precio_maximo,
       AVG(p.precio) AS precio_medio,
       COUNT(p.id) AS total_productos
FROM producto p INNER JOIN fabricante f on f.id = p.id_fabricante
WHERE f.nombre = 'Crucial';

-- Muestra el número total de productos que tiene cada uno de los fabricantes.
-- El listado también debe incluir los fabricantes que no tienen ningún producto.
-- El resultado mostrará dos columnas, una con el nombre del fabricante y otra con el número de productos que tiene.
-- Ordene el resultado descendentemente por el número de productos.
SELECT f.nombre AS fabricante,
       COUNT(p.nombre) AS total_productos
FROM fabricante f LEFT JOIN producto p on f.id = p.id_fabricante
GROUP BY f.id
ORDER BY total_productos DESC;

-- Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los fabricantes.
-- El resultado mostrará el nombre del fabricante junto con los datos que se solicitan.
SELECT f.nombre AS fabricante,
       IFNULL(MAX(p.precio), 0) AS precio_maximo,
       IFNULL(MIN(p.precio), 0) AS precio_minimo,
       IFNULL(AVG(p.precio), 0) AS precio_medio
FROM fabricante f LEFT JOIN producto p on f.id = p.id_fabricante
GROUP BY f.id;

-- Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€.
-- No es necesario mostrar el nombre del fabricante, con el identificador del fabricante es suficiente
SELECT f.id,
       MIN(p.precio) AS precio_minimo,
       MAX(p.precio) AS precio_maximo,
       AVG(p.precio) AS precio_medio
FROM fabricante f LEFT JOIN producto p on f.id = p.id_fabricante
WHERE f.id IN (SELECT id_fabricante
               FROM producto
               GROUP BY id_fabricante
               HAVING AVG(precio) > 200
               )
GROUP BY f.id;


-- Calcula el número de productos que tienen un precio mayor o igual a 180€
SELECT COUNT(*) AS tota
FROM producto
WHERE precio >= 180;

-- Calcula el número de productos que tiene cada fabricante con un precio mayor o igual a 180
SELECT id_fabricante,
       COUNT(*) AS productos
FROM producto
WHERE precio >= 180
GROUP BY id_fabricante;

-- Lista el precio medio los productos de cada fabricante, mostrando solamente el identificador del fabricante
SELECT id_fabricante,
       AVG(precio) AS precio_medio
FROM producto
GROUP BY id_fabricante;

-- Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productos
SELECT f.id,
       f.nombre,
       COUNT(p.id) AS cantidad_productos
FROM fabricante f INNER JOIN producto p on f.id = p.id_fabricante
GROUP BY f.id
HAVING cantidad_productos >= 2;

-- Devuelve los nombres de los fabricantes que no tienen productos asociados
SELECT f.nombre
FROM fabricante f
WHERE NOT EXISTS(SELECT 1
                 FROM producto p
                 WHERE p.id_fabricante = f.id
                 );

-- Devuelve los nombres de los fabricantes que tienen productos asociados.
SELECT f.nombre
FROM fabricante f
WHERE EXISTS(SELECT 1
             FROM producto p
             WHERE p.id_fabricante = f.id
             );

-- Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando IN o NOT IN).
SELECT f.nombre
FROM fabricante f
WHERE f.id NOT IN (SELECT p.id_fabricante
                   FROM producto p);

-- Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando IN o NOT IN).
SELECT f.nombre
FROM fabricante f
WHERE f.id IN (SELECT p.id_fabricante
                   FROM producto p);

-- Devuelve el producto más caro que existe en la tabla producto sin hacer uso de MAX, ORDER BY ni LIMIT.
SELECT nombre,
       precio
FROM producto
WHERE precio != ALL (SELECT p.precio
                     FROM producto p
                     WHERE p.precio < ANY (SELECT precio
                                           FROM producto));

-- Devuelve el producto más barato que existe en la tabla producto sin hacer uso de MIN, ORDER BY ni LIMIT
SELECT nombre,
       precio
FROM producto
WHERE precio != ALL (SELECT p.precio
                     FROM producto p
                     WHERE p.precio > ANY (SELECT precio
                                           FROM producto))

-- Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando ALL o ANY).

-- Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando ALL o ANY).