USE emple01;
/*select * from emp;
---------
select * from depto;
-------------
select * from emp where puesto='contable';
-----------
select * from emp where puesto='contable' order by nomemp asc;
-----------
select * from emp where puesto='contable' order by nomemp desc;
-----------
select nomemp,sal from emp;
--------------
select nomdep from depto;
--------------
select nomdep from depto order by nomdep asc;
-----------------
select nomdep from depto order by localidad asc;
-----------
select nomdep from depto order by localidad desc;
------------
select nomemp,puesto from emp order by sal asc;
----------------------
select nomemp,puesto from emp order by puesto and sal asc;
-----------------------
select nomemp,puesto from emp order by puesto desc, sal asc;
--------------------
select sal,comision from emp where numdep='3';
-----------------------
select sal,comision from emp where numdep='3' order by comision;
---------------
select comision from emp;
select distinct comision from emp;
-----------------
select comision,nomemp from emp;
--------------------
select nomemp, sal from emp;
----------------------
select distinct sal, comision from emp;
----------------------
select sal+1000 from emp where numdep='3';
-------------------------
select sal,sal+1000 from emp where numdep='3';
--------------------------
select nomemp from emp where comision>(sal/2);
-------------------------
select nomemp from emp where comision>=(sal*0.25);
-------------------------
select nomemp as "Nombre", puesto as "Puesto" from emp;
---------------------------------
select concat(nomemp, ' ', puesto) from emp; */

#------------A PARTIR DEL 26--------------
#26 Halla el salario y la comisión de los empleados cuyo número de empleado supera a 7500.
select sal, comision from emp where numemp>7500;

#27 Si dividimos los empleados en dos grupos, A y B, empezando los del grupo B en la letra J, obtén los nombres y empleos de los del grupo B, por orden alfabético.
select nomemp as "grupo B", puesto from emp where nomemp between "j" and "z" order by nomemp;

#28 Obtén el salario, la comisión y el salario total (salario + comisión) de los empleados con comisión, ordenado por número de empleado.
select sal, comision, sal+comision from emp where comision is not null order by numemp;

#29 Ídem pero para los que no tienen comisión.
select sal, ifnull(comision,0) as comision, ifnull(sal+comision,sal) as "sal+comision" from emp where comision is null order by numemp;

#30 Halla el porcentaje que supone la comisión sobre el salario total ordenando por nombre.
select (comision/sal)*100 from emp where comision is not null order by nomemp;

#31 Halla los empleados del departamento 1 cuyo nombre no contiene la cadena "LA".
select nomemp from emp where numdep=1 and nomemp not like '%la%';

#32 Obtén los nombres de los departamentos que no sean de "VENTAS" ni de "ADMINISTRACION", ordenados por localidad.
select nomdep from depto where nomdep not in  ("ventas" , "ADMINISTRACIÓN") order by localidad;

#33 Deseamos conocer el nombre y departamento de los comerciales que no trabajan en el departamento 1 y cuyo salario es superior a 800, ordenados por la fecha de incorporación.
select nomemp, nomdep from emp e, depto d where e.numdep=d.numdep and e.puesto="comercial" and e.numdep!=1 and sal>800 order by feccont

#34 Para los empleados que tienen comisión obtén sus nombres en orden alfabético y el cociente entre salario y comisión.
select nomemp, sal/comision as cociente from emp where comision is not null and sal/comision is not null order by nomemp;

#35 Obtén información de los empleados cuyo nombre contiene exactamente cinco caracteres.
select * from emp where nomemp like '_____';

#36 Ídem pero cuyos nombres contengan al menos cinco caracteres.
select * from emp where  char_length(nomemp)>5;

#37 Halla los datos de los empleados para los que, su nombre comienza por A y su salario es mayor que 1000, o, reciben comisión y trabajan en el departamento 3.
select* from emp where nomemp like 'a%' and sal>1000 or comision>0 and numdep=3;

#38 Halla el nombre y salario total de todos los empleados ordenado por este último y por su propio salario.
select nomemp, ifnull(sal+comision,sal) as"salario total" from emp  order by "salario total", sal;

#39 Obtén los nombres, salarios y comisiones de los empleados que perciben un salario situado entre la mitad de la comisión y la propia comisión.
select nomemp, sal, comision from emp where sal between (comision/2) and comision;

#40 Obtén el complementario del anterior.
select nomemp, sal, comision from emp where sal not between (comision/2) and comision;

#41 Muestra los nombres y empleos de los empleados tales que su empleo acaba en "BLE" y su nombre empieza por A usando funciones (rigth y left).
select nomemp, puesto from emp where left(nomemp,1)='a' and right(puesto,3)='ble';

#42 Intenta obtener el mismo resultado usando un predicado simple (con una expresión regular).
select nomemp, puesto from emp where nomemp like 'a%' and puesto like '%ble';

#43 Halla los nombres de los empleados que tienen como máximo cinco caracteres en su nombre.
select nomemp from emp where char_length(5);

#44 Suponiendo que el año próximo la subida del total percibido por empleado es del 6% y el siguiente del 7%, halla los nombres y salarios totales actuales y futuros de todos los empleados, indicando para cada uno si tienen o no comisión.
select nomemp, sal, (sal+sal*0.6)+ifnull(comision,0) as "subida_1", (sal+sal*0.7)+ifnull(comision,0) as "subida_2", ifnull(comision,0) from emp;

#45 Halla el nombre y la fecha de ingreso de los empleados que no son vendedores.
select nomemp, feccont from emp where puesto!="comercial";

#46 Obtén la información disponible de los empleados de cuyo número de empleado sea alguno de los siguientes: 7844, 7900, 7521, 7782, 7934, 7678 y 7369, pero no uno de entre: 7902, 7839, 7499 ni 7878.
select* from emp where numemp  in  (7844, 7900, 7521, 7782, 7934,7678,7369);

#47 Halla los salarios totales de todos los empleados.
select sal+ifnull(comision,0) from emp;

#48 Ordena los empleados por su departamento y luego de manera descendente por su número.
select nomemp, numdep, numemp from emp order by numdep desc, numemp asc;

#49 Para los empleados que tienen como director a algún otro con número mayor que el suyo, obtén los que reciben de salario más de 1000 y menos de 2000, o están en el departamento 3.
select *  from emp e, depto d where d.numdep=e.numdep and d.codjefe>e.numemp and sal between 1000 and 2000 or e.numdep=3;
select* from emp e where numemp>(select codjefe from depto d where e.numdep=d.numdep) and (sal between 1000 and 2000 or numdep=3);

#50 Obtén el salario más alto de la empresa, el total destinado a comisiones y el número de empleados.
select max(sal), sum(comision), count(nomemp) from emp;

#51 Halla el nombre del último empleado por orden alfabético.
select nomemp from emp  order by nomemp desc limit 1;

#52 Halla el salario más alto, el más bajo y la diferencia entre ellos.
select max(sal), min(sal),max(sal)-min(sal) from emp;

#53 ¿Cuántos empleos diferentes, empleados y diferentes salarios encontramos en el departamento 3, y a qué cantidad asciende la suma de los salarios de dicho departamento?
select count(distinct puesto), count(nomemp), count(distinct sal), sum(sal) from emp where numdep=3;

#54 ¿Cuántos empleados tienen comisión?
select count(comision) from emp where comision>0;

#55 ¿Cuántos empleados tiene el departamento 2?
select count(numdep) from emp where numdep=2;

#56 Halla los departamentos que tienen más de tres empleados y el número de empleados de los mismos.
select count(numemp), e.numdep, d.nomdep from emp e, depto d where e.numdep=d.numdep group by e.numdep having count(nomemp)>3;

#57 ¿Qué puestos distintos existen en la empresa y cuántos empleados desempeñan cada uno?.
#58 Halla la suma de los salarios de cada departamento.
#59 Halla los empleados del departamento 3 por orden descendente de comisión.

#60 ¿Cuáles son los dos empleados con los mayores salarios?
select * from emp order by sal desc limit 2;

#61 Halla los datos de los empleados cuyo salario es mayor que el del empleado de código 7934, ordenando por el propio salario.
select* from emp where sal>(select sal from emp where numemp=7934) order by sal;

#62 Obtén información en la que se reflejen los nombres, empleos y salarios tanto de los que superan el salario de Allen como del propio Allen.

#63 ¿Quiénes reciben el salario más alto y más bajo, y a cuánto ascienden?. 
select nomemp, sal from emp where sal=(select max(sal) from emp) or sal=(select min(sal) from emp);

#64 Halla los empleados cuyo salario supera o coincide con la media del salario de la empresa.
#65 Obtén los empleados cuyo salario supera al de sus compañeros de departamento.
#66 Obtén los empleados del departamento 1 que tienen el mismo empleo que alguien del departamento de "VENTAS".
#67 Obtén información sobre los empleados que tienen el mismo trabajo que los empleados que trabajan en Pontevedra.
#68 Obtén todos los departamentos sin empleados.
#69 Halla el departamento cuya suma de salarios sea la más alta. Halla también la mencionada suma.
#70 Obtén los empleados que no son supervisados por ningún otro.
#71 Halla el nombre de los empleados que, teniendo un salario superior a 1000, tienen como director al empleado de código 7499
#72 Halla el conjunto complementario del resultado del ejercicio anterior.
#73 Para los empleados que tienen como jefe a algún otro con número menor que el suyo, obtén los que reciben de salario más de 1000 y menos de 2000, o están en el departamento 3.
#74 Halla la media de los salarios de los departamentos cuyo salario mínimo supera a 900, considerando los salarios inferiores a 5000. Además se necesita el código y el nombre de los departamentos.  

#75 Determina las localidades que son sede de departamentos que no tienen empleados, y en las que trabajan al menos cuatro empleados, indicando el número de empleados que trabaja en cada una.
select localidad from depto where numdep not in (select distinct numdep from emp) union select d.localidad from depto d, emp e where d.numdep=e.numdep group by d.numdep having count(e.numemp)>4;

#76 ¿Qué empleados trabajan en ciudades que tienen más de cinco letras?. Ordena el resultado inversamente por ciudades y normalmente por nombres de empleados.
select nomemp from emp e, depto d where e.numdep=d.numdep and localidad like '______%' order by localidad desc,nomemp;

#77 Halla los jefes que tienen por lo menos un empleado a su cargo, ordenados inversamente por nombre.
select nomemp, codjefe from emp e, depto d where d.numdep=e.numdep group by codjefe having count(nomemp>1) order by nomemp desc;

#78 Halla los empleados que no tienen a otro empleado a sus órdenes.
select nomemp, codjefe from emp e, depto d where d.numdep=e.numdep group by codjefe  having count(nomemp<1) order by nomemp desc;

#79 ¿Cuántos empleos hay en cada departamento y cuál es la media anual del salario de cada uno?. Incluye en el resultado el nombre del departamento para clarificar el resultado.

#80 Obtén los empleados que trabajan en Santiago o en Vilagarcía.
select e.nomemp, d.localidad from emp e right join depto d on (e.numdep=d.numdep) where localidad in ('santiago', 'vilagarcia');

#81 Obtén un listado en el que se reflejen el código y el nombre de cada supervisor, junto al número de empleados que supervisa directamente. Si son jefes de un departamento pero no tienen empleados a su cargo también deberían aparecer.
select j.nomemp, j.numemp, e.numemp from emp j, depto d, emp e where e.numdep=d.numdep and d.codjefe=j.numemp;

select j.numemp, j.nomemp, e.numemp from depto d left join emp e on (d.numdep=e.numdep) join emp j on (d.codjefe=j.numemp);

#82 Halla los empleados con salario mayor de cada departamento. Se debe incluir el salario y el nombre del departamento.
select nomemp, nomdep, sal from emp e1, depto d where e1.numdep=d.numdep and sal=(select max(sal) from emp e2 where e2.numdep=d.numdep);

#83 Para cada departamento halla la suma del salario, el código y el nombre del departamento si éste tiene al menos dos empleados y la media de los salarios del departamento es mayor que la media de los salarios de todos los empleados.
#84 Comprueba si algún empleado que sea jefe de un departamento que no sea el suyo.
select e.* from emp e, depto d where e.numemp=d.codjefe and e.numdep!=d.numdep;