--Расчет длительности разговора
CREATE OR REPLACE FUNCTION calculate_duration()
Returns trigger
language plpgsql AS
$$
Begin
update Conversations set Duration = 
EXTRACT(EPOCH FROM (NEW.DateEnd::timestamptz - NEW.DateStart::timestamptz))
where CallId" = NEW.CallId;
return new;
END;
$$;

--Триггер, вызывающий функцию расчета длительности разговора
CREATE TRIGGER calc_duration
AFTER INSERT ON Conversations
FOR EACH ROW EXECUTE PROCEDURE
calculate_duration();

--Расчет стоимости разговора без скидки и со скидкой
CREATE OR REPlACE FUNCTION calculate_price()
RETURNS TRIGGER
LANGUAGE plpgsql AS
$$
BEGIN
UPDATE Conversations SET Price=
round(((Duration / 60.00) * (select Rate from Rates where CityId = NEW.CityId))::numeric,2)
where CallId = NEW.CallId;

UPDATE Conversations SET PriceWithDiscount=
Round((((Duration / 60.00) * (select Rate from Rates where CityId = NEW.CityId)) *
	   ((100.00 - (select DiscountPercentage from Discounts where CityId = NEW.CityId)) / 100.00))::numeric,2)
where CallId = NEW.CallId;
RETURN NEW;
END;
$$;

--Триггер расчета стоимости без скидки и со скидкой
CREATE TRIGGER calc_price
AFTER INSERT ON Conversations
FOR EACH ROW EXECUTE PROCEDURE
calculate_price();





