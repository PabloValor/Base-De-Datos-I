/*Ejercios*/

/*1 | Consultas*/
/*a*/
select raz_social
from comercio 
where raz_social like 'A%' 

/*b*/
select T.nombre
from tecnico T 
inner join banco B
on B.cod_banc=T.cod_banc
where B.descripcion = 'Galacia'
and T.nombre like '%Juan%'


/*c*/

select C.RAZ_SOCIAL,C.domicilio,L.descripcion,p.descripcion
from comercio C
inner join grande G
on G.cod_comercio = C.cod_comercio
inner join localidad L
on l.cod_loc = C.cod_loc
inner join provincia P
on P.cod_prov = L.cod_prov
where G.sucursales > 3
order by P.descripcion, L.descripcion 

/*d*/

select T.id_terminal, C.raz_social
from terminal T
left join comercio C
on T.cod_comercio=C.cod_comercio
left join venta V
on V.id_terminal=T.id_terminal
where V.id_venta is Null


/*e*/

select V.id_venta Transacciones, V.fecha_hora, V.monto, C.raz_social
from terminal T
inner join comercio C
on T.cod_comercio=C.cod_comercio
inner join venta V
on V.id_terminal=T.id_terminal
where (V.fecha_hora >='2013-01-01' and V.fecha_hora < '2013-01-02') and V.cuotas >= 6 and V.cuotas <= 12 

/*f*/
select YEAR(T.año_importacion),COUNT(*)
from terminal T 
group by YEAR(T.año_importacion)

/*g REVISAR*/
select * 
from terminal T
where id_terminal in (select id_terminal from reparacion group by id_terminal having COUNT(*) > 4)

/*h REVISAR*/
select * from terminal T
where exists (select 1 from reparacion R where R.id_terminal=T.id_terminal)
--Averiguar si el resultado tiene que contemplar solo las terminales, 
--que tuvieron al menos una reparación por cada técnico (de todos los registrados en la tabla técnico)

/*i */
select nombre,sueldo 
from tecnico 
where cuit_tec in (select R.cuit_tec 
					from reparacion R
                    group by R.cuit_tec 
                    order by COUNT(*) desc)

/*j REVISAR*/
select c.cod_comercio,raz_social, SUM(v.monto) 
from venta v
inner join terminal T on T.id_terminal=v.id_terminal
inner join comercio C on T.cod_comercio=C.cod_comercio
where year (fecha_hora )=2012 
group by c.cod_comercio,C.raz_social
having SUM(v.monto)>1

/*2 | ABM*/
/*a REVISAR*/
delete  from Tecnico T 
where cuit_tec in (select T.cuit_tec
					from tecnico T
                    inner join reparacion R on T.cuit_tec = R.cuit.tec 
                    where fecha >= '2010-01-01' and fecha < '2011-01-01'
                    and nombre like '%oscar%')
/*b*/
update tecnico 
set sueldo=sueldo+(sueldo*0.20) 
where fecha_ingreso < '2013-01-01'

/*c*/
update venta 
set numero_tarjeta='9999-9999-9999-9999'
where numero_tarjeta='1234-1234-1234-4321'
and fecha_hora = '2013-04-01'

