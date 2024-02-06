# Tarea 7
## Creación de fichero base-datos-clientes.sql.
Creamos un fichero nano en el que insertamos la información proporcionada debajo con el siguente comando:
```sql
nano base-datos-clientes.sql
```
```sql
-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS concesionario;

-- Usar la base de datos
USE concesionario;

CREATE TABLE IF NOT EXISTS clientes (
    id_cliente INTEGER PRIMARY KEY,
    nombre TEXT,
    edad INTEGER,
    direccion TEXT
);

CREATE TABLE IF NOT EXISTS coches (
    id_coche INTEGER PRIMARY KEY,
    modelo TEXT,
    marca TEXT,
    año INTEGER,
    precio REAL
);

CREATE TABLE IF NOT EXISTS ventas (
    id_venta INTEGER PRIMARY KEY,
    id_cliente INTEGER,
    id_coche INTEGER,
    fecha_venta DATE,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_coche) REFERENCES coches(id_coche)
);

INSERT INTO clientes (nombre, edad, direccion) VALUES
    ('Juan Pérez', 30, 'Calle A #123'),
    ('María Gómez', 25, 'Avenida B #456'),
    ('Carlos López', 35, 'Calle C #789'),
    ('Ana Martínez', 28, 'Avenida D #101'),
    ('Pedro Rodríguez', 40, 'Calle E #234'),
    ('Laura Sánchez', 32, 'Avenida F #567'),
    ('Miguel González', 27, 'Calle G #890'),
    ('Isabel Díaz', 38, 'Avenida H #111'),
    ('Francisco Ruiz', 33, 'Calle I #222'),
    ('Elena Torres', 29, 'Avenida J #333');

INSERT INTO coches (modelo, marca, año, precio) VALUES
    ('Sedán 2022', 'Toyota', 2022, 25000.00),
    ('Hatchback 2021', 'Honda', 2021, 22000.00),
    ('SUV 2023', 'Ford', 2023, 30000.00),
    ('Coupé 2022', 'Chevrolet', 2022, 28000.00),
    ('Camioneta 2023', 'Nissan', 2023, 32000.00),
    ('Compacto 2021', 'Volkswagen', 2021, 20000.00),
    ('Híbrido 2022', 'Hyundai', 2022, 27000.00),
    ('Deportivo 2023', 'Mazda', 2023, 35000.00),
    ('Pickup 2022', 'Ram', 2022, 31000.00),
    ('Eléctrico 2021', 'Tesla', 2021, 40000.00);

INSERT INTO ventas (id_cliente, id_coche, fecha_venta) VALUES
    (1, 1, '2023-01-15'),
    (2, 2, '2023-02-20'),
    (3, 3, '2023-03-25'),
    (4, 4, '2023-04-10'),
    (5, 5, '2023-05-05'),
    (6, 6, '2023-06-15'),
    (7, 7, '2023-07-20'),
    (8, 8, '2023-08-25'),
    (10, 10, '2023-10-05');
```

## Lectura del fichero sql.
Mediante el siguiente comando entramos en sqlite:
```sql
sqlite3 tarea7.db 
```
Por medio del comando dado a continuación realizamos la creacion de la tabla y la inserción de la informacion en la base de datos
```sql
.read base-datos-clientes.sql
```

## Realización de consultas
### Listar los coches vendidos con sus modelos y precios, junto con los nombres de los clientes que los compraron.
-- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. ¿Qué es lo que no me han pedido?
```sql
select co.modelo, co.precio, cl.nombre from coches as co, clientes as cl, ventas as v where cl.id_cliente=v.id_cliente and co.id_coche=v.id_coche;
```
|     modelo     | precio  |     nombre      |
|----------------|---------|-----------------|
| Sedán 2022     | 25000.0 | Juan Pérez      |
| Hatchback 2021 | 22000.0 | María Gómez     |
| SUV 2023       | 30000.0 | Carlos López    |
| Coupé 2022     | 28000.0 | Ana Martínez    |
| Camioneta 2023 | 32000.0 | Pedro Rodríguez |
| Compacto 2021  | 20000.0 | Laura Sánchez   |
| Híbrido 2022   | 27000.0 | Miguel González |
| Deportivo 2023 | 35000.0 | Isabel Díaz     |
| Eléctrico 2021 | 40000.0 | Elena Torres    |

### Encontrar los clientes que han comprado coches con precios superiores al promedio de todos los coches vendidos.
-- Cosas que debo de tener en cuenta:
    -- Precios superiores.
    -- Obtener la media. AVG(precio)
```sql
select co.precio, cl.nombre from coches as co, clientes as cl, ventas as v where cl.id_cliente=v.id_cliente and co.id_coche=v.id_coche and co.precio > (select avg(precio) from coches);
```
| precio  |     nombre      |
|---------|-----------------|
| 30000.0 | Carlos López    |
| 32000.0 | Pedro Rodríguez |
| 35000.0 | Isabel Díaz     |
| 40000.0 | Elena Torres    |

### Mostrar los modelos de coches y sus precios que no han sido vendidos aún:
-- Cosas que debo de tener en cuenta:
    -- Coches que han sido vendidos.
    -- Quiero los coches que no han sido vendidos. NOT id_coche IN ventas
```sql
select co.modelo, co.precio from coches as co, clientes as cl, ventas as v where cl.id_cliente=v.id_cliente and co.id_coche=v.id_coche and not v.id_coche in (select id_coche from ventas);
```
-- La consulta se devuelve vacía

### Calcular el total gastado por todos los clientes en coches:
-- Cosas que debo de tener en cuenta:
    -- Me estan pidiendo la suma total de todos los coches vendidos, NO de aquellos que aún no se han vendido.
```sql
select sum(precio) as gasto_total from coches as co, ventas as v where co.id_coche=v.id_coche;
```
| gasto_total |
|-------------|
| 259000.0    |

### Listar los coches vendidos junto con la fecha de venta y el nombre del cliente, ordenados por fecha de venta de forma descendente:
-- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. ¿Por qué campo tengo que ordenadar. Es uno o más campos?
```sql
select co.modelo, v.fecha_venta, cl.nombre from coches as co, clientes as cl, ventas as v where cl.id_cliente=v.id_cliente and co.id_coche=v.id_coche order by v.fecha_venta desc;
```
|     modelo     | fecha_venta |     nombre      |
|----------------|-------------|-----------------|
| Eléctrico 2021 | 2023-10-05  | Elena Torres    |
| Deportivo 2023 | 2023-08-25  | Isabel Díaz     |
| Híbrido 2022   | 2023-07-20  | Miguel González |
| Compacto 2021  | 2023-06-15  | Laura Sánchez   |
| Camioneta 2023 | 2023-05-05  | Pedro Rodríguez |
| Coupé 2022     | 2023-04-10  | Ana Martínez    |
| SUV 2023       | 2023-03-25  | Carlos López    |
| Hatchback 2021 | 2023-02-20  | María Gómez     |
| Sedán 2022     | 2023-01-15  | Juan Pérez      |

### Encontrar el modelo de coche más caro.
-- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. MAX
```sql
select modelo, max(precio) as max_precio from coches;
```
|     modelo     | max_precio |
|----------------|------------|
| Eléctrico 2021 | 40000.0    |

### Mostrar los clientes que han comprado al menos un coche (un coche o más) y la cantidad de coches comprados.
-- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. COUNT
```sql
select cl.nombre, count(v.id_coche) as coches_comprados from coches as co, clientes as cl, ventas as v where cl.id_cliente=v.id_cliente and co.id_coche=v.id_coche group by cl.nombre having count(v.id_coche) >= 1;
```
|     nombre      | coches_comprados |
|-----------------|------------------|
| Ana Martínez    | 1                |
| Carlos López    | 1                |
| Elena Torres    | 1                |
| Isabel Díaz     | 1                |
| Juan Pérez      | 1                |
| Laura Sánchez   | 1                |
| María Gómez     | 1                |
| Miguel González | 1                |
| Pedro Rodríguez | 1                |

### Encontrar los clientes que han comprado coches de la marca 'Toyota':
-- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. Like | regexp | =. Tabla normalizada ?.
```sql
select cl.nombre from coches as co, clientes as cl, ventas as v where cl.id_cliente=v.id_cliente and co.id_coche=v.id_coche and co.marca regexp 'Toyota';
```
|   nombre   |
|------------|
| Juan Pérez |

### Calcular el promedio de edad de los clientes que han comprado coches de más de 25,000.
-- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. 
```sql
select round(avg(cl.edad), 2) AS promedio_edad, co.precio from coches as co, clientes as cl, ventas as v where cl.id_cliente=v.id_cliente and co.id_coche=v.id_coche and co.precio > 25000;
```
| promedio_edad | precio  |
|---------------|---------|
| 32.83         | 30000.0 |

### Mostrar los modelos de coches y sus precios que fueron comprados por clientes mayores de 30 años.
-- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?.
```sql
select co.modelo, co.precio, cl.edad from coches as co, clientes as cl, ventas as v where cl.id_cliente=v.id_cliente and co.id_coche=v.id_coche and cl.edad > 30;
```
|     modelo     | precio  | edad |
|----------------|---------|------|
| SUV 2023       | 30000.0 | 35   |
| Camioneta 2023 | 32000.0 | 40   |
| Compacto 2021  | 20000.0 | 32   |
| Deportivo 2023 | 35000.0 | 38   |

### Encontrar los coches vendidos en el año 2022 junto con la cantidad total de ventas en ese año.
-- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?.
```sql
select co.modelo, COUNT(*) as total_ventas from coches as co, clientes as cl, ventas as v where cl.id_cliente=v.id_cliente and co.id_coche=v.id_coche and v.fecha_venta = 2022 group by co.modelo;
```
-- La consulta se devuelve vacía

### Listar los coches cuyos precios son mayores que el precio promedio de coches vendidos a clientes menores de 30 años.
-- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. AVG
```sql
select co.precio, co.modelo, cl.edad from coches as co, clientes as cl, ventas as v where cl.id_cliente=v.id_cliente and co.id_coche=v.id_coche and co.precio > (select avg(precio) from coches) and cl.edad < 30;
```
| precio  |     modelo     | edad |
|---------|----------------|------|
| 40000.0 | Eléctrico 2021 | 29   |

### Calcular el total de ventas por marca de coche, ordenado de forma descendente por el total de ventas:
-- Cosas que debo de tener en cuenta:
    -- ¿Qué me están pidiendo?. COUNT| DESC|ASC precio
```sql
SELECT co.marca, count(*) as total_ventas from coches as co, clientes as cl, ventas as v where cl.id_cliente=v.id_cliente and co.id_coche=v.id_coche group by co.marca order by total_ventas desc;
```
|   marca    | total_ventas |
|------------|--------------|
| Volkswagen | 1            |
| Toyota     | 1            |
| Tesla      | 1            |
| Nissan     | 1            |
| Mazda      | 1            |
| Hyundai    | 1            |
| Honda      | 1            |
| Ford       | 1            |
| Chevrolet  | 1            |