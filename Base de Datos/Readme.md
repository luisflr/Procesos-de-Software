 # Base de Datos
 
## Creación de la Base de Datos: 

Para la creación de la Base de Datos se tomó en cuenta el programa Oracle, más específicamente el entorno de desarrollo “Oracle Developer” en donde se crearon las entidades necesarias, para poder manejar una vidriería. En esta base de datos podremos encontrar las siguientes entidades
* Administrador: Esta es una entidad relacionada solo con la funcionalidad de logeo, es decir, las personas registradas en esta entidad     serán las únicas que podrán ingresar a la aplicación móvil.
* Clientes: En esta entidad se registra todos los clientes con sus respectivos datos: “Código de cliente, nombre, apellido, teléfono,       dirección, etc.”
* Departamentos: En esta entidad se registran todos los departamentos que pertenecen a la empresa “Ventas, Administración, Almacén,         etc.”
* Empleados: En esta entidad se registran todos los empleados que trabajan en la empresa con sus respectivos datos y también el             departamento al que pertenecen.
* Pedidos: Aquí se registran todos los pedidos que la empresa realiza a algún proveedor, para poder actualizar el stock de los               productos.
* Productos: Esta entidad registra todos los productos con sus respectivos datos y el proveedor al cual pertenecen.
* Proveedores: Esta entidad registra todos los proveedores de la empresa, con sus respectivos datos (se tomó en cuenta solo los             proveedores que operan en la ciudad de Arequipa).
* Ventascabecera: En esta entidad tenemos todo lo que son los registros de las ventas, pero como su nombre lo dice, es una cabecera de       ventas, en donde se registran solo los, clientes a los que se vendió, los empleados que realizaron las ventas, la fecha de venta, etc.
* Ventasdetalle: Aquí se registran todo lo que son los detalles de ventas, como los productos vendidos, la cantidad de productos             vendidos, el monto total, etc.

Después de esto tenemos lo que son los procedimientos almacenados, que nos sirven para poder manejar la Base de Datos, seleccionar, insertar, actualizar, eliminar, algún registro de alguna tabla de la Base de Datos. Hasta el momento tenemos 10 procedimientos almacenados. 

### Creacion de los procedimietos 

* Procedimientos
  -	 Actualizar proveedor.
  -	 Cant_emp: para poder ver la cantidad de empleados por un determinado departamento.
  -	 Consulta_cli: para poder consultar a la Base de Datos sobre un determinado cliente ingresando el id del mismo.
  -	 Consulta_emp: de la misma forma que el cliente se consulta un empleado ingresando su id.
  -	 Consulta_nom: con este procedimiento, podemos consultar un empleado ingresando su nombre.
  -	 Insert1: este procedimiento nos permite insertar un nuevo producto.
  -	 Eliminar_producto: este procedimiento nos permite eliminar un producto ingresando su id.
  -  Actualizar_producto: Este procedimiento nos permite actualizar el precio de un determinado producto.
  -	 Insert_cliente: este procedimiento nos permite ingresar un nuevo cliente.
  -	 Pr_login: este procedimiento nos verificara si es que el usuario y contraseña ingresados existen en la tabla “Administrador”, y de       acuerdo a ello nos retornara el valor de 1 o null.

 
