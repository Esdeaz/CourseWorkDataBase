INSERT INTO Abonents (INN, ClientName, ClientAddress) VALUES
(353889100102, 'ООО КОМПАНИЯ 1', 'Адрес 1')
(914137410566, 'ООО КОМПАНИЯ 2', 'Адрес 2'),
(567471877157, 'ООО КОМПАНИЯ 3', 'Адрес 3'),
(380144426906, 'ООО КОМПАНИЯ 4', 'Адрес 4'),
(430130644430, 'ОАО КОМПАНИЯ 5', 'Адрес 5'),
(521398845699, 'ЗАО КОМПАНИЯ 6', 'Адрес 6'),
(473666008268, 'ООО КОМПАНИЯ 7', 'Адрес 7'),
(853340688337, 'ОАО КОМПАНИЯ 8', 'Адрес 8'),
(286704288255, 'ООО КОМПАНИЯ 8', 'Адрес 9'),
(733477954103, 'ООО КОМПАНИЯ 9', 'Адрес 10')

INSERT INTO AbonentsNums (clientId, PhoneNumber) Values
(1, '+70700106285'),
(2, '+79587828393'),
(2, '+72059882872'),
(3, '+77888775072'),
(4, '+70546897216'),
(5, '+74536583460'),
(6, '+73251240782'),
(7, '+73251240782'),
(8, '+75000442279'),
(9, '+78285004188'),
(10,'+70235630796')

INSERT INTO Rates (RateDay, RateNight, CityName) Values
(3.25, 3.5, 'Белый Яр'),
(3.15, 3.2, 'Боград'),
(2.13, 4.61, 'Копьево'),
(2.74, 3.12, 'Саяногорск'),
(2.65, 2.89, 'Усть-Абакан'),
(1.5, 2.64, 'Черногорск'),
(2.78, 3.45, 'Анадырь'),
(1.78, 2.36, 'Архангельск'),
(2.45, 3.1, 'Березник'),
(1.90, 2.35, 'Вельск')

INSERT INTO Discounts (DiscountDuration, DiscountPercentage, CityId) Values
('2021-12-05', 10, 100),
('2021-12-05', 9, 101),
('2021-12-05', 8, 102),
('2021-12-05', 7, 103),
('2021-12-05', 6, 104),
('2021-12-05', 5, 105),
('2021-12-05', 4, 106),
('2021-12-05', 3, 107),
('2021-12-05', 2, 108),
('2021-12-05', 1, 109)

INSERT INTO Conversations (CityId, ClientId, PhoneTo, PhoneIDFrom, DateStart, DateEnd) VALUES
(100, 1, '+70102133936', 1, '2021-10-22 10:23:54', '2021-10-22 10:29:12'),
(101, 2, '+70290572648', 3, '2021-10-22 10:23:54', '2021-10-22 10:29:12'),
(102, 3, '+75028321054', 4, '2021-10-22 10:23:54', '2021-10-22 10:29:12'),
(103, 4, '+70290572648', 5, '2021-10-22 10:23:54', '2021-10-22 10:29:12'),
(104, 5, '+70290572648', 6, '2021-10-22 10:23:54', '2021-10-22 10:29:12'),
(105, 6, '+75028321054', 7, '2021-10-22 10:23:54', '2021-10-22 10:29:12'),
(106, 7, '+70290572648', 8, '2021-10-22 10:23:54', '2021-10-22 10:29:12'),
(107, 8, '+70290572648', 9, '2021-10-22 10:23:54', '2021-10-22 10:29:12'),
(108, 9, '+70290572648', 10, '2021-10-22 10:23:54', '2021-10-22 10:29:12'),
(109, 10, '+70290572648', 11, '2021-10-22 10:23:54', '2021-10-22 10:29:12')



