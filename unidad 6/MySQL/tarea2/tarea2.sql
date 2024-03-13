-- TAREA 2
-- MIGRACIÓN Y PRIMEROS PASOS EN MYSQL
-- Migramos la BBDD dada en sqlite3 a MySQL:
CREATE TABLE IF NOT EXISTS clientes (
    id_cliente INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT,
    direccion TEXT
);

INSERT INTO clientes (nombre, direccion) VALUES
    ('Cliente 1', 'Dirección 1'),
    ('Cliente 2', 'Dirección 2'),
    ('Cliente 3', 'Dirección 3'),
    ('Cliente 4', 'Dirección 4'),
    ('Cliente 5', 'Dirección 5'),
    ('Cliente 6', 'Dirección 6'),
    ('Cliente 7', 'Dirección 7'),
    ('Cliente 8', 'Dirección 8'),
    ('Cliente 9', 'Dirección 9'),
    ('Cliente 10', 'Dirección 10'),
    ('Cliente 11', 'Dirección 11'),
    ('Cliente 12', 'Dirección 12'),
    ('Cliente 13', 'Dirección 13'),
    ('Cliente 14', 'Dirección 14'),
    ('Cliente 15', 'Dirección 15'),
    ('Cliente 16', 'Dirección 16'),
    ('Cliente 17', 'Dirección 17'),
    ('Cliente 18', 'Dirección 18'),
    ('Cliente 19', 'Dirección 19'),
    ('Cliente 20', 'Dirección 20');

CREATE TABLE IF NOT EXISTS productos (
    id_producto INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT,
    precio FLOAT
);

INSERT INTO productos (nombre, precio) VALUES
    ('Producto 1', 10.99),
    ('Producto 2', 20.50),
    ('Producto 3', 30.99),
    ('Producto 4', 40.50),
    ('Producto 5', 50.99),
    ('Producto 6', 60.50),
    ('Producto 7', 70.99),
    ('Producto 8', 80.50),
    ('Producto 9', 90.99),
    ('Producto 10', 100.50),
    ('Producto 11', 110.99),
    ('Producto 12', 120.50),
    ('Producto 13', 130.99),
    ('Producto 14', 140.50),
    ('Producto 15', 150.99),
    ('Producto 16', 160.50),
    ('Producto 17', 170.99),
    ('Producto 18', 180.50),
    ('Producto 19', 190.99),
    ('Producto 20', 200.50);

CREATE TABLE IF NOT EXISTS ordenes (
    id_orden INTEGER PRIMARY KEY AUTOINCREMENT,
    id_cliente INTEGER,
    id_producto INTEGER,
    cantidad INTEGER,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

INSERT INTO ordenes (id_cliente, id_producto, cantidad) VALUES
    (1, 1, 2),
    (2, 2, 1),
    (3, 3, 3),
    (4, 4, 2),
    (5, 5, 1),
    (6, 6, 2),
    (7, 7, 3),
    (8, 8, 2),
    (9, 9, 1),
    (10, 10, 2),
    (11, 11, 3),
    (12, 12, 2),
    (13, 13, 1),
    (14, 14, 2),
    (15, 15, 3),
    (16, 16, 2),
    (17, 17, 1),
    (18, 18, 2),
    (19, 19, 3),
    (20, 20, 2);

-- Creamos una base de datos con el coamndo:
CREATE DATABASE tarea2

-- Accedemos a la base de datos con el coamndo:
USE tarea2


-- Rrealiza las siguientes consultas:

-- Consultas simples:
-- Mostrar todos los clientes.
-- Mostrar todos los productos.
-- Mostrar todas las órdenes.
-- Mostrar los primeros 5 clientes ordenados por nombre.
-- Mostrar los productos con un precio mayor a 50.
-- Mostrar todas las órdenes realizadas por el cliente con ID 1.
-- Mostrar los clientes cuyos nombres comienzan con la letra "M".
-- Mostrar las órdenes que contienen más de 2 productos.
-- Mostrar los productos ordenados por precio de forma descendente.

-- Consultas de ejemplo para practicar joins
-- Seleccionar todos los clientes y sus órdenes, incluso si no tienen órdenes
-- Seleccionar todas las órdenes junto con los productos correspondientes
-- Mostrar el nombre de los clientes que han realizado órdenes de productos que cuestan más de 50
-- Obtener el nombre de los productos que no se han ordenado aún
-- Mostrar el nombre del cliente, el producto y la cantidad para todas las órdenes
-- Obtener el nombre de los productos junto con los nombres de los clientes que han realizado órdenes de esos productos
-- Mostrar todas las órdenes con sus clientes y productos, incluso si no hay órdenes
-- Obtener el nombre de los clientes junto con el número total de órdenes que han realizado
-- Mostrar todas las órdenes junto con el nombre del cliente y el nombre del producto
-- Mostrar todas las órdenes con sus productos y clientes, incluso si no hay información de cliente.
-- Obtener el nombre de los productos junto con el nombre de los clientes que han realizado órdenes de esos productos, incluyendo los productos que no han sido ordenados
-- Mostrar todas las órdenes junto con el nombre del cliente y el nombre del producto, incluyendo las órdenes sin productos
-- Obtener el nombre de los clientes junto con el número total de órdenes que han realizado, incluyendo los clientes que no han realizado órdenes.
-- Mostrar todas las órdenes con sus clientes y productos, incluyendo las órdenes y productos que no tienen información.
