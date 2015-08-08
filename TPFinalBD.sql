create database TrabajoPractico;

use TrabajoPractico;

create table tarjeta
	(
		cod_tarjeta int primary key,
        descripcion varchar(50));

create table provincia
	(
		cod_prov int primary key,
        descripcion varchar(50));
        
create table pais
	(
		cod_pais int primary key,
        descripcion varchar(50));
        
create table banco
	(
		cod_banc int primary key,
        descripcion varchar(50));
        
create table version
	(
		cod_version int primary key,
        descripcion varchar(50));
        
 create  table localidad
	(
		cod_loc int primary key,
        descripcion varchar (50),
        cod_prov int,
        foreign key (cod_prov) references provincia (cod_prov)
	);
    
create table comercio

	(
		cod_comercio int primary key,
        raz_social varchar (50),
        num_tel varchar (11),
        domicilio varchar (50),
        tipo varchar (20),
        cod_loc int,
        foreign key (cod_loc) references localidad (cod_loc)
	);


create table terminal
	(
		id_terminal int primary key,
		memoria int,
		año_importacion date,
		cod_pais int,
		cod_version int,
        cod_comercio int,
		foreign key (cod_pais) references pais (cod_pais),
		foreign key (cod_version) references version (cod_version),
        foreign key (cod_comercio) references comercio (cod_comercio)
    );

    

create table venta
	
	(
		id_venta int primary key,
        factura_num int,
        numero_tarjeta varchar(50),
        fecha_hora date,
        cuotas int,
        cod_tarjeta int,
        id_terminal int,
        monto int,
        foreign key (cod_tarjeta) references tarjeta (cod_tarjeta),
        foreign key (id_terminal) references terminal (id_terminal)
	);
      

        
create table grande
	(
		cod_comercio int primary key,
        sucursales int,
        foreign key (cod_comercio) references comercio (cod_comercio)
	);
    
create table pequeño
	(
		cod_comercio int primary key,
        responsables varchar (50),
        foreign key (cod_comercio) references comercio (cod_comercio)
	);
    
create table tecnico
	(
		cuit_tec varchar(50) primary key,
        nombre varchar (50),
        fecha_ingreso date,
        cuenta int,
        sueldo int,
        cod_banc int,
        foreign key (cod_banc) references banco (cod_banc)
	);


create table reparacion
	(
		num_rep int primary key,
        id_terminal int,
        duracion time,
        costo int,
        fecha date,
        cuit_tec varchar(50),
        foreign key (id_terminal) references terminal (id_terminal),
        foreign key (cuit_tec) references tecnico (cuit_tec)
	);



/* Inserts tarjeta*/
insert into tarjeta  values(1,'Visa');
insert into tarjeta  values(2,'Mastercard');
insert into tarjeta  values(3,'Amex');
insert into tarjeta  values(4,'City');
insert into tarjeta  values(5,'Galicia');

/* Inserts pais*/

insert into pais values(1,'Argentina');
insert into pais values(2,'Argelia');
insert into pais values(3,'Turquia');
insert into pais values(4,'Mexico');
insert into pais values(5,'Peru');
insert into pais values(6,'Belgica');

/*Inserts Version*/

insert into version values(1,'Win 8');
insert into version values(2,'Win 7');
insert into version values(3,'Win xp');
insert into version values(4,'Win 7');
insert into version values(5,'Win 7');
insert into version values(6,'Win 10');

/*Inserts Provincia*/

insert into provincia values(1, 'Buenos Aires');
insert into provincia values(2, 'La Pampa');
insert into provincia values(3, 'Misiones');
insert into provincia values(4, 'Jujuy');
insert into provincia values(5, 'Salta');
insert into provincia values(6, 'Cordoba');

/*Inserts Localidad*/

insert into localidad values(1, 'Bolivar', 1);
insert into localidad values(2, 'Santa rosa', 2);
insert into localidad values(3, 'San Vicente', 3);
insert into localidad values(4, 'Valle', 4);
insert into localidad values(5, 'Lejania', 5);
insert into localidad values(6, 'Saburrea', 6);

/* Inserts Comercio*/

insert into comercio values(1, 'Pepito S.A', '4669-0000', 'Diaz Velez 1500', 'Grande', 1);
insert into comercio values(2, 'Juanito S.A', '4669-0001', 'Tucuman 1501', 'Grande', 2);
insert into comercio values(3, 'Josesito S.A', '4669-0002', 'Don Bosco 1523', 'Pequeño', 3);
insert into comercio values(4, 'Pamelita S.A', '4669-0005', 'Varela 1533', 'Grande', 4);
insert into comercio values(5, 'Sarlanga S.A', '4669-0023', 'Arieta 1544', 'Pequeño', 5);
insert into comercio values(6, 'Alonso S.A', '4669-0011', 'San Martin 350', 'Grande', 6);

/* Inserts terminal*/

insert into terminal values(1, 2048, '2005-10-21',1,1,1);
insert into terminal values(2, 2048, '2005-10-21',2,2,2);
insert into terminal values(3, 2048, '2005-10-21',3,3,3);
insert into terminal values(4, 2048, '2005-10-21',4,4,4);
insert into terminal values(5, 2048, '2005-10-21',5,5,5);
insert into terminal values(6, 2048, '2005-10-05',6,6,6);

/* Inserts Banco*/

insert into banco values(1, 'Santander Rio');
insert into banco values(2, 'BBVA');
insert into banco values(3, 'Comafi');
insert into banco values(4, 'Provincia');
insert into banco values(5, 'Galicia');

/*Inserts Venta*/

insert into venta values(1, 100001, '1234-1234-1234-4321', '2015-05-15', 3, 1, 1,5000);
insert into venta values(2, 100002, '1354-0234-1234-1135', '2013-01-01', 12, 2, 2,3000); 
insert into venta values(3, 100003, '1464-1244-1334-1134', '2013-01-01', 6, 3, 3,4000); 
insert into venta values(4, 100004, '1574-2244-1444-1232', '2012-10-15', 7, 4, 4,6000); 
insert into venta values(5, 100005, '1234-1234-1234-4321', '2013-04-01', 12, 5, 5,9000);

/*Inserts Grande*/

insert into grande values(1, '5');
insert into grande values(2, '7');
insert into grande values(3, '8');
insert into grande values(4, '2');
insert into grande values(5, '1');

/*Inserts Pequeño*/

insert into pequeño values(1, 'Alan Figueroa');
insert into pequeño values(2, 'Santiago Cruz');
insert into pequeño values(3, 'Andres Cardinale');
insert into pequeño values(4, 'Alan Faena');
insert into pequeño values(5, 'Flavio Mendoza');

/*Inserts Tecnico*/

insert into tecnico values('30-67881435-7', 'Omar Estevez', '2009-11-10', 101513, 5000, 1);
insert into tecnico values('20-51455454-6', 'Federico Luz', '2011-11-10', 101213, 7000, 2);
insert into tecnico values('30-81818144-7', 'Angel Gallardo', '2010-10-10', 101411, 6000, 3);
insert into tecnico values('20-87414525-6', 'Benito Salomon', '2010-11-10', 101615, 8000, 4);
insert into tecnico values('30-65987415-7', 'Daniel Osvaldo', '2013-11-10', 101714, 10000, 5);

/*Inserts Reparacion */

insert into reparacion values(1, 1, '36:00:00', 1500, '2011-04-06',  '30-67881435-7');
insert into reparacion values(2, 2,'12:00:00', 2500, '2012-09-12', '20-51455454-6');
insert into reparacion values(3, 3,'6:00:00', 500, '2014-07-25', '30-81818144-7');
insert into reparacion values(4, 4,'48:00:00', 750, '2014-11-11', '30-65987415-7');
insert into reparacion values(5, 5,'21:00:00', 10000, '2010-02-01', '30-65987415-7');


