use empresa_ventas;
/*Indica las sentencias del DCL necesarias para crear los siguientes usuarios y asignarles los permisos
necesarios sobre la base de datos “empresa_ventas”:
1. Usuario: emp01. Permisos: leer en todas las tablas*/
create user 'emp01@servidor' identified by  '1234';
grant select on empresa_ventas.* to 'emp01@servidor';

/*2. Usuario: emp02. Permisos: leer en tabla clientes*/
create user 'emp02@servidor' identified by '1234';
grant select, update on empresa_ventas.clientes  to 'emp02@servidor';
grant select, update on empresa_ventas.empleados to 'emp02@servidor';

/*3. Usuarios: emp03 y emp04. Permisos: leer, y actualizar datos en las tablas cliente y empleados*/
create user 'emp03@servidor';
create user 'emp04@servidor';
grant select, update on empresa_ventas.clientes to 'emp03@servidor', 'emp04@servidor';
grant select, update on empresa_ventas.empleados to 'emp03@servidor', 'emp04@servidor';

/*4. Cambia la contraseña del usuario emp04 por 123.*/
alter user 'emp04@servidor' identified;
set password for 'emp04@servidor'='contraseña';

/*5. Usuario: emp05. Permisos: todos los permisos en las tablas cliente y empleados, excepto conceder permisos a
otros usuarios.*/
create user 'emp05@servidor';
grant all privileges on empresa_ventas.clientes to 'emp04@servidor';
grant all privileges on empresa_ventas.empleados to 'emp04@servidor';

/*6. Usuario: emp06. Permisos:
- todos los permisos en la tablas clientes, y además conceder permisos a otros usuarios.
- Mostrar los datos de la tabla empleados;*/
create user 'emp06@servidor';
grant all privileges on empresa_ventas.clientes to 'emp06@servidor' with grant option;
select * from empleados;

/*7. Usuario: emp07. Permisos:
- ver el IdEmpleado, apellido y oficio de los empleados.
- Modificar el oficio de los empleados*/
create user 'emp07@servidor';
grant select (idempleado, apellido, oficio) on empresa_ventas.empleados to 'emp06@servidor';

/*8. Usuarios: emp08, emp09. Permisos:
- Pueden ver todos los atributos de todas las tablas (excepto el salario y comisión de los empleados
- Puede realizar cualquier acción con la tabla pedidos
- Puede modificar el stock de los productos.*/
create user emp08 identified by "emp08";
create user emp09 identified by "emp09";
select concat('grant select on empresa_ventas.',table_name,' to emp08, emp09;') from information_schema.tables 
	where table_schema='empresa_ventas' and table_name!='empleados';
grant select on empresa_ventas.clientes to emp08, emp09;
grant select on empresa_ventas.departamentos to emp08, emp09;
grant all on empresa_ventas.pedidos to emp08, emp09;
grant select on empresa_ventas.productos to emp08, emp09;
grant select (idempleado,apellido,oficio,idjefe,fecha_alta,iddepartamento,telefono) on empresa_ventas.empleados to emp08,emp09;
grant update (stock_disponible) on empresa_ventas.productos to emp08,emp09;
select * from mysql.tableS_priv;

/*9. Usuario: emp10. Permisos:
- Tendrá control total sobre todas las BD si se conecta de manera local al servidor, con posibilidad de
conceder permisos a otros usuarios.
- Tendrá control total sobre las tablas empresa.empleados y empresa.clientes si se conecta desde la IP que
utilices en la máquina real para conectarte al servidor.*/
create user emp10@localhost identified by "emp10";
create user emp10@10.0.2.15 identified by "emp10";
grant all on *.* to emp10@localhost with grant option;
grant all on empresa_ventas.empleados to emp10@10.0.2.15;
grant all on empresa_ventas.clientes to emp10@10.0.2.15;

10. Quita al usuario emp10 todos los permisos que tenía sobre la tabla empleados
11. Modifica el usuario emp08 para que no pueda modificar ningún dato de la BD.
12. Borra el usuario emp09.
13. El usuario emp10 está de baja temporal y en lugar de borrarlo debemos impedir que se conecte a la BD, para
ello no tendrá ningún permiso sobre ninguna BD.
14. De que 2 maneras podemos hacer que el SGBD haga efectivos los cambios de permisos que hemos introducido
mediante comandos?:
15. Usuario: emp11. Permisos:
- puede hacer SELECT sobre la tabla empleados cuando se conecta desde el propio servidor.
- puede hacer SELECT sobre la tabla pedidos cuando se conecta desde el equipo 10.0.0.2
- puede hacer SELECT sobre la tabla clientes cuando se conecta desde cualquier lugar.
16. En estas condiciones,
- ¿puede emp11 hacer SELECT sobre la tabla clientes cuando se conecta desde el propio servidor?
- ¿puede emp11 hacer SELECT sobre la tabla clientes cuando se conecta desde el equipo 10.0.0.2?
- ¿puede emp11 hacer SELECT sobre la tabla clientes cuando se conecta desde un equipo que se encuentra
en la red 192.168.26.0 / 24?
17. Usuario: emp12. Permisos:
- puede hacer SELECT sobre los siguientes atributos de la tabla empleados (IdEmpleado,apellido,oficio)
cuando se conecta desde el propio servidor.
18. Revoca al usuario el permiso de ver el oficio en la tabla empleados
19. Revoca al usuario todos los permisos sobre todas las bases de datos.
20. Usuario: emp13. Permisos:
2
- puede hacer SELECT, UPDATE y DELETE sobre las tablas empleados, departamentos, pedidos cuando se
conecta desde cualquier lugar.
21. Revoca al usuario emp13 todos los permisos sobre todas las bases de datos.
22. Mostrar con SELECT los usuarios del SGBD que empiezan por emp (nombre, equipo desde el que se puede
conectar y hash del password).
23. Elimina todos los usuarios que empiecen por “emp”.*/

