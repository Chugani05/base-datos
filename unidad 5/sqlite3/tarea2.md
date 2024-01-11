## Creación de tabla
```sql
create table Propietarios (
    id integer primary key autoincrement,
    nombre text not null,
    apellido text not null,
    dni text
);
create table Vehiculos (
    id integer primary key autoincrement,
    marca text not null,
    modelo text not null,
    anio integer not null,
    id_propietario integer	references propietario(id)
);
```

## Inserción de valores
```sql
insert into Propietarios (id, nombre, apellido, dni)
values 
```
```sql
insert into Vehiculos (id, marca, modelo, anio, id_propietario)
values 
```

## Consultas
### Seleccionar todos los propietarios.
```sql
```
```sql
```
### Listar todos los vehículos.
```sql
```
```sql
```
### Seleccionar solo los nombres y apellidos de los propietarios.
```sql
```
```sql
```
### Listar todas las marcas y modelos de los vehículos.
```sql
```
```sql
```
### Seleccionar solo los propietarios con apellido "Perez".
```sql
```
```sql
```
### Listar todos los vehículos con año 2019.
```sql
```
```sql
```
### Seleccionar propietarios que tienen vehículos de la marca "Toyota".
```sql
```
```sql
```
### Listar vehículos con marca "Ford" y modelo "Fiesta".
```sql
```
```sql
```
### Seleccionar propietarios con DNI "12345678A".
```sql
```
```sql
```
### Listar vehículos que pertenecen al propietario con ID 5.
```sql
```
```sql
```

## Updates 
### Actualizar el nombre de un propietario con DNI "12345678A".
```sql
```
```sql
```
### Modificar el año de un vehículo con ID 3 a 2022.
```sql
```
```sql
```
### Cambiar el modelo de todos los vehículos Nissan a "Micra".
```sql
```
```sql
```
### Actualizar el apellido de un propietario con ID 7 a "Gomez".
```sql
```
```sql
```
### Modificar la marca de un vehículo con modelo "Fiesta" a "Renault".
```sql
```
```sql
```