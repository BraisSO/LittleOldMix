use empresa
/*Añade un nuevo producto de nombre PRODUCTO_PROBA, con código de fabricante ASU, identificador de 
producto ABCDE y con el mismo precio y existencias que el producto con descripción 3D PRO JOYSTICK */

INSERT INTO produto (cod_fabricante, identificador, descricion, prezo, existencias) select 'ASU', 'ABCDE', 'producto_proba', prezo, existencias from produto where descricion="3D PRO JOYSTICK";

/*Añade un nuevo fabricante a la BD con código AAA y el mismo nombre que el fabricante del pedido 10600, pero 
cambiándole las letras E por A (Por ejemplo, si el fabricante fuese SEAGATE, el fabricante nuevo tendría por 
nombre SAAGATA).*/

insert into fabricante (codigo, nome)
select 'AAA', replace(f.nome,'E','A') from fabricante f, pedido p where f.codigo=p.cod_fabricante and p.numero=10600;

/*Inserta con una sola operación los siguientes valores en la tabla FABRICANTE: ('ASU','ASUS'), ('DEL','DELL'). 
En caso de que la clave de algún registro ya exista en la tabla, no se debe insertar el registro.*/

insert ignore into fabricante (codigo, nome)  values ('ASU','ASUS'), ('DEL','DELL');

/*Inserta con una sola operación los siguientes valores en la tabla FABRICANTE: ('TOS','TOSSSHIBA'),
('LEN','LENOVO'). En caso de que la clave de algún registro ya exista en la tabla, se deben actualizar los datos.*/

insert into fabricante (codigo, nome) values ('TOS','TOSSSHIBA'), ('LEN','LENOVO') on duplicate key update nome=value(nome);

/*Inserta en la tabla FABRICANTE la fila ('KIN', 'KINGSTON'). En caso de que la clave ya exista en la tabla debe 
ponerle el nombre 'THE KING'*/

insert into fabricante (codigo, nome) values ('KING','KINGSTON') on duplicate key update nome='THE KING';

/*Con una sola instrucción, divide la cuota de ventas de todos los empleados de la sucursal de Valencia entre 7 y 
divide también entre 7 el objetivo de la propia sucursal.*/

update empregado e, sucursal s set e.cota_de_vendas=e.cota_de_vendas/7, s.obxectivo=s.obxectivo/7 where e.id_sucursal_traballa=s.identificador and s.cidade='Valencia';

/*Modifica todos los empleados que hayan quedado con una cuota de ventas decimal (no entera) para asignarles 
el entero más alto anterior a su cuota (por ejemplo, si tienen cuota 205.8 deberían pasar a tener 205).*/

update empregado set cota_de_vendas=floor(cota_de_vendas);

-- Incrementa en un mes la fecha de nacimiento de todos los empleados.

update empregado set data_nacemento=adddate(data_nacemento, interval 1 month)

/*Inserta los siguientes productos (con los espacios que se indica en la descripción):
cod_fabricante identificador descricion prezo existencias
SAM 11004 ‘Webcam S270 ‘ 32.37 5Bases de Datos
BD UNIDAD 05
ACTIVIDAD 04
2
SAM 1100X ‘ Unidad USB’ 51.4 4
SAM 1100Y ‘ Joystick 4D JK93 ‘ 50.87 6*/

insert into produto (cod_fabricante, identificador, descricion, prezo, existencias) VALUES ('SAM', "11004", 'Webcam S270   ', 32.37, 5), ('SAM', "1100X", 'Unidad USB         ', 51.4, 4), ('SAM', '1100Y', ' Joystick 4D JK93 ', 50.87, 6);

/*Elimina los espacios que hayan quedado al inicio o al final de la descripción de los productos solo en los que 
tengan espacios en blanco al principio*/

update produto set descricion=trim(descricion) where descricion like ' %';


/*Divide entre 3 el límite de crédito de los clientes cuyo nombre contenga la cadena ‘INFO’ y acabe por A, 
rendondeando el valor a 2 decimales.*/
update cliente set limite_de_credito=round(limite_de_credito/3, 2) where nome like '%INFO%' and nome like'%A';

/*Incrementa el objetivo de las sucursales de la región OESTE en un 6%, y modificar el nombre de la región por 
WEST.*/
update sucursal set  obxectivo=obxectivo*1.06 , rexion="WEST"where rexion="OESTE";

/*Crea una tabla “CONSULTAS” con los campos numemp y numcli para guardar las consultas realizadas por los 
clientes a los empleados. Para probar su funcionamiento, inserta 4 filas en la tabla con valores aleatorios (tanto 
de empleados como de clientes) comprendidos entre 0 y 2000 en el caso de los clientes, y entre 0 y 200 en el 
caso de los empleados.*/
create table consultas (numemp int, numcli int);
insert into consultas (numemp, numcli) 
values (floor(RAND()*200),floor(RAND()*2000)), 
(floor(RAND()*200),floor(RAND()*2000)),
(floor(RAND()*200),floor(RAND()*2000)),
(floor(RAND()*200),floor(RAND()*2000));
select numcli from consultas

/*Crea una tabla CLIENTES_101 con los clientes asignados al empleado 101, y una tabla CLIENTES_VIP con los 
clientes con límite de crédito mayor a 50.000€. Elimina simultáneamente de ambas tablas los clientes que estén 
en las dos a la vez*/

create table clientes_101 select num_empregado_asignado="101", numero from cliente where num_empregado_asignado="101" ;
create table clientes_vip select limite_de_credito>=50000, numero from cliente where limite_de_credito>=50000;

delete clientes_101, clientes_vip from clientes_101, clientes_vip where clientes_101.numero=clientes_vip.numero;

-- Elimina los fabricantes que no suministren ningún producto.
delete fabricante from fabricante where fabricante.codigo not in (select distinct cod_fabricante from produto);

-- Elimina los pedidos de empleados contratados antes del año 2001.
delete pedido from pedido join empregado on pedido.num_empregado=empregado.numero where data_contrato<"2001-01-01";

/*Crea una tabla de nombre FABRICANTE2 que sea una copia de FABRICANTE en estructura y contenido.
Elimina de FABRICANTE2 todos los fabricantes cuyo nombre empiece por ‘S’.*/
create table fabricante2 select * from fabricante;
delete from fabricante2 where nome like "s%";

 /*Elimina de FABRICANTE2 todos los registros excepto ASUS, TOSHIBA y WESTERN DIGITAL*/
delete from fabricante2 where nome not in ("Asus", "toshiba", "western digital");

 -- Elimina todas las filas de la tabla FABRICANTE2 de la forma más rápida y menos costosa posible.
truncate fabricante2;
