-- TAREA 3
-- TRABAJANDO CON JOIN'S
-- Dada la siguiente BBDD:
-- Completa aquello que falte
CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nombre_cliente VARCHAR(100),
    ciudad_cliente VARCHAR(100)
);

CREATE TABLE ordenes (
    id_orden INT PRIMARY KEY,
    id_cliente INT,
    fecha_orden DATE,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE productos (
    id_producto INT PRIMARY KEY,
    nombre_producto VARCHAR(100),
    precio_producto DECIMAL(10, 2)
);

CREATE TABLE detalles_ordenes (
    id_detalle INT PRIMARY KEY,
    id_orden INT,
    id_producto INT,
    cantidad INT,
    FOREIGN KEY (id_orden) REFERENCES ordenes(id_orden),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

INSERT INTO clientes (id_cliente, nombre_cliente, ciudad_cliente) VALUES
(1, 'Juan', 'Ciudad A'),
(2, 'María', 'Ciudad B'),
(3, 'Pedro', 'Ciudad C');

INSERT INTO ordenes (id_orden, id_cliente, fecha_orden) VALUES
(1, 1, '2024-03-01'),
(2, 2, '2024-03-02'),
(3, 3, '2024-03-03');

INSERT INTO productos (id_producto, nombre_producto, precio_producto) VALUES
(1, 'Producto A', 50.00),
(2, 'Producto B', 75.00),
(3, 'Producto C', 100.00);

INSERT INTO detalles_ordenes (id_detalle, id_orden, id_producto, cantidad) VALUES
(1, 1, 1, 2),
(2, 2, 2, 1),
(3, 3, 3, 3);

-- Creamos una base de datos con el coamndo:
CREATE DATABASE tarea3

-- Accedemos a la base de datos con el coamndo:
USE tarea3


-- Realiza las siguientes consultas:
-- 1. Mostrar todos los clientes.
-- 2. Mostrar todas las órdenes.
-- 3. Mostrar todos los productos.
-- 4. Mostrar todos los detalles de las órdenes.
-- 5. Mostrar los primeros 5 clientes ordenados por nombre.
-- 6. Mostrar los productos con un precio mayor a 50.
-- 7. Mostrar todas las órdenes realizadas por el cliente con ID 1.
-- 8. Mostrar los clientes cuyos nombres comienzan con la letra "A".
-- 9. Mostrar las órdenes que contienen más de 2 productos.
-- 10. Mostrar los productos ordenados por precio de forma descendente.
-- 11. Seleccionar todos los clientes y sus órdenes, incluso si no tienen órdenes.
-- 12. Seleccionar todas las órdenes junto con los productos correspondientes.
-- 13. Mostrar el nombre de los clientes que han realizado órdenes de productos que cuestan más de 50.
-- 14. Obtener el nombre de los productos que no se han ordenado aún.
-- 15. Mostrar el nombre del cliente, el producto y la cantidad para todas las órdenes.
-- 16. Obtener el nombre de los productos junto con los nombres de los clientes que han realizado órdenes de esos productos.
-- 17. Mostrar todas las órdenes con sus clientes y productos, incluso si no hay órdenes.
-- 18. Obtener el nombre de los clientes junto con el número total de órdenes que han realizado.
-- 19. Mostrar todas las órdenes junto con el nombre del cliente y el nombre del producto.
-- 20. Mostrar todas las órdenes con sus productos y clientes, incluso si no hay información de cliente.
-- 21. Obtener el nombre de los productos junto con los nombres de los clientes que han realizado órdenes de esos productos, incluyendo los productos que no han sido ordenados.
-- 22. Mostrar todas las órdenes junto con el nombre del cliente y el nombre del producto, incluyendo las órdenes sin productos.
-- 23. Obtener el nombre de los clientes junto con el número total de órdenes que han realizado, incluyendo los clientes que no han realizado órdenes.
-- 24. Mostrar todas las órdenes con sus clientes y productos, incluyendo las órdenes y productos que no tienen información.
-- 25. Realizar un inner join entre clientes y órdenes.
-- 26. Realizar un left join entre órdenes y detalles de órdenes.
-- 27. Realizar un right join entre productos y detalles de órdenes.
-- 28. Realizar un full join entre clientes y órdenes.
-- 29. Realizar un full join entre órdenes y detalles de órdenes.
-- 30. Realizar un full join entre productos y detalles de órdenes.
