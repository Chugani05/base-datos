## Creación de fichero empleados-dump.sql.
Creamos un fichero nano en el que insertamos la información proporcionada debajo con el siguente comando:
```sql
nano empleados-dump.sql
```
```sql
CREATE TABLE empleados (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT,
    salario REAL,
    departamento TEXT
);

INSERT INTO empleados (nombre, salario, departamento) VALUES ('Juan', 50000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('María', 60000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Carlos', 55000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Ana', 48000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Pedro', 70000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Laura', 52000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Javier', 48000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Carmen', 65000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Miguel', 51000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Elena', 55000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Diego', 72000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Sofía', 49000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Andrés', 60000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Isabel', 53000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Raúl', 68000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Patricia', 47000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Alejandro', 71000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Natalia', 54000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Roberto', 49000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Beatriz', 63000, 'TI');
```
## Lectura del fichero sql.
Mediante el siguiente comando entramos en sqlite:
```sql
sqlite3 tarea3.db 
```

Por medio del comando dado a continuación realizamos la creacion de la tabla y la inserción de la informacion en la base de datos
```sql
.read empleados-dump.sql
```

## Realización de consultas
### Muestra el nombre de todos los empleados en mayúsculas.
```sql
select upper(nombre) as nombre_mayusculas from empleados;
```
```sql
+-------------------+
| nombre_mayusculas |
+-------------------+
| JUAN              |
| JUAN              |
| MARíA             |
| CARLOS            |
| ANA               |
| PEDRO             |
| LAURA             |
| JAVIER            |
| CARMEN            |
| MIGUEL            |
| ELENA             |
| DIEGO             |
| SOFíA             |
| ANDRéS            |
| ISABEL            |
| RAúL              |
| PATRICIA          |
| ALEJANDRO         |
| NATALIA           |
| ROBERTO           |
| BEATRIZ           |
+-------------------+
```
### Calcula el valor absoluto del salario de todos los empleados.
```sql
select nombre, abs(salario) as salario_absoluto from empleados;
```
```sql
+-----------+------------------+
|  nombre   | salario_absoluto |
+-----------+------------------+
| Juan      | 50000.0          |
| Juan      | 50000.0          |
| María     | 60000.0          |
| Carlos    | 55000.0          |
| Ana       | 48000.0          |
| Pedro     | 70000.0          |
| Laura     | 52000.0          |
| Javier    | 48000.0          |
| Carmen    | 65000.0          |
| Miguel    | 51000.0          |
| Elena     | 55000.0          |
| Diego     | 72000.0          |
| Sofía     | 49000.0          |
| Andrés    | 60000.0          |
| Isabel    | 53000.0          |
| Raúl      | 68000.0          |
| Patricia  | 47000.0          |
| Alejandro | 71000.0          |
| Natalia   | 54000.0          |
| Roberto   | 49000.0          |
| Beatriz   | 63000.0          |
+-----------+------------------+
```
### Muestra la fecha actual.
```sql
select current_date as fecha_actual from empleados limit 1;
```
```sql
+--------------+
| fecha_actual |
+--------------+
| 2024-01-17   |
+--------------+
```
### Calcula el promedio de salarios de todos los empleados.
```sql
select avg(salario) as promidio_salario from empleados;
```
```sql
+------------------+
| promidio_salario |
+------------------+
| 56666.6666666667 |
+------------------+
```
### Convierte la cadena '123' a un valor entero.
```sql
select cast('123' as integer) as valor_entero;
```
```sql
+--------------+
| valor_entero |
+--------------+
| 123          |
+--------------+
```
### Concatena el nombre y el departamento de cada empleado.
```sql
select nombre || ' ' || departamento as nombre_departamento from empleados;
```
```sql
+---------------------------+
|    nombre_departamento    |
+---------------------------+
| Juan Ventas               |
| Juan Ventas               |
| María TI                  |
| Carlos Ventas             |
| Ana Recursos Humanos      |
| Pedro TI                  |
| Laura Ventas              |
| Javier Recursos Humanos   |
| Carmen TI                 |
| Miguel Ventas             |
| Elena Recursos Humanos    |
| Diego TI                  |
| Sofía Ventas              |
| Andrés Recursos Humanos   |
| Isabel TI                 |
| Raúl Ventas               |
| Patricia Recursos Humanos |
| Alejandro TI              |
| Natalia Ventas            |
| Roberto Recursos Humanos  |
| Beatriz TI                |
+---------------------------+
```
### Concatena el nombre y el departamento de cada empleado con un guion como separador.
```sql
```
```sql
```
### Categoriza a los empleados según sus salarios.
```sql
```
```sql
```
### Calcula la suma total de salarios de todos los empleados.
```sql
```
```sql
```
### Redondea el salario de todos los empleados a dos decimales.
```sql
```
```sql
```
### Muestra la longitud de cada nombre de empleado.
```sql
```
```sql
```
### Cuenta el número total de empleados en cada departamento.
```sql
```
```sql
```
### Muestra la hora actual.
```sql
```
```sql
```
### Convierte el salario a un valor de punto flotante.
```sql
```
```sql
```
### Muestra los primeros tres caracteres de cada nombre de empleado.
```sql
```
```sql
```


## Order By and Like.
### Empleados en el departamento de 'Ventas' con salarios superiores a 52000.
```sql
```
```sql
```
### Empleados cuyos nombres contienen la letra 'a' y tienen salarios ordenados de manera ascendente.
```sql
```
```sql
```
### Empleados en el departamento 'Recursos Humanos' con salarios entre 45000 y 55000.
```sql
```
```sql
```
### Empleados con salarios en orden descendente, limitando a los primeros 5 resultados.
```sql
```
```sql
```
### Empleados cuyos nombres comienzan con 'M' o 'N' y tienen salarios superiores a 50000.
```sql
```
```sql
```
### Empleados en el departamento 'TI' o 'Ventas' ordenados alfabéticamente por nombre.
```sql
```
```sql
```
### Empleados con salarios únicos (eliminando duplicados) en orden ascendente.
```sql
```
```sql
```
### Empleados cuyos nombres terminan con 'o' o 'a' y están en el departamento 'Ventas'.
```sql
```
```sql
```
### Empleados con salarios fuera del rango de 55000 a 70000, ordenados por departamento.
```sql
```
```sql
```
### Empleados en el departamento 'Recursos Humanos' con nombres que no contienen la letra 'e'.
```sql
```
```sql
```