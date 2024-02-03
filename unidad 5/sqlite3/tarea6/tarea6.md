# Tarea 6
## Creación de fichero base-datos-clientes.sql.
Creamos un fichero nano en el que insertamos la información proporcionada debajo con el siguente comando:
```sql
nano base-datos-clientes.sql
```
```sql
-- Crear la tabla de Clientes
CREATE TABLE IF NOT EXISTS Clientes (
    id INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL,
    email TEXT UNIQUE
);

-- Crear la tabla de Productos
CREATE TABLE IF NOT EXISTS Productos (
    id INTEGER PRIMARY KEY,
    nombre TEXT NOT NULL,
    precio REAL
);

-- Crear la tabla de Pedidos
CREATE TABLE IF NOT EXISTS Pedidos (
    id_pedido INTEGER PRIMARY KEY,
    id_cliente INTEGER,
    id_producto INTEGER,
    cantidad INTEGER,
    fecha_pedido DATE,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id),
    FOREIGN KEY (id_producto) REFERENCES Productos(id)
);

INSERT INTO Clientes (nombre, email) VALUES
    ('Juan Pérez', 'juan@example.com'),
    ('María Gómez', 'maria@example.com'),
    ('Carlos López', 'carlos@example.com'),
    ('Ana Rodríguez', 'ana@example.com'),
    ('Luisa Martínez', 'luisa@example.com'),
    ('Pedro Sánchez', 'pedro@example.com'),
    ('Laura García', 'laura@example.com'),
    ('Miguel Martín', 'miguel@example.com'),
    ('Elena González', 'elena@example.com'),
    ('David Torres', 'david@example.com'),
    ('Sofía Ruiz', 'sofia@example.com'),
    ('Javier López', 'javier@example.com'),
    ('Carmen Vargas', 'carmen@example.com'),
    ('Daniel Muñoz', 'daniel@example.com'),
    ('Isabel Serrano', 'isabel@example.com'),
    ('Alejandro Muñoz', 'alejandro@example.com'),
    ('Raquel Herrera', 'raquel@example.com'),
    ('Francisco Mora', 'francisco@example.com'),
    ('Marina Díaz', 'marina@example.com'),
    ('Antonio Jiménez', 'antonio@example.com'),
    ('Beatriz Romero', 'beatriz@example.com'),
    ('Carlos Gómez', 'carlos.gomez@example.com'),
    ('Clara Sánchez', 'clara.sanchez@example.com'),
    ('Andrés Martínez', 'andres@example.com'),
    ('Lucía Díaz', 'lucia@example.com'),
    ('Mario Serrano', 'mario@example.com'),
    ('Eva Torres', 'eva.torres@example.com'),
    ('Roberto Ruiz', 'roberto@example.com'),
    ('Celia García', 'celia@example.com');

INSERT INTO Productos (nombre, precio) VALUES
    ('Laptop', 1200.00),
    ('Smartphone', 699.99),
    ('TV LED', 799.50),
    ('Tablet', 299.99),
    ('Auriculares Bluetooth', 79.99),
    ('Impresora', 199.99),
    ('Cámara Digital', 499.99),
    ('Reproductor de Audio', 149.99),
    ('Altavoces Inalámbricos', 129.99),
    ('Reloj Inteligente', 249.99),
    ('Teclado Inalámbrico', 59.99),
    ('Ratón Óptico', 29.99),
    ('Monitor LED', 349.99),
    ('Mochila para Portátil', 49.99),
    ('Disco Duro Externo', 89.99),
    ('Router Wi-Fi', 69.99),
    ('Lámpara LED', 39.99),
    ('Batería Externa', 19.99),
    ('Estuche para Auriculares', 14.99),
    ('Tarjeta de Memoria', 24.99),
    ('Cargador Inalámbrico', 34.99),
    ('Kit de Limpieza para Computadoras', 9.99),
    ('Funda para Tablet', 19.99),
    ('Soporte para Teléfono', 14.99),
    ('Hub USB', 29.99),
    ('Webcam HD', 59.99),
    ('Funda para Laptop', 29.99),
    ('Adaptador HDMI', 12.99);

INSERT INTO Pedidos (id_cliente, id_producto, cantidad, fecha_pedido) VALUES
    (1, 1, 2, '2024-02-01'),
    (2, 2, 1, '2024-02-02'),
    (3, 3, 3, '2024-02-03'),
    (4, 4, 1, '2024-02-04'),
    (5, 5, 2, '2024-02-05'),
    (6, 6, 1, '2024-02-06'),
    (7, 7, 3, '2024-02-07'),
    (8, 8, 2, '2024-02-08'),
    (9, 9, 1, '2024-02-09'),
    (10, 10, 2, '2024-02-10'),
    (11, 11, 1, '2024-02-11'),
    (12, 12, 3, '2024-02-12'),
    (13, 13, 1, '2024-02-13'),
    (14, 14, 2, '2024-02-14'),
    (15, 15, 1, '2024-02-15'),
    (16, 16, 3, '2024-02-16'),
    (17, 17, 2, '2024-02-17'),
    (18, 18, 1, '2024-02-18'),
    (19, 19, 2, '2024-02-19'),
    (20, 20, 1, '2024-02-20'),
    (21, 21, 3, '2024-02-21'),
    (22, 22, 1, '2024-02-22'),
    (23, 23, 2, '2024-02-23'),
    (24, 24, 1, '2024-02-24'),
    (25, 25, 3, '2024-02-25'),
    (26, 26, 2, '2024-02-26'),
    (27, 27, 1, '2024-02-27'),
    (28, 28, 2, '2024-02-28'),
    (29, 29, 1, '2024-02-29'),
    (30, 30, 3, '2024-03-01');
```
## Lectura del fichero sql.
Mediante el siguiente comando entramos en sqlite:
```sql
sqlite3 tarea6.db 
```
Por medio del comando dado a continuación realizamos la creacion de la tabla y la inserción de la informacion en la base de datos
```sql
.read base-datos-clientes.sql
```

## Tablas creadas
### Tabla de Clientes
| id |     nombre      |           email           |
|----|-----------------|---------------------------|
| 1  | Juan Pérez      | juan@example.com          |
| 2  | María Gómez     | maria@example.com         |
| 3  | Carlos López    | carlos@example.com        |
| 4  | Ana Rodríguez   | ana@example.com           |
| 5  | Luisa Martínez  | luisa@example.com         |
| 6  | Pedro Sánchez   | pedro@example.com         |
| 7  | Laura García    | laura@example.com         |
| 8  | Miguel Martín   | miguel@example.com        |
| 9  | Elena González  | elena@example.com         |
| 10 | David Torres    | david@example.com         |
| 11 | Sofía Ruiz      | sofia@example.com         |
| 12 | Javier López    | javier@example.com        |
| 13 | Carmen Vargas   | carmen@example.com        |
| 14 | Daniel Muñoz    | daniel@example.com        |
| 15 | Isabel Serrano  | isabel@example.com        |
| 16 | Alejandro Muñoz | alejandro@example.com     |
| 17 | Raquel Herrera  | raquel@example.com        |
| 18 | Francisco Mora  | francisco@example.com     |
| 19 | Marina Díaz     | marina@example.com        |
| 20 | Antonio Jiménez | antonio@example.com       |
| 21 | Beatriz Romero  | beatriz@example.com       |
| 22 | Carlos Gómez    | carlos.gomez@example.com  |
| 23 | Clara Sánchez   | clara.sanchez@example.com |
| 24 | Andrés Martínez | andres@example.com        |
| 25 | Lucía Díaz      | lucia@example.com         |
| 26 | Mario Serrano   | mario@example.com         |
| 27 | Eva Torres      | eva.torres@example.com    |
| 28 | Roberto Ruiz    | roberto@example.com       |
| 29 | Celia García    | celia@example.com         |

### Tabla de Productos
| id |              nombre               | precio |
|----|-----------------------------------|--------|
| 1  | Laptop                            | 1200.0 |
| 2  | Smartphone                        | 699.99 |
| 3  | TV LED                            | 799.5  |
| 4  | Tablet                            | 299.99 |
| 5  | Auriculares Bluetooth             | 79.99  |
| 6  | Impresora                         | 199.99 |
| 7  | Cámara Digital                    | 499.99 |
| 8  | Reproductor de Audio              | 149.99 |
| 9  | Altavoces Inalámbricos            | 129.99 |
| 10 | Reloj Inteligente                 | 249.99 |
| 11 | Teclado Inalámbrico               | 59.99  |
| 12 | Ratón Óptico                      | 29.99  |
| 13 | Monitor LED                       | 349.99 |
| 14 | Mochila para Portátil             | 49.99  |
| 15 | Disco Duro Externo                | 89.99  |
| 16 | Router Wi-Fi                      | 69.99  |
| 17 | Lámpara LED                       | 39.99  |
| 18 | Batería Externa                   | 19.99  |
| 19 | Estuche para Auriculares          | 14.99  |
| 20 | Tarjeta de Memoria                | 24.99  |
| 21 | Cargador Inalámbrico              | 34.99  |
| 22 | Kit de Limpieza para Computadoras | 9.99   |
| 23 | Funda para Tablet                 | 19.99  |
| 24 | Soporte para Teléfono             | 14.99  |
| 25 | Hub USB                           | 29.99  |
| 26 | Webcam HD                         | 59.99  |
| 27 | Funda para Laptop                 | 29.99  |
| 28 | Adaptador HDMI                    | 12.99  |

### Tabla de Pedidos
| id_pedido | id_cliente | id_producto | cantidad | fecha_pedido |
|-----------|------------|-------------|----------|--------------|
| 1         | 1          | 1           | 2        | 2024-02-01   |
| 2         | 2          | 2           | 1        | 2024-02-02   |
| 3         | 3          | 3           | 3        | 2024-02-03   |
| 4         | 4          | 4           | 1        | 2024-02-04   |
| 5         | 5          | 5           | 2        | 2024-02-05   |
| 6         | 6          | 6           | 1        | 2024-02-06   |
| 7         | 7          | 7           | 3        | 2024-02-07   |
| 8         | 8          | 8           | 2        | 2024-02-08   |
| 9         | 9          | 9           | 1        | 2024-02-09   |
| 10        | 10         | 10          | 2        | 2024-02-10   |
| 11        | 11         | 11          | 1        | 2024-02-11   |
| 12        | 12         | 12          | 3        | 2024-02-12   |
| 13        | 13         | 13          | 1        | 2024-02-13   |
| 14        | 14         | 14          | 2        | 2024-02-14   |
| 15        | 15         | 15          | 1        | 2024-02-15   |
| 16        | 16         | 16          | 3        | 2024-02-16   |
| 17        | 17         | 17          | 2        | 2024-02-17   |
| 18        | 18         | 18          | 1        | 2024-02-18   |
| 19        | 19         | 19          | 2        | 2024-02-19   |
| 20        | 20         | 20          | 1        | 2024-02-20   |
| 21        | 21         | 21          | 3        | 2024-02-21   |
| 22        | 22         | 22          | 1        | 2024-02-22   |
| 23        | 23         | 23          | 2        | 2024-02-23   |
| 24        | 24         | 24          | 1        | 2024-02-24   |
| 25        | 25         | 25          | 3        | 2024-02-25   |
| 26        | 26         | 26          | 2        | 2024-02-26   |
| 27        | 27         | 27          | 1        | 2024-02-27   |
| 28        | 28         | 28          | 2        | 2024-02-28   |
| 29        | 29         | 29          | 1        | 2024-02-29   |
| 30        | 30         | 30          | 3        | 2024-03-01   |


## Realización de consultas
### Obtener todos los clientes.
```sql
select id, nombre from clientes;
```
| id |     nombre      |
|----|-----------------|
| 1  | Juan Pérez      |
| 2  | María Gómez     |
| 3  | Carlos López    |
| 4  | Ana Rodríguez   |
| 5  | Luisa Martínez  |
| 6  | Pedro Sánchez   |
| 7  | Laura García    |
| 8  | Miguel Martín   |
| 9  | Elena González  |
| 10 | David Torres    |
| 11 | Sofía Ruiz      |
| 12 | Javier López    |
| 13 | Carmen Vargas   |
| 14 | Daniel Muñoz    |
| 15 | Isabel Serrano  |
| 16 | Alejandro Muñoz |
| 17 | Raquel Herrera  |
| 18 | Francisco Mora  |
| 19 | Marina Díaz     |
| 20 | Antonio Jiménez |
| 21 | Beatriz Romero  |
| 22 | Carlos Gómez    |
| 23 | Clara Sánchez   |
| 24 | Andrés Martínez |
| 25 | Lucía Díaz      |
| 26 | Mario Serrano   |
| 27 | Eva Torres      |
| 28 | Roberto Ruiz    |
| 29 | Celia García    |

### Obtener la cantidad total de productos en todos los pedidos
```sql
select sum(cantidad) as productos_total from pedidos;
```
| productos_total |
|-----------------|
| 54              |

### Obtener el precio promedio de los productos:
```sql
select round(avg(precio), 2) as precio_promedio from productos;
```
| precio_promedio |
|-----------------|
| 188.29          |

### Obtener los clientes que tienen un email válido (contiene '@'):
```sql
select * from clientes where email regexp '@';
```
| id |     nombre      |           email           |
|----|-----------------|---------------------------|
| 1  | Juan Pérez      | juan@example.com          |
| 2  | María Gómez     | maria@example.com         |
| 3  | Carlos López    | carlos@example.com        |
| 4  | Ana Rodríguez   | ana@example.com           |
| 5  | Luisa Martínez  | luisa@example.com         |
| 6  | Pedro Sánchez   | pedro@example.com         |
| 7  | Laura García    | laura@example.com         |
| 8  | Miguel Martín   | miguel@example.com        |
| 9  | Elena González  | elena@example.com         |
| 10 | David Torres    | david@example.com         |
| 11 | Sofía Ruiz      | sofia@example.com         |
| 12 | Javier López    | javier@example.com        |
| 13 | Carmen Vargas   | carmen@example.com        |
| 14 | Daniel Muñoz    | daniel@example.com        |
| 15 | Isabel Serrano  | isabel@example.com        |
| 16 | Alejandro Muñoz | alejandro@example.com     |
| 17 | Raquel Herrera  | raquel@example.com        |
| 18 | Francisco Mora  | francisco@example.com     |
| 19 | Marina Díaz     | marina@example.com        |
| 20 | Antonio Jiménez | antonio@example.com       |
| 21 | Beatriz Romero  | beatriz@example.com       |
| 22 | Carlos Gómez    | carlos.gomez@example.com  |
| 23 | Clara Sánchez   | clara.sanchez@example.com |
| 24 | Andrés Martínez | andres@example.com        |
| 25 | Lucía Díaz      | lucia@example.com         |
| 26 | Mario Serrano   | mario@example.com         |
| 27 | Eva Torres      | eva.torres@example.com    |
| 28 | Roberto Ruiz    | roberto@example.com       |
| 29 | Celia García    | celia@example.com         |

### Obtener el producto más caro.
```sql
select id, nombre, max(precio) as max_precio from productos;
```
| id | nombre | max_precio |
|----|--------|------------|
| 1  | Laptop | 1200.0     |

### Obtener los pedidos realizados en febrero de 2024.
```sql
select * from pedidos where fecha_pedido regexp '2024-02-';
```
| id_pedido | id_cliente | id_producto | cantidad | fecha_pedido |
|-----------|------------|-------------|----------|--------------|
| 1         | 1          | 1           | 2        | 2024-02-01   |
| 2         | 2          | 2           | 1        | 2024-02-02   |
| 3         | 3          | 3           | 3        | 2024-02-03   |
| 4         | 4          | 4           | 1        | 2024-02-04   |
| 5         | 5          | 5           | 2        | 2024-02-05   |
| 6         | 6          | 6           | 1        | 2024-02-06   |
| 7         | 7          | 7           | 3        | 2024-02-07   |
| 8         | 8          | 8           | 2        | 2024-02-08   |
| 9         | 9          | 9           | 1        | 2024-02-09   |
| 10        | 10         | 10          | 2        | 2024-02-10   |
| 11        | 11         | 11          | 1        | 2024-02-11   |
| 12        | 12         | 12          | 3        | 2024-02-12   |
| 13        | 13         | 13          | 1        | 2024-02-13   |
| 14        | 14         | 14          | 2        | 2024-02-14   |
| 15        | 15         | 15          | 1        | 2024-02-15   |
| 16        | 16         | 16          | 3        | 2024-02-16   |
| 17        | 17         | 17          | 2        | 2024-02-17   |
| 18        | 18         | 18          | 1        | 2024-02-18   |
| 19        | 19         | 19          | 2        | 2024-02-19   |
| 20        | 20         | 20          | 1        | 2024-02-20   |
| 21        | 21         | 21          | 3        | 2024-02-21   |
| 22        | 22         | 22          | 1        | 2024-02-22   |
| 23        | 23         | 23          | 2        | 2024-02-23   |
| 24        | 24         | 24          | 1        | 2024-02-24   |
| 25        | 25         | 25          | 3        | 2024-02-25   |
| 26        | 26         | 26          | 2        | 2024-02-26   |
| 27        | 27         | 27          | 1        | 2024-02-27   |
| 28        | 28         | 28          | 2        | 2024-02-28   |
| 29        | 29         | 29          | 1        | 2024-02-29   |

### Obtener la cantidad total de productos en todos los pedidos por producto.
```sql
select pe.id_producto, sum(pe.cantidad) as pedido_total, po.nombre from productos as po, pedidos as pe where pe.id_producto=po.id group by pe.id_producto;
```
| id_producto | pedido_total |              nombre               |
|-------------|--------------|-----------------------------------|
| 1           | 2            | Laptop                            |
| 2           | 1            | Smartphone                        |
| 3           | 3            | TV LED                            |
| 4           | 1            | Tablet                            |
| 5           | 2            | Auriculares Bluetooth             |
| 6           | 1            | Impresora                         |
| 7           | 3            | Cámara Digital                    |
| 8           | 2            | Reproductor de Audio              |
| 9           | 1            | Altavoces Inalámbricos            |
| 10          | 2            | Reloj Inteligente                 |
| 11          | 1            | Teclado Inalámbrico               |
| 12          | 3            | Ratón Óptico                      |
| 13          | 1            | Monitor LED                       |
| 14          | 2            | Mochila para Portátil             |
| 15          | 1            | Disco Duro Externo                |
| 16          | 3            | Router Wi-Fi                      |
| 17          | 2            | Lámpara LED                       |
| 18          | 1            | Batería Externa                   |
| 19          | 2            | Estuche para Auriculares          |
| 20          | 1            | Tarjeta de Memoria                |
| 21          | 3            | Cargador Inalámbrico              |
| 22          | 1            | Kit de Limpieza para Computadoras |
| 23          | 2            | Funda para Tablet                 |
| 24          | 1            | Soporte para Teléfono             |
| 25          | 3            | Hub USB                           |
| 26          | 2            | Webcam HD                         |
| 27          | 1            | Funda para Laptop                 |
| 28          | 2            | Adaptador HDMI                    |

### Obtener los clientes que han realizado más de un pedido.
```sql
select * from clientes where id in (select id_cliente from pedidos group by id_cliente having count(id_pedido)>1);
```
-- La consulta se devuelve vacía

### Obtener los productos que tienen un precio registrado.
```sql
select * from productos where precio is not null;
```
| id |              nombre               | precio |
|----|-----------------------------------|--------|
| 1  | Laptop                            | 1200.0 |
| 2  | Smartphone                        | 699.99 |
| 3  | TV LED                            | 799.5  |
| 4  | Tablet                            | 299.99 |
| 5  | Auriculares Bluetooth             | 79.99  |
| 6  | Impresora                         | 199.99 |
| 7  | Cámara Digital                    | 499.99 |
| 8  | Reproductor de Audio              | 149.99 |
| 9  | Altavoces Inalámbricos            | 129.99 |
| 10 | Reloj Inteligente                 | 249.99 |
| 11 | Teclado Inalámbrico               | 59.99  |
| 12 | Ratón Óptico                      | 29.99  |
| 13 | Monitor LED                       | 349.99 |
| 14 | Mochila para Portátil             | 49.99  |
| 15 | Disco Duro Externo                | 89.99  |
| 16 | Router Wi-Fi                      | 69.99  |
| 17 | Lámpara LED                       | 39.99  |
| 18 | Batería Externa                   | 19.99  |
| 19 | Estuche para Auriculares          | 14.99  |
| 20 | Tarjeta de Memoria                | 24.99  |
| 21 | Cargador Inalámbrico              | 34.99  |
| 22 | Kit de Limpieza para Computadoras | 9.99   |
| 23 | Funda para Tablet                 | 19.99  |
| 24 | Soporte para Teléfono             | 14.99  |
| 25 | Hub USB                           | 29.99  |
| 26 | Webcam HD                         | 59.99  |
| 27 | Funda para Laptop                 | 29.99  |
| 28 | Adaptador HDMI                    | 12.99  |

### Obtener la fecha del primer pedido realizado:
```sql
select * from pedidos order by fecha_pedido limit 1;
```
| id_pedido | id_cliente | id_producto | cantidad | fecha_pedido |
|-----------|------------|-------------|----------|--------------|
| 1         | 1          | 1           | 2        | 2024-02-01   |

### Obtener los productos cuyos nombres comienzan con 'A' o 'B':
```sql
select * from productos where nombre regexp '^[AB]';
```
| id |         nombre         | precio |
|----|------------------------|--------|
| 5  | Auriculares Bluetooth  | 79.99  |
| 9  | Altavoces Inalámbricos | 129.99 |
| 18 | Batería Externa        | 19.99  |
| 28 | Adaptador HDMI         | 12.99  |

### Obtener la cantidad total de productos en todos los pedidos por cliente ordenado por cliente.
```sql
select pe.id_cliente, c.nombre, sum(pe.cantidad) as total_productos from pedidos as pe, clientes as c where pe.id_cliente=c.id group by pe.id_cliente;
```
| id_cliente |     nombre      | total_productos |
|------------|-----------------|-----------------|
| 1          | Juan Pérez      | 2               |
| 2          | María Gómez     | 1               |
| 3          | Carlos López    | 3               |
| 4          | Ana Rodríguez   | 1               |
| 5          | Luisa Martínez  | 2               |
| 6          | Pedro Sánchez   | 1               |
| 7          | Laura García    | 3               |
| 8          | Miguel Martín   | 2               |
| 9          | Elena González  | 1               |
| 10         | David Torres    | 2               |
| 11         | Sofía Ruiz      | 1               |
| 12         | Javier López    | 3               |
| 13         | Carmen Vargas   | 1               |
| 14         | Daniel Muñoz    | 2               |
| 15         | Isabel Serrano  | 1               |
| 16         | Alejandro Muñoz | 3               |
| 17         | Raquel Herrera  | 2               |
| 18         | Francisco Mora  | 1               |
| 19         | Marina Díaz     | 2               |
| 20         | Antonio Jiménez | 1               |
| 21         | Beatriz Romero  | 3               |
| 22         | Carlos Gómez    | 1               |
| 23         | Clara Sánchez   | 2               |
| 24         | Andrés Martínez | 1               |
| 25         | Lucía Díaz      | 3               |
| 26         | Mario Serrano   | 2               |
| 27         | Eva Torres      | 1               |
| 28         | Roberto Ruiz    | 2               |
| 29         | Celia García    | 1               |

### Obtener los clientes que han realizado más de un pedido en febrero de 2024.
```sql
select pe.id_cliente, c.nombre, pe.fecha_pedido from pedidos as pe, clientes as c where pe.id_cliente=c.id and pe.fecha_pedido regexp '2024-02' group by c.id having count(pe.id_cliente)>1;
```
-- La consulta se devuelve vacía

### Obtener los productos con precio entre 100 y 500.
```sql
select * from productos where precio between 100 and 500;
```
| id |         nombre         | precio |
|----|------------------------|--------|
| 4  | Tablet                 | 299.99 |
| 6  | Impresora              | 199.99 |
| 7  | Cámara Digital         | 499.99 |
| 8  | Reproductor de Audio   | 149.99 |
| 9  | Altavoces Inalámbricos | 129.99 |
| 10 | Reloj Inteligente      | 249.99 |
| 13 | Monitor LED            | 349.99 |

### Obtener la cantidad total de productos en todos los pedidos por cliente ordenado por cantidad descendente.
```sql
select c.id, c.nombre, sum(pe.cantidad) as cantidad_total from pedidos as pe, clientes as c where c.id=pe.id_cliente group by pe.id_cliente order by pe.cantidad desc;
```
| id |     nombre      | cantidad_total |
|----|-----------------|----------------|
| 25 | Lucía Díaz      | 3              |
| 21 | Beatriz Romero  | 3              |
| 16 | Alejandro Muñoz | 3              |
| 12 | Javier López    | 3              |
| 7  | Laura García    | 3              |
| 3  | Carlos López    | 3              |
| 28 | Roberto Ruiz    | 2              |
| 26 | Mario Serrano   | 2              |
| 23 | Clara Sánchez   | 2              |
| 19 | Marina Díaz     | 2              |
| 17 | Raquel Herrera  | 2              |
| 14 | Daniel Muñoz    | 2              |
| 10 | David Torres    | 2              |
| 8  | Miguel Martín   | 2              |
| 5  | Luisa Martínez  | 2              |
| 1  | Juan Pérez      | 2              |
| 29 | Celia García    | 1              |
| 27 | Eva Torres      | 1              |
| 24 | Andrés Martínez | 1              |
| 22 | Carlos Gómez    | 1              |
| 20 | Antonio Jiménez | 1              |
| 18 | Francisco Mora  | 1              |
| 15 | Isabel Serrano  | 1              |
| 13 | Carmen Vargas   | 1              |
| 11 | Sofía Ruiz      | 1              |
| 9  | Elena González  | 1              |
| 6  | Pedro Sánchez   | 1              |
| 4  | Ana Rodríguez   | 1              |
| 2  | María Gómez     | 1              |

### Obtener los clientes que tienen una 'a' en cualquier posición de su nombre.
```sql
select * from clientes where nombre regexp '[aA]';
```
| id |     nombre      |           email           |
|----|-----------------|---------------------------|
| 1  | Juan Pérez      | juan@example.com          |
| 2  | María Gómez     | maria@example.com         |
| 3  | Carlos López    | carlos@example.com        |
| 4  | Ana Rodríguez   | ana@example.com           |
| 5  | Luisa Martínez  | luisa@example.com         |
| 7  | Laura García    | laura@example.com         |
| 8  | Miguel Martín   | miguel@example.com        |
| 9  | Elena González  | elena@example.com         |
| 10 | David Torres    | david@example.com         |
| 11 | Sofía Ruiz      | sofia@example.com         |
| 12 | Javier López    | javier@example.com        |
| 13 | Carmen Vargas   | carmen@example.com        |
| 14 | Daniel Muñoz    | daniel@example.com        |
| 15 | Isabel Serrano  | isabel@example.com        |
| 16 | Alejandro Muñoz | alejandro@example.com     |
| 17 | Raquel Herrera  | raquel@example.com        |
| 18 | Francisco Mora  | francisco@example.com     |
| 19 | Marina Díaz     | marina@example.com        |
| 20 | Antonio Jiménez | antonio@example.com       |
| 21 | Beatriz Romero  | beatriz@example.com       |
| 22 | Carlos Gómez    | carlos.gomez@example.com  |
| 23 | Clara Sánchez   | clara.sanchez@example.com |
| 24 | Andrés Martínez | andres@example.com        |
| 25 | Lucía Díaz      | lucia@example.com         |
| 26 | Mario Serrano   | mario@example.com         |
| 27 | Eva Torres      | eva.torres@example.com    |
| 29 | Celia García    | celia@example.com         |

### Obtener el precio máximo de los productos.
```sql
```

### Obtener los pedidos realizados por el cliente con ID 1 en febrero de 2024.
```sql
```

### Obtener la cantidad total de productos en todos los pedidos por producto ordenado por total de productos descendente.
```sql
```

### Obtener los productos que no tienen un precio registrado.
```sql
```

### Obtener la fecha del último pedido realizado.
```sql
```

### Obtener los clientes cuyo nombre tiene al menos 5 caracteres.
```sql
```

### Obtener los productos que tienen la letra 'o' en cualquier posición del nombre.
```sql
```

### Obtener la cantidad total de productos en todos los pedidos por cliente ordenado por cliente.
```sql
```

### Obtener los clientes cuyos nombres no contienen la letra 'i':
```sql
```

### Obtener los pedidos realizados por el cliente con ID 2 en febrero de 2024.
```sql
```

### Obtener el precio mínimo de los productos.
```sql
```

### Obtener los clientes que han realizado al menos un pedido en febrero de 2024.
```sql
```

### Obtener la fecha del último pedido realizado por el cliente con ID 3.
```sql
```

### Obtener los productos que tienen una 'a' al final del nombre.
```sql
```

### Obtener los clientes cuyos nombres tienen al menos 4 vocales (mayúsculas|minúsculas).
```sql
```

### Obtener los productos cuyo precio tenga al menos 4 números sin contrar los decimales.
```sql
```

### Obtener los clientes cuyos nombres tienen al menos una 'a' seguida de una 'e'.
```sql
```

### Obtener los productos cuyos nombres terminan con una consonante.
```sql
```

### Obtener los productos cuyos nombres empiezan con una vocal.
```sql
```