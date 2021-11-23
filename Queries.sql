--Получение списка скидок по коду города
SELECT d.cityid,
d.discountpercentage,
cityname
FROM rates r
INNER JOIN discounts d ON r.cityid = d.cityid;


--Получение списка клиентов с сортировкой по стоимости
select co.clientid, clientname, co.price, co.pricewithdiscount
from abonents ab
inner join conversations co on co.clientid = ab.clientid
order by co.price desc;


--Получение номеров клиентов
select ab.clientid, ab.clientname, an.phonenumber
from abonentsnums an
inner join abonents ab on ab.clientid = an.clientid
order by ab.clientid asc

--Получить тариф и скидку для конкретного кода города
select cityid, discountpercentage  from discounts
union
select cityid, rate from rates
order by cityid asc

--Группировка сумм, потраченных на разговоры, по кодам городов
select cityid, sum(price) as sum from conversations group by cityid order by cityid asc

--Группировка сумм по кодам городов, средняя стоимость которых превышают определенную сумму
select cityid, sum(price) as sum from conversations group by cityid having avg(price) > 100 order by cityid asc

--Получение информации по звонкам.
select ab.clientname, an.idserialkey, an.phonenumber, callid, phoneto, duration
from conversations co
inner join abonents ab on ab.clientid = co.clientid
inner join abonentsnums an on an.idserialkey = co.phoneidfrom


--Получить среднее время общения в минутах
SELECT Round((AVG(co.duration) / 60.00)::numeric,2) as AverageConversationsTime
FROM conversations co

--Получить города, в которые клиенты звонят
Select ab.clientname, cityname
from rates r
inner join conversations co on co.cityid=r.cityid
inner join abonents ab on ab.clientid=co.clientid
