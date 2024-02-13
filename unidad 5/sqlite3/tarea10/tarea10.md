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
select * from customers where country='Brazil';
```
| CustomerId | FirstName | LastName  |                     Company                      |             Address             |        City         | State | Country | PostalCode |       Phone        |        Fax         |             Email             | SupportRepId |
|------------|-----------|-----------|--------------------------------------------------|---------------------------------|---------------------|-------|---------|------------|--------------------|--------------------|-------------------------------|--------------|
| 1          | Luís      | Gonçalves | Embraer - Empresa Brasileira de Aeronáutica S.A. | Av. Brigadeiro Faria Lima, 2170 | São José dos Campos | SP    | Brazil  | 12227-000  | +55 (12) 3923-5555 | +55 (12) 3923-5566 | luisg@embraer.com.br          | 3            |
| 10         | Eduardo   | Martins   | Woodstock Discos                                 | Rua Dr. Falcão Filho, 155       | São Paulo           | SP    | Brazil  | 01007-010  | +55 (11) 3033-5446 | +55 (11) 3033-4564 | eduardo@woodstock.com.br      | 4            |
| 11         | Alexandre | Rocha     | Banco do Brasil S.A.                             | Av. Paulista, 2022              | São Paulo           | SP    | Brazil  | 01310-200  | +55 (11) 3055-3278 | +55 (11) 3055-8131 | alero@uol.com.br              | 5            |
| 12         | Roberto   | Almeida   | Riotur                                           | Praça Pio X, 119                | Rio de Janeiro      | RJ    | Brazil  | 20040-020  | +55 (21) 2271-7000 | +55 (21) 2271-7070 | roberto.almeida@riotur.gov.br | 3            |
| 13         | Fernanda  | Ramos     |                                                  | Qe 7 Bloco G                    | Brasília            | DF    | Brazil  | 71020-677  | +55 (61) 3363-5547 | +55 (61) 3363-7855 | fernadaramos4@uol.com.br      | 4            |

### Proporciona una consulta que muestre las facturas de clientes que son de Brasil. La tabla resultante debe mostrar el nombre completo del cliente, ID de factura, fecha de la factura y país de facturación.
```sql
select c.firstname || ' ' || c.lastname as full_name, i.invoiceid, i.invoicedate, i.billingcity from customers as c, invoices as i where i.invoiceid=c.customerid and c.country='Brazil';
```
```sql
select c.firstname || ' ' || c.lastname as full_name, i.invoiceid, i.invoicedate, i.billingcity from invoices as i inner join customers as c on i.invoiceid=c.customerid and c.country='Brazil';
```
|    full_name    | InvoiceId |     InvoiceDate     |  BillingCity  |
|-----------------|-----------|---------------------|---------------|
| Luís Gonçalves  | 1         | 2009-01-01 00:00:00 | Stuttgart     |
| Eduardo Martins | 10        | 2009-02-03 00:00:00 | Dublin        |
| Alexandre Rocha | 11        | 2009-02-06 00:00:00 | London        |
| Roberto Almeida | 12        | 2009-02-11 00:00:00 | Stuttgart     |
| Fernanda Ramos  | 13        | 2009-02-19 00:00:00 | Mountain View |

### Proporciona una consulta que muestre solo los empleados que son Agentes de Ventas.
```sql
select * from employees where title='Sales Support Agent';
```
| EmployeeId | LastName | FirstName |        Title        | ReportsTo |      BirthDate      |      HireDate       |     Address      |  City   | State | Country | PostalCode |       Phone       |        Fax        |          Email           |
|------------|----------|-----------|---------------------|-----------|---------------------|---------------------|------------------|---------|-------|---------|------------|-------------------|-------------------|--------------------------|
| 3          | Peacock  | Jane      | Sales Support Agent | 2         | 1973-08-29 00:00:00 | 2002-04-01 00:00:00 | 1111 6 Ave SW    | Calgary | AB    | Canada  | T2P 5M5    | +1 (403) 262-3443 | +1 (403) 262-6712 | jane@chinookcorp.com     |
| 4          | Park     | Margaret  | Sales Support Agent | 2         | 1947-09-19 00:00:00 | 2003-05-03 00:00:00 | 683 10 Street SW | Calgary | AB    | Canada  | T2P 5G3    | +1 (403) 263-4423 | +1 (403) 263-4289 | margaret@chinookcorp.com |
| 5          | Johnson  | Steve     | Sales Support Agent | 2         | 1965-03-03 00:00:00 | 2003-10-17 00:00:00 | 7727B 41 Ave     | Calgary | AB    | Canada  | T3B 1Y7    | 1 (780) 836-9987  | 1 (780) 836-9543  | steve@chinookcorp.com    |

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