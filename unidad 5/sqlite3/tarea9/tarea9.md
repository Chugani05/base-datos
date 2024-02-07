# Tarea 9
## Creación de fichero base-datos-clientes.sql.
Creamos un fichero nano en el que insertamos la información proporcionada en el archivo adjunto en la carpeta tarea8 con el siguente comando:
```sql
nano base-datos-clientes.sql
```

## Lectura del fichero sql.
Mediante el siguiente comando entramos en sqlite:
```sql
sqlite3 tarea9.db 
```
Por medio del comando dado a continuación realizamos la creacion de la tabla y la inserción de la informacion en la base de datos
```sql
.read base-datos-clientes.sql
```

## Realización de consultas
### Obtener el nombre del alumno y el nombre de la clase en la que está inscrito.
### Obtener el nombre del alumno y la materia de las clases en las que está inscrito.
### Obtener el nombre del alumno, la edad y el nombre del profesor de las clases en las que está inscrito.
### Obtener el nombre del alumno y la dirección de las clases en las que está inscrito.
### Obtener el nombre del alumno y el nombre de la clase junto con el profesor.
### Obtener el nombre del alumno, la materia y el nombre del profesor de las clases en las que está inscrito.
### Obtener el nombre del alumno, la edad y la materia de las clases en las que está inscrito.
### Obtener el nombre del alumno, la dirección y el profesor de las clases en las que está inscrito.
### Obtener el nombre del alumno y la materia de las clases en las que está inscrito, ordenado por el nombre del alumno.
### Contar cuántos alumnos están inscritos en cada clase.