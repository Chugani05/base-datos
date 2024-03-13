-- TAREA 1
-- MIGRACIÓN Y PRIMEROS PASOS EN MYSQL
-- Migramos la BBDD dada en sqlite3 a MySQL:
CREATE TABLE IF NOT EXISTS usuarios (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    edad INT,
    correo VARCHAR(50)
);

INSERT INTO usuarios (nombre, edad, correo) VALUES
('Juan', 25, 'juan@example.com'),
('María', 30, 'maria@example.com'),
('Pedro', 28, 'pedro@example.com');

CREATE TABLE IF NOT EXISTS productos (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    precio DECIMAL(10, 2),
    cantidad INT
);

INSERT INTO productos (nombre, precio, cantidad) VALUES
('Camisa', 25.99, 100),
('Pantalón', 35.50, 80),
('Zapatos', 59.99, 50);

CREATE TABLE IF NOT EXISTS pedidos (
    id INTEGER AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT,
    producto_id INT,
    cantidad INT,
    fecha_pedido DATE,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    FOREIGN KEY (producto_id) REFERENCES productos(id)
);

INSERT INTO pedidos (usuario_id, producto_id, cantidad, fecha_pedido) VALUES
(1, 1, 2, '2024-03-01'),
(2, 2, 1, '2024-03-02'),
(3, 3, 3, '2024-03-03');

-- Creamos una base de datos con el coamndo:
CREATE DATABASE tarea1

-- Accedemos a la base de datos con el coamndo:
USE tarea1


-- Rrealiza las siguientes consultas:
-- Mostrar todos los usuarios.
select * from usuarios;
/**
+----+--------+------+-------------------+
| id | nombre | edad | correo            |
+----+--------+------+-------------------+
|  1 | Juan   |   25 | juan@example.com  |
|  2 | María  |   30 | maria@example.com |
|  3 | Pedro  |   28 | pedro@example.com |
+----+--------+------+-------------------+
**/

-- Mostrar todos los productos.
select * from productos;
/**
+----+-----------+--------+----------+
| id | nombre    | precio | cantidad |
+----+-----------+--------+----------+
|  1 | Camisa    |  25.99 |      100 |
|  2 | Pantalón  |  35.50 |       80 |
|  3 | Zapatos   |  59.99 |       50 |
+----+-----------+--------+----------+
**/

-- Mostrar todos los pedidos.
select * from pedidos;
/**
+----+------------+-------------+----------+--------------+
| id | usuario_id | producto_id | cantidad | fecha_pedido |
+----+------------+-------------+----------+--------------+
|  1 |          1 |           1 |        2 | 2024-03-01   |
|  2 |          2 |           2 |        1 | 2024-03-02   |
|  3 |          3 |           3 |        3 | 2024-03-03   |
+----+------------+-------------+----------+--------------+
**/

-- Mostrar los usuarios que tienen más de 25 años.
select * from usuarios where edad > 25;
/**
+----+--------+------+-------------------+
| id | nombre | edad | correo            |
+----+--------+------+-------------------+
|  2 | María  |   30 | maria@example.com |
|  3 | Pedro  |   28 | pedro@example.com |
+----+--------+------+-------------------+
**/

-- Mostrar los productos con un precio mayor a 50.
select * from productos where precio > 50;
/**
+----+---------+--------+----------+
| id | nombre  | precio | cantidad |
+----+---------+--------+----------+
|  3 | Zapatos |  59.99 |       50 |
+----+---------+--------+----------+
**/

-- Mostrar los pedidos realizados el día de hoy.
select * from pedidos 
/**

**/

-- Mostrar el total de productos en stock.
select sum(precio) from productos;
/**
+-------------+
| sum(precio) |
+-------------+
|      121.48 |
+-------------+
**/

-- Mostrar el promedio de edades de los usuarios.
select avg(edad) from usuarios;
/**
+-----------+
| avg(edad) |
+-----------+
|   27.6667 |
+-----------+
**/

-- Mostrar los usuarios que tienen la letra 'a' en su nombre
-- Mostrar los productos ordenados por precio de forma descendente.
-- Mostrar los pedidos realizados por el usuario con ID 2.
-- Mostrar los usuarios ordenados por edad de forma ascendente.
-- Mostrar los productos con un precio entre 20 y 50.
-- Mostrar los usuarios que tienen un correo de dominio 'example.com'.
-- Mostrar los pedidos con una cantidad mayor a 2
