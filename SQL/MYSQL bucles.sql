/*1. Utilizando el comando IF, crea un procedimiento ‘siDivisible’ que reciba 2
números y muestre sí el primero es divisible por el segundo. Por ejemplo, si
introducimos los números 4 y 2. El procedimiento deberá mostrar el mensaje: 4 es
divisible por 2.*/

USE pruebas;
DROP PROCEDURE IF EXISTS pr_divisible;
delimiter /
CREATE PROCEDURE pr_divisible(IN par_uno INT, IN par_dos INT)
BEGIN
	IF par_uno % par_dos = 0 THEN SELECT  CONCAT(par_uno, ' si es divisible entre ', par_dos);
    ELSE SELECT CONCAT(par_uno, ' no es divisible entre ', par_dos);
    END IF;
END;

/
delimiter ;

CALL pr_divisible(36,5) 

/* 2. Utilizando el comando CASE, crear un procedimiento ‘notasPrimaria’ que
reciba dos parámetros: p_Numero
(nota de un alumno) y p_Nombre (nombre del alumno). El procedimiento deberá
mostrar un mensaje con el siguiente formato y según el siguiente baremo:
- si la nota está entre 9 y 10, deberá mostrar “el alumno [nombre] tiene un
Sobresaliente”.
- si la nota está entre 7 y 8, deberá mostrar “el alumno [nombre] tiene un
Notable”.
- si la nota es un 6, deberá mostrar “el alumno [nombre] tiene un Bien”.
- si la nota es un 5, deberá mostrar “el alumno [nombre] tiene un Suficiente”.
- si la nota es menor que 5, deberá mostrar “el alumno [nombre] tiene un
Insuficiente” */

DROP PROCEDURE IF EXISTS pr_notasprimaria;
delimiter /
CREATE procedure pr_notasprimaria(in nota_alumno INT, in nombre_alumno varchar(50))
begin
	CASE
    
	when nota_alumno=9 or nota_alumno=10 then select concat(' el alumno ', nombre_alumno, ' tiene un
	Sobresaliente');
    
	when nota_alumno=7 or nota_alumno=8 then select concat(' el alumno ', nombre_alumno, ' tiene un
	Notable');
 
	when nota_alumno=6 then select concat(' el alumno ', nombre_alumno, ' tiene un
	Bien');

	when nota_alumno=5 then select concat(' el alumno ', nombre_alumno, ' tiene un
	Suficiente');

	when nota_alumno=4 then select concat(' el alumno ', nombre_alumno, ' tiene un
	Insuficiente');

	else select "nota no registrada";

end case;
end;
 /
delimiter ;

call pr_notasprimaria(8, 'Brais')

/*3. Modifica el procedimiento anterior para tener en cuenta que el usuario puede
introducir una nota que no sea un valor entre 0 y 10. En ese caso, el procedimiento
deberá mostrar el siguiente mensaje: ‘Nota incorrecta, debe introducir una nota entre
0 y 10’.*/

DROP PROCEDURE IF EXISTS pr_notasprimaria;
delimiter /
CREATE procedure pr_notasprimaria(in nota_alumno INT, in nombre_alumno varchar(50))
begin
	CASE
    
	when nota_alumno=9 or nota_alumno=10 then select concat(' el alumno ', nombre_alumno, ' tiene un
	Sobresaliente');
    
	when nota_alumno=7 or nota_alumno=8 then select concat(' el alumno ', nombre_alumno, ' tiene un
	Notable');
 
	when nota_alumno=6 then select concat(' el alumno ', nombre_alumno, ' tiene un
	Bien');

	when nota_alumno=5 then select concat(' el alumno ', nombre_alumno, ' tiene un
	Suficiente');

	when nota_alumno<4  then select concat(' el alumno ', nombre_alumno, ' tiene un
	Insuficiente');

	else select 'Nota incorrecta, debe introducir una nota entre
	0 y 10';

end case;
end;
 /
delimiter ;

call pr_notasprimaria(11, 'Brais')

/*4. Utilizando un bucle REPEAT, crea un procedimiento que muestre la suma de
los números pares comprendidos entre 100 y 90 (100-98-96-94-92-90).*/

DROP PROCEDURE IF EXISTS pr_buclepares;
delimiter /
	create procedure pr_buclepares()
	begin
    declare v_cont int default 100;
    declare v_suma int default 0;
    repeat
    set v_suma=v_suma+v_cont;
    set v_cont=v_cont-2;
	until v_cont<90 
    end repeat;
  select v_suma;
end;
/
delimiter ;

call pr_buclepares()

/*5. Utilizando un bucle WHILE, crea un procedimiento que muestre la suma de los
100 primeros números naturales (1-2-............-99-100)*/

DROP PROCEDURE IF EXISTS pr_sumanaturales;
delimiter /
	create procedure pr_sumanaturales()
	begin
		declare v_cont int default 1;
        declare v_suma int default 0;
  while v_cont <= 100 do 
	set v_suma=v_suma+v_cont;
    set v_cont=v_cont+1;
  end while;
  select v_suma;
end;
/
delimiter ;

call pr_sumanaturales()


/*6. Utilizando un bucle LOOP, crear un procedimiento que muestre la suma de los
números pares comprendidos entre 1 y 20 excepto el 10 (2-4-6-8-12-14-16-18-20).*/
DROP PROCEDURE IF EXISTS pr_suma20;
delimiter /
	create procedure pr_suma20()
	begin
		declare v_cont int default 2;
        declare v_suma int default 0;
        simple_loop: Loop
			set v_suma=v_suma+v_cont;
            set v_cont=v_cont+2;
		if v_cont<=8 then set v_cont=v_cont+4;  
        end if; 
        if v_cont>20 then leave simple_loop;
        end if;
        end loop simple_loop;
        select v_suma;
end;
/
delimiter ;

call pr_suma20()

-- Ejemplo de MERCEDES sin o de saltar o 10.
drop procedure if exists pr_suma;
delimiter /
create procedure pr_suma()
begin
  declare v_suma int default 2;
    declare v_cont int default 0;
  sumador:loop
    if v_cont>20 then leave sumador;
        else set v_suma=v_suma+v_cont;
        end if;
    set v_cont=v_cont+1;
  end loop;
  select v_suma;
end;
/
delimiter ;

call pr_suma()

/*7. Crear un procedimiento ‘operacionesAritméticas’, que reciba 2 números
enteros o decimales y que muestre la suma, resta, producto y división de dichos
números.*/
DROP PROCEDURE IF EXISTS pr_opar;
delimiter /
	create procedure pr_opar (v_num1 int, v_num2 int)
	begin
    
	select v_num1 + v_num2 as 'Suma';
    select v_num1 - v_num2 as 'Resta';
    select v_num1 div v_num2 as 'División' ;
    select v_num1 * v_num2 as 'Multiplicación' ;
end;
/
delimiter ;

call pr_opar(10,2)


/*8. Crear un procedimiento ‘primeros20Impares’ que muestre los 20 primeros
números impares.*/

-- MODO BRAIS
DROP PROCEDURE IF EXISTS pr_bucleimpares;
delimiter /
	create procedure pr_bucleimpares()
	begin
    declare v_cont int default 0;
    declare v_imp int default 0;
    repeat
    set v_imp=v_imp+v_cont;
    set v_cont=v_cont+1;
    if (v_cont%2)!=0 then select v_cont; 
    end if;
	until v_cont>=38
    end repeat;
  select cont;
end;
/
delimiter ;

call pr_bucleimpares()


-- MODO MERCEDES
drop procedure if exists pr_20impares;
delimiter /
create procedure pr_20impares()
begin
    declare v_cont int default 1;
    while v_cont<=40 do
    select v_cont; -- otra forma: if!(v_cont%2) then select v_cont; end if;
        set v_cont=v_cont+2;
  end while;
end;
/
call pr_20impares;

call pr_bucleimpares()


/*9. Modifica el procedimiento anterior para que muestre los 20 números impares
que sigan al número que se indique como parámetro.*/

drop procedure pr_primeros20impares;
delimiter /
create procedure pr_primeros20impares(par_inicio int)
begin
	declare v_primerimpar int;
	declare v_contador int default 0;
    if par_inicio % 2 =0 then
		set v_primerimpar=par_inicio+1;
	else
		set v_primerimpar=par_inicio;
	end if;
    while v_contador<20 do
		select v_primerimpar;
        set v_contador=v_contador+1;
        set v_primerimpar=v_primerimpar+2;
	end while;
end;
/
delimiter ;


-- 10. Crear un procedimiento ˜”fechaLarga” que reciba una fecha
dd-mm-aaaa) y muestra la fecha en formato largo. Por ejemplo: 31-10-2014 debera mostrar: Viernes, 31 de Octubre de 2014.

select date_format(now(),'%W');

drop function fn_fechalarga;
delimiter /
create function fn_fechalarga(par_fecha date) returns varchar(50) no sql
begin
    declare v_retorno varchar(50) default '';
    set v_retorno=concat(date_format(par_fecha,'%W'),', ',date_format(par_fecha,'%e'),' de ',date_format(par_fecha,'%M'),' de ',year(par_fecha));
	return v_retorno;
end;
/
delimiter ;

select fn_fechalarga('2019-04-24');

/*11.	Crear una función que devuelva el siguiente número de departamento que se debe asignar cuando se crea un nuevo departamento (como si fuese un auto_increment de la columna depto_no devolviendo el maximo de la columna depto_no mas 1 al ejecutar la función)*/
drop function if exists fn_incrementar
DELIMITER //
CREATE FUNCTION fn_incrementar() RETURNS int
BEGIN
  declare v_maximo int;
  select max(depto_no) into v_maximo from departamentos;
    set v_maximo=v_maximo + 1;
    return v_maximo;
END
//
delimiter ;

/*12.	Crear una función que devuelva el nombre del jefe de un empleado. La función aceptará como parámetro el número de empleado.*/
drop function if exists fn_jefe;
DELIMITER //
CREATE FUNCTION fn_jefe(v_emp int) RETURNS char
BEGIN
DECLARE v_jefe char;
declare v_apellido char;
	select director  into v_jefe from empleados where emp_no=v_emp;
    select apellido into v_apellido from empleados where emp_no=v_director;
    
    return v_apellido;
END;
//

delimiter ;

/*13.	Modificar la función anterior para que en el caso que no encuentre un jefe válido devuelva “Jefe no encontrado”*/
drop function if exists fn_jefe;
DELIMITER //
CREATE FUNCTION fn_jefe(v_emp int) RETURNS char
BEGIN
DECLARE v_jefe char;
declare v_apellido char;
	select director  into v_jefe from empleados where emp_no=v_emp;
    select apellido into v_apellido from empleados where emp_no=v_director;
    return ifnull(v_apellido, 'jefe no existe');
//

delimiter ;


/*14.	Desarrollar un procedimiento que visualice el apellido, el nombre del jefe y la fecha de alta de todos los empleados ordenados por apellido.*/
drop procedure pr_muestra_emp;
delimiter //
create procedure pr_muestra_emp ()
begin
	select emp_no, apellido, fn_buscajefe (emp_no), fecha_alta from empleados order by apellido;
    end;
    //
    delimiter ;
    
/*15.	Escribir un procedimiento que visualice el apellido y el salario de los cinco empleados que tienen el salario mas alto.*/
drop procedure pr_muestra_emp;
delimiter //
create procedure pr_sal_alto ()
begin
	select apellido, max(sal) from empleados order by sal limit 5;
	end;
	//
	delimiter ;

/*16.	Escribir un procedimiento que muestre el nombre de cada departamento y la cantidad de empleados que tiene.*/
drop procedure fn_cuentaemp;
delimiter //
create function fn_cuentaemp (p_depto int) returns int
begin
	declare v_cant int;
    select count (emp_no) into v_cant from epleados where depto_no=p_depto;
    return v_cant;
    end;
    //
    delimiter ;

/*17.	Modifica el procedimiento anterior para que ademas muestre un listado de los nombres de todos los empleados de ese departamento.*/
	drop procedure pr_emp;
delimiter //
create procedure pr_emp ()
begin
declare v_depno smallint;
declare v_depnombre char;
declare v_salir int default 0;
	declare c_listado cursor for select dep_no, dnombre from departamentos;
    declare continue handler for not found set v_salir=1;
    open c_listado;
    emp_loop:loop
		fetch c_listado into v_depno, v_dnombre;
		if v_salir=1 then leave emp_looop; end if;
        select v_depno, v_nombre;
        end loop;
        close c_listado;
    end;
    //
    delimiter ;

/*18.	Crea un procedimiento que acepte un numero de departamento como parametro y muestre todos los datos de los empleados que trabajan en ese departamento.*/
drop procedure pr_datosemp;
delimiter //
create procedure pr_datosemp (v_numdepto smallint)
begin
	declare v_depno int;
    declare v_dnombre char;
    declare v_cantemp int;
    declare v_salir int default 0;
    declare v_apellido varcahr (20);
	declare c_listado cursor for select dep_no, dnombre, fn_cuentasemp (dep_no) from departamentos;
    declare c_empleados cursor for select apellido from empleados where dep_no=v_depno;
	declare continue handler for not found set v_salir=1;
    open c_listado;
    dep_loop:loop
		fetch c_listado into v_depno,v_dnombre, v_cantemp;
        if v_salir=1 then leave emp_loop; end if;
        select v_depno, v_dnombre, v_cantemp;
        open c_empleados;
        emp_loop:loop
        fetch c_empleados into v_apellido;
        if v_salir=1 then
        set v_salir=0;
        leave emp_loop; end if;
        select v_apellido;
        end loop;
        close c_empleados;
	end loop; 
    close c_listado;
    end;
      //
    delimiter ;


