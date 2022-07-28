use ventas;
create table h_departamentos like departamentos;
delimiter &&;
create trigger tg_before_delete  
before delete on departamentos for each row;
begin
	insert into h_departamentos (dep_no, dnombre, localidad) values (old.dep_no, old.dnombre, old.localidad);
end &&
delimiter ; 
delete from departamentos where dep_no=50;


/*1. Crear un trigger en la tabla empleados que asigne automaticamente la fecha y hora
actual en la columna fecha de contratacion si intentan insertar null en ese campo*/

delimiter &&;
create trigger tg_contrat
before insert on contratacion for each row;
begin
	if(isnull(new.contración) then set new.contratacion=now(); end if;
end &&
delimiter ; 


/*2. Modifica el trigger anterior para que impida insertar empleados con numero de
empleado mayor que 1000.*/

delimiter &&;
create trigger tg_contrat
before insert on contratacion for each row;
begin
	if new.emp_no>1000 then SIGNAL sqlstate '42502' set message_text="Numero de empleado debe ser menor a 1000"; end if;
	if(isnull(new.contración) then set new.contratacion=now(); end if;
end &&
delimiter ; 

/*3. Añadir un campo “importe” en la tabla PEDIDO de tipo numeric(9,2).
Crear un disparador que se ejecute cada vez que se inserte un registro en la tabla PEDIDO
que calcule el valor del campo importe de la
siguiente manera: importe = precio del producto * cantidad*/

alter table pedidos add importe numeric (9,2);
delimiter &&;
create trigger tr_importe
before insert on pedidos 
for each row;
begin
	declare v_precio double;
	select precio_actual from productos where productos_no=new.producto_no;
    set new.importe=v_precio * new unidades;
end &&
delimiter ; 

/*4. Crear una tabla empleados_historico para guardar registro de los empleados borrados;
junto con el nombre del usuario que hace el borrado y la fecha de borrado mediante un
trigger.*/

create table empl_historico like empleados;
alter table empl_historico add fecha_borrado timestamp;
alter table empl_historico add usuario varchar (100);

drop trigger if exists tr_empl_borrar;
delimiter &&
create trigger tr_empl_borrar before delete on empleados for each row
begin
	insert into empl_historico (emp_no, apellido, oficio, director, fecha, fecha_alta, salario, comision, dep_no, telefono, fecha_borrado, usuario) values (old.emp_no, old.apellido, old.oficio, old.director, old.fecha, old.fecha_alta, old.salario, old.comision, old.dep_no, old.telefono, now(), user());
    end;
    &&
    delimiter ;

/*5. Crear un TRIGGER BEFORE INSERT que cuando se inserte un empleado sin salario le
asigne el salario mas bajo de todos los de la empresa (calculado sin tener en cuenta los
salarios NULL o 0)*/

drop trigger if exists tr_empl_salario;
delimiter &&
create trigger tr_empl_salario before insert on empleados for each row
begin
declare v_salariomin double;
	if new.salario=0 or new.salario is null then
    select min(salario) into v_salariomin from empleados where salario >0 and salario is not null;
    set new.salario=v_salariomin;
    end if;
    end;
    &&
    delimiter ;

/*6. Elabora un mecanismo que impida que se inserte un registro en la tabla de pedidos
cuando el numero de unidades pedidas de un producto supera el stock disponible de ese
producto. Ademas mostrara un mensaje indicando que no se puede realizar el pedido por
falta de stock. En caso de que se pueda realizar el pedido restara al stock del producto la
cantidad comprada en el pedido.*/

drop trigger if exists tr_pedido_stock;
delimiter &&
create trigger tr_pedido_stock before insert on pedidos for each row
begin
declare v_stock double;
declare v_precio double;
select precio_actual into v_precio from productos where producto_no=new.producto_no;
select stock_disponible into v_stock from productos where producto_no=new.producto_no;
if new.unidades>v_stock then
	signal sqlstate '42502' set message_text="No hay stock suficiente para este pedido";
    end if;
    end;
    &&
    delimiter ;


/*7. Indica como se puede conseguir lo siguiente: Deseamos evitar que por error se
introduzca el mismo producto (es decir que no se repita la DESCRIPCION) varias veces
en la tabla de productos*/

drop trigger if exists tr_pedido_stock;
delimiter &&
create trigger tr_pedido_stock before insert on pedidos for each row
begin
declare v_stock double;
declare v_precio double;
select precio_actual into v_precio from productos where producto_no=new.producto_no;
select stock_disponible into v_stock from productos where producto_no=new.producto_no;
if new.unidades>v_stock then
	signal sqlstate '42502' set message_text="No hay stock suficiente para este pedido";
    end if;
    set new.importe=v_precio * new.unidades;
    update productos set stock_disponible=new.unidades where producto_no=new.producto_no;
    end;
    &&
    delimiter ;