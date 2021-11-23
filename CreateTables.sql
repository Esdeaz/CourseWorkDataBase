--Создание таблицы Абоненты
CREATE TABLE IF NOT EXISTS public.abonents
(
    clientid integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    inn bigint NOT NULL,
    clientname character varying(100) COLLATE pg_catalog."default" NOT NULL,
    clientaddress character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "Abonents_pkey" PRIMARY KEY (clientid),
    CONSTRAINT "Abonents_ClientName_check2" CHECK (char_length(clientname::text) <= 100 AND char_length(clientname::text) > 0),
    CONSTRAINT "Abonents_ClientAddress_check" CHECK (char_length(clientaddress::text) <= 100 AND char_length(clientaddress::text) > 0)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.abonents
    OWNER to postgres;

GRANT ALL ON TABLE public.abonents TO postgres WITH GRANT OPTION;

--Создание таблицы Номера абонентов
CREATE TABLE IF NOT EXISTS public.abonentsnums
(
    clientid integer NOT NULL,
    phonenumber character varying(12) COLLATE pg_catalog."default" NOT NULL,
    idserialkey integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    CONSTRAINT "AbonentsNum_pkey" PRIMARY KEY (idserialkey),
    CONSTRAINT fk_clientid FOREIGN KEY (clientid)
        REFERENCES public.abonents (clientid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.abonentsnums
    OWNER to postgres;

GRANT ALL ON TABLE public.abonentsnums TO postgres WITH GRANT OPTION;

--Создание таблицы Переговоры
CREATE TABLE IF NOT EXISTS public.conversations
(
    callid integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    price double precision DEFAULT 0,
    pricewithdiscount double precision,
    cityid integer NOT NULL,
    clientid integer NOT NULL,
    phoneto character varying(12) COLLATE pg_catalog."default" NOT NULL,
    phoneidfrom integer NOT NULL,
    duration bigint DEFAULT 0,
    datestart timestamp without time zone,
    dateend timestamp without time zone,
    CONSTRAINT "Conversations_pkey" PRIMARY KEY (callid),
    CONSTRAINT "fk_cityId" FOREIGN KEY (cityid)
        REFERENCES public.rates (cityid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "fk_clientId" FOREIGN KEY (clientid)
        REFERENCES public.abonents (clientid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "fk_phoneIdFrom" FOREIGN KEY (phoneidfrom)
        REFERENCES public.abonentsnums (idserialkey) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "Conversations_check" CHECK (dateend >= datestart),
    CONSTRAINT "Conversations_PhoneTo_check" CHECK (char_length(phoneto::text) > 0 AND char_length(phoneto::text) <= 12)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.conversations
    OWNER to postgres;

GRANT ALL ON TABLE public.conversations TO postgres WITH GRANT OPTION;

--Создание таблицы Скидки
CREATE TABLE IF NOT EXISTS public.discounts
(
    discountid integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    discountduration timestamp without time zone NOT NULL,
    discountpercentage double precision NOT NULL DEFAULT 0,
    cityid integer NOT NULL,
    CONSTRAINT "Discount_pkey" PRIMARY KEY (discountid),
    CONSTRAINT "fk_cityID" FOREIGN KEY (cityid)
        REFERENCES public.rates (cityid) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "Discounts_DiscountPercentage_check" CHECK (discountpercentage >= 0::double precision AND discountpercentage <= 100::double precision)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.discounts
    OWNER to postgres;

GRANT ALL ON TABLE public.discounts TO postgres WITH GRANT OPTION;

--Создание таблицы Тарифы
CREATE TABLE IF NOT EXISTS public.rates
(
    cityid integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 100 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    cityname character varying(100) COLLATE pg_catalog."default" NOT NULL,
    rate double precision NOT NULL DEFAULT 0,
    CONSTRAINT "Rates_pkey" PRIMARY KEY (cityid)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.rates
    OWNER to postgres;

GRANT ALL ON TABLE public.rates TO postgres WITH GRANT OPTION;