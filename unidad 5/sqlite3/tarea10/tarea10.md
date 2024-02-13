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
select c.firstname || ' ' || c.lastname as FullName, i.invoiceid, i.invoicedate, i.billingcountry from customers as c, invoices as i where i.invoiceid=c.customerid and c.country='Brazil';
```
```sql
select c.firstname || ' ' || c.lastname as FullName, i.invoiceid, i.invoicedate, i.billingcountry from invoices as i inner join customers as c on i.invoiceid=c.customerid and c.country='Brazil';
```
|    FullName    | InvoiceId |     InvoiceDate     | BillingCountry |
|-----------------|-----------|---------------------|----------------|
| Luís Gonçalves  | 1         | 2009-01-01 00:00:00 | Germany        |
| Eduardo Martins | 10        | 2009-02-03 00:00:00 | Ireland        |
| Alexandre Rocha | 11        | 2009-02-06 00:00:00 | United Kingdom |
| Roberto Almeida | 12        | 2009-02-11 00:00:00 | Germany        |
| Fernanda Ramos  | 13        | 2009-02-19 00:00:00 | USA            |

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
select distinct billingcountry from invoices;
```
| BillingCountry |
|----------------|
| Germany        |
| Norway         |
| Belgium        |
| Canada         |
| USA            |
| France         |
| Ireland        |
| United Kingdom |
| Australia      |
| Chile          |
| India          |
| Brazil         |
| Portugal       |
| Netherlands    |
| Spain          |
| Sweden         |
| Czech Republic |
| Finland        |
| Denmark        |
| Italy          |
| Poland         |
| Austria        |
| Hungary        |
| Argentina      |

### Proporciona una consulta que muestre las facturas de clientes que son de Brasil.
```sql
select * from customers as c, invoices as i where i.invoiceid=c.customerid and c.country='Brazil';
```
```sql
select * from invoices as i inner join customers as c on i.invoiceid=c.customerid and c.country='Brazil';
```
| InvoiceId | CustomerId |     InvoiceDate     |      BillingAddress       |  BillingCity  | BillingState | BillingCountry | BillingPostalCode | Total | CustomerId | FirstName | LastName  |                     Company                      |             Address             |        City         | State | Country | PostalCode |       Phone        |        Fax         |             Email             | SupportRepId |
|-----------|------------|---------------------|---------------------------|---------------|--------------|----------------|-------------------|-------|------------|-----------|-----------|--------------------------------------------------|---------------------------------|---------------------|-------|---------|------------|--------------------|--------------------|-------------------------------|--------------|
| 1         | 2          | 2009-01-01 00:00:00 | Theodor-Heuss-Straße 34   | Stuttgart     |              | Germany        | 70174             | 1.98  | 1          | Luís      | Gonçalves | Embraer - Empresa Brasileira de Aeronáutica S.A. | Av. Brigadeiro Faria Lima, 2170 | São José dos Campos | SP    | Brazil  | 12227-000  | +55 (12) 3923-5555 | +55 (12) 3923-5566 | luisg@embraer.com.br          | 3            |
| 10        | 46         | 2009-02-03 00:00:00 | 3 Chatham Street          | Dublin        | Dublin       | Ireland        |                   | 5.94  | 10         | Eduardo   | Martins   | Woodstock Discos                                 | Rua Dr. Falcão Filho, 155       | São Paulo           | SP    | Brazil  | 01007-010  | +55 (11) 3033-5446 | +55 (11) 3033-4564 | eduardo@woodstock.com.br      | 4            |
| 11        | 52         | 2009-02-06 00:00:00 | 202 Hoxton Street         | London        |              | United Kingdom | N1 5LH            | 8.91  | 11         | Alexandre | Rocha     | Banco do Brasil S.A.                             | Av. Paulista, 2022              | São Paulo           | SP    | Brazil  | 01310-200  | +55 (11) 3055-3278 | +55 (11) 3055-8131 | alero@uol.com.br              | 5            |
| 12        | 2          | 2009-02-11 00:00:00 | Theodor-Heuss-Straße 34   | Stuttgart     |              | Germany        | 70174             | 13.86 | 12         | Roberto   | Almeida   | Riotur                                           | Praça Pio X, 119                | Rio de Janeiro      | RJ    | Brazil  | 20040-020  | +55 (21) 2271-7000 | +55 (21) 2271-7070 | roberto.almeida@riotur.gov.br | 3            |
| 13        | 16         | 2009-02-19 00:00:00 | 1600 Amphitheatre Parkway | Mountain View | CA           | USA            | 94043-1351        | 0.99  | 13         | Fernanda  | Ramos     |                                                  | Qe 7 Bloco G                    | Brasília            | DF    | Brazil  | 71020-677  | +55 (61) 3363-5547 | +55 (61) 3363-7855 | fernadaramos4@uol.com.br      | 4            |

### Proporciona una consulta que muestre las facturas asociadas con cada agente de ventas. La tabla resultante debe incluir el nombre completo del Agente de Ventas.
```sql
select i.*, c.firstname || ' ' || c.lastname as EmployeeFullName from customers as c, invoices as i, employees as e where i.invoiceid=c.customerid and c.supportrepid=e.employeeid and e.title='Sales Support Agent';
```
```sql
select i.*, e.firstname || ' ' || e.lastname as EmployeeFullName from invoices as i inner join customers as c on i.invoiceid=c.customerid join employees as e on c.supportrepid=e.employeeid and e.title='Sales Support Agent';
```
| InvoiceId | CustomerId |     InvoiceDate     |      BillingAddress       |  BillingCity   | BillingState | BillingCountry | BillingPostalCode | Total |   EmployeeFullName    |
|-----------|------------|---------------------|---------------------------|----------------|--------------|----------------|-------------------|-------|-----------------------|
| 1         | 2          | 2009-01-01 00:00:00 | Theodor-Heuss-Straße 34   | Stuttgart      |              | Germany        | 70174             | 1.98  | Luís Gonçalves        |
| 3         | 8          | 2009-01-03 00:00:00 | Grétrystraat 63           | Brussels       |              | Belgium        | 1000              | 5.94  | François Tremblay     |
| 12        | 2          | 2009-02-11 00:00:00 | Theodor-Heuss-Straße 34   | Stuttgart      |              | Germany        | 70174             | 13.86 | Roberto Almeida       |
| 15        | 19         | 2009-03-04 00:00:00 | 1 Infinite Loop           | Cupertino      | CA           | USA            | 95014             | 1.98  | Jennifer Peterson     |
| 18        | 31         | 2009-03-09 00:00:00 | 194A Chain Lake Drive     | Halifax        | NS           | Canada         | B3S 1C5           | 8.91  | Michelle Brooks       |
| 19        | 40         | 2009-03-14 00:00:00 | 8, Rue Hanovre            | Paris          |              | France         | 75002             | 13.86 | Tim Goyer             |
| 24        | 4          | 2009-04-06 00:00:00 | Ullevålsveien 14          | Oslo           |              | Norway         | 0171              | 5.94  | Frank Ralston         |
| 29        | 36         | 2009-05-05 00:00:00 | Tauentzienstraße 8        | Berlin         |              | Germany        | 10789             | 1.98  | Robert Brown          |
| 30        | 38         | 2009-05-06 00:00:00 | Barbarossastraße 19       | Berlin         |              | Germany        | 10779             | 3.96  | Edward Francis        |
| 33        | 57         | 2009-05-15 00:00:00 | Calle Lira, 198           | Santiago       |              | Chile          |                   | 13.86 | Ellie Sullivan        |
| 37        | 17         | 2009-06-06 00:00:00 | 1 Microsoft Way           | Redmond        | WA           | USA            | 98052-8300        | 3.96  | Fynn Zimmermann       |
| 38        | 21         | 2009-06-07 00:00:00 | 801 W 4th Street          | Reno           | NV           | USA            | 89503             | 5.94  | Niklas Schröder       |
| 42        | 51         | 2009-07-06 00:00:00 | Celsiusg. 9               | Stockholm      |              | Sweden         | 11230             | 1.98  | Wyatt Girard          |
| 43        | 53         | 2009-07-06 00:00:00 | 113 Lupus St              | London         |              | United Kingdom | SW1V 3EN          | 1.98  | Isabelle Mercier      |
| 44        | 55         | 2009-07-07 00:00:00 | 421 Bourke Street         | Sidney         | NSW          | Australia      | 2010              | 3.96  | Terhi Hämäläinen      |
| 45        | 59         | 2009-07-08 00:00:00 | 3,Raj Bhavan Road         | Bangalore      |              | India          | 560001            | 5.94  | Ladislav Kovács       |
| 46        | 6          | 2009-07-11 00:00:00 | Rilská 3174/6             | Prague         |              | Czech Republic | 14300             | 8.91  | Hugh O'Reilly         |
| 52        | 38         | 2009-08-08 00:00:00 | Barbarossastraße 19       | Berlin         |              | Germany        | 10779             | 5.94  | Emma Jones            |
| 53        | 44         | 2009-08-11 00:00:00 | Porthaninkatu 9           | Helsinki       |              | Finland        | 00530             | 8.91  | Phil Hughes           |
| 58        | 13         | 2009-09-07 00:00:00 | Qe 7 Bloco G              | Brasília       | DF           | Brazil         | 71020-677         | 3.96  | Manoj Pareek          |
| 59        | 17         | 2009-09-08 00:00:00 | 1 Microsoft Way           | Redmond        | WA           | USA            | 98052-8300        | 5.94  | Puja Srivastava       |
| 4         | 14         | 2009-01-06 00:00:00 | 8210 111 ST NW            | Edmonton       | AB           | Canada         | T6G 2C7           | 8.91  | Bjørn Hansen          |
| 5         | 23         | 2009-01-11 00:00:00 | 69 Salem Street           | Boston         | MA           | USA            | 2113              | 13.86 | František Wichterlová |
| 8         | 40         | 2009-02-01 00:00:00 | 8, Rue Hanovre            | Paris          |              | France         | 75002             | 1.98  | Daan Peeters          |
| 9         | 42         | 2009-02-02 00:00:00 | 9, Place Louis Barthou    | Bordeaux       |              | France         | 33000             | 3.96  | Kara Nielsen          |
| 10        | 46         | 2009-02-03 00:00:00 | 3 Chatham Street          | Dublin         | Dublin       | Ireland        |                   | 5.94  | Eduardo Martins       |
| 13        | 16         | 2009-02-19 00:00:00 | 1600 Amphitheatre Parkway | Mountain View  | CA           | USA            | 94043-1351        | 0.99  | Fernanda Ramos        |
| 16        | 21         | 2009-03-05 00:00:00 | 801 W 4th Street          | Reno           | NV           | USA            | 89503             | 3.96  | Frank Harris          |
| 20        | 54         | 2009-03-22 00:00:00 | 110 Raeburn Pl            | Edinburgh      |              | United Kingdom | EH4 1HH           | 0.99  | Dan Miller            |
| 22        | 57         | 2009-04-04 00:00:00 | Calle Lira, 198           | Santiago       |              | Chile          |                   | 1.98  | Heather Leacock       |
| 23        | 59         | 2009-04-05 00:00:00 | 3,Raj Bhavan Road         | Bangalore      |              | India          | 560001            | 3.96  | John Gordon           |
| 26        | 19         | 2009-04-14 00:00:00 | 1 Infinite Loop           | Cupertino      | CA           | USA            | 95014             | 13.86 | Richard Cunningham    |
| 27        | 33         | 2009-04-22 00:00:00 | 5112 48 Street            | Yellowknife    | NT           | Canada         | X1A 1N6           | 0.99  | Patrick Gray          |
| 32        | 48         | 2009-05-10 00:00:00 | Lijnbaansgracht 120bg     | Amsterdam      | VV           | Netherlands    | 1016              | 8.91  | Aaron Mitchell        |
| 34        | 12         | 2009-05-23 00:00:00 | Praça Pio X, 119          | Rio de Janeiro | RJ           | Brazil         | 20040-020         | 0.99  | João Fernandes        |
| 35        | 13         | 2009-06-05 00:00:00 | Qe 7 Bloco G              | Brasília       | DF           | Brazil         | 71020-677         | 1.98  | Madalena Sampaio      |
| 39        | 27         | 2009-06-10 00:00:00 | 1033 N Park Ave           | Tucson         | AZ           | USA            | 85719             | 8.91  | Camille Bernard       |
| 40        | 36         | 2009-06-15 00:00:00 | Tauentzienstraße 8        | Berlin         |              | Germany        | 10789             | 13.86 | Dominique Lefebvre    |
| 49        | 30         | 2009-08-06 00:00:00 | 230 Elgin Street          | Ottawa         | ON           | Canada         | K2P 1L7           | 1.98  | Stanisław Wójcik      |
| 55        | 8          | 2009-08-24 00:00:00 | Grétrystraat 63           | Brussels       |              | Belgium        | 1000              | 0.99  | Mark Taylor           |
| 56        | 9          | 2009-09-06 00:00:00 | Sønder Boulevard 51       | Copenhagen     |              | Denmark        | 1720              | 1.98  | Diego Gutiérrez       |
| 2         | 4          | 2009-01-02 00:00:00 | Ullevålsveien 14          | Oslo           |              | Norway         | 0171              | 3.96  | Leonie Köhler         |
| 6         | 37         | 2009-01-19 00:00:00 | Berger Straße 10          | Frankfurt      |              | Germany        | 60316             | 0.99  | Helena Holý           |
| 7         | 38         | 2009-02-01 00:00:00 | Barbarossastraße 19       | Berlin         |              | Germany        | 10779             | 1.98  | Astrid Gruber         |
| 11        | 52         | 2009-02-06 00:00:00 | 202 Hoxton Street         | London         |              | United Kingdom | N1 5LH            | 8.91  | Alexandre Rocha       |
| 14        | 17         | 2009-03-04 00:00:00 | 1 Microsoft Way           | Redmond        | WA           | USA            | 98052-8300        | 1.98  | Mark Philips          |
| 17        | 25         | 2009-03-06 00:00:00 | 319 N. Frances Street     | Madison        | WI           | USA            | 53703             | 5.94  | Jack Smith            |
| 21        | 55         | 2009-04-04 00:00:00 | 421 Bourke Street         | Sidney         | NSW          | Australia      | 2010              | 1.98  | Kathy Chase           |
| 25        | 10         | 2009-04-09 00:00:00 | Rua Dr. Falcão Filho, 155 | São Paulo      | SP           | Brazil         | 01007-010         | 8.91  | Victor Stevens        |
| 28        | 34         | 2009-05-05 00:00:00 | Rua da Assunção 53        | Lisbon         |              | Portugal       |                   | 1.98  | Julia Barnett         |
| 31        | 42         | 2009-05-07 00:00:00 | 9, Place Louis Barthou    | Bordeaux       |              | France         | 33000             | 5.94  | Martha Silk           |
| 36        | 15         | 2009-06-05 00:00:00 | 700 W Pender Street       | Vancouver      | BC           | Canada         | V6C 1G8           | 1.98  | Hannah Schneider      |
| 41        | 50         | 2009-06-23 00:00:00 | C/ San Bernardo 85        | Madrid         |              | Spain          | 28015             | 0.99  | Marc Dubois           |
| 47        | 15         | 2009-07-16 00:00:00 | 700 W Pender Street       | Vancouver      | BC           | Canada         | V6C 1G8           | 13.86 | Lucas Mancini         |
| 48        | 29         | 2009-07-24 00:00:00 | 796 Dundas Street West    | Toronto        | ON           | Canada         | M6J 1V1           | 0.99  | Johannes Van der Berg |
| 50        | 32         | 2009-08-06 00:00:00 | 696 Osborne Street        | Winnipeg       | MB           | Canada         | R3L 2B9           | 1.98  | Enrique Muñoz         |
| 51        | 34         | 2009-08-07 00:00:00 | Rua da Assunção 53        | Lisbon         |              | Portugal       |                   | 3.96  | Joakim Johansson      |
| 54        | 53         | 2009-08-16 00:00:00 | 113 Lupus St              | London         |              | United Kingdom | SW1V 3EN          | 13.86 | Steve Murray          |
| 57        | 11         | 2009-09-06 00:00:00 | Av. Paulista, 2022        | São Paulo      | SP           | Brazil         | 01310-200         | 1.98  | Luis Rojas            |

### Proporciona una consulta que muestre el Total de la Factura, nombre del cliente, país y nombre del Agente de Ventas para todas las facturas y clientes.
```sql
select i.total, c.firstname as CustomerName, c.country, e.firstname as EmployeeName from customers as c, invoices as i, employees as e where i.invoiceid=c.customerid and c.supportrepid=e.employeeid and e.title='Sales Support Agent';
```
```sql
select i.total, c.firstname as CustomerName, c.country, e.firstname as EmployeeName from invoices as i inner join customers as c on i.invoiceid=c.customerid join employees as e on c.supportrepid=e.employeeid and e.title='Sales Support Agent';
```
| Total | CustomerName |    Country     | EmployeeName |
|-------|--------------|----------------|--------------|
| 1.98  | Luís         | Brazil         | Jane         |
| 5.94  | François     | Canada         | Jane         |
| 13.86 | Roberto      | Brazil         | Jane         |
| 1.98  | Jennifer     | Canada         | Jane         |
| 8.91  | Michelle     | USA            | Jane         |
| 13.86 | Tim          | USA            | Jane         |
| 5.94  | Frank        | USA            | Jane         |
| 1.98  | Robert       | Canada         | Jane         |
| 3.96  | Edward       | Canada         | Jane         |
| 13.86 | Ellie        | Canada         | Jane         |
| 3.96  | Fynn         | Germany        | Jane         |
| 5.94  | Niklas       | Germany        | Jane         |
| 1.98  | Wyatt        | France         | Jane         |
| 1.98  | Isabelle     | France         | Jane         |
| 3.96  | Terhi        | Finland        | Jane         |
| 5.94  | Ladislav     | Hungary        | Jane         |
| 8.91  | Hugh         | Ireland        | Jane         |
| 5.94  | Emma         | United Kingdom | Jane         |
| 8.91  | Phil         | United Kingdom | Jane         |
| 3.96  | Manoj        | India          | Jane         |
| 5.94  | Puja         | India          | Jane         |
| 8.91  | Bjørn        | Norway         | Margaret     |
| 13.86 | František    | Czech Republic | Margaret     |
| 1.98  | Daan         | Belgium        | Margaret     |
| 3.96  | Kara         | Denmark        | Margaret     |
| 5.94  | Eduardo      | Brazil         | Margaret     |
| 0.99  | Fernanda     | Brazil         | Margaret     |
| 3.96  | Frank        | USA            | Margaret     |
| 0.99  | Dan          | USA            | Margaret     |
| 1.98  | Heather      | USA            | Margaret     |
| 3.96  | John         | USA            | Margaret     |
| 13.86 | Richard      | USA            | Margaret     |
| 0.99  | Patrick      | USA            | Margaret     |
| 8.91  | Aaron        | Canada         | Margaret     |
| 0.99  | João         | Portugal       | Margaret     |
| 1.98  | Madalena     | Portugal       | Margaret     |
| 8.91  | Camille      | France         | Margaret     |
| 13.86 | Dominique    | France         | Margaret     |
| 1.98  | Stanisław    | Poland         | Margaret     |
| 0.99  | Mark         | Australia      | Margaret     |
| 1.98  | Diego        | Argentina      | Margaret     |
| 3.96  | Leonie       | Germany        | Steve        |
| 0.99  | Helena       | Czech Republic | Steve        |
| 1.98  | Astrid       | Austria        | Steve        |
| 8.91  | Alexandre    | Brazil         | Steve        |
| 1.98  | Mark         | Canada         | Steve        |
| 5.94  | Jack         | USA            | Steve        |
| 1.98  | Kathy        | USA            | Steve        |
| 8.91  | Victor       | USA            | Steve        |
| 1.98  | Julia        | USA            | Steve        |
| 5.94  | Martha       | Canada         | Steve        |
| 1.98  | Hannah       | Germany        | Steve        |
| 0.99  | Marc         | France         | Steve        |
| 13.86 | Lucas        | Italy          | Steve        |
| 0.99  | Johannes     | Netherlands    | Steve        |
| 1.98  | Enrique      | Spain          | Steve        |
| 3.96  | Joakim       | Sweden         | Steve        |
| 13.86 | Steve        | United Kingdom | Steve        |
| 1.98  | Luis         | Chile          | Steve        |

### ¿Cuántas facturas hubo en 2009 y 2011? ¿Cuáles son las ventas totales respectivas para cada uno de esos años?
```sql
select substr(invoicedate, 1, 4) as Year, count(invoiceid) as TotalInvoices, sum(total) as TotalSales from invoices where year in ('2009', '2011') group by year;
```
| Year | TotalInvoices | TotalSales |
|------|---------------|------------|
| 2009 | 83            | 449.46     |
| 2011 | 83            | 469.58     |

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