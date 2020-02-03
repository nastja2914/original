-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Фев 03 2020 г., 02:23
-- Версия сервера: 5.7.15
-- Версия PHP: 7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `task_3`
--

-- --------------------------------------------------------

--
-- Структура таблицы `city`
--

CREATE TABLE `city` (
  `id_city` int(11) NOT NULL,
  `name_city` varchar(30) NOT NULL,
  `year_city_was_founded` varchar(4) NOT NULL,
  `city_founder` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `city`
--

INSERT INTO `city` (`id_city`, `name_city`, `year_city_was_founded`, `city_founder`) VALUES
(1, 'Москва', '1147', 'Юрий Долгорукий'),
(2, 'Орел', '1566', 'Иван Грозный'),
(3, 'Воронеж', '1586', 'Михаил Воротынский'),
(4, 'Нижний Новгород', '1221', ' Юрий Всеволодович'),
(5, 'Санкт-Петербург', '1703', 'Петр I'),
(6, 'Владимир', '990', 'Владимир Мономах'),
(7, 'Ярославль', '1010', 'Ярослав Мудрый'),
(8, 'Саратов', '1590', ' Федор Иоаннович Засекин'),
(9, 'Самара', '1586', ' Федор Иоаннович Засекин'),
(10, 'Волгоград', '1579', ' Федор Иоаннович Засекин'),
(11, 'Ростов-на-Дону', '1749', 'Петр I'),
(12, 'Екатеринбург ', '1723', 'Петр I'),
(13, 'Челябинск', '1736', 'А. И. Тевкелев'),
(14, 'Великий Новгород', '859', 'Рюрик'),
(15, 'Красноярск', '1628', 'Андрей Дубенской '),
(16, 'Владивосток', '1860', 'Н. Муравьев-Амурский');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id_city`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `city`
--
ALTER TABLE `city`
  MODIFY `id_city` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
