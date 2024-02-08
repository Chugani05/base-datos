# Tarea 10
## Lectura del fichero db.
Mediante el siguiente comando entramos en sqlite:
```sql
sqlite3 tarea10.db 
```
Por medio del comando dado a continuación realizamos la creacion de la tabla y la inserción de la informacion en la base de datos
```sql
.open chinook.db
```

## Realización de consultas
### Proporciona una consulta que muestre solo los clientes de Brasil.
```sql
select country from customers where country='Brasil';
```
### Proporciona una consulta que muestre las facturas de clientes que son de Brasil. La tabla resultante debe mostrar el nombre completo del cliente, ID de factura, fecha de la factura y país de facturación.
```sql
sqlite> select c.firstname || ' ' || c.lastname as full_name, i.invoiceid, i.invoicedate, i.billingcity from customers as c, invoices as i where i.invoiceid=c.customerid and c.country='Brasil';
```
```sql
select c.firstname || ' ' || c.lastname as full_name, i.invoiceid, i.invoicedate, i.billingcity from invoices as i inner join customers as c on i.invoiceid=c.customerid and c.country='Brasil';
```
-- La consulta se devuelve vacía

### Proporciona una consulta que muestre solo los empleados que son Agentes de Ventas.
```sql
```
### Proporciona una consulta que muestre una lista única de países de facturación de la tabla de Facturas.
```sql
```
### Proporciona una consulta que muestre las facturas de clientes que son de Brasil.
```sql
```
### Proporciona una consulta que muestre las facturas asociadas con cada agente de ventas. La tabla resultante debe incluir el nombre completo del Agente de Ventas.
```sql
```
### Proporciona una consulta que muestre el Total de la Factura, nombre del cliente, país y nombre del Agente de Ventas para todas las facturas y clientes.
```sql
```
### ¿Cuántas facturas hubo en 2009 y 2011? ¿Cuáles son las ventas totales respectivas para cada uno de esos años?
```sql
```
### Mirando la tabla de InvoiceLine, proporciona una consulta que CUENTE el número de ítems de línea para el ID de factura 37.
```sql
```
### Mirando la tabla de InvoiceLine, proporciona una consulta que CUENTE el número de ítems de línea para cada Factura. PISTA: GROUP BY
```sql
```
### Proporciona una consulta que incluya el nombre de la pista con cada ítem de línea de factura.
```sql
```
### Proporciona una consulta que incluya el nombre de la pista comprada Y el nombre del artista con cada ítem de línea de factura.
```sql
```
### Proporciona una consulta que muestre el número total de pistas en cada lista de reproducción. El nombre de la lista de reproducción debe estar incluido en la tabla resultante.
```sql
```
### Proporciona una consulta que muestre todas las pistas, pero no muestre IDs. La tabla resultante debe incluir el nombre del álbum, el tipo de medio y el género.
```sql
```
### Proporciona una consulta que muestre todas las facturas.
```sql
```
### Proporciona una consulta que muestre las ventas totales realizadas por cada agente de ventas.
```sql
```
### ¿Qué agente de ventas realizó más ventas en 2009?
```sql
```
### Escribir una consulta que muestre todas las playlists de la base de datos.
```sql
```
### Escribe una consulta que liste todas las canciones de una playlist.
```sql
```
### Escribe una consulta que liste exclusivamente el nombre de las canciones de una playlist concreta, con el nombre de su género y el nombre de tipo de medio.
```sql
```