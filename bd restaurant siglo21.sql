--------------------------------------------------------
-- Archivo creado  - viernes-octubre-18-2019   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence ORDEN_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  ORDEN_SEQ  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 2 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence PEDIDO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  PEDIDO_SEQ  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 2 CACHE 20 NOORDER  NOCYCLE ;
   
--------------------------------------------------------
--  DDL for Sequence VENTA_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  VENTA_SEQ  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 2 CACHE 20 NOORDER  NOCYCLE ;


--------------------------------------------------------
--  TABLA PERFIL
--------------------------------------------------------
CREATE TABLE perfil (
    id_perfil            NUMBER(5) NOT NULL,
    nombre_perfil        VARCHAR2(20 BYTE) NOT NULL,
    descripcion_perfil   VARCHAR2(100 BYTE) NOT NULL
);

ALTER TABLE perfil ADD CONSTRAINT perfil_pk PRIMARY KEY ( id_perfil );


--insertar datos en perfil--

insert into perfil (id_perfil, nombre_perfil, descripcion_perfil) values (1,'Administrador','Gestiona a nivel administrativo el restaurant');
insert into perfil (id_perfil, nombre_perfil, descripcion_perfil) values (2,'Bodeguero','Gestiona inventario del restaurant');
insert into perfil (id_perfil, nombre_perfil, descripcion_perfil) values (3,'Cocina','Encargado de la cocina del restaurante');
insert into perfil (id_perfil, nombre_perfil, descripcion_perfil) values (4,'Mesa','Mesa del lugar encargada de ingresar los pedidos');
insert into perfil (id_perfil, nombre_perfil, descripcion_perfil) values (5,'Finanzas','Encargado del área financiera y ventas del restaurant');
insert into perfil (id_perfil, nombre_perfil, descripcion_perfil) values (6,'Operador','Encargado de las reservas del restaurant');
insert into perfil (id_perfil, nombre_perfil, descripcion_perfil) values (7,'Caja','Encargado de realizar ventas del restaurant');


--procedimiento para listar en datagridview--

create or replace procedure seleccionarPerfil (registros out sys_refcursor)
as
Begin
 open registros for select id_perfil as "ID", nombre_perfil as "NOMBRE", descripcion_perfil as "DESCRIPCIÓN" from perfil
 order by id_perfil ASC;
End;


--procedimiento para insertar perfil--

create or replace procedure insertarPerfil (nom in VARCHAR2, descrip VARCHAR2)
as
Begin
 insert into perfil (nombre_perfil, descripcion_perfil) values (nom,descrip);
End;



--secuencia y trigger para id incrementable al agregar--

create sequence perfil_sequencia start with 8;

create or replace trigger perfil_trig
 Before insert on perfil
  for each row
 begin
  select perfil_sequencia.NEXTVAL
  into :new.id_perfil
  from dual;
 End;


--procedimiento para actualizar perfil--

create or replace procedure actualizarPerfil (idp in NUMBER, nom in VARCHAR2, descrip in VARCHAR2)
as
 vid NUMBER := idp;
 vnom VARCHAR2(20) := nom;
 vdescrip VARCHAR2(100) := descrip;
begin
 update perfil set nombre_perfil = vnom, descripcion_perfil = vdescrip where id_perfil = vid;
Exception
 when NO_DATA_FOUND  then
  null;
 when others then
  raise;
 End actualizarPerfil;



--procedimiento para eliminar perfil--

create or replace procedure eliminarPerfil (idp in NUMBER)
as
 vid number := idp;
Begin
 delete from perfil where id_perfil = vid;
End;


--------------------------------------------------------
--  TABLA USUARIO
--------------------------------------------------------
CREATE TABLE usuario (
    id_usuario            NUMBER(5) NOT NULL,
    nombre_usuario        VARCHAR2(20 BYTE) NOT NULL,
    clave                 VARCHAR2(50 BYTE) NOT NULL,
    id_perfil             NUMBER(5) NOT NULL
);

ALTER TABLE usuario ADD CONSTRAINT usuario_pk PRIMARY KEY ( id_usuario );

--insertar datos en usuario--
insert into usuario (id_usuario, nombre_usuario, clave, id_perfil) values (1,'admin','admin', 1);
insert into usuario (id_usuario, nombre_usuario, clave, id_perfil) values (2,'bodega','bodega', 2);
insert into usuario (id_usuario, nombre_usuario, clave, id_perfil) values (3,'cocina','cocina',3);
insert into usuario (id_usuario, nombre_usuario, clave, id_perfil) values (4,'mesa','mesa',4);
insert into usuario (id_usuario, nombre_usuario, clave, id_perfil) values (5,'finan','finan',5);
insert into usuario (id_usuario, nombre_usuario, clave, id_perfil) values (6,'opera','opera',6);
insert into usuario (id_usuario, nombre_usuario, clave, id_perfil) values (7,'caja','caja',7);



--procedimiento para listar en datagridview--
create or replace procedure seleccionarUsuario(registros out sys_refcursor)
as
Begin
 open registros for select u.id_usuario as "ID", u.nombre_usuario as "NOMBRE", u.clave as "CLAVE", p.nombre_perfil as "PERFIL"
 from usuario u, perfil p
 where p.id_perfil = u.id_perfil
 order by id_usuario ASC;
End;

--procedimiento para insertar USUARIO--
 create or replace procedure insertarUsuario (nom in VARCHAR2, clv IN VARCHAR2, idperf IN NUMBER)
 as
 Begin
  insert into usuario (nombre_usuario, clave,id_perfil) values (nom, clv, idperf);
  End;

--secuencia y trigger para id incrementable al agregar--

create sequence usuario_sequencia start with 8;
 
 create or replace trigger usuario_trig
 Before insert on usuario
  for each row
  Begin
  select usuario_sequencia.NEXTVAL
into :new.id_usuario
from dual;
End;

--procedimiento para actualizar USUARIO--

create or replace procedure actualizarUsuario (idu in NUMBER, nom in VARCHAR2, clv IN VARCHAR2, idperf IN NUMBER)
 as
  vid NUMBER := idu;
  vnom VARCHAR2(20) := nom;
  vclv VARCHAR2(50) := clv;
  vidperf NUMBER := idperf;
  begin
  update usuario set nombre_usuario = vnom, clave = vclv, id_perfil = vidperf where id_usuario = vid;
  Exception
   when NO_DATA_FOUND then
   null;
   when others then
   raise;
   End actualizarUsuario;

--procedimiento para eliminar USUARIO--
 create or replace procedure eliminarUsuario (idu in NUMBER)
 as
 vid number := idu;
 Begin
  delete from usuario where id_usuario = vid;
  End;


--------------------------------------------------------
--  TABLA MESA
--------------------------------------------------------
CREATE TABLE mesa(
    id_mesa            NUMBER(5) NOT NULL,
    cant_sillas        NUMBER(2) NOT NULL,
    disponibilidad     CHAR(1 BYTE) NOT NULL,
    tipo               VARCHAR2(10 BYTE) NOT NULL
);

ALTER TABLE mesa ADD CONSTRAINT mesa_pk PRIMARY KEY ( id_mesa );

--insertar datos en MESA--
insert into MESA (ID_MESA,CANT_SILLAS,DISPONIBILIDAD,TIPO) values (1,4,'s','Pequeña');
insert into MESA (ID_MESA,CANT_SILLAS,DISPONIBILIDAD,TIPO) values (2,4,'s','Pequeña');
insert into MESA (ID_MESA,CANT_SILLAS,DISPONIBILIDAD,TIPO) values (3,4,'s','Pequeña');
insert into MESA (ID_MESA,CANT_SILLAS,DISPONIBILIDAD,TIPO) values (4,4,'s','Pequeña');
insert into MESA (ID_MESA,CANT_SILLAS,DISPONIBILIDAD,TIPO) values (5,6,'s','Mediana');
insert into MESA (ID_MESA,CANT_SILLAS,DISPONIBILIDAD,TIPO) values (6,6,'s','Mediana');
insert into MESA (ID_MESA,CANT_SILLAS,DISPONIBILIDAD,TIPO) values (7,6,'s','Mediana');
insert into MESA (ID_MESA,CANT_SILLAS,DISPONIBILIDAD,TIPO) values (8,6,'s','Mediana');
insert into MESA (ID_MESA,CANT_SILLAS,DISPONIBILIDAD,TIPO) values (9,12,'s','Familiar');
insert into MESA (ID_MESA,CANT_SILLAS,DISPONIBILIDAD,TIPO) values (10,12,'s','Familiar');


--procedimiento para listar en datagridview--
create or replace procedure seleccionarMesa(registros out sys_refcursor)
as
Begin
 open registros for select id_mesa as "ID", cant_sillas as "CANTIDAD DE SILLAS", disponibilidad as "DISPONIBLE", tipo as "TIPO" from mesa
 order by id_mesa ASC;
End;

--procedimiento para insertar MESA--
create or replace procedure insertarMesa (cant in NUMBER, disp in CHAR, tip in VARCHAR2)
as
Begin
 insert into mesa (cant_sillas, disponibilidad, tipo) values (cant, disp, tip);
End;

--secuencia y trigger para id incrementable al agregar--

create sequence mesa_sequencia start with 11;

create or replace trigger mesa_trig
 Before insert on mesa
  for each row
 begin
  select mesa_sequencia.NEXTVAL
  into :new.id_mesa
  from dual;
 End;

--procedimiento para actualizar MESA--
create or replace procedure actualizarMesa (idm in NUMBER, cant in NUMBER, disp in CHAR, tip in VARCHAR2)
as
 vid NUMBER := idm;
 vcant NUMBER := cant;
 vdisp CHAR(1) := disp;
 vtip VARCHAR2(10) := tip;
begin
 update mesa set cant_sillas = vcant, disponibilidad = vdisp, tipo = vtip where id_mesa = vid;
Exception
 when NO_DATA_FOUND  then
  null;
 when others then
  raise;
 End actualizarMesa;


--procedimiento para eliminar MESA--
create or replace procedure eliminarMesa (idm in NUMBER)
 as
 vid number := idm;
 Begin
  delete from mesa where id_mesa = vid;
  End;


--------------------------------------------------------
--  TABLA RESERVA
--------------------------------------------------------
CREATE TABLE reserva(
    id_reserva        NUMBER(5) NOT NULL,
    fecha_uso         DATE NOT NULL,
	hora_uso          VARCHAR2(5 BYTE) NOT NULL,
    rut               VARCHAR2(12 BYTE) NOT NULL,
    id_mesa           NUMBER(5) NOT NULL
);
ALTER TABLE reserva ADD CONSTRAINT reserva_pk PRIMARY KEY ( id_reserva );

--insertar datos en RESERVA--
insert into reserva (id_reserva, fecha_uso, hora_uso, rut , id_mesa) values (1,'02/01/2020','12:20','18.505.665-8', 1);
insert into reserva (id_reserva, fecha_uso, hora_uso, rut , id_mesa) values (2,'02/01/2020','15:40','10.345.658-2', 2);

--procedimiento para listar en datagridview--
create or replace procedure seleccionarReserva(registros out sys_refcursor)
as
Begin
 open registros for select id_reserva as "ID", fecha_uso as "FECHA DE USO", hora_uso as "HORA DE USO",rut as "RUT CLIENTE", id_mesa as "N° MESA RESERVADA"
 from reserva
 order by id_reserva ASC;
End;

--procedimiento para insertar RESERVA--
 create or replace procedure insertarReserva (fecha in DATE, hor in VARCHAR2, rt IN VARCHAR2, idmes in NUMBER)
 as
 Begin
  insert into reserva (fecha_uso, hora_uso, rut, id_mesa) values (fecha , hor, rt , idmes);
  End;

--secuencia y trigger para id incrementable al agregar--
 create sequence reserva_sequencia start with 3;
 
 create or replace trigger reserva_trig
 Before insert on reserva
  for each row
  Begin
  select reserva_sequencia.NEXTVAL
into :new.id_reserva
from dual;
End;

--procedimiento para actualizar RESERVA--

 create or replace procedure actualizarReserva(idr in NUMBER, fecha in DATE, hor in VARCHAR2, rt IN VARCHAR2, idmes in NUMBER)
 as
  vid NUMBER := idr;
  vfecha VARCHAR2(12) := fecha;
  vhora VARCHAR2(5) := hor;
  vrut VARCHAR2(12) := rt;
  vidm NUMBER := idmes; 
  begin 
  update reserva set fecha_uso = vfecha, hora_uso = vhora, rut = vrut, id_mesa = vidm where id_reserva = vid;
  Exception
   when NO_DATA_FOUND then
   null;
   when others then
   raise;
   End actualizarReserva;

--procedimiento para eliminar RESERVA--
create or replace procedure eliminarReserva (idr in NUMBER)
 as
 vid number := idr;
 Begin
  delete from reserva where id_reserva = vid;
  End;



--------------------------------------------------------
--  TABLA PROVEEDOR
--------------------------------------------------------
CREATE TABLE proveedor (
    id_proveedor            NUMBER(5) NOT NULL,
    rut_empresa             VARCHAR2(12 BYTE) NOT NULL,
    razon_social            VARCHAR2(100 BYTE) NOT NULL,
    descripcion             VARCHAR2(100 BYTE) NOT NULL,
    direccion_casa_matriz   VARCHAR2(100 BYTE) NOT NULL,
    ciudad_casa_matriz      VARCHAR2(50 BYTE) NOT NULL,
    nro_casa_matriz         NUMBER(5) NOT NULL,
    telefono                NUMBER(10) NOT NULL,
    correo_contacto         VARCHAR2(100 BYTE) NOT NULL
);

ALTER TABLE proveedor ADD CONSTRAINT proveedor_pk PRIMARY KEY ( id_proveedor ); 


--insertar datos en proveedor--

insert into proveedor(id_proveedor,rut_empresa,razon_social,descripcion,direccion_casa_matriz,ciudad_casa_matriz,nro_casa_matriz,telefono,correo_contacto) values(1,'78.289.730-6','Comercializadora Mirasol S.A','Doña Carne, local distribuidor de carnes','Arlegui','Viña del Mar',969,954892567,'dona_carne@gmail.com');
insert into proveedor(id_proveedor,rut_empresa,razon_social,descripcion,direccion_casa_matriz,ciudad_casa_matriz,nro_casa_matriz,telefono,correo_contacto) values(2,'76.012.833-3','Super 10 S.A','Supermercado Mayorista 10','Pedro Montt','Valparaíso',2585,6006000025,'mayorista10@gmail.com');
            

--procedimiento para listar en datagridview--

create or replace procedure seleccionarProveedor(registros out sys_refcursor)
as
Begin
 open registros for select id_proveedor as "ID",rut_empresa as "RUT EMPRESA",razon_social as "RAZÓN SOCIAL",descripcion as "DESCRIPCIÓN",direccion_casa_matriz as "DIRECCIÓN CASA MATRIZ",ciudad_casa_matriz as "CIUDAD CASA MATRIZ",nro_casa_matriz as "NÚMERO CASA MATRIZ",telefono as "TELÉFONO",correo_contacto as "EMAIL" from proveedor
 order by id_proveedor ASC;
End;

 --procedimiento para insertar proveedor

 create or replace procedure insertarProveedor (rut in VARCHAR2 ,razon in VARCHAR2 ,descp in VARCHAR2,direcc in VARCHAR2,ciud in VARCHAR2,nro in NUMBER,fono in NUMBER,correo in VARCHAR2)
 as
 Begin
  insert into proveedor (rut_empresa,razon_social,descripcion,direccion_casa_matriz,ciudad_casa_matriz,nro_casa_matriz,telefono,correo_contacto) values (rut ,razon ,descp,direcc,ciud,nro,fono,correo);
  End;

 --secuencia y trigger para id incrementable al agregar--
 create sequence proveedor_sequencia start with 3;
 
 create or replace trigger proveedor_trig
 Before insert on proveedor
  for each row
  Begin
  select proveedor_sequencia.NEXTVAL
into :new.id_proveedor
from dual;
End;


 --procedimiento para actualizar proveedor--

 create or replace procedure actualizarProveedor (idp in NUMBER,rut in VARCHAR2 ,razon in VARCHAR2 ,descp in VARCHAR2,direcc in VARCHAR2,ciud in VARCHAR2,nro in NUMBER,fono in NUMBER,correo in VARCHAR2)
 as
  vid NUMBER := idp;
  vrut VARCHAR2(12) := rut;
  vrazon VARCHAR2(100) := razon;
  vdescp VARCHAR2(100) := descp;
  vdirecc VARCHAR2(100) := direcc;
  vciud VARCHAR2(50) := ciud;
  vnro NUMBER := nro;
  vfono NUMBER := fono;
  vcorreo VARCHAR2(100) := correo;
  begin 
  update proveedor set rut_empresa = vrut, razon_social = vrazon, descripcion = vdescp, direccion_casa_matriz = vdirecc, ciudad_casa_matriz = vciud, nro_casa_matriz = vnro, telefono = vfono, correo_contacto = vcorreo where id_proveedor = vid;
  Exception
   when NO_DATA_FOUND then
   null;
   when others then
   raise;
   End actualizarProveedor;
   

 --procedimiento para eliminar proveedor--
 
 create or replace procedure eliminarProveedor (idp in NUMBER)
 as
 vid number := idp;
 Begin
  delete from proveedor where id_proveedor = vid;
  End;
  
  
 
-------------------------------------------------------- 
--  TABLA PRODUCTO
--------------------------------------------------------
CREATE TABLE producto (
    id_producto    NUMBER(5) NOT NULL,
    descripcion    VARCHAR2(100 BYTE) NOT NULL,
    stock          NUMBER(5) NOT NULL,
    detalle_stock    VARCHAR2(20 BYTE) NOT NULL,
    id_proveedor   NUMBER(5) NOT NULL
);

ALTER TABLE producto ADD CONSTRAINT producto_pk PRIMARY KEY (id_producto);


--insertar datos en producto--

insert into producto(id_producto, descripcion, stock, detalle_stock, id_proveedor) values(1,'Pan Batido',40,'unidades',1);
insert into producto(id_producto, descripcion, stock, detalle_stock, id_proveedor) values(2,'Pechuga de Pollo',15,'kilos',2);           
           

--procedimiento para listar en datagridview--

create or replace procedure seleccionarProducto(registros out sys_refcursor)
as
Begin
 open registros for select p.id_producto as "ID", p.descripcion as "DESCRIPCIÓN", p.stock as "STOCK", p.detalle_stock as "UNIDAD DE MEDIDA", c.descripcion as "PROVEEDOR"
 from producto p, proveedor c
 where c.id_proveedor = p.id_proveedor
 order by id_producto ASC;
End;

 --procedimiento para insertar producto

 create or replace procedure insertarProducto (descp in VARCHAR2, stk IN NUMBER, detalle in VARCHAR2, idprov IN NUMBER)
 as
 Begin
  insert into producto (descripcion, stock, detalle_stock, id_proveedor) values (descp , stk , detalle, idprov);
  End;

 --secuencia y trigger para id incrementable al agregar--
 create sequence producto_sequencia start with 3;
 
 create or replace trigger producto_trig
 Before insert on producto
  for each row
  Begin
  select producto_sequencia.NEXTVAL
into :new.id_producto
from dual;
End;

 --procedimiento para actualizar producto--

 create or replace procedure actualizarProducto (idp in NUMBER, descp in VARCHAR2, stk IN NUMBER, detalle in VARCHAR2, idprov IN NUMBER)
 as
  vid NUMBER := idp;
  vdescp VARCHAR2(100) := descp;
  vstk NUMBER := stk;
  vdetalle VARCHAR(20) := detalle;
  vidprov NUMBER := idprov;
  begin
  update producto set descripcion = vdescp, stock = vstk, detalle_stock = vdetalle, id_proveedor = vidprov where id_producto = vid;
  Exception
   when NO_DATA_FOUND then
   null;
   when others then
   raise;
   End actualizarProducto;
   

 --procedimiento para eliminar producto--
 
 create or replace procedure eliminarProducto (idp in NUMBER)
 as
 vid number := idp;
 Begin
  delete from producto where id_producto = vid;
  End;
  
  

--------------------------------------------------------
--  TABLA CATEGORÍA
--------------------------------------------------------
CREATE TABLE categoria (
    id_categoria            NUMBER(5) NOT NULL,
    descripcion_categoria   VARCHAR2(100 BYTE) NOT NULL
);

ALTER TABLE categoria ADD CONSTRAINT categoria_pk PRIMARY KEY ( id_categoria );

--insertar datos en categoría--

insert into categoria (id_categoria, descripcion_categoria) values (1,'Sopa');
insert into categoria (id_categoria, descripcion_categoria) values (2,'Puré');   


--procedimiento para listar en datagridview--
create or replace procedure seleccionarCategoria(registros out sys_refcursor)
as
Begin
 open registros for select ID_CATEGORIA as "ID", DESCRIPCION_CATEGORIA as "DESCRIPCIÓN" from categoria
 order by id_categoria ASC;
End;

--procedimiento para insertar CATEGORÍA--
create or replace procedure insertarCategoria (descrip in VARCHAR2)
 as
 Begin
  insert into categoria (descripcion_categoria) values (descrip);
  End;

--secuencia y trigger para id incrementable al agregar-- 

create sequence categoria_sequencia start with 3;

create or replace trigger categoria_trig
 Before insert on categoria
  for each row
  Begin
  select categoria_sequencia.NEXTVAL
into :new.id_categoria
from dual;
End;
  
--procedimiento para actualizar CATEGORÍA--
create or replace procedure actualizarCategoria (idct in NUMBER, descrip in VARCHAR2)
 as
  vid NUMBER := idct;
  vdescrip VARCHAR2(100) := descrip;
  begin
  update categoria set descripcion_categoria = vdescrip where id_categoria = vid;
  Exception
   when NO_DATA_FOUND then
   null;
   when others then
   raise;
   End actualizarCategoria;

--procedimiento para eliminar CATEGORÍA--

create or replace procedure eliminarCategoria (idct in NUMBER)
 as
 vid number := idct;
 Begin
  delete from categoria where id_categoria = vid;
  End;


  
--------------------------------------------------------
--  TABLA PLATO
--------------------------------------------------------
 CREATE TABLE plato (
    id_plato            NUMBER(5) NOT NULL,
    descripcion         VARCHAR2(100 BYTE) NOT NULL,
    precio_unitario     NUMBER(6) NOT NULL,
    id_categoria        NUMBER(5) NOT NULL,
    tiempo_preparacion  NUMBER(4) NOT NULL
);

ALTER TABLE plato ADD CONSTRAINT plato_pk PRIMARY KEY ( id_plato );


--insertar datos en plato--

insert into plato (ID_PLATO,DESCRIPCION,PRECIO_UNITARIO,ID_CATEGORIA,TIEMPO_PREPARACION) values (0,'Ninguno',0,1,0);
insert into plato (ID_PLATO,DESCRIPCION,PRECIO_UNITARIO,ID_CATEGORIA,TIEMPO_PREPARACION) values (1,'Cazuela de vacuno',3000,1,600);
insert into plato (ID_PLATO,DESCRIPCION,PRECIO_UNITARIO,ID_CATEGORIA,TIEMPO_PREPARACION) values (2,'Osobuco estofado',3500,1,900);
insert into plato (ID_PLATO,DESCRIPCION,PRECIO_UNITARIO,ID_CATEGORIA,TIEMPO_PREPARACION) values (3,'Papas con arroz',2200,1,900);



--procedimiento para listar en datagridview--

create or replace procedure seleccionarPlato (registros out sys_refcursor)
as
Begin
 open registros for select p.id_plato as "ID", p.descripcion as "DESCRIPCIÓN", p.precio_unitario as "PRECIO UNITARIO", c.descripcion_categoria as "CATEGORÍA" , p.tiempo_preparacion as "TIEMPO PREPARACIÓN" 
 from plato p, categoria c
 where c.id_categoria = p.id_categoria AND p.id_plato > 0
 order by id_plato ASC;
End;


--procedimiento para insertar plato--

create or replace procedure insertarPlato (descp in VARCHAR2, precio in NUMBER, idc in NUMBER, tiempo in NUMBER)
as
Begin
 insert into plato (descripcion, precio_unitario, id_categoria, tiempo_preparacion)  values (descp, precio, idc, tiempo);
End;



--secuencia y trigger para id incrementable al agregar--

create sequence plato_sequencia start with 4;

create or replace trigger plato_trig
 Before insert on plato
  for each row
 begin
  select plato_sequencia.NEXTVAL
  into :new.id_plato
  from dual;
 End;


--procedimiento para actualizar plato--

create or replace procedure actualizarPlato (idp in NUMBER, descp in VARCHAR2, precio in NUMBER, idc in NUMBER, tiempo in NUMBER)
as
 vid NUMBER := idp;
 vdescp VARCHAR2(100) := descp;
 vprecio NUMBER := precio;
 vidc NUMBER := idc;
 vtiempo NUMBER := tiempo;
begin
 update plato set descripcion = vdescp, precio_unitario = vprecio, id_categoria = vidc, tiempo_preparacion = vtiempo where id_plato = vid;
Exception
 when NO_DATA_FOUND  then
  null;
 when others then
  raise;
 End actualizarPlato;



--procedimiento para eliminar plato--

create or replace procedure eliminarPlato (idp in NUMBER)
as
 vid number := idp;
Begin
 delete from plato where id_plato = vid;
End;



--------------------------------------------------------  
--  TABLA BEBESTIBLE
--------------------------------------------------------
CREATE TABLE bebestible (
                id_bebestible NUMBER(5) NOT NULL,
                descripcion VARCHAR2(100 BYTE) NOT NULL,
                stock       NUMBER(5) NOT NULL,
                precio_unitario NUMBER(6) NOT NULL
                );
                
ALTER TABLE bebestible ADD CONSTRAINT bebestible_pk PRIMARY KEY (id_bebestible);

--insertar datos en BEBESTIBLE--
insert into bebestible(id_bebestible, descripcion, stock, precio_unitario) values(0, 'Ninguno',0,0);
insert into bebestible(id_bebestible, descripcion, stock, precio_unitario) values(1, 'Pepsi 500cc',5,1000);
insert into bebestible(id_bebestible, descripcion, stock, precio_unitario) values(2, 'Coca Cola Zero 1 litro',3,1200);

--procedimiento para listar en datagridview--

create or replace procedure seleccionarBebestible(registros out sys_refcursor)
as
Begin
 open registros for select ID_BEBESTIBLE as "ID", DESCRIPCION as "DESCRIPCIÓN", STOCK as "STOCK", PRECIO_UNITARIO as "PRECIO UNITARIO"
 from bebestible
 where id_bebestible > 0
 order by id_bebestible ASC;
End;

--procedimiento para insertar BEBESTIBLE--
create or replace procedure insertarBebestible (descrip in VARCHAR2, stck in NUMBER, prec_unit in NUMBER)
 as
 Begin
  insert into bebestible (descripcion, stock, precio_unitario) values (descrip , stck , prec_unit);
  End;

--secuencia y trigger para id incrementable al agregar--

create sequence bebestible_sequencia start with 3;

create or replace trigger bebestible_trig
 Before insert on bebestible
  for each row
  Begin
  select bebestible_sequencia.NEXTVAL
into :new.id_bebestible
from dual;
End;

--procedimiento para actualizar BEBESTIBLE--
create or replace procedure actualizarBebestible (idb in NUMBER, descrip in VARCHAR2, stck in NUMBER, prec_unit in NUMBER)
 as
  vid NUMBER := idb;
  vdescrip VARCHAR2(100) := descrip;
  vstck NUMBER := stck;
  vprec_unit NUMBER := prec_unit;
  begin
  update bebestible set descripcion = vdescrip, stock = vstck, precio_unitario = vprec_unit where id_bebestible = vid;
  Exception
   when NO_DATA_FOUND then
   null;
   when others then
   raise;
   End actualizarBebestible;

--procedimiento para eliminar BEBESTIBLE--

create or replace procedure eliminarBebestible (idb in NUMBER)
 as
 vid number := idb;
 Begin
  delete from bebestible where id_bebestible = vid;
  End;



--------------------------------------------------------
--  TABLA POSTRE
--------------------------------------------------------
CREATE TABLE postre (
                id_postre NUMBER(5) NOT NULL,
                descripcion VARCHAR2(100 BYTE) NOT NULL,
                stock       NUMBER(5) NOT NULL,
                precio_unitario NUMBER(6) NOT NULL
                );

ALTER TABLE postre ADD CONSTRAINT postre_pk PRIMARY KEY (id_postre);

--insertar datos en POSTRE--
insert into postre(id_postre, descripcion, stock, precio_unitario) values (0, 'Ninguno',0,0);
insert into postre(id_postre, descripcion, stock, precio_unitario) values (1, 'Mousse de chocolate blanco y negro',10,2500);
insert into postre(id_postre, descripcion, stock, precio_unitario) values (2, 'Brownies con helado de vainilla y salsa de chocolate',10,3500);
insert into postre(id_postre, descripcion, stock, precio_unitario) values (3, 'Helado de chocolate',0,800);
insert into postre(id_postre, descripcion, stock, precio_unitario) values (4, 'Helado de naranja',12,600);

--procedimiento para listar en datagridview--
create or replace procedure seleccionarPostre(registros out sys_refcursor)
as
Begin
 open registros for select id_postre as "ID", descripcion as "DESCRIPCIÓN", stock as "STOCK", precio_unitario as "PRECIO UNITARIO" 
 from postre
 where id_postre > 0
 order by id_postre ASC;
End;

--procedimiento para insertar POSTRE--
create or replace procedure insertarPostre (descrip in VARCHAR2, stck in NUMBER, prec_unit in NUMBER)
 as
 Begin
  insert into postre (descripcion, stock, precio_unitario) values (descrip , stck , prec_unit);
  End;


--secuencia y trigger para id incrementable al agregar--
create sequence postre_sequencia start with 5;

create or replace trigger postre_trig
 Before insert on postre
  for each row
  Begin
  select postre_sequencia.NEXTVAL
into :new.id_postre
from dual;
End;



--procedimiento para actualizar POSTRE--
create or replace procedure actualizarPostre (idpt in NUMBER, descrip in VARCHAR2, stck in NUMBER, prec_unit in NUMBER)
 as
  vid NUMBER := idpt;
  vdescrip VARCHAR2(100) := descrip;
  vstck NUMBER := stck;
  vprec_unit NUMBER := prec_unit;
  begin
  update postre set descripcion = vdescrip, stock = vstck, precio_unitario = vprec_unit where id_postre = vid;
  Exception
   when NO_DATA_FOUND then
   null;
   when others then
   raise;
   End actualizarPostre;

--procedimiento para eliminar POSTRE--
create or replace procedure eliminarPostre (idpt in NUMBER)
 as
 vid number := idpt;
 Begin
  delete from postre where id_postre = vid;
  End;



--------------------------------------------------------
--  TABLA CLIENTE
--------------------------------------------------------
CREATE TABLE cliente (
    rut     VARCHAR2(12 BYTE) NOT NULL,
    primer_nombre      VARCHAR2(20 BYTE) NOT NULL,
    segundo_nombre     VARCHAR2(20 BYTE),
    apell_paterno      VARCHAR2(20 BYTE) NOT NULL,
    apell_materno      VARCHAR2(20 BYTE) NOT NULL,
    telefono	       NUMBER(10) NOT NULL,
    correo_contacto    VARCHAR2(100 Byte) NOT NULL
);   
ALTER TABLE cliente ADD CONSTRAINT cliente_pk PRIMARY KEY ( rut );

--insertar datos en CLIENTE--
insert into cliente (rut, primer_nombre, segundo_nombre, apell_paterno, apell_materno, telefono, correo_contacto) values('18.505.665-8', 'Forrest', 'Alan', 'Gump', 'Winston', 95658526, 'f.gump@gmail.com');
insert into cliente (rut, primer_nombre, segundo_nombre, apell_paterno, apell_materno, telefono, correo_contacto) values('10.345.658-2', 'Arnold', 'Alois', 'Schwarzenegger', 'Negger', 966778823, 'a.lois.elnegger@gmail.com');

--procedimiento para listar en datagridview--
create or replace procedure seleccionarCliente(registros out sys_refcursor)
as
Begin
 open registros for select rut as "RUT", primer_nombre as "PRIMER NOMBRE", segundo_nombre as "SEGUNDO NOMBRE", apell_paterno as "APELLIDO PATERNO", apell_materno as "APELLIDO MATERNO", telefono as "TELÉFONO", correo_contacto as "EMAIL" from cliente;
 End;
  	    	
--procedimiento para insertar CLIENTE--
create or replace procedure insertarCliente (rt in VARCHAR2, pnombre in VARCHAR2, snombre in VARCHAR2, appaterno in VARCHAR2, apmaterno in VARCHAR2, 
fono in VARCHAR2, mail in VARCHAR2)
 as
 Begin
  insert into cliente (rut, primer_nombre, segundo_nombre, apell_paterno, apell_materno, telefono, correo_contacto) values (rt, pnombre, snombre, appaterno, apmaterno, fono, mail);
  End;


--procedimiento para actualizar CLIENTE--
create or replace procedure actualizarCliente (rt in VARCHAR2, pnombre in VARCHAR2, snombre in VARCHAR2, appaterno in VARCHAR2, apmaterno in VARCHAR2, 
fono in VARCHAR2, mail in VARCHAR2)
 as
  vrut VARCHAR2(12) := rt;
  vpnombre VARCHAR2(20) := pnombre;
  vsnombre VARCHAR2(20) := snombre;
  vappaterno VARCHAR2(20) := appaterno;
  vapmaterno VARCHAR2(20) := apmaterno;
  vfono NUMBER(10) := fono;
  vmail VARCHAR2(100) := mail;
  begin
  update cliente set primer_nombre = vpnombre, segundo_nombre = vsnombre, apell_paterno = vappaterno, apell_materno = vapmaterno,
                          telefono = vfono, correo_contacto = vmail where rut = vrut;
  Exception
   when NO_DATA_FOUND then
   null;
   when others then
   raise;
   End actualizarCliente;


--procedimiento para eliminar CLIENTE--

create or replace procedure eliminarCliente (rt in VARCHAR2)
as
 vrut VARCHAR2(12) := rt;
Begin
 delete from cliente where rut = vrut;
End;



--------------------------------------------------------
--  TABLA CARGO
--------------------------------------------------------
CREATE TABLE cargo (
    id_cargo            NUMBER(5) NOT NULL,
    descripcion_cargo   VARCHAR2(100 BYTE) NOT NULL
);

ALTER TABLE cargo ADD CONSTRAINT cargo_pk PRIMARY KEY ( id_cargo );

--insertar datos en cargo--

insert into cargo (id_cargo, descripcion_cargo) values (1,'Cajero');
insert into cargo (id_cargo, descripcion_cargo) values (2,'Encargado de Finanzas');   
insert into cargo (id_cargo, descripcion_cargo) values (3,'Cocinero');   
insert into cargo (id_cargo, descripcion_cargo) values (4,'Bodeguero');   
insert into cargo (id_cargo, descripcion_cargo) values (5,'Mesero');   
insert into cargo (id_cargo, descripcion_cargo) values (6,'Operador'); 
insert into cargo (id_cargo, descripcion_cargo) values (7,'Auxiliar de Aseo');   


--procedimiento para listar en datagridview--
create or replace procedure seleccionarCargo(registros out sys_refcursor)
as
Begin
 open registros for select ID_CARGO as "ID", DESCRIPCION_CARGO as "DESCRIPCIÓN" from cargo
 order by id_cargo ASC;
End;

--procedimiento para insertar CARGO--
create or replace procedure insertarCargo (descrip in VARCHAR2)
 as
 Begin
  insert into cargo (descripcion_cargo) values (descrip);
  End;

--secuencia y trigger para id incrementable al agregar-- 

create sequence cargo_sequencia start with 8;

create or replace trigger cargo_trig
 Before insert on cargo
  for each row
  Begin
  select cargo_sequencia.NEXTVAL
into :new.id_cargo 
from dual;
End;
  
--procedimiento para actualizar CARGO--
create or replace procedure actualizarCargo (idct in NUMBER, descrip in VARCHAR2)
 as
  vid NUMBER := idct;
  vdescrip VARCHAR2(100) := descrip;
  begin
  update cargo set descripcion_cargo = vdescrip where id_cargo = vid;
  Exception
   when NO_DATA_FOUND then
   null;
   when others then
   raise;
   End actualizarCargo;

--procedimiento para eliminar CARGO--

create or replace procedure eliminarCargo (idct in NUMBER)
 as
 vid number := idct;
 Begin
  delete from cargo where id_cargo = vid;
  End;



--------------------------------------------------------
--  TABLA TRABAJADOR
--------------------------------------------------------
CREATE TABLE trabajador (
    id_trabajador      NUMBER(5) NOT NULL,
    rut_trabajador     VARCHAR2(12 BYTE) NOT NULL,
    primer_nombre      VARCHAR2(20 BYTE) NOT NULL,
    segundo_nombre     VARCHAR2(20 BYTE),
    apell_paterno      VARCHAR2(20 BYTE) NOT NULL,
    apell_materno      VARCHAR2(20 BYTE) NOT NULL,
    fecha_nacimiento   DATE NOT NULL,
    sexo               CHAR(1 BYTE) NOT NULL,
    direccion          VARCHAR2(100 BYTE) NOT NULL,
    nro_direccion      NUMBER(5) NOT NULL,
    ciudad             VARCHAR2(20 BYTE) NOT NULL,
    id_cargo           NUMBER(5) NOT NULL,
    telefono           NUMBER(10) NOT NULL,
    correo_contacto    VARCHAR2(100 BYTE) NOT NULL,
    sueldo             NUMBER(6) NOT NULL
);

ALTER TABLE trabajador ADD CONSTRAINT trabajador_pk PRIMARY KEY ( id_trabajador );

--insertar datos en trabajador--
insert into trabajador (ID_TRABAJADOR,RUT_TRABAJADOR,PRIMER_NOMBRE,SEGUNDO_NOMBRE,APELL_PATERNO,APELL_MATERNO,FECHA_NACIMIENTO,SEXO,DIRECCION,NRO_DIRECCION,CIUDAD,ID_CARGO,TELEFONO,CORREO_CONTACTO,SUELDO) values (1,'18.840.347-6','Alejandro','Nicolás','Gonzáles','Villanueva','20/03/1945','M','Av. Santiago',463,'Villa Alemana',1,955869274,'alejandro@gmail.com',700000);
insert into trabajador (ID_TRABAJADOR,RUT_TRABAJADOR,PRIMER_NOMBRE,SEGUNDO_NOMBRE,APELL_PATERNO,APELL_MATERNO,FECHA_NACIMIENTO,SEXO,DIRECCION,NRO_DIRECCION,CIUDAD,ID_CARGO,TELEFONO,CORREO_CONTACTO,SUELDO) values (2,'17.346.854-3','Fernanda','Ignacia','Rojas','Zamorano','06/11/1982','F','Pasaje Rapanui',2083,'Villa Alemana',3,958738573,'fernanda@gmail.com',550000);
Insert into trabajador (ID_TRABAJADOR,RUT_TRABAJADOR,PRIMER_NOMBRE,SEGUNDO_NOMBRE,APELL_PATERNO,APELL_MATERNO,FECHA_NACIMIENTO,SEXO,DIRECCION,NRO_DIRECCION,CIUDAD,ID_CARGO,TELEFONO,CORREO_CONTACTO,SUELDO) values (3,'12.323.121-2','Raúl','Ignacio','Herrera','Fernández','31/12/69','M','Pasaje pinzón',123,'Villa Alemana',3,958465343,'cocinero1@gmail.com',400000);
Insert into trabajador (ID_TRABAJADOR,RUT_TRABAJADOR,PRIMER_NOMBRE,SEGUNDO_NOMBRE,APELL_PATERNO,APELL_MATERNO,FECHA_NACIMIENTO,SEXO,DIRECCION,NRO_DIRECCION,CIUDAD,ID_CARGO,TELEFONO,CORREO_CONTACTO,SUELDO) values (4,'12.345.678-9','Felipe','Javier','Contreras','Rojas','31/12/69','M','Av. Santa María',422,'Villa Alemana',2,989373157,'cocinero2@gmail.com',400000);



--procedimiento para listar en datagridview--
create or replace procedure seleccionarTrabajador (registros out sys_refcursor)
as
Begin
 open registros for select id_trabajador as "ID",rut_trabajador as "RUT",primer_nombre as "PRIMER NOMBRE",segundo_nombre as "SEGUNDO NOMBRE",apell_paterno as "APELLIDO PATERNO",apell_materno as "APELLIDO MATERNO",fecha_nacimiento as "FECHA DE NACIMIENTO",sexo as "SEXO",direccion as "DIRECCIÓN",nro_direccion as "NÚMERO DIRECCIÓN",ciudad as "CIUDAD",c.descripcion_cargo as "CARGO",telefono as "TELÉFONO",correo_contacto as "EMAIL",sueldo as "SUELDO"
 from trabajador t, cargo c
 where c.id_cargo = t.id_cargo
 order by id_trabajador ASC;
End;


--procedimiento para insertar trabajador--
create or replace procedure insertarTrabajador (rut in VARCHAR2,pnombre in VARCHAR2,snombre in VARCHAR2,appaterno in VARCHAR2,apmaterno in VARCHAR2,nac in DATE,se in CHAR,direcc in VARCHAR2,nro in NUMBER,ciu in VARCHAR2,carg in NUMBER,fono in NUMBER,mail in VARCHAR2,suel in NUMBER)  
as
Begin
 insert into trabajador (rut_trabajador,primer_nombre,segundo_nombre,apell_paterno,apell_materno,fecha_nacimiento,sexo,direccion,nro_direccion,ciudad,id_cargo,telefono,correo_contacto,sueldo)   
 values (rut,pnombre,snombre,appaterno,apmaterno,nac,se,direcc,nro,ciu,carg,fono,mail,suel);
End;



--secuencia y trigger para id incrementable al agregar--

create sequence trabajador_sequencia start with 5;

create or replace trigger trabajador_trig
 Before insert on trabajador
  for each row
 begin
  select trabajador_sequencia.NEXTVAL
  into :new.id_trabajador
  from dual;
 End;


--procedimiento para actualizar trabajador--

create or replace procedure actualizarTrabajador (idt in NUMBER,rut in VARCHAR2,pnombre in VARCHAR2,snombre in VARCHAR2,appaterno in VARCHAR2,apmaterno in VARCHAR2,nac in DATE,se in CHAR,direcc in VARCHAR2,nro in NUMBER,ciu in VARCHAR2,carg in NUMBER,fono in NUMBER,mail in VARCHAR2,suel in NUMBER) 
as
 vidt NUMBER := idt;
 vrut VARCHAR2(12) := rut;
 vpnombre VARCHAR2(20) := pnombre;
 vsnombre VARCHAR2(20) := snombre;
 vappaterno VARCHAR2(20) := appaterno;
 vapmaterno VARCHAR2(20) := apmaterno;
 vnac DATE := nac;
 vse CHAR(1) := se;
 vdirecc VARCHAR2(100) := direcc;
 vnro NUMBER(5) := nro;
 vciu VARCHAR2(20) := ciu;
 vcarg NUMBER := carg;
 vfono NUMBER(10) := fono;
 vmail VARCHAR2(100) := mail;
 vsuel NUMBER(6) := suel;
begin
 update trabajador set rut_trabajador = vrut,primer_nombre = vpnombre,segundo_nombre = vsnombre,apell_paterno  = vappaterno,apell_materno = vapmaterno,fecha_nacimiento = vnac,sexo = vse,direccion = vdirecc,nro_direccion = vnro,ciudad = vciu,id_cargo = vcarg,telefono = vfono,correo_contacto = vmail,sueldo = vsuel where id_trabajador = vidt;
Exception
 when NO_DATA_FOUND  then
  null;
 when others then
  raise;
 End actualizarTrabajador;
 
 
 
--procedimiento para eliminar trabajador--

create or replace procedure eliminarTrabajador (idt in NUMBER)
as
 vid number := idt;
Begin
 delete from trabajador where id_trabajador = vid;
End;



--------------------------------------------------------
--  TABLA SOLICITUD_STOCK
--------------------------------------------------------
CREATE TABLE solicitud_stock (
    id_solicitud            NUMBER(5) NOT NULL,
    descripcion_solicitud   VARCHAR2(100 BYTE) NOT NULL,
    estado                  VARCHAR2(20 BYTE) NOT NULL
);

ALTER TABLE solicitud_stock ADD CONSTRAINT solicitud_stock_pk PRIMARY KEY ( id_solicitud );

--insertar datos en SOLICITUD_STOCK--

insert into solicitud_stock (id_solicitud, descripcion_solicitud, estado) values (1,'Se requieren 12 kilos de Pechuga de Pollo.','Pendiente');
insert into solicitud_stock (id_solicitud, descripcion_solicitud, estado) values (2,'Se requieren 40 unidades de Pan Batido.','Pendiente');   


--procedimiento para listar en datagridview--
create or replace procedure seleccionarSolicitud(registros out sys_refcursor)
as
Begin
 open registros for select ID_SOLICITUD as "ID", DESCRIPCION_SOLICITUD as "Detalle Solicitud", ESTADO as "Estado" from solicitud_stock
 where estado = 'Pendiente'
 order by id_solicitud ASC;
End;

create or replace procedure seleccionarSolicitudTotal(registros out sys_refcursor)
as
Begin
 open registros for select ID_SOLICITUD as "ID", DESCRIPCION_SOLICITUD as "Detalle Solicitud", ESTADO as "Estado" 
 from solicitud_stock
 order by id_solicitud ASC;
End;

--procedimiento para insertar SOLICITUD_STOCK--
create or replace procedure insertarSolicitud (descrip in VARCHAR2, estad in VARCHAR2)
 as
 Begin
  insert into solicitud_stock (descripcion_solicitud, estado) values (descrip, estad);
  End;

--secuencia y trigger para id incrementable al agregar-- 

create sequence solicitud_stock_sequencia start with 3;

create or replace trigger solicitud_stock_trig
 Before insert on solicitud_stock
  for each row
  Begin
  select solicitud_stock_sequencia.NEXTVAL
into :new.id_solicitud
from dual;
End;

--procedimiento para actualizar SOLICITUD_STOCK--
create or replace procedure actualizarSolicitud (ids in NUMBER, descrip in VARCHAR2, estad in VARCHAR2)
as
 vid NUMBER := ids;
 vdescrip VARCHAR2(100) := descrip;
 vestad VARCHAR2(20) := estad;
begin
 update solicitud_stock set descripcion_solicitud = vdescrip, estado = vestad where id_solicitud = vid;
Exception
 when NO_DATA_FOUND  then
  null;
 when others then
  raise;
 End actualizarSolicitud;



--------------------------------------------------------
--  TABLA PEDIDO
--------------------------------------------------------
CREATE TABLE pedido (
    id_pedido NUMBER NOT NULL, 
    estado VARCHAR2(20 BYTE) NOT NULL, 
    nombre_cliente VARCHAR2(20 BYTE) NOT NULL, 
    precio_total NUMBER NOT NULL, 
    id_mesa NUMBER NOT NULL
);


ALTER TABLE pedido ADD CONSTRAINT pedido_pk PRIMARY KEY ( id_pedido );

insert into pedido (ID_PEDIDO,ESTADO,NOMBRE_CLIENTE,PRECIO_TOTAL,ID_MESA) values (1,2,'Josefina',6500,2);



--procedimiento para listar en datagridview--

create or replace procedure seleccionarPedido (registros out sys_refcursor)
as
Begin
 open registros for select id_pedido as "ID", estado as "Estado", nombre_cliente as "Cliente", precio_total as "Precio Total", id_mesa as "Mesa"
 from pedido
 order by id_pedido ASC;
End;



--------------------------------------------------------
--  TABLA ORDEN
--------------------------------------------------------
CREATE TABLE orden (
    id_orden NUMBER NOT NULL, 
    precio_subtotal NUMBER NOT NULL, 
    id_bebestible NUMBER NOT NULL, 
    id_postre NUMBER NOT NULL, 
    id_plato NUMBER NOT NULL, 
    id_pedido NUMBER NOT NULL, 
    estado VARCHAR2(10 BYTE) NOT NULL
);


ALTER TABLE orden ADD CONSTRAINT orden_pk PRIMARY KEY ( id_orden );

insert into orden (ID_ORDEN,PRECIO_SUBTOTAL,ID_BEBESTIBLE,ID_POSTRE,ID_PLATO,ID_PEDIDO,ESTADO) values (1,6500,1,1,1,1,'Listo');


--procedimiento para listar en datagridview--

create or replace procedure seleccionarOrden (registros out sys_refcursor)
as
Begin
 open registros for select o.id_orden as "ID", p.nombre_cliente as "Cliente", o.id_pedido as "Pedido", pla.descripcion as "Plato", b.descripcion as "Bebestible", po.descripcion as "Postre", o.precio_subtotal as "Precio Subtotal" , o.estado as "Estado" 
 from orden o, pedido p, plato pla, bebestible b, postre po
 where p.id_pedido = o.id_pedido AND pla.id_plato = o.id_plato AND b.id_bebestible = o.id_bebestible AND po.id_postre = o.id_postre
 order by id_orden ASC;
End;



--------------------------------------------------------
--  TABLA VENTA
--------------------------------------------------------
CREATE TABLE venta (
    id_venta NUMBER(5,0) NOT NULL, 
    fecha_venta DATE NOT NULL, 
    total_pagar NUMBER(6,0) NOT NULL, 
    detalle_pago VARCHAR2(100 BYTE) NOT NULL, 
    nombre_cliente VARCHAR2(100 BYTE) NOT NULL, 
    metodo_pago VARCHAR2(20 BYTE) NOT NULL, 
    id_pedido NUMBER(5,0) NOT NULL, 
    id_trabajador NUMBER(5,0) NOT NULL
);

ALTER TABLE venta ADD CONSTRAINT venta_pk PRIMARY KEY ( id_venta );

Insert into VENTA (ID_VENTA,FECHA_VENTA,TOTAL_PAGAR,DETALLE_PAGO,NOMBRE_CLIENTE,METODO_PAGO,ID_PEDIDO,ID_TRABAJADOR) values (1,to_date('03/12/19','DD/MM/RR'),6500,'Cliente Normal','Carlos','Efectivo',1,1);



create or replace procedure seleccionarVenta (registros out sys_refcursor)
as
Begin
 open registros for select id_venta as "ID", fecha_venta as "Fecha Venta", total_pagar as "Pago Total", nombre_cliente as "Cliente", metodo_pago as "Método de Pago"
 from venta v, trabajador t
 where t.id_trabajador = v.id_trabajador
 order by id_venta ASC;
End;

--------------------------------------------------------
--  PROCEDIMIENTOS 
--------------------------------------------------------
create or replace procedure grafVentasxDia(registros out sys_refcursor)
as
Begin
 open registros for select fecha_venta,count(id_venta)
 from venta
 group by fecha_venta
 order by fecha_venta;
 End;
 
 create or replace procedure grafVentasxMes(registros out sys_refcursor)
as
Begin
 open registros for select to_char(fecha_venta, 'Month/YYYY'),count(id_venta)
 from venta
 group by to_char(fecha_venta, 'Month/YYYY')
 order by to_char(fecha_venta, 'Month/YYYY');
 End;
 
 create or replace procedure grafVentasxAnio(registros out sys_refcursor)
as
Begin
 open registros for select to_char(fecha_venta, 'YYYY'),count(id_venta)
 from venta
 group by to_char(fecha_venta, 'YYYY')
 order by to_char(fecha_venta, 'YYYY');
 End;
 
 create or replace procedure grafGananciasxDia(registros out sys_refcursor)
as
Begin
 open registros for select fecha_venta,sum(total_pagar)
 from venta
 group by fecha_venta
 order by fecha_venta;
 End;
 
   create or replace procedure grafGananciasxMes(registros out sys_refcursor)
as
Begin
 open registros for select to_char(fecha_venta, 'Month/YYYY'),sum(total_pagar)
 from venta
 group by to_char(fecha_venta, 'Month/YYYY')
 order by to_char(fecha_venta, 'Month/YYYY');
 End;
 
  create or replace procedure grafGananciasxAnio(registros out sys_refcursor)
as
Begin
 open registros for select to_char(fecha_venta, 'YYYY'),sum(total_pagar)
 from venta
 group by to_char(fecha_venta, 'YYYY')
 order by to_char(fecha_venta, 'YYYY');
 End;

 create or replace procedure totalGananciasVentas(registros out sys_refcursor)
as
Begin
 open registros for select sum(total_pagar)
 from venta;
 End;
 
 create or replace procedure cantidadVentas(registros out sys_refcursor)
as
Begin
 open registros for select count(id_venta)
 from venta;
 End;
 
 create or replace procedure cantidadTrabajadores(registros out sys_refcursor)
as
Begin
 open registros for select count(id_trabajador)
 from trabajador;
 End;
 
 create or replace procedure cantidadReservas(registros out sys_refcursor)
as
Begin
 open registros for select count(id_reserva)
 from reserva;
 End;





--------------------------------------------------------
--  DDL for Index PLATO__IDX
--------------------------------------------------------
  CREATE UNIQUE INDEX PLATO__IDX ON PLATO (ID_CATEGORIA);

--------------------------------------------------------
--  DDL for Index VENTA__IDX
--------------------------------------------------------
  CREATE UNIQUE INDEX VENTA__IDX ON VENTA (ID_PEDIDO);

--------------------------------------------------------
--  DDL for Index VENTA__IDXV1
--------------------------------------------------------
  CREATE INDEX VENTA__IDXV1 ON VENTA (ID_TRABAJADOR); 

--------------------------------------------------------
--  DDL for Index PRODUCTO__IDX
--------------------------------------------------------
  CREATE UNIQUE INDEX PRODUCTO__IDX ON PRODUCTO (ID_PROVEEDOR); 

--------------------------------------------------------
--  DDL for Index RESERVA__IDX
--------------------------------------------------------
  CREATE UNIQUE INDEX RESERVA__IDX ON RESERVA (RUT_CLIENTE);
 
--------------------------------------------------------
--  DDL for Index RESERVA__IDXV1
--------------------------------------------------------
  CREATE UNIQUE INDEX RESERVA__IDXV1 ON RESERVA (ID_MESA); 






--------------------------------------------------------
--  Ref Constraints for Table ORDEN
--------------------------------------------------------
  ALTER TABLE ORDEN ADD CONSTRAINT BEBESTIBLE_FK FOREIGN KEY (ID_BEBESTIBLE)
	  REFERENCES BEBESTIBLE (ID_BEBESTIBLE);
  ALTER TABLE ORDEN ADD CONSTRAINT PLATO_FK FOREIGN KEY (ID_PLATO)
	  REFERENCES PLATO (ID_PLATO);
  ALTER TABLE ORDEN ADD CONSTRAINT POSTRE_FK FOREIGN KEY (ID_POSTRE)
	  REFERENCES POSTRE (ID_POSTRE);
  ALTER TABLE ORDEN ADD CONSTRAINT PEDIDO_FK FOREIGN KEY (ID_PEDIDO)
	  REFERENCES PEDIDO (ID_PEDIDO);

--------------------------------------------------------
--  Ref Constraints for Table PLATO
--------------------------------------------------------
  ALTER TABLE PLATO ADD CONSTRAINT PLATO_CATEGORIA_FK FOREIGN KEY (ID_CATEGORIA)
	  REFERENCES CATEGORIA (ID_CATEGORIA);

--------------------------------------------------------
--  Ref Constraints for Table PRODUCTO
--------------------------------------------------------
  ALTER TABLE PRODUCTO ADD CONSTRAINT PRODUCTO_PROVEEDOR_FK FOREIGN KEY (ID_PROVEEDOR)
	  REFERENCES PROVEEDOR (ID_PROVEEDOR);

--------------------------------------------------------
--  Ref Constraints for Table RESERVA
--------------------------------------------------------
  ALTER TABLE RESERVA ADD CONSTRAINT RESERVA_CLIENTE_FK FOREIGN KEY (RUT_CLIENTE)
	  REFERENCES CLIENTE (RUT_CLIENTE);
  ALTER TABLE RESERVA ADD CONSTRAINT RESERVA_MESA_FK FOREIGN KEY (ID_MESA)
	  REFERENCES MESA (ID_MESA);

--------------------------------------------------------
--  Ref Constraints for Table USUARIO
--------------------------------------------------------
  ALTER TABLE USUARIO ADD CONSTRAINT PERFIL_FK FOREIGN KEY (ID_PERFIL)
	  REFERENCES PERFIL (ID_PERFIL);
	  
	  --------------------------------------------------------
--  Ref Constraints for Table TRABAJADOR
--------------------------------------------------------
  ALTER TABLE TRABAJADOR ADD CONSTRAINT CARGO_FK FOREIGN KEY (ID_CARGO)
	  REFERENCES CARGO (ID_CARGO);

--------------------------------------------------------
--  Ref Constraints for Table PEDIDO
--------------------------------------------------------
  ALTER TABLE PEDIDO ADD CONSTRAINT MESA_FK FOREIGN KEY (ID_MESA)
	  REFERENCES MESA (ID_MESA);

--------------------------------------------------------
--  Ref Constraints for Table VENTA
--------------------------------------------------------
  ALTER TABLE VENTA ADD CONSTRAINT PEDIDO_FK FOREIGN KEY (ID_PEDIDO)
	  REFERENCES PEDIDO (ID_PEDIDO);
  ALTER TABLE VENTA ADD CONSTRAINT TRABAJADOR_FK FOREIGN KEY (ID_TRABAJADOR)
	  REFERENCES TRABAJADOR (ID_TRABAJADOR);

