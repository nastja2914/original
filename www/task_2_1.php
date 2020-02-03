<?php
//Подключаем файл с настройками базы данных
require "classes/config.php";

//Устанавливаем соединение с БД
$conn = new PDO('mysql:host='.$HOST.';dbname=task_2'.$dbName, $USER, $PASSWORD);
//Указываем кодировку
$conn->exec('SET CHARACTER SET utf8');
//Запрос к БД, где мы выбираем ID_товара, Название товара, Название свойства товара, Значение свойства товара с объединением всех трех таблиц
$sql = "SELECT product.id_product,product.title_prod, product_property.title_property, product_property_value.value FROM product JOIN product_property_value on product.id_product=product_property_value.id_product join product_property on product_property_value.id_property=product_property.id_property ";
//Подготавлваем SQL-выражение к выполнению запроса
$st = $conn->prepare($sql); 
//Вызываем метод для выполнения запроса
$st->execute(); 
//Последовательное получение всех строк из результата запроса к БД
$row=$st->fetchAll(PDO::FETCH_ASSOC);
//Запрос к БД, где выбираем ID_товара и его название без дополнительных свойств
$sql_2="SELECT id_product,title_prod FROM product";
$st= $conn->prepare($sql_2); 
$st->execute();
$product=$st->fetchAll(PDO::FETCH_ASSOC);

//просматриваем массив с товарами и их свойствами
	foreach ($row as $value)
	{
		//Если данный товар является новинкой, то мы сохраняем этот товар и ID_товара
		if(strcmp($value['value'],'Новая коллекция')==0)
		{
			$str[$value['id_product']]=$value; 
			
		}
		//Если данный товар зеленого цвета, то мы сохраняем этот товар и ID_товара
		if(strcmp($value['value'],'Зеленый')==0)
		{
			$str_2[$value['id_product']]=$value;
			$id_size=$value['id_product'];
			
			
		}
		
		//сохраняем все товары со свойством Размер
		if(strcmp($value['title_property'],'Размер')==0)
		{
			$size[$value['id_product']][]=$value['value'];
		
		}
		//сохраняем все товары со свойством Цвет
		if(strcmp($value['title_property'],'Цвет')==0)
		{
			$color[$value['id_product']][]=$value['value'];
			
		}
		
		
	}
	//для каждого товара получаем размеры в которых он представлен для вывода в таблицу
	foreach($size as $key=> $size_value)
	{
		$new_size[$key]=implode(' ', $size_value);
	}
	//для каждого товара получаем цвета в которых он представлен для вывода в таблицу
	foreach($color as $key_color=> $color_value)
	{
		$new_color[$key_color]=implode(' ', $color_value);
	}
	
	//формируем список всех новинок зеленого цвета
	foreach($str as $val)
	{
		foreach($str_2 as $val_2)
		{
			if(strcmp($val['title_prod'],$val_2['title_prod'])==0) {$itog[]=$val_2; }
		}
	}
	

?>


