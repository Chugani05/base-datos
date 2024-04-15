-- TAREA 5
-- TRABAJO CON LA BBDD JARDINERIA
-- El diagrama ER de esta BBDD es el siguiente:
!

-- Se pide:
-- Carga de datos
Relizamos la carga de datos creando un archivo sql con los datos de la base de datos. Ejecuta la linea `source jardineria.sql` en la terminal de MySql, que nos proporciona una base de datos llamada jardineria que contiene las siguientes tablas:
show databases;
/**
+--------------------+
| Database           |
+--------------------+
| Base_Indices       |
| information_schema |
| jardineria         |
| mysql              |
| performance_schema |
| sakila             |
| sys                |
| tarea1             |
| tarea2             |
| tarea3             |
| tarea71            |
| tarea72            |
| tarea7_4           |
+--------------------+
**/
show tables;
/**
+----------------------+
| Tables_in_jardineria |
+----------------------+
| cliente              |
| detalle_pedido       |
| empleado             |
| gama_producto        |
| oficina              |
| pago                 |
| pedido               |
| producto             |
+----------------------+
**/

-- Índices
-- 1. Consulte cuáles son los índices que hay en la tabla producto utilizando las instrucciones SQL que nos permiten obtener esta información de la tabla.
show index from producto;
/**
+----------+------------+----------+--------------+-----------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table    | Non_unique | Key_name | Seq_in_index | Column_name     | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+----------+------------+----------+--------------+-----------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| producto |          0 | PRIMARY  |            1 | codigo_producto | A         |         276 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| producto |          1 | gama     |            1 | gama            | A         |           4 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
+----------+------------+----------+--------------+-----------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
**/

-- 2. Haga uso de EXPLAIN para obtener información sobre cómo se están realizando las consultas y diga cuál de las dos consultas realizará menos comparaciones para encontrar el producto que estamos buscando. ¿Cuántas comparaciones se realizan en cada caso? ¿Por qué?.
  ```sql
  SELECT *
  FROM producto
  WHERE codigo_producto = 'OR-114';
  ````

  ```sql
  SELECT *
  FROM producto
  WHERE nombre = 'Evonimus Pulchellus';
  ```
-- Razona la respuesta, y analiza las diferencias.

explain select * from producto where codigo_producto = 'OR-114';
/**
+----+-------------+----------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
| id | select_type | table    | partitions | type  | possible_keys | key     | key_len | ref   | rows | filtered | Extra |
+----+-------------+----------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
|  1 | SIMPLE      | producto | NULL       | const | PRIMARY       | PRIMARY | 62      | const |    1 |   100.00 | NULL  |
+----+-------------+----------+------------+-------+---------------+---------+---------+-------+------+----------+-------+
**/
explain select * from producto where nombre = 'Evonimus Pulchellus';
/**
+----+-------------+----------+------------+------+---------------+------+---------+------+------+----------+-------------+
| id | select_type | table    | partitions | type | possible_keys | key  | key_len | ref  | rows | filtered | Extra       |
+----+-------------+----------+------------+------+---------------+------+---------+------+------+----------+-------------+
|  1 | SIMPLE      | producto | NULL       | ALL  | NULL          | NULL | NULL    | NULL |  276 |    10.00 | Using where |
+----+-------------+----------+------------+------+---------------+------+---------+------+------+----------+-------------+
**/

Según los resultados,


-- 3. Suponga que estamos trabajando con la base de datos jardineria y queremos saber optimizar las siguientes consultas. ¿Cuál de las dos sería más eficiente?. Se recomienda hacer uso de EXPLAIN para obtener información sobre cómo se están realizando las consultas.
  SELECT AVG(total)
  FROM pago
  WHERE YEAR(fecha_pago) = 2008;`

  SELECT AVG(total)
  FROM pago
  WHERE fecha_pago >= '2008-01-01' AND fecha_pago <= '2008-12-31';

-- 4. Optimiza la siguiente consulta creando índices cuando sea necesario. Se recomienda hacer uso de EXPLAIN para obtener información sobre cómo se están realizando las consultas.
  SELECT *
  FROM cliente INNER JOIN pedido
  ON cliente.codigo_cliente = pedido.codigo_cliente
  WHERE cliente.nombre_cliente LIKE 'A%';

-- 5. ¿Por qué no es posible optimizar el tiempo de ejecución de las siguientes consultas, incluso haciendo uso de índices?
  SELECT *
  FROM cliente INNER JOIN pedido
  ON cliente.codigo_cliente = pedido.codigo_cliente
  WHERE cliente.nombre_cliente LIKE '%A%';

  SELECT *
  FROM cliente INNER JOIN pedido
  ON cliente.codigo_cliente = pedido.codigo_cliente
  WHERE cliente.nombre_cliente LIKE '%A';

-- 6. Crea un índice de tipo FULLTEXT sobre las columnas nombre y descripcion de la tabla producto.
create fulltext index idx_nombre_descripcion on producto(nombre, descripcion);
/**
+----------+------------+------------------------+--------------+-----------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table    | Non_unique | Key_name               | Seq_in_index | Column_name     | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+----------+------------+------------------------+--------------+-----------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| producto |          0 | PRIMARY                |            1 | codigo_producto | A         |         276 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| producto |          1 | gama                   |            1 | gama            | A         |           4 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| producto |          1 | idx_nombre_descripcion |            1 | nombre          | NULL      |         276 |     NULL |   NULL |      | FULLTEXT   |         |               | YES     | NULL       |
| producto |          1 | idx_nombre_descripcion |            2 | descripcion     | NULL      |         276 |     NULL |   NULL | YES  | FULLTEXT   |         |               | YES     | NULL       |
+----------+------------+------------------------+--------------+-----------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
**/

-- 7. Una vez creado el índice del ejercicio anterior realiza las siguientes consultas haciendo uso de la función MATCH, para buscar todos los productos que:
  -- 1. Contienen la palabra planta en el nombre o en la descripción. - Realice una consulta para cada uno de los modos de búsqueda full-text que existen en MySQL (IN NATURAL LANGUAGE MODE, IN BOOLEAN MODE y WITH QUERY EXPANSION) y compare los resultados que ha obtenido en cada caso.
  -- 2. Contienen la palabra planta seguida de cualquier carácter o conjunto de caracteres, en el nombre o en la descripción.
  -- 3. Empiezan con la palabra planta en el nombre o en la descripción.
  -- 4. Contienen la palabra tronco o la palabra árbol en el nombre o en la descripción.
  -- 5. Contienen la palabra tronco y la palabra árbol en el nombre o en la descripción.
  -- 6. Contienen la palabra tronco pero no contienen la palabra árbol en el nombre o en la descripción.
  -- 7. Contiene la frase proviene de las costas en el nombre o en la descripción.
  -- 8. Crea un índice de tipo INDEX compuesto por las columnas apellido_contacto y nombre_contacto de la tabla cliente.
  -- 9. Una vez creado el índice del ejercicio anterior realice las siguientes consultas haciendo uso de EXPLAIN:
    -- 1. Busca el cliente Javier Villar. ¿Cuántas filas se han examinado hasta encontrar el resultado?
    -- 2. Busca el cliente anterior utilizando solamente el apellido Villar.
    -- 3. ¿Cuántas filas se han examinado hasta encontrar el resultado?
    -- 4. Busca el cliente anterior utilizando solamente el nombre Javier. ¿Cuántas filas se han examinado hasta encontrar el resultado? ¿Qué ha ocurrido en este caso?
  -- 10. Calcula cuál podría ser un buen valor para crear un índice sobre un prefijo de la columna nombre_cliente de la tabla cliente. Tenga en cuenta que un buen valor será aquel que nos permita utilizar el menor número de caracteres para diferenciar todos los valores que existen en la columna sobre la que estamos creando el índice.
    -- 1. En primer lugar calculamos cuántos valores distintos existen en la columna nombre_cliente. Necesitarás utilizar la función COUNT y DISTINCT.
    -- 2. Haciendo uso de la función LEFT ve calculando el número de caracteres que necesitas utilizar como prefijo para diferenciar todos los valores de la columna. Necesitarás la función COUNT, DISTINCT y LEFT.
    -- 3. Una vez que hayas encontrado el valor adecuado para el prefijo, crea el índice sobre la columna nombre_cliente de la tabla cliente.
    -- 4. Ejecuta algunas consultas de prueba sobre el índice que acabas de crear.

-- Vistas
-- 1. Escriba una vista que se llame listado_pagos_clientes que muestre un listado donde aparezcan todos los clientes y los pagos que ha realizado cada uno de ellos. La vista deberá tener las siguientes columnas: nombre y apellidos del cliente concatenados, teléfono, ciudad, pais, fecha_pago, total del pago, id de la transacción
create view listado_pagos_clientes as select concat_ws(' ', c.nombre_contacto, c.apellido_contacto) as nombre_cliente, c.telefono, c.ciudad, c.pais, p.fecha_pago, p.total, p.id_transaccion from cliente as c join pago as p on c.codigo_cliente = p.codigo_cliente; 
/**
**/
-- 2. Escriba una vista que se llame listado_pedidos_clientes que muestre un listado donde aparezcan todos los clientes y los pedidos que ha realizado cada uno de ellos. La vista deberá tener las siguientes columnas: código del cliente, nombre y apellidos del cliente concatendados, teléfono, ciudad, pais, código del pedido, fecha del pedido, fecha esperada, fecha de entrega y la cantidad total del pedido, que será la suma del producto de todas las cantidades por el precio de cada unidad, que aparecen en cada línea de pedido.
create view listado_pedidos_clientes as select c.codigo_cliente, concat_ws(' ', c.nombre_contacto, c.apellido_contacto) as nombre_cliente, c.telefono, c.ciudad, c.pais, p.codigo_pedido, p.fecha_pedido, p.fecha_esperada, p.fecha_entrega, d.cantidad * d.precio_unidad as total_pedido from cliente as c join pedido as p on c.codigo_cliente = p.codigo_cliente join detalle_pedido as d on p.codigo_pedido = d.codigo_pedido;
/**
**/
-- 3. Utilice las vistas que ha creado en los pasos anteriores para devolver un listado de los clientes de la ciudad de Madrid que han realizado pagos.
select * from listado_pagos_clientes where ciudad = 'Madrid';
/**
**/
-- 4. Utilice las vistas que ha creado en los pasos anteriores para devolver un listado de los clientes que todavía no han recibido su pedido.
select * from listado_pedidos_clientes where fecha_entrega is null;
/**
**/
-- 5. Utilice las vistas que ha creado en los pasos anteriores para calcular el número de pedidos que se ha realizado cada uno de los clientes.
select codigo_cliente, count(codigo_pedido) as numero_pedidos from listado_pedidos_clientes group by codigo_cliente;
/**
**/
-- 6. Utilice las vistas que ha creado en los pasos anteriores para calcular el valor del pedido máximo y mínimo que ha realizado cada cliente.
select codigo_cliente, max(total_pedido) as pedido_max, min(total_pedido) as pedido_min from listado_pedidos_clientes group by codigo_cliente;
/**
**/
-- 7. Modifique el nombre de las vista listado_pagos_clientes y asígnele el nombre listado_de_pagos. Una vez que haya modificado el nombre de la vista ejecute una consulta utilizando el nuevo nombre de la vista para comprobar que sigue funcionando correctamente.
rename table listado_pagos_clientes to listado_de_pagos;
/**
**/
-- 8. Elimine las vistas que ha creado en los pasos anteriores.
drop view if exists listado_de_pagos;
drop view if exists listado_pedidos_clientes;
/**
**/
