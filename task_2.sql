-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Фев 03 2020 г., 02:22
-- Версия сервера: 5.7.15
-- Версия PHP: 7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `task_2`
--

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `id_product` int(11) NOT NULL,
  `title_prod` varchar(100) NOT NULL,
  `category_prod` varchar(100) NOT NULL,
  `price_prod` decimal(6,0) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id_product`, `title_prod`, `category_prod`, `price_prod`) VALUES
(1, 'Вечернее платье', 'Платья', '15000'),
(2, 'Сарафан', 'Платья', '1300'),
(3, 'Летнее платье', 'Платья', '900'),
(4, 'Зимняя куртка', 'Верхняя одежда', '6500'),
(5, 'Кожаная куртка', 'Верхняя одежда', '4700'),
(6, 'Пальто', 'Верхняя одежда', '5300'),
(7, 'Шапка', 'Аксессуары ', '600'),
(8, 'Перчатки', 'Аксессуары ', '350'),
(9, 'Шарф', 'Аксессуары', '700'),
(10, 'Очки солнцезащитные ', 'Аксессуары ', '599');

-- --------------------------------------------------------

--
-- Структура таблицы `product_property`
--

CREATE TABLE `product_property` (
  `id_property` int(11) NOT NULL,
  `title_property` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product_property`
--

INSERT INTO `product_property` (`id_property`, `title_property`) VALUES
(1, 'Цвет'),
(2, 'Размер'),
(3, 'Новинка');

-- --------------------------------------------------------

--
-- Структура таблицы `product_property_value`
--

CREATE TABLE `product_property_value` (
  `id_value` int(11) NOT NULL,
  `value` varchar(100) NOT NULL,
  `id_product` int(11) NOT NULL,
  `id_property` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product_property_value`
--

INSERT INTO `product_property_value` (`id_value`, `value`, `id_product`, `id_property`) VALUES
(1, 'Красный', 1, 1),
(2, 'Зеленый', 1, 1),
(3, 'Синий', 1, 1),
(4, 'Черный', 1, 1),
(5, 'Синий', 2, 1),
(6, 'Черный', 2, 1),
(7, 'Красный', 3, 1),
(8, 'Зеленый', 3, 1),
(9, 'Синий', 4, 1),
(10, 'Черный', 4, 1),
(11, 'Черный', 5, 1),
(12, 'Красный', 6, 1),
(13, 'Зеленый', 5, 1),
(14, 'Синий', 6, 1),
(15, 'Черный', 6, 1),
(16, 'Красный', 7, 1),
(17, 'Зеленый', 7, 1),
(18, 'Синий', 7, 1),
(19, 'Черный', 7, 1),
(20, 'Черный', 8, 1),
(21, 'Красный', 9, 1),
(22, 'Зеленый', 9, 1),
(23, 'Синий', 9, 1),
(24, 'Черный', 10, 1),
(25, 'S', 1, 2),
(26, 'M', 1, 2),
(27, 'S', 2, 2),
(28, 'M', 2, 2),
(29, 'L', 1, 2),
(30, 'L', 2, 2),
(31, 'L', 3, 2),
(32, 'L', 4, 2),
(33, 'S', 3, 2),
(34, 'M', 3, 2),
(35, 'S', 4, 2),
(36, 'M', 4, 2),
(37, 'S', 5, 2),
(38, 'M', 5, 2),
(39, 'L', 5, 2),
(40, 'S', 6, 2),
(41, 'M', 6, 2),
(42, 'L', 6, 2),
(43, 'S', 7, 2),
(44, 'M', 7, 2),
(45, 'L', 7, 2),
(46, 'S', 8, 2),
(47, 'M', 8, 2),
(48, 'L', 8, 2),
(49, '40', 9, 2),
(50, '50', 9, 2),
(51, '52.18.135', 10, 2),
(52, 'Новая коллекция', 1, 3),
(53, 'Новая коллекция', 4, 3),
(54, 'Новая коллекция', 5, 3),
(55, 'Новая коллекция', 6, 3),
(56, 'Новая коллекция', 7, 3),
(57, 'Новая коллекция', 8, 3),
(58, 'Зеленый', 6, 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id_product`);

--
-- Индексы таблицы `product_property`
--
ALTER TABLE `product_property`
  ADD PRIMARY KEY (`id_property`);

--
-- Индексы таблицы `product_property_value`
--
ALTER TABLE `product_property_value`
  ADD PRIMARY KEY (`id_value`),
  ADD KEY `id_product` (`id_product`),
  ADD KEY `id_property` (`id_property`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT для таблицы `product_property`
--
ALTER TABLE `product_property`
  MODIFY `id_property` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `product_property_value`
--
ALTER TABLE `product_property_value`
  MODIFY `id_value` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `product_property_value`
--
ALTER TABLE `product_property_value`
  ADD CONSTRAINT `product_property_value_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`),
  ADD CONSTRAINT `product_property_value_ibfk_2` FOREIGN KEY (`id_property`) REFERENCES `product_property` (`id_property`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
