
APLICACIÓN JM_SERVAC

La aplicación V_Servac, es una aplicación pensada para el manejo de una vidriería, por lo que cuenta con las funciones básicas de esta, como son, ingresar algún producto, actualizar un producto, eliminar un producto y ver una lista de los productos, así también tenemos funcionalidades para los empleados, proveedores, departamentos, etc. Todo esto con la finalidad de que el usuario pueda manejar de una forma sencilla con una interfaz amigable.
Para poder crear esta aplicación, se realizaron los siguientes pasos:
  •	Creación de la Base de Datos.
  •	Creación de una web service.
  •	Creación de una aplicación móvil.
Creación de la Base de Datos: Para la creación de la Base de Datos se tomó en cuenta el programa Oracle, más específicamente el entorno de desarrollo “Oracle Developer” en donde se crearon las entidades necesarias, para poder manejar una vidriería. En esta base de datos podremos encontrar las siguientes entidades
  o	Administrador: Esta es una entidad relacionada solo con la funcionalidad de logeo, es decir, las personas registradas en esta entidad     serán las únicas que podrán ingresar a la aplicación móvil.
  o	Clientes: En esta entidad se registra todos los clientes con sus respectivos datos: “Código de cliente, nombre, apellido, teléfono,       dirección, etc.”
  o	Departamentos: En esta entidad se registran todos los departamentos que pertenecen a la empresa “Ventas, Administración, Almacén,         etc.”
  o	Empleados: En esta entidad se registran todos los empleados que trabajan en la empresa con sus respectivos datos y también el             departamento al que pertenecen.
  o	Pedidos: Aquí se registran todos los pedidos que la empresa realiza a algún proveedor, para poder actualizar el stock de los               productos.
  o	Productos: Esta entidad registra todos los productos con sus respectivos datos y el proveedor al cual pertenecen.
  o	Proveedores: Esta entidad registra todos los proveedores de la empresa, con sus respectivos datos (se tomó en cuenta solo los             proveedores que operan en la ciudad de Arequipa).
  o	Ventascabecera: En esta entidad tenemos todo lo que son los registros de las ventas, pero como su nombre lo dice, es una cabecera de       ventas, en donde se registran solo los, clientes a los que se vendió, los empleados que realizaron las ventas, la fecha de venta, etc.
  o	Ventasdetalle: Aquí se registran todo lo que son los detalles de ventas, como los productos vendidos, la cantidad de productos             vendidos, el monto total, etc.
