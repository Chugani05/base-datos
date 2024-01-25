-- Tablas iniciales:
-- Tabla Pokemon
/**
+----+------------+---------+-------+
| id |   nombre   | id_tipo | nivel |
+----+------------+---------+-------+
| 1  | Bulbasaur  | 3       | 10    |
| 2  | Charmander | 2       | 12    |
| 3  | Squirtle   | 1       | 8     |
| 4  | Pikachu    | 4       | 15    |
| 5  | Geodude    | 5       | 11    |
| 6  | Vaporeon   | 1       | 25    |
| 7  | Flareon    | 2       | 27    |
| 8  | Ivysaur    | 3       | 18    |
| 9  | Jolteon    | 4       | 22    |
| 10 | Cubone     | 5       | 14    |
| 11 | Gyarados   | 1       | 30    |
| 12 | Arcanine   | 2       | 35    |
| 13 | Exeggutor  | 3       | 40    |
| 14 | Raichu     | 4       | 38    |
| 15 | Sandslash  | 5       | 33    |
| 16 | Venusaur   | 3       | 45    |
| 17 | Charizard  | 2       | 50    |
| 18 | Blastoise  | 1       | 55    |
| 19 | Electabuzz | 4       | 48    |
| 20 | Rhydon     | 5       | 52    |
| 21 | Dragonite  | 2       | 60    |
| 22 | Flareon    | 2       | 65    |
| 23 | Venusaur   | 3       | 70    |
| 24 | Zapdos     | 4       | 75    |
| 25 | Rhydon     | 5       | 80    |
+----+------------+---------+-------+
**/
-- Tabla Tipo
/**
+----+-----------+
| id |  nombre   |
+----+-----------+
| 1  | Agua      |
| 2  | Fuego     |
| 3  | Planta    |
| 4  | Eléctrico |
| 5  | Tierra    |
+----+-----------+
**/

-- Actualizar el nivel de Bulbasaur.
update Pokemon set nivel=12 where nombre='Bulbasaur';
select * from pokemon where nombre='Bulbasaur';
/**
+----+-----------+---------+-------+
| id | nombre    | id_tipo | nivel |
+----+-----------+---------+-------+
| 1  | Balbasaur | 3       | 12    |
+----+-----------+---------+-------+
**/
-- Cambiar el tipo de Pikachu a "Eléctrico/Rojo".
update Tipo set nombre='Eléctrico/Rojo' where id= (select id_tipo from Pokemon where nombre='Pikachu');
select * from Pokemon as p, Tipo as t where p.id_tipo=t.id and p.nombre="Pikachu";
/**
+----+---------+---------+-------+----+----------------+
| id | nombre  | id_tipo | nivel | id |     nombre     |
+----+---------+---------+-------+----+----------------+
| 4  | Pikachu | 4       | 15    | 4  | Eléctrico/Rojo |
+----+---------+---------+-------+----+----------------+
**/
-- Incrementar el nivel de todos los Pokémon de tipo Agua.
update pokemon set nivel = nivel + 1 where id_Tipo = (select id from Tipo where nombre = 'Agua');
select * from  Pokemon as p,Tipo as t where p.id_tipo=t.id and t.nombre="Agua";
/**
+----+-----------+---------+-------+----+--------+
| id |  nombre   | id_tipo | nivel | id | nombre |
+----+-----------+---------+-------+----+--------+
| 3  | Squirtle  | 1       | 9     | 1  | Agua   |
| 6  | Vaporeon  | 1       | 26    | 1  | Agua   |
| 11 | Gyarados  | 1       | 31    | 1  | Agua   |
| 18 | Blastoise | 1       | 56    | 1  | Agua   |
+----+-----------+---------+-------+----+--------+
**/
-- Eliminar a Jynx de la lista de Pokémon.
delete from Pokemon where nombre='Jynx';
select * from Pokemon where nombre='Jynx';
-- No genera tabla porque no existe Jynx
 - Eliminar el tipo "Hielo" de la lista de tipos de Pokémon.

 - Obtener todos los Pokémon.

 - Obtener el nombre y nivel de los Pokémon de tipo Fuego.

 - Obtener el nombre de los Pokémon que tienen un nivel superior a 30.

 - Obtener el nombre de los Pokémon ordenados por nivel de forma descendente.

 - Obtener la cantidad de Pokémon por tipo.

 - Obtener la información completa de un Pokémon específico. Selecciona el que desees.

 - Obtener el promedio de niveles de todos los Pokémon.

 - Obtener el nombre del Pokémon de mayor nivel.

 - Actualizar el nombre de Bulbasaur a "Bulbasaur Nv. 15":

 - Obtener los Pokémon cuyo nivel es igual a 50.

 - Eliminar todos los Pokémon de nivel 40.

 - Obtener el tipo y nivel de Pikachu.

 - Obtener los Pokémon de tipo Planta con nivel superior a 20:

 - Actualizar el tipo de Pikachu a "Eléctrico/Azul":

 - Eliminar todos los Pokémon de tipo Planta.

 - Obtener los Pokémon con nombre y tipo ordenados alfabéticamente.

 - Obtén todos los Pokémon cuyos nombres contienen las letras 'sa'.

 - Encuentra todos los Pokémon cuyo nivel es 40, 50 o 60.

 - Obtén todos los Pokémon de tipo Fuego cuyos nombres comienzan con la letra 'C'.

 - Encuentra los nombres y tipos de los Pokémon cuyo nivel es mayor que el promedio de todos los Pokémon en la base de datos.