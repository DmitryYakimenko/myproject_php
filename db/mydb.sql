-- phpMyAdmin SQL Dump
-- version 4.0.10.10
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Янв 30 2016 г., 12:40
-- Версия сервера: 5.6.26
-- Версия PHP: 5.6.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `mydb`
--

-- --------------------------------------------------------

--
-- Структура таблицы `attributs`
--

CREATE TABLE IF NOT EXISTS `attributs` (
  `attribut_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `attribut_name` varchar(100) NOT NULL,
  PRIMARY KEY (`attribut_id`),
  UNIQUE KEY `attribut_name_UNIQUE` (`attribut_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=110 ;

--
-- Дамп данных таблицы `attributs`
--

INSERT INTO `attributs` (`attribut_id`, `attribut_name`) VALUES
(93, 'ECC'),
(5, 'Внутренняя тактовая частота'),
(30, 'Время наработки на отказ'),
(75, 'Встроенное видео'),
(16, 'Выходы DVI'),
(15, 'Графический чип'),
(96, 'Емкость накопителя'),
(6, 'Интегрированная графика'),
(24, 'Интерфейс'),
(78, 'Код производителя'),
(84, 'Количество внешних отсеков 3.5"'),
(85, 'Количество внутренних отсеков 3.5"'),
(10, 'Количество контактов'),
(83, 'Количество отсеков 5.25"'),
(88, 'Количество планок'),
(106, 'Количество разъемов дополнительного питания для видеокарт'),
(108, 'Количество разьемов для подключения HDD/FDD/SATA'),
(4, 'Количество ядер'),
(70, 'Коннектор питания'),
(76, 'Контроллер RAID'),
(86, 'Максимальная длина видеокарты'),
(17, 'Максимально поддерживаемое разрешение'),
(109, 'Максимальные нагрузки'),
(77, 'Максимальный объем оперативной памяти'),
(100, 'Максимальный уровень шума'),
(80, 'Материал корпуса'),
(35, 'Материал радиатора'),
(101, 'Мощность'),
(82, 'Мощность блока питания'),
(31, 'Назначение'),
(81, 'Наличие блока питания'),
(89, 'Напряжение питания'),
(23, 'Объем'),
(97, 'Объем буфера'),
(19, 'Объем памяти'),
(104, 'Охлаждение'),
(39, 'Питание и тип коннектора'),
(18, 'Поддерживаемые 3D API'),
(72, 'Поддержка памяти'),
(74, 'Поддержка процессоров'),
(3, 'Поколение процессора'),
(90, 'Радиаторы на планках'),
(8, 'Разблокированный множитель'),
(34, 'Размер вентилятора'),
(20, 'Размеры'),
(40, 'Размеры (ШхВхГ)'),
(21, 'Разрядность шины памяти'),
(1, 'Семейство процессора'),
(14, 'Система охлаждения'),
(28, 'Скорость записи'),
(98, 'Скорость передачи данных'),
(27, 'Скорость чтения'),
(73, 'Слоты'),
(33, 'Совместимость'),
(92, 'Схема таймингов памяти'),
(11, 'Тестовый атрибут без типа'),
(94, 'Технология'),
(32, 'Тип'),
(95, 'Тип жесткого диска'),
(102, 'Тип кабелей'),
(79, 'Тип корпуса'),
(22, 'Тип накопителя'),
(87, 'Тип памяти'),
(37, 'Тип подшипника'),
(2, 'Тип разъема'),
(103, 'Тип разъема подключения к материнской плате'),
(105, 'Тип разъема подключения питания процессора'),
(107, 'Тип разъемов дополнительного питания для видеокарт'),
(9, 'Тип упаковки'),
(26, 'Тип ячеек памяти'),
(38, 'Уровень шума'),
(25, 'Формфактор'),
(99, 'Цвет'),
(36, 'Частота вращения'),
(12, 'Частота памяти'),
(7, 'Частота шины данных'),
(13, 'Частота ядра'),
(71, 'Чипсет (Северный мост)'),
(29, 'Энергопотребление'),
(91, 'Эффективная пропускная способность');

-- --------------------------------------------------------

--
-- Структура таблицы `customers`
--

CREATE TABLE IF NOT EXISTS `customers` (
  `customer_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `surname` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `discount` tinyint(2) unsigned DEFAULT NULL,
  `phone` varchar(13) NOT NULL,
  `role` varchar(45) DEFAULT 'user',
  `password` varchar(45) DEFAULT NULL,
  `registration_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `phone_UNIQUE` (`phone`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `customers`
--

INSERT INTO `customers` (`customer_id`, `username`, `surname`, `email`, `discount`, `phone`, `role`, `password`, `registration_date`) VALUES
(5, 'test', 'test', 'test@test.test', NULL, '+300000000000', 'user', 'd5ed48bdbc07eaa9479b563a0c7972d3', '2016-01-26 11:07:02');

-- --------------------------------------------------------

--
-- Структура таблицы `goods`
--

CREATE TABLE IF NOT EXISTS `goods` (
  `good_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `good_name` varchar(100) NOT NULL,
  `price` float unsigned NOT NULL,
  `good_type_id` int(10) unsigned NOT NULL,
  `description` text,
  `image` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`good_id`,`good_type_id`),
  KEY `fk_goods_type_goods_idx` (`good_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=39 ;

--
-- Дамп данных таблицы `goods`
--

INSERT INTO `goods` (`good_id`, `good_name`, `price`, `good_type_id`, `description`, `image`) VALUES
(1, 'Intel Core i5-4460 3.2GHz/5GT/s/6MB (BX80646I)', 5312, 1, 'Процессор Intel Core i5-4460 основан на новой архитектуре Haswell Refresh. Номинальная внутренняя частота процессора составляет 3.2 ГГц, которая в режиме "турбо" увеличивается до 3.4 ГГц.', NULL),
(2, 'AMD FX-6300 3.5GHz/5200MHz /8MB (FD6300WMHKBO)', 2764, 1, NULL, NULL),
(4, 'Asus H81M-K (s1150, Intel H81, PCI-Ex16)', 1235, 3, NULL, NULL),
(5, 'Asus M5A78L-M LX3 (sAM3+, AMD 760G, PCI-Ex16)', 1855, 3, NULL, NULL),
(6, 'Aerocool PGS V3X Advance Black Edition + Aero', 1629, 4, NULL, NULL),
(7, 'Crown SM158 500 Вт Black Silver', 1249, 4, NULL, NULL),
(8, 'Asus PCI-Ex GeForce GTX 950 2048MB GDDR5 (128)', 4921, 2, NULL, NULL),
(9, 'MSI PCI-Ex Radeon R9 390X 8192MB GDDR5 (512bi)', 13308, 2, NULL, NULL),
(10, 'Kingston DDR3-1600 4096MB PC3-12800 (KVR16N11)', 606, 5, NULL, NULL),
(11, 'Kingston DDR3-1600 8192MB PC3-12800 (KVR16N11)', 1001, 5, NULL, NULL),
(12, 'Жесткий диск Seagate Barracuda 7200.12 500GB ', 1275, 6, NULL, NULL),
(13, 'Жесткий диск Western Digital My Passport Ultr', 1619, 6, NULL, NULL),
(14, 'Aerocool KCAS-700 700W (4713105953282)', 1449, 9, NULL, NULL),
(15, 'DeepCool Explorer 480W (DE480)', 658, 9, NULL, NULL),
(28, 'Intel Core i7-6700K 4.0GHz/8GT/s/8MB (BX80662I76700K) s1151 BOX', 11699, 1, 'Новый процессор Intel Core i7-6700K 6-го поколения, с кодовым названием микроархитектуры Skylake. Предназначен для настольной платформы Intel LGA 1151. Принадлежит к семейству высокопроизводительных процессоров Core i7 с большим разгонным потенциалом.  Intel Core i7-6700K производится по стандарту 14-нм техпроцесса, имеет 4 ядра, которые работают в 8 потоков со штатной тактовой частотой 4.0 ГГц, 4.2 ГГц в режиме Turbo Boost 2.0. Объем кэш-памяти 3 уровня равен 8 МБ. Имеет 2-х канальный контроллер памяти DDR4 / DDR3L и разблокированный множитель.', NULL),
(29, 'AMD FX-8320 3.5GHz/5200MHz/8MB', 4050, 1, 'AMD FX-8320 — восьмиядерный процессор основанный на микроархитектуре Vishera изготовленный по 32 нм техпроцессу. Частота процессора — 3.5 ГГц. Включена поддержка режима Turbo повышающая частоту до 4 ГГц. Процессор имеет 8 МБ кеша второго уровня и 8 МБ кеша третьего уровня. Тепловыделение процессора составляет 125 Вт.', NULL),
(30, 'MSI PCI-Ex Radeon R9 380 2048MB', 6555, 2, 'Графическая карта является самым важным элементом в достижении высоких FPS. Вот почему MSI представляет вам лучшее из лучшего. Беспрецедентно высокая производительность — MSI R9 380 Gaming. Подробнее: http://hard.rozetka.com.ua/msi_r9_380_gaming_2g/p3438848/', NULL),
(31, 'SSD Kingston SSDNow V300 120GB 2.5" SATAIII MLC (SV300S37A/120G) ', 1274, 7, 'Повысьте скорость работы вашего компьютера и сэкономьте средства, заменив старый жесткий диск на твердотельный накопитель SSDNowV300 компании Kingston. Это самое экономически эффективное решение для повышения производительности системы и более простой способно сравнению с переносом всех данных на новую систему. SSDNow V300 имеет контроллер LSI SandForce, оптимизированный для флэш-памяти нового поколения, что обеспечивает высочайшее качество и надежность. Накопители состоят из твердотельных компонентов и не содержат движущихся деталей, поэтому они имеют повышенную ударопрочность и выдерживают падения и вибрации. Накопители SSDNow V300 просты в установке и поставляются в комплектах, содержащих все необходимые аксессуары, включая программное обеспечение для клонирования файлов и операционной системы за считанные минуты. Они имеют трехлетнюю гарантию, бесплатную техническую поддержку и отличаются легендарной надежностью Kingston.', NULL),
(32, 'Zalman CNPS10X Performa+', 925, 8, 'Процессорный кулер Zalman CNPS10X Performa+ оснащен блоком алюминиевых ребер и пятью медными теплоотводными трубками, сходящимися у основания и проходящими насквозь радиаторный блок.', NULL),
(33, 'Gigabyte GA-Z97X-Gaming 3 (s1150, Intel Z97, PCI-Ex16)', 3952, 3, 'Системные платы Gigabyte укомплектованы всем необходимым для построения бескомпромиссной, высокопроизводительной игровой системы. Заряженные по полной, системные платы Gigabyte могут нести на борту продвинутые технологии обработки звука, два сетевых разъёма, поддержку мультиграфических решений, расширенные возможности охлаждения, и, разумеется, обладают агрессивным дизайном. Системная плата Gigabyte — серьезный выбор прирожденных геймеров.', NULL),
(34, 'Zalman Z11 Plus HF1 Black', 2299, 4, 'Передняя сетчатая крышка для лучшего охлаждения', NULL),
(35, 'Kingston DDR3-1600 8192MB PC3-12800 HyperX FURY Blue (HX316C10F/8)', 1350, 5, 'Простой апгрейд системы и современный внешний вид', NULL),
(36, 'Western Digital Purple 3TB 64MB WD30PURX 3.5 SATA III', 2999, 6, 'В накопителе WD Purple для систем наблюдения применяется уникальная технология AllFrame, обеспечивающая превосходную надежность работы в системах безопасности для дома или малых и средних предприятий. Уникальные микропрограммные разработки, реализованные в накопителе WD Purple, совместимые с набором команд работы с потоковыми данными протокола ATA, уменьшают число ошибок, вызывающих распад изображения и перебои в записи, которые возникают при использовании в системах безопасности обычных накопителей для компьютеров. Накопитель WD Purple для систем наблюдения создан для круглосуточной работы в системах безопасности с 32 или менее камерами высокой четкости и 8 или менее жесткими дисками.', NULL),
(37, 'Seasonic Platinum-660 (SS-660XP2) ', 6156, 9, 'Особеностью серии Platinum является высокотехнологичная LLC/full-bridge топология электроцепи с уникальной встроенной панелью управления прямым током с внедренным модулем регуляции напряжения. Этот дизайн способствует практически идеальному преобразованию постоянного тока что оптимизирует эффективность уменьшая потерю тока и полного сопротивления.', NULL),
(38, 'Thermaltake Water 3.0 Ultimate (CL-', 4639, 8, 'Thermaltake Water 3.0 Ultimate — необслуживаемая процессорная система жидкостного охлаждения предназначена для установки на процессоры с сокетом 1366 / 1150 / 1155 / 1156 / 2011 от Intel, и FM1 / FM2 / AM2 / AM2+ / AM3 / AM3+ от AMD Подробнее: http://hard.rozetka.com.ua/thermaltake_cl_w007_pl12bl_a/p3011251/', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `good_attribute`
--

CREATE TABLE IF NOT EXISTS `good_attribute` (
  `good_attribute_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `good_id` int(10) unsigned NOT NULL,
  `attribut_id` int(10) unsigned NOT NULL,
  `attribut_value` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`good_attribute_id`,`good_id`,`attribut_id`),
  KEY `fk_good_attribute_goods1_idx` (`good_id`),
  KEY `fk_good_attribute_attributs1_idx` (`attribut_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=136 ;

--
-- Дамп данных таблицы `good_attribute`
--

INSERT INTO `good_attribute` (`good_attribute_id`, `good_id`, `attribut_id`, `attribut_value`) VALUES
(1, 1, 1, 'Intel Core i5'),
(2, 1, 2, 'Socket 1150'),
(3, 1, 3, 'Intel Haswell (четвертое)'),
(4, 1, 4, '4'),
(5, 1, 5, '3200 МГц'),
(6, 1, 6, 'Intel HD Graphics 4600'),
(7, 1, 7, '5 ГТ/с'),
(8, 1, 8, 'Нет'),
(9, 1, 9, 'BOX'),
(10, 1, 10, '1150'),
(11, 8, 12, '6610 МГц'),
(12, 8, 13, '1076 МГц (Boost: 1253 МГц)'),
(13, 8, 14, 'Радиатор + вентиляторы'),
(14, 8, 15, 'GeForce GTX 950'),
(15, 8, 16, '1'),
(16, 8, 17, '4096x2160'),
(17, 8, 18, 'DirectX 12, OpenGL 4.5'),
(18, 8, 19, '2 ГБ'),
(19, 8, 20, '210 x 113 x 40 мм'),
(20, 8, 21, '128 бит'),
(27, 28, 5, '4000 МГц'),
(28, 28, 6, 'Intel HD Graphics 530'),
(29, 28, 10, '1151'),
(30, 28, 4, '4'),
(31, 28, 3, 'Skylake (шестое)'),
(32, 28, 8, 'Да'),
(33, 28, 1, 'Intel Core i7'),
(34, 28, 2, 'Socket 1151'),
(35, 28, 9, 'BOX'),
(36, 28, 7, '8 ГТ/с'),
(37, 29, 5, '3500 МГц'),
(38, 29, 6, 'Нет'),
(39, 29, 10, '938'),
(40, 29, 4, '8'),
(41, 29, 3, 'FX-8320'),
(42, 29, 8, 'Да'),
(43, 29, 1, 'AMD FX-Series'),
(44, 29, 2, 'Socket AM3+'),
(45, 29, 9, 'BOX'),
(46, 29, 7, '5200 МГц'),
(47, 30, 16, '2'),
(48, 30, 15, 'R9 380'),
(49, 30, 17, '4096x2160'),
(50, 30, 19, '2 ГБ'),
(51, 30, 18, 'DirectX 12, OpenGL 4.5'),
(52, 30, 20, '268 x 138 x 40 мм'),
(53, 30, 21, '256 бит'),
(54, 30, 14, 'Twin Frozr V + Zero Frozr'),
(55, 30, 12, '5600 МГц'),
(56, 30, 13, '1000 МГц'),
(57, 31, 22, 'Внутренний'),
(58, 31, 23, '120 ГБ'),
(59, 31, 24, 'SATAIII'),
(60, 31, 25, '2.5"'),
(61, 31, 26, 'MLC'),
(62, 31, 27, '450 МБ/с'),
(63, 31, 28, '450 МБ/с'),
(64, 31, 29, '0.640 Вт при простое / 1.423 Вт при чтении / '),
(65, 31, 30, '1 млн. часов'),
(66, 32, 31, 'Для процессора'),
(67, 32, 32, 'Воздушное охлаждение (кулер)'),
(68, 32, 33, 'Intel: 2011 / 1150 / 1151 / 1155 / 1156 / 136'),
(69, 32, 34, '120 мм'),
(70, 32, 35, 'Алюминий/медь'),
(71, 32, 36, '900~1,350 ±10% (RC24P присоединен), 900~2,000'),
(72, 32, 37, 'скольжения (Long life)'),
(73, 32, 38, '17~24dBA ±10% (RC24P присоединен), 17~36dBA ±'),
(74, 32, 39, '12 В 4-пин коннектор'),
(75, 32, 40, '131 х 96.5 х 151 мм'),
(76, 33, 2, 'Socket 1150'),
(77, 33, 71, 'Intel Z97'),
(78, 33, 25, 'ATX'),
(79, 33, 72, '4 x DDR3 DIMM; Количество каналов 2'),
(80, 33, 73, '1 x PCI, 3 x PCI-E 2.x x1, 1 x PCI-E 3.0 x16 (x4), 1 x PCI-E 3.0 x16 (x8), 1 x PCI-E 3.0 x16'),
(81, 33, 74, 'Intel Core i7 / Core i5 / Core i3 / Pentium / Celeron 4е и 5е поколение'),
(82, 33, 75, 'Нет'),
(83, 33, 76, '0, 1, 5, 10'),
(84, 33, 77, '32 ГБ'),
(85, 33, 70, '24+8 pin'),
(86, 34, 78, 'Zalman Z11 Plus HF1'),
(87, 34, 25, 'ATX'),
(88, 34, 79, 'Miditower'),
(89, 34, 80, 'Сталь, пластик'),
(90, 34, 81, 'Отсутствует'),
(91, 34, 82, ' Нет'),
(92, 34, 83, '4'),
(93, 34, 84, '1'),
(94, 34, 85, '5'),
(95, 34, 86, '290 мм'),
(96, 35, 31, 'Для настольных ПК'),
(97, 35, 19, '8 ГБ'),
(98, 35, 87, 'DDR3 SDRAM'),
(99, 35, 12, '1600 МГц'),
(100, 35, 88, '1'),
(101, 35, 89, '1.5 В'),
(102, 35, 90, 'Есть'),
(103, 35, 91, '12800 MБ/с'),
(104, 35, 92, '10-10-10'),
(105, 35, 93, 'Нет'),
(106, 36, 78, 'WD30PURX'),
(107, 36, 94, 'HDD'),
(108, 36, 95, 'Внутренний'),
(109, 36, 25, '3.5"'),
(110, 36, 96, '3 ТБ'),
(111, 36, 24, 'SATAIII'),
(112, 36, 97, '64 МБ'),
(113, 36, 98, '6 Гбит/с'),
(114, 36, 99, 'Черный'),
(115, 36, 100, '24 дБ'),
(116, 37, 78, 'SS-660XP2'),
(117, 37, 101, '660 Вт'),
(118, 37, 102, 'Модульные'),
(119, 37, 103, 'ATX 20+4pin'),
(120, 37, 104, 'Вентилятор'),
(121, 37, 105, '1x4+4pin, 1x8pin'),
(122, 37, 106, '4'),
(123, 37, 107, '4x6+2pin'),
(124, 37, 108, '5 / 1 / 10'),
(125, 37, 109, '+3.3 В - 25 A, +5 В - 25 A, +12 В - 55 A, +5 Bsb - 3 A, -12 В - 0.5 A'),
(126, 38, 35, 'Алюминий'),
(127, 38, 31, 'Для процессора'),
(128, 38, 39, '12 В 4-пин + PWM'),
(129, 38, 34, '120 мм'),
(130, 38, 40, '393 x 120 x 27 мм'),
(131, 38, 33, 'Intel Socket: 1151 / 1366 / 1150 / 1155 / 1156 / 2011 AMD Socket: AM2 / AM2+ / AM3 / AM3+ / FM1 / FM'),
(132, 38, 32, 'Жидкостное охлаждение'),
(133, 38, 37, 'Нет'),
(134, 38, 38, '20 дБ'),
(135, 38, 36, '1000 ~ 2000 об/мин');

-- --------------------------------------------------------

--
-- Структура таблицы `menus`
--

CREATE TABLE IF NOT EXISTS `menus` (
  `menu_title` varchar(45) DEFAULT NULL,
  `page_url` varchar(45) DEFAULT NULL,
  `menu_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title_eu` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `menus`
--

INSERT INTO `menus` (`menu_title`, `page_url`, `menu_id`, `title_eu`) VALUES
('Главная', '/pages/index', 1, 'index'),
('Конструктор', '/goods/construct/', 2, 'construct'),
('Товары', '/goods/', 3, 'index'),
('Доставка', '/pages/view/delivery', 4, 'delivery'),
('Оплата', '/pages/view/payment', 5, 'payment'),
('О нас', '/pages/view/about_us', 6, 'about_us');

-- --------------------------------------------------------

--
-- Структура таблицы `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `order_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_date` timestamp NULL DEFAULT NULL,
  `shop_inventory_number` int(10) unsigned NOT NULL,
  `order_price` float unsigned DEFAULT NULL,
  `customer_id` int(10) unsigned NOT NULL,
  `status_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`order_id`,`shop_inventory_number`,`customer_id`,`status_id`),
  KEY `fk_orders_shop1_idx` (`shop_inventory_number`),
  KEY `fk_orders_customers1_idx` (`customer_id`),
  KEY `fk_orders_statuses1_idx` (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `pages`
--

CREATE TABLE IF NOT EXISTS `pages` (
  `page_title` varchar(45) DEFAULT NULL,
  `page_content` varchar(45) DEFAULT NULL,
  `menu_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `pages`
--

INSERT INTO `pages` (`page_title`, `page_content`, `menu_id`) VALUES
('Добро пожаловать на мой сайт', 'Контент главной страницы', 1),
('Доставка', 'Здесь будет информация о доставке', 4),
('Оплата', 'Здесь будет информация о оплате', 5),
('О нас', 'Здесь будет текст о нас', 6);

-- --------------------------------------------------------

--
-- Структура таблицы `shop`
--

CREATE TABLE IF NOT EXISTS `shop` (
  `inventory_number` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `good_id` int(10) unsigned NOT NULL,
  `date_come` datetime NOT NULL,
  PRIMARY KEY (`inventory_number`,`good_id`),
  KEY `fk_shop_goods1_idx` (`good_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `statuses`
--

CREATE TABLE IF NOT EXISTS `statuses` (
  `status_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `status_name` varchar(45) NOT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `type_goods`
--

CREATE TABLE IF NOT EXISTS `type_goods` (
  `good_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `good_type_name` varchar(45) NOT NULL,
  `image` varchar(45) DEFAULT NULL,
  `type_name_eu` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`good_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Дамп данных таблицы `type_goods`
--

INSERT INTO `type_goods` (`good_type_id`, `good_type_name`, `image`, `type_name_eu`) VALUES
(1, 'Процесоры', '/goods/type/1.jpg', 'cpu'),
(2, 'Видеокарты', '/goods/type/2.jpg', 'videocards'),
(3, 'Материнские платы', '/goods/type/3.jpg', 'motherboards'),
(4, 'Корпуса', '/goods/type/4.jpg', 'cases'),
(5, 'Память', '/goods/type/5.jpg', 'memory'),
(6, 'Жесткие диски и дисковые массивы', '/goods/type/6.jpg', 'hdd'),
(7, 'SSD-накопители', '/goods/type/7.jpg', 'ssd'),
(8, 'Системы охлаждения', '/goods/type/8.jpg', 'coolers'),
(9, 'Блоки питания', '/goods/type/9.jpg', 'psu');

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `goods`
--
ALTER TABLE `goods`
  ADD CONSTRAINT `fk_goods_type_goods` FOREIGN KEY (`good_type_id`) REFERENCES `type_goods` (`good_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `good_attribute`
--
ALTER TABLE `good_attribute`
  ADD CONSTRAINT `fk_good_attribute_attributs1` FOREIGN KEY (`attribut_id`) REFERENCES `attributs` (`attribut_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_good_attribute_goods1` FOREIGN KEY (`good_id`) REFERENCES `goods` (`good_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_orders_customers1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_orders_shop1` FOREIGN KEY (`shop_inventory_number`) REFERENCES `shop` (`inventory_number`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_orders_statuses1` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`status_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `pages`
--
ALTER TABLE `pages`
  ADD CONSTRAINT `fk_pages_menus1` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`menu_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Ограничения внешнего ключа таблицы `shop`
--
ALTER TABLE `shop`
  ADD CONSTRAINT `fk_shop_goods1` FOREIGN KEY (`good_id`) REFERENCES `goods` (`good_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
