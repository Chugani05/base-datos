# Tarea 8
## Creación de fichero base-datos-clientes.sql.
Creamos un fichero nano en el que insertamos la información proporcionada en el archivo adjunto en la carpeta tarea8 con el siguente comando:

```sql
nano base-datos-clientes.sql
```

## Lectura del fichero sql.
Mediante el siguiente comando entramos en sqlite:
```sql
sqlite3 tarea8.db 
```
Por medio del comando dado a continuación realizamos la creacion de la tabla y la inserción de la informacion en la base de datos
```sql
.read base-datos-clientes.sql
```

## Realización de consultas
### Consulta para obtener el nombre y la edad de los clientes que han comprado coches de la marca Toyota.
```sql
select cl.nombre, cl.edad, co.marca from clientes as cl, coches as co, ventas as v where cl.id_cliente=v.id_cliente and co.id_coche=v.id_coche and co.marca='Toyota';
```
|   nombre   | edad | marca  |
|------------|------|--------|
| Juan Pérez | 30   | Toyota |

### Consulta para calcular el precio promedio de los coches vendidos.
```sql
select round(avg(co.precio), 2) as precio_promedio_ventas from coches as co, ventas as v where co.id_coche=v.id_coche;
```
| precio_promedio_ventas |
|------------------------|
| 28777.78               |

### Consulta para obtener el modelo y la marca de los coches vendidos a clientes menores de 30 años.
```sql
select co.modelo, co.marca, cl.edad from coches as co, clientes as cl, ventas as v where cl.id_cliente=v.id_cliente and co.id_coche=v.id_coche and cl.edad < 30;
```
|     modelo     |   marca   | edad |
|----------------|-----------|------|
| Hatchback 2021 | Honda     | 25   |
| Coupé 2022     | Chevrolet | 28   |
| Híbrido 2022   | Hyundai   | 27   |
| Eléctrico 2021 | Tesla     | 29   |
| Hatchback 2021 | Honda     | 25   |
| Coupé 2022     | Chevrolet | 28   |
| Híbrido 2022   | Hyundai   | 27   |
| Eléctrico 2021 | Tesla     | 29   |

### Consulta para contar el número de coches vendidos de cada marca.
```sql
select marca, count(*) as cantidad from coches group by marca;
```
|   marca    | cantidad |
|------------|----------|
| Chevrolet  | 2        |
| Ford       | 2        |
| Honda      | 2        |
| Hyundai    | 2        |
| Mazda      | 2        |
| Nissan     | 2        |
| Ram        | 2        |
| Tesla      | 2        |
| Toyota     | 2        |
| Volkswagen | 2        |

### Consulta para obtener el nombre y la dirección de los clientes que han llevado a reparar sus coches en 2024.
```sql
select cl.nombre, cl.direccion, r.fecha_reparación from clientes as cl, reparacion as r where cl.id_cliente=r.id_cliente and r.fecha_reparación regexp '2024';
```
|     nombre      |   direccion    | fecha_reparación |
|-----------------|----------------|------------------|
| Francisco Ruiz  | Calle I #222   | 2024-01-05       |
| Elena Torres    | Avenida J #333 | 2024-02-10       |
| Juan Pérez      | Calle A #123   | 2024-03-15       |
| María Gómez     | Avenida B #456 | 2024-04-20       |
| Carlos López    | Calle C #789   | 2024-05-25       |
| Ana Martínez    | Avenida D #101 | 2024-06-10       |
| Pedro Rodríguez | Calle E #234   | 2024-07-05       |
| Laura Sánchez   | Avenida F #567 | 2024-08-15       |
| Miguel González | Calle G #890   | 2024-09-20       |
| Isabel Díaz     | Avenida H #111 | 2024-10-25       |
| Francisco Ruiz  | Calle I #222   | 2024-11-05       |
| Elena Torres    | Avenida J #333 | 2024-12-10       |
| Francisco Ruiz  | Calle I #222   | 2024-01-05       |
| Elena Torres    | Avenida J #333 | 2024-02-10       |
| Juan Pérez      | Calle A #123   | 2024-03-15       |
| María Gómez     | Avenida B #456 | 2024-04-20       |
| Carlos López    | Calle C #789   | 2024-05-25       |
| Ana Martínez    | Avenida D #101 | 2024-06-10       |
| Pedro Rodríguez | Calle E #234   | 2024-07-05       |
| Laura Sánchez   | Avenida F #567 | 2024-08-15       |
| Miguel González | Calle G #890   | 2024-09-20       |
| Isabel Díaz     | Avenida H #111 | 2024-10-25       |
| Francisco Ruiz  | Calle I #222   | 2024-11-05       |
| Elena Torres    | Avenida J #333 | 2024-12-10       |

### Consulta para calcular el total gastado en reparaciones por cada cliente.
```sql
select cl.nombre, sum(r.precio) as gasto_total_reparaciones from clientes as cl, reparacion as r where cl.id_cliente=r.id_cliente group by cl.nombre;
```
-- no hay columna precio en reparaciones

### Consulta para obtener el nombre y la edad de los clientes que han comprado coches de más de 30000 euros.
```sql
select cl.nombre, cl.edad, co.precio from coches as co, clientes as cl, ventas as v where cl.id_cliente=v.id_cliente and co.id_coche=v.id_coche and co.precio > 30000;
```
|     nombre      | edad | precio  |
|-----------------|------|---------|
| Pedro Rodríguez | 40   | 32000.0 |
| Isabel Díaz     | 38   | 35000.0 |
| Elena Torres    | 29   | 40000.0 |
| Pedro Rodríguez | 40   | 32000.0 |
| Isabel Díaz     | 38   | 35000.0 |
| Elena Torres    | 29   | 40000.0 |

### Consulta para calcular el precio medio de los coches vendidos en 2023.
```sql
select round(avg(co.precio), 2) as precio_promedio_ventas_2023 from coches as co, ventas as v where co.id_coche=v.id_coche and v.fecha_venta regexp '2023';
```
| precio_promedio_ventas_2023 |
|-----------------------------|
| 28777.78                    |

### Consulta para obtener el nombre y la dirección de los clientes que han comprado coches de la marca Ford.
```sql
```
### Consulta para contar el número de coches vendidos por año.
```sql
```
### Consulta para obtener el nombre y la edad de los clientes que han comprado coches de más de 30000 euros y llevado a reparar sus coches.
```sql
```
### Consulta para calcular el precio total de los coches vendidos a clientes menores de 30 años.
```sql
```
### Consulta para obtener el modelo y el año de los coches vendidos en 2023 y llevados a reparar.
```sql
```
### Consulta para contar el número de coches vendidos por cliente.
```sql
```
### Consulta para obtener el nombre y el precio de los coches vendidos a clientes mayores de 35 años.
```sql
```
### Consulta para calcular el precio total de los coches vendidos a clientes que viven en una calle (en la dirección).
```sql
```
### Consulta para obtener el nombre y la dirección de los clientes que han comprado coches de más de 30000 euros y llevado a reparar sus coches en 2024.
```sql
```
### Consulta para calcular el precio medio de los coches vendidos en 2023 y llevados a reparar por clientes menores de 30 años.
```sql
```
### Consulta para obtener el modelo y el año de los coches vendidos por clientes que tienen una dirección que contiene la palabra "Avenida".
```sql
```
### Consulta para contar el número de reparaciones realizadas en 2024 por cada cliente.
```sql
```