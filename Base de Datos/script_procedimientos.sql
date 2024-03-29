---------- insertar un cliente -------------


CREATE OR REPLACE PROCEDURE INSERT_CLIENTE(NOMBREC VARCHAR, APELLIDOC VARCHAR,TELEFONOC NUMBER,DIRECCIONC VARCHAR) AS
CLI_ID CLIENTES.CLIENTESID%TYPE;
BEGIN 
SELECT MAX(CLIENTESID)+1 INTO CLI_ID FROM CLIENTES;
INSERT INTO CLIENTES(CLIENTESID,CLIENTESNOMBRE,CLIENTESAPELLIDO,CLIENTESTELEFONO,CLIENTESDIRECCION) 
VALUES (CLI_ID, NOMBREC,APELLIDOC,TELEFONOC,DIRECCIONC);
END;

EXECUTE INSERT_CLIENTE('Joseph','Regata',956514231,'Av. Regata');
------ insertar un producto ----------
select* from productos;
alter table productos add CANTIDAD NUMBER(4,0);
select * from VENTASCABECERA;

INSERT INTO PRODUCTOS(PRODUCTOSID,PRODUCTOSNOMBRE,PRODUCTOSDIMENSION,PRECIOUNITARIO,CANTIDAD)
VALUES (2,'Cantonera S/anclaje','2 pulgadas',20.5,30);
select * from productos;
select max(productosid) from productos;

CREATE OR REPLACE PROCEDURE  INSERT1(NOMBREP VARCHAR, DIMENSIONP VARCHAR, PRECIOP NUMBER, CANTIDADP NUMBER)as--,RESP OUT VARCHAR2) AS
V_ID PRODUCTOS.PRODUCTOSID%TYPE;
BEGIN
SELECT MAX(PRODUCTOSID)+1 INTO V_ID FROM PRODUCTOS;
INSERT INTO PRODUCTOS(PRODUCTOSID,PRODUCTOSNOMBRE,PRODUCTOSDIMENSION,PRECIOUNITARIO,CANTIDAD)
VALUES (V_ID,NOMBREP,DIMENSIONP,PRECIOP,CANTIDADP);
--RESP:='EXITO';
END;

--CREATE TABLE AUX AS SELECT * FROM PRODUCTOS;
--SELECT * FROM PRODUCTOS;
--SELECT * FROM AUX;
SELECT * FROM PRODUCTOS;
SET SERVEROUTPUT ON
DECLARE
RESPUESTA VARCHAR(60);
BEGIN
INSERT1('SDFASDFAS','80 x 120',40,25,RESPUESTA);
DBMS_OUTPUT.PUT_LINE('RESPUESTA: '||RESPUESTA);
END;

select * from aux;
select * from productos;



------- CONSULTAR EMPLEADO POR ID DE EMPLEADO -------------
SELECT * FROM EMPLEADOS WHERE EMPLEADOSID=1;

CREATE OR REPLACE PROCEDURE CONSULTA_EM(V_EMPLEADO NUMBER) AS
P_EMP EMPLEADOS%ROWTYPE;
BEGIN
SELECT * INTO P_EMP FROM EMPLEADOS WHERE EMPLEADOSID=V_EMPLEADO;
DBMS_OUTPUT.PUT_LINE('Nombre: '||P_EMP.EMPLEADOSNOMBRE);
DBMS_OUTPUT.PUT_LINE('Apellidos: '||P_EMP.EMPLEADOSAPELLIDO);
DBMS_OUTPUT.PUT_LINE('Telefono: '||P_EMP.EMPLEADOSTELEFONO);
DBMS_OUTPUT.PUT_LINE('Direccion: '||P_EMP.EMPLEADOSDIRECCION);
DBMS_OUTPUT.PUT_LINE('Departamento de trabajo: '||P_EMP.DEPARTAMENTOID);
EXCEPTION
WHEN NO_DATA_FOUND THEN DBMS_OUTPUT.PUT_LINE('Empleado no encontrado');
END;

SET SERVEROUTPUT ON
EXECUTE CONSULTA_EM(1);

------- CONSULTAR EMPLEADO POR NOMBRE DE EMPLEADO ------------
CREATE OR REPLACE PROCEDURE CONSULTA_NOM(V_EMPLEADO VARCHAR) AS
P_EMP EMPLEADOS%ROWTYPE;
BEGIN
SELECT * INTO P_EMP FROM EMPLEADOS WHERE EMPLEADOSNOMBRE=V_EMPLEADO;
DBMS_OUTPUT.PUT_LINE('ID: '||P_EMP.EMPLEADOSID);
DBMS_OUTPUT.PUT_LINE('Apellidos: '||P_EMP.EMPLEADOSAPELLIDO);
DBMS_OUTPUT.PUT_LINE('Telefono: '||P_EMP.EMPLEADOSTELEFONO);
DBMS_OUTPUT.PUT_LINE('Direccion: '||P_EMP.EMPLEADOSDIRECCION);
DBMS_OUTPUT.PUT_LINE('Departamento de trabajo: '||P_EMP.DEPARTAMENTOID);
EXCEPTION
WHEN NO_DATA_FOUND THEN DBMS_OUTPUT.PUT_LINE('Empleado no encontrado');
END;

SET SERVEROUTPUT ON
EXECUTE CONSULTA_NOM('Luis');

--- Total de empleados por determinado departamento ------------------------------
SELECT * FROM DEPARTAMENTOS;

SELECT D.DEPARTAMENTOSNOMBRE DEPARTAMENTO,COUNT(E.EMPLEADOSID) CANTIDAD FROM EMPLEADOS E INNER JOIN DEPARTAMENTOS D 
ON E.DEPARTAMENTOID=D.DEPARTAMENTOSID WHERE D.DEPARTAMENTOSNOMBRE='VENTAS' 
GROUP BY D.DEPARTAMENTOSID,D.DEPARTAMENTOSNOMBRE;

CREATE OR REPLACE PROCEDURE CANT_EMP(V_DEPA VARCHAR) AS
V_DEP DEPARTAMENTOS.DEPARTAMENTOSNOMBRE%TYPE;
V_EMP NUMBER(4,0);
BEGIN
SELECT D.DEPARTAMENTOSNOMBRE DEPARTAMENTO,COUNT(E.EMPLEADOSID) CANTIDAD INTO V_DEP, V_EMP
FROM EMPLEADOS E INNER JOIN DEPARTAMENTOS D 
ON E.DEPARTAMENTOID=D.DEPARTAMENTOSID WHERE D.DEPARTAMENTOSNOMBRE=V_DEPA 
GROUP BY D.DEPARTAMENTOSID,D.DEPARTAMENTOSNOMBRE;
DBMS_OUTPUT.PUT_LINE('DEPARTAMENTO: '|| V_DEP);
DBMS_OUTPUT.PUT_LINE('TOTAL DE EMPLEADOS: '|| V_EMP);
EXCEPTION
WHEN NO_DATA_FOUND THEN DBMS_OUTPUT.PUT_LINE('DEPARTAMENTO NO ENCONTRADO');
END;

SELECT * FROM DEPARTAMENTOS;

SET SERVEROUTPUT ON
EXECUTE CANT_EMP('INFORMATICA');

-------------------consulta de un determinado cliente por id ----------------------------
SELECT * FROM CLIENTES WHERE CLIENTESID=1;

CREATE OR REPLACE PROCEDURE CONSULTA_CLI(V_CLIENTE NUMBER) AS
P_CLI CLIENTES%ROWTYPE;
BEGIN
SELECT * INTO P_CLI FROM CLIENTES WHERE CLIENTESID=V_CLIENTE;
DBMS_OUTPUT.PUT_LINE('Nombre: '||P_CLI.CLIENTESNOMBRE);
DBMS_OUTPUT.PUT_LINE('Apellidos: '||P_CLI.CLIENTESAPELLIDO);
DBMS_OUTPUT.PUT_LINE('Telefono: '||P_CLI.CLIENTESTELEFONO);
DBMS_OUTPUT.PUT_LINE('Direccion: '||P_CLI.CLIENTESDIRECCION);
EXCEPTION
WHEN NO_DATA_FOUND THEN DBMS_OUTPUT.PUT_LINE('Cliente no encontrado');
END;

SET SERVEROUTPUT ON
EXECUTE CONSULTA_CLI(1);

-------------------------- CONSULTA CLIENTES POR NOMBRE DE CLIENTES ------------------------
SELECT * FROM CLIENTES WHERE CLIENTESID=1;

CREATE OR REPLACE PROCEDURE CONSULTA_CLI(V_CLIENTE VARCHAR) AS
P_CLI CLIENTES%ROWTYPE;
BEGIN
SELECT * INTO P_CLI FROM CLIENTES WHERE CLIENTESNOMBRE=V_CLIENTE;
DBMS_OUTPUT.PUT_LINE('ID: '||P_CLI.CLIENTESID);
DBMS_OUTPUT.PUT_LINE('Apellidos: '||P_CLI.CLIENTESAPELLIDO);
DBMS_OUTPUT.PUT_LINE('Telefono: '||P_CLI.CLIENTESTELEFONO);
DBMS_OUTPUT.PUT_LINE('Direccion: '||P_CLI.CLIENTESDIRECCION);
EXCEPTION
WHEN NO_DATA_FOUND THEN DBMS_OUTPUT.PUT_LINE('Cliente no encontrado');
END;

SET SERVEROUTPUT ON
EXECUTE CONSULTA_CLI('Luis');


--------------------------------------------------------------------
select * from VENTASCABECERA;
select * from VENTASDETALLE;
SELECT SYSDATE -28 FROM DUAL;
SELECT SYSDATE FROM DUAL;

select * from productos;

INSERT INTO VENTASCABECERA VALUES (1,SYSDATE-30, 2,4,30);
INSERT INTO VENTASCABECERA VALUES (2,SYSDATE-29, 3,5,70);
INSERT INTO VENTASCABECERA VALUES (3,SYSDATE-28, 3,6,50);
INSERT INTO VENTASCABECERA VALUES (4,SYSDATE-28, 2,8,160);
INSERT INTO VENTASCABECERA VALUES (5,SYSDATE-28, 4,7,75);
INSERT INTO VENTASCABECERA VALUES (6,SYSDATE-28, 4,10,40);
INSERT INTO VENTASCABECERA VALUES (7,SYSDATE-28, 2,9,73);
INSERT INTO VENTASCABECERA VALUES (8,SYSDATE-28, 7,10,73);
INSERT INTO VENTASCABECERA VALUES (9,SYSDATE-28, 20,15,50);
INSERT INTO VENTASCABECERA VALUES (10,SYSDATE-28, 12,5,40);
INSERT INTO VENTASCABECERA VALUES (11,SYSDATE-30, 12,14,45);
INSERT INTO VENTASCABECERA VALUES (12,SYSDATE-30, 13,17,55);
INSERT INTO VENTASCABECERA VALUES (13,SYSDATE-30, 20,11,65);
INSERT INTO VENTASCABECERA VALUES (14,SYSDATE-30, 15,20,85);
INSERT INTO VENTASCABECERA VALUES (15,SYSDATE-30, 15,19,100);
INSERT INTO VENTASCABECERA VALUES (16,SYSDATE-30, 15,17,45);
INSERT INTO VENTASCABECERA VALUES (17,SYSDATE-30, 18,17,83);

SELECT * fROM PRODUCTOS;
DELETE FROM PRODUCTOS WHERE PRODUCTOSID = 24;
DELETE FROM CLIENTES WHERE CLIENTESID=20;
SELECT * FROM VENTASDETALLE;
INSERT INTO VENTASDETALLE VALUES (1, 8,1,30);
INSERT INTO VENTASDETALLE VALUES (2, 24,2,35);


select * from productos;

-------------------------ACTUALIZAR UN PROVEEDOR ----------------
SELECT * FROM PROVEEDORES;

CREATE OR REPLACE PROCEDURE ACTUALIZAR_PROVEEDOR(VPROVEEDORID VARCHAR,CAMPO VARCHAR, VALOR VARCHAR) AS
BEGIN
  IF (CAMPO = 'NOMBRE') THEN
    UPDATE PROVEEDORES SET NOMBRE = VALOR WHERE PROVEEDORESID = VPROVEEDORID;
    DBMS_OUTPUT.PUT_LINE('NOMBRE ACTUALIZADO');
  ELSIF (CAMPO = 'DIRECCION')THEN
    UPDATE PROVEEDORES SET DIRECCION = VALOR WHERE PROVEEDORESID=VPROVEEDORID;
    DBMS_OUTPUT.PUT_LINE('DIRECCION ACTUALIZADO');
  ELSIF (CAMPO = 'TELEFONO')THEN
    UPDATE PROVEEDORES SET TELEFONO = VALOR WHERE PROVEEDORESID=VPROVEEDORID;
    DBMS_OUTPUT.PUT_LINE('TELEFONO ACTUALIZADO');
  END IF;
END;

SET SERVEROUTPUT ON
EXECUTE ACTUALIZAR_PROVEEDOR(1,'DIRECCION','AV.INDE');

select * from ADMINISTRADOR

select * from productos;
--------------------- ELIMINAR UN REGISTRO DE PRODUCTOS  ------------
SELECT * FROM CLIENTES;

CREATE OR REPLACE PROCEDURE ELIMINAR_PRODUCTO(PRODUCTID NUMBER) AS
BEGIN
 DELETE FROM PRODUCTOS WHERE PRODUCTOSID = PRODUCTID;
  DBMS_OUTPUT.PUT_LINE('EL REGISTRO HA SIDO ELIMINADO');
END;

DELETE FROM PRODUCTOS WHERE PRODUCTOSID=10;

SELECT * FROM PRODUCTOS;  

SET SERVEROUTPUT ON
EXECUTE ELIMINAR_PRODUCTO(15);


CREATE OR REPLACE PROCEDURE PR_LOGIN(PV1 IN VARCHAR2, PV2 IN VARCHAR2, PV3 OUT NUMBER)AS
ADMINID NUMBER;
BEGIN
  SELECT ADMIN_ID INTO ADMINID FROM ADMINISTRADOR WHERE USUARIO = PV1 AND CONTRASE�A = PV2;
  PV3 := ADMINID;
  
  EXCEPTION 
  WHEN NO_DATA_FOUND THEN DBMS_OUTPUT.PUT_LINE('CLIENTE NO REGISTRADO');
END;


INSERT INTO ADMINISTRADOR VALUES(1,'Luis','svaial20dlm');
INSERT INTO ADMINISTRADOR VALUES(2,'Diego','�aco');
INSERT INTO ADMINISTRADOR VALUES(3,'Maria','mari');

  select * from ADMINISTRADOR;
  
select * from productos;
delete from productos where productosid=27;