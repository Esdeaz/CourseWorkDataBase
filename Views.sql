--Список клиентов и их номеров
create view getclientnumber as
select ab.clientname, phonenumber
from abonentsnums an
inner join abonents ab on ab.clientid=an.clientid

--Проверка
select * from getclientnumber

--Список скидок для каждого города
create view getdiscountcityname as
select r.cityname, discountid, discountpercentage
from discounts d
inner join rates r on r.cityid = d.cityid

--Проверка
select*from getdiscountcityname

--Список телефонных переговоров и номеров, с которых звонили клиенты
create view getconv as
select ab.clientname, an.idserialkey, an.phonenumber, callid, phoneto, duration
from conversations co
inner join abonents ab on ab.clientid = co.clientid
inner join abonentsnums an on an.idserialkey = co.phoneidfrom

--Проверка
select*from getconv
