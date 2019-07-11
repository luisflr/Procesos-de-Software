-- Generado por Oracle SQL Developer Data Modeler 4.1.3.901
--   en:        2019-06-18 09:23:28 COT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g




CREATE TABLE Clientes
  (
    ClientesID        INTEGER NOT NULL ,
    ClientesNombre    VARCHAR2 (20 CHAR) NOT NULL ,
    ClientesApellido  VARCHAR2 (20 CHAR) ,
    ClientesTelefono  INTEGER NOT NULL ,
    ClientesDireccion VARCHAR2 (50 CHAR)
  ) ;
ALTER TABLE Clientes ADD CONSTRAINT Clientes_PK PRIMARY KEY ( ClientesID ) ;


CREATE TABLE Departamentos
  (
    DepartamentosID       INTEGER NOT NULL ,
    DepartamentosNombre   VARCHAR2 (50 CHAR) NOT NULL ,
    DepartamentosTelefono INTEGER NOT NULL
  ) ;
ALTER TABLE Departamentos ADD CONSTRAINT Departamentos_PK PRIMARY KEY ( DepartamentosID ) ;


CREATE TABLE Empleados
  (
    EmpleadosID        INTEGER NOT NULL ,
    EmpleadosNombre    VARCHAR2 (20 CHAR) NOT NULL ,
    EmpleadosApellido  VARCHAR2 (20 CHAR) ,
    EmpleadosTelefono  INTEGER ,
    EmpleadosDireccion VARCHAR2 (50 CHAR) ,
    DepartamentoID     INTEGER NOT NULL
  ) ;
ALTER TABLE Empleados ADD CONSTRAINT Empleados_PK PRIMARY KEY ( EmpleadosID ) ;


CREATE TABLE Pedidos
  (
    PedidosID         INTEGER NOT NULL ,
    Fecha             VARCHAR2 (10) ,
    ProveedoresID     INTEGER NOT NULL ,
    ProductosID       INTEGER NOT NULL ,
    CantidadProductos INTEGER ,
    PedidosEstado     INTEGER
  ) ;
ALTER TABLE Pedidos ADD CONSTRAINT Pedidos_PK PRIMARY KEY ( PedidosID ) ;


CREATE TABLE Productos
  (
    ProductosID        INTEGER NOT NULL ,
    ProductosNombre    VARCHAR2 (40 CHAR) NOT NULL ,
    ProductosDimension VARCHAR2 (20 CHAR) NOT NULL ,
    PrecioUnitario     NUMBER (4,2) NOT NULL
  ) ;
ALTER TABLE Productos ADD CONSTRAINT Productos_PK PRIMARY KEY ( ProductosID ) ;


CREATE TABLE Proveedores
  (
    ProveedoresID INTEGER NOT NULL ,
    Nombre        VARCHAR2 (20 CHAR) NOT NULL ,
    Direccion     VARCHAR2 (30 CHAR) NOT NULL ,
    Telefono      INTEGER NOT NULL
  ) ;
ALTER TABLE Proveedores ADD CONSTRAINT Proveedores_PK PRIMARY KEY ( ProveedoresID ) ;


CREATE TABLE Ventas
  (
    VentasID        INTEGER NOT NULL ,
    VentasFechas    VARCHAR2 (10 CHAR) NOT NULL ,
    ProductosID     INTEGER NOT NULL ,
    ProductosPrecio NUMBER (4,2) NOT NULL ,
    Cantidad        INTEGER NOT NULL ,
    ClienteID       INTEGER NOT NULL ,
    EmpleadosID     INTEGER NOT NULL ,
    PrecioTotal     NUMBER (4,2)
  ) ;
ALTER TABLE Ventas ADD CONSTRAINT Ventas_PK PRIMARY KEY ( VentasID ) ;


ALTER TABLE Pedidos ADD CONSTRAINT Pedidos_Productos_FK FOREIGN KEY ( ProductosID ) REFERENCES Productos ( ProductosID ) ;

ALTER TABLE Pedidos ADD CONSTRAINT Pedidos_Proveedores_FK FOREIGN KEY ( ProveedoresID ) REFERENCES Proveedores ( ProveedoresID ) ;

ALTER TABLE Empleados ADD CONSTRAINT TABLE_6_Departamentos_FK FOREIGN KEY ( DepartamentoID ) REFERENCES Departamentos ( DepartamentosID ) ;

ALTER TABLE Ventas ADD CONSTRAINT Ventas_Clientes_FK FOREIGN KEY ( ClienteID ) REFERENCES Clientes ( ClientesID ) ;

ALTER TABLE Ventas ADD CONSTRAINT Ventas_Empleados_FK FOREIGN KEY ( EmpleadosID ) REFERENCES Empleados ( EmpleadosID ) ;

ALTER TABLE Ventas ADD CONSTRAINT Ventas_Productos_FK FOREIGN KEY ( ProductosID ) REFERENCES Productos ( ProductosID ) ;


-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             7
-- CREATE INDEX                             0
-- ALTER TABLE                             13
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
