#1. Mostrar el nombre de los jugadores de los Lakers.
use liga;
select Nombre from jugadores where Nombre_equipo="Lakers";

#2. Mostrar el código, nombre y altura de los jugadores españoles que juegan en los Lakers.
select codigo,nombre, altura from jugadores where Procedencia="spain";

#3. Mostrar el nombre, altura y procedencia de los jugadores españoles y eslovenos que juegan en los Lakers.
select codigo,nombre, altura from jugadores where nombre_equipo="Lakers" and Procedencia="spain" or Procedencia="slovenia";

#4. Mostrar el nombre, altura y procedencia de los jugadores españoles, eslovenos o serbios que juegan en los Lakers.
select nombre,altura,procedencia from jugadores where nombre_equipo="Lakers" and procedencia in ("spain","slovenia","serbia","serbia montenegro");

#5. Mostrar nombre de los jugadores, nombre del equipo y peso los jugadores de la LIGA cuyo peso este entre 270 y 300 libras.
select nombre, nombre_equipo, peso from jugadores where peso between 270 and 300;

#6. Mostrar el nombre del jugador, nombre del equipo y el peso en kilogramos de los jugadores de la LIGA que pesen entre 120 y 150 kilos. Una libra equivales a 0.4535 kilos.
select nombre, nombre_equipo, peso*0.435 as "Peso en KG" from jugadores where peso*0.435 between 120 and 150;

#7. Mostrar el nombre de los jugadores y nombre del equipo de los jugadores de los que se desconoce su procedencia.
select nombre, nombre_equipo from jugadores where procedencia is null;

#8. Mostrar el nombre de los jugadores y nombre del equipo de los jugadores de los que se conoce su procedencia.
select nombre, nombre_equipo from jugadores where procedencia is not null;

#9. Mostrar el nombre del equipo y procedencia de los equipos que empiecen por 'r'.
select nombre_equipo, procedencia from jugadores where nombre_equipo like "r%";

#10. Mostrar el nombre del equipo y procedencia de los equipos que terminen en 'ts'.
select nombre_equipo, procedencia from jugadores where nombre_equipo like "%ts";

#11. Mostrar el nombre del equipo y procedencia de los equipos que contengan el carácter 'p'.
select nombre_equipo, procedencia from jugadores where nombre_equipo like "%p%";

#12. Mostrar el nombre del equipo y procedencia de los equipos que contengan como segunda letra la 'o'.
select nombre_equipo, procedencia from jugadores where nombre_equipo like "_o%";

#13. Mostrar el nombre del equipo y procedencia de los equipos que empiecen por 'r' que terminen por 's' y que tengan 7 caracteres
select nombre_equipo, procedencia from jugadores where nombre_equipo like "r_____s";

#14. Mostrar el nombre del equipo de los 5 primeros equipos.
select nombre from equipos limit 5;

#15. Mostrar el nombre del equipo de los 3 primeros equipos a partir del 5º equipo.
select nombre from equipos limit 5,3;

#16. Mostrar nombre del equipo y división los equipos de la conferencia Oeste ordenados ascendentemente por división.
select nombre, division from equipos where conferencia="west" order by division asc;

#17. Mostrar nombre del equipo y división los equipos de la conferencia Oeste ordenados de forma ascendente por división y de forma descendente por nombre del equipo.
select nombre, division from equipos where conferencia="west" order by division asc, nombre desc;

#18. ¿Cuánto pesa el jugador más pesado de la LIGA?
select nombre, max(peso) from jugadores;

#19. ¿Cuánto mide el jugador más bajito de la LIGA?. Mostrar altura en pies y metros.
select min(cast(replace(trim(altura),'-','.') as decimal (8,2))) from jugadores;

#20. ¿Cuántos jugadores juegan en los Lakers?
select count(*)  from jugadores where nombre_equipo="lakers";

#21. ¿Cuántos jugadores juegan en los Warriors? Utiliza la columna procedencia cómo argumento para la función de resumen?
select count("procedencia") from jugadores where nombre_equipo="warriors";

#22. ¿Cuánto pesan de media los jugadores de los Bulls?
select sum(peso)/15 from jugadores where nombre_equipo="bulls";

#23. Mostrar para cada equipo, el nombre del equipo, nombre y peso del jugador más pesado.
select nombre_equipo,nombre,max(peso) from jugadores group by nombre_equipo;

#24. Mostrar por conferencia, cuántos equipos hay.
select count(*) from equipos group by conferencia;

#25. ¿Cuánto pesan de media los jugadores de España, Italia y Francia?
select avg(peso),procedencia from jugadores where procedencia in ("spain", "italy", "france") group by procedencia; 

#26. Mostrar el nombre de los equipos de la LIGA cuyos jugadores pesen de media más de 228 libras, ordenarlos por la media del peso.
select nombre_equipo,avg(peso) from jugadores group by nombre_equipo having avg(peso)>228 order by avg(peso); 

#27. Seleccionar qué equipos de la LIGA tienen 1 o más jugadores españoles, ordenarlos por nombre del equipo.
select nombre_equipo from jugadores where procedencia="spain" group by nombre_equipo order by 1;

#28. Mostrar el nombre de los jugadores ue juegan en equipos de la división Southwest.
select nombre from jugadores where nombre_equipo in (select nombre from equipos where division='southwest');

#29. Mostrar nombre y altura del jugador más alto de la nba.
select nombre,altura from jugadores where altura in(select max(altura) from jugadores);

#30. Mostrar el nombre de la división de los equipos donde juegan jugadores españoles.
select division from equipos where nombre in (select nombre_equipo from jugadores where procedencia="spain");

#31. Mostrar el nombre de todos los equipos, sí hay jugadores españoles jugando en el equipo 'Raptors'.
select nombre from equipos where exists (select nombre_equipo from jugadores where Procedencia="spain" and Nombre_equipo="raptors");

#32. Mostrar el nombre de los equipos que tienen jugadores españoles.
select nombre from equipos where nombre in (select nombre_equipo from jugadores where Procedencia="spain");

#33. Mostrar el nombre de los equipos que no tienen jugadores españoles.
select nombre from equipos where nombre not in (select nombre_equipo from jugadores where procedencia="spain");

#34. Nombre y peso de todos los jugadores de la nba que pesan más que todos los jugadores españoles.
select nombre, peso from jugadores where peso>= (select max(peso) from jugadores where Procedencia="spain");

#35. Mostrar el nombre y peso de los jugadores base (posición = 'G') que pesan más que cualquier pivot (posición = 'C') de la nba
select nombre, peso from jugadores where posicion="g" and peso>=any(select peso from jugadores where posicion="c");

#36. Mostrar todos los datos del equipo donde juega el jugador más alto de la nba.
select * from equipos where nombre in (select nombre_equipo from jugadores where peso=(select max(peso) from jugadores));

#37. Número de jugadores de cada conferencia
select count(*) from jugadores j, equipos e where j.nombre_equipo=e.nombre group by conferencia;

#38. Nombre de equipo, conferencia y posición de los jugadores que hayan anotado más de 35 puntos en un partido
select nombre_equipo, conferencia, posicion from equipos e, jugadores j, estadisticas est where e.nombre=j.nombre_equipo and j.codigo=est.jugador and Puntos_por_partido>35;

#39. Promedio de altura de los jugadores que pongan más de 1,5 tapones por partido
select avg(altura) from jugadores j, estadisticas t where j.codigo=t.jugador and tapones_por_partido>1.5;

#40. Conferencia y nombre de los equipos local y visitante que hayan jugado partidos finalizados con más de 20 puntos de diferencia en la temporada 07/08
select conferencia, equipo_local, equipo_visitante from equipos e, partidos p where p.equipo_visitante=e.nombre and puntos_visitante-puntos_local>20 or puntos_local-puntos_visitante>20 and temporada="07/08";

#41. Nombre, Equipo, puntos por partido, asistencias por partido, tapones por partido y rebotes por partido de los jugadores españoles en la temporada 07/08
select nombre, nombre_equipo, puntos_por_partido, asistencias_por_partido, tapones_por_partido, rebotes_por_partido from estadisticas e, jugadores j where e.jugador=j.codigo and procedencia="spain" and temporada="07/08";

#42. Para cada jugador, mostrar su nombre, nombre de equipo y puesto en el que juega.
select nombre, nombre_equipo, posicion from jugadores ;

#43. Para cada equipo, mostrar todos los datos del equipo y número de partidos que han jugado como locales.
select distinct e.*, count(equipo_local) from equipos e, partidos p where e.nombre=p.equipo_local group by equipo_local;

#44. Nombres de los equipos que jugaron algún partido resuelto por un solo punto de diferencia y temporada en que se jugó el partido
select distinct nombre, temporada from equipos e, partidos p where e.nombre=p.equipo_local and (puntos_local-puntos_visitante=1 or puntos_visitante-puntos_local=1);

#45. Datos de los equipos que no han ganado ningún partido como visitantes
select* from equipos where nombre in (select equipo_visitante from partidos where puntos_visitante<puntos_local);

/*46. Nombre, peso y equipo de los jugadores cuyo peso coincide con el de otro jugador de su mismo equipo (y nombre del jugador con el que coinciden)
select nombre, peso, nombre_equipo from jugadores where peso in (select peso from jugadores where peso      

#47. Muestra para cada equipo, su nombre y el nombre de los equipos de su misma conferencia.
select nombre from equipos where conferencia (    */  

#48. Nombre, conferencia y número de jugadores de cada equipo. Si un equipo no tiene jugadores debe mostrar un 0.
#49. Número de partidos ganados y perdidos por cada equipo. Si un equipo no tiene partidos, debe mostrar 0.




