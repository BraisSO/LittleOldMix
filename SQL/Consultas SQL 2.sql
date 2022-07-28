use ventas;

/*1. Inserta en la tabla departamentos un nuevo departamento con código 50 y sede en “SANTIAGO” que tendrá por
nombre “operaciones”.*/
insert into departamentos (dep_no, dnombre, localidad) values ("50", "santiago", "operaciones");

/*2. Asigna a dicho departamento al empleado “Lopez”, que como será el jefe de ese departamento no tendrá
director asignado.*/
update empleados set director=null, dep_no='50' where apellido='lopez';

/*3. Inserta con los códigos 8000, 8001 y 8002 a los empleados “MARTINEZ”, “PEREZ” y “RODRIGUEZ”, analistas
que acaban de ser contratados por el departamento de operaciones. Sus salarios serán respectivamente de
1000, 1100 y 1200€, sin comisiones. Su director será el 7521.*/
insert into empleados (emp_no, apellido, salario, director) values ('8000','martinez', 1000, '7521'), ('8001', 'perez', 1100, '7521'), ('8002', 'rodriguez', 1200, '7521');

/*4. Asignar una comisión de 2.000€ a los vendedores que no ganan nada en concepto de comisión*/
update empleados set comision=2000 where comision=null or comision=0;

/*5. Actualizar con una sola operación el pedido 1000 de modo que aumente en 1 unidad el producto comprado y se
reduzca en una unidad el stock disponible del producto vendido.*/
update pedidos, productos set pedidos.unidades=pedidos.unidades+1, productos.STOCK_DISPONIBLE=productos.STOCK_DISPONIBLE-1 where pedidos.PRODUCTO_NO=productos.producto_no and pedido_no="1000";

/*6. El pedido 1000 no ha sido pagado, por ese motivo debemos añadir al debe del cliente el importe del pedido.*/
!!!!!!!!!!!!!!!!!!!!!!!!!!!

/*7. Inserta un nuevo departamento con código 0, nombre “DESCONOCIDO” y sede “DESCONOCIDA”.*/
insert into departamentos (dep_no, dnombre, localidad) values ("0", 'desconocido', 'desconocida');

/*8. Copia todos los empleados entre el 7839 y el 7876, poniéndoles como código el código actual menos 7838. Su
fecha de contratación debe ser la fecha actual.*/
update empleados set empleados.emp_no=empleados.emp_no-7838, fecha_alta=now() where emp_no between 7839 and 7876;

/*9. Crea una nueva tabla de “EMP_CONT” con la misma estructura que la tabla de empleados, e inserta en ella los
empleados del departamento de contabilidad.*/
create table emp_cont like empleados;
delete from emp_cont;
insert into emp_cont (emp_no,apellido,oficio,director,FECHA_ALTA,salario,comision,dep_no,telefono) select * from empleados where (select dep_no from departamentos where dnombre="contabilidad");

/*10. Sube el salario un 2% a los empleados con oficio vendedor y súbelo un 3% a los que no son vendedor ni
director (con una sola instrucción).*/
update empleados set salario=salario*(
case 
when oficio="vendedor" then 1.2
when oficio not in ("vendedor", "director") then 1.3
else 1.3
end);
 
/*11. Crea una nueva tabla PUESTOS(codpuesto,puesto). Inserta en dicha tabla los distintos puestos que ocupan los
empleados (sin repetir).*/
CREATE TABLE puestos(codpuesto varchar(200), puesto varchar(200));
insert into puestos (puesto) select distinct oficio from empleados; 

/*12. Crea un campo codpuesto en la tabla de empleado y asigna a cada empleado el código de puesto que le
corresponda en función de su oficio. Elimina posteriormente el campo OFICIO de la tabla de empleados.*/
alter table empleados add column codpuesto smallint;
update empleados set codpuesto auto_increment;
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

/*13. A todos los empleados que no tengan asignado un departamento, asígnales el departamento desconocido.*/
update empleados set dep_no="desconocido" where dep_no=0 or dep_no=null;

/*14. El empleado 7499 cambiará de lugar de trabajo, pasando al departamento CONTABILIDAD con el puesto de
EMPLEADO. Modifica ambos campos con una sola sentencia.*/
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

/*15. Transfiere a todos los empleados del departamento 30 que no tengan comisión al departamento 40, y asígnales
una comisión de 200€.*/
update empleados set dep_no=40, comision=200 where dep_no=30 and (comision=0 or comision is null);

/*16. Asigna una comisión de 500 a todos los empleados que no teniendo comisión tengan un salario superior a
2500€.*/
update empleados set comision=500 where (comision=0 or comision is null) and (salario>2500);

/*17. Asigna una comisión del 10% de su salario a todos los empleados que no teniendo comisión tengan un salario
inferior a 2500€.*/
update empleados set comision=salario*0.1 where salario<2500;

/*18. Baja todos los salarios un 10% e incrementa la comisión un 20%.*/
update empleados set salario=salario*0.1, comision=comision*1.2;

/*19. Elimina todos los empleados de la tabla EMP_CONT cuyo código sea mayor que 10.*/
delete from emp_cont where EMP_NO>10;

/*20. Despide (elimina) a aquellos empleados cuya comisión supera a su salario.*/
delete from empleados where comision>salario;

/*21. Jubila a aquellos empleados contratados antes del 1 de marzo de 1981.*/
update empleados set oficio="jubilado" where fecha_alta<"1981-03-01";

/*22. Borra el departamento CONTABILIDAD. Antes de eliminarlo, tendrás que reubicar a sus empleados y asignarlos
al departamento DECONOCIDO.*/
update empleados set dep_no="0" where dep_no=(select dep_no from departamentos where dnombre="contabilidad");
delete from departamentos where dnombre="contabilidad";

/*23. Elimina todos los empleados del departamento de ventas cuyo apellido contenga como segunda letra una A,
que tengan menos de 7 caracteres y que no terminen en O.*/
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

/*24. Añade un campo SEDE de tipo smallint a la tabla de departamentos.*/
alter table departamentos add column SEDE smallint;

/*25. Asigna la sede 1 a todos los departamentos excepto al desconocido, que tendrá sede 0.*/
update departamentos set sede=(
case 
when dnombre="desconocido" then 0
else 1
end);

/*26. Duplica todos los departamentos de la sede 1 para crearlos también en la sede 2. Los códigos de los nuevos
departamentos se obtendrán sumándole 50 al código de departamento que estén copiando.*/