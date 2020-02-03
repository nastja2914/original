<html>
<head>
<title>Задание 3</title>

<! Указываем кодировку страницы >
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"> 
<! Подключаем файл JavaScript, в котором содержится функция фильтрации вводимых данных для INPUT >
<script src="task_3.js"> </script>
<! Подключаем файл CSS, в котором содержится стиль для кнопки >
<link rel="stylesheet" type="text/css" href="styles.css"> 
</head>

<body>
<form action='#' method = "POST" enctype="multipart/form-data">
<table border=1>
<tr>
	<td>Название города</td>
	<td>Год основания города</td>
	<td>Основатель города</td>
</tr>

<?php
//Подключаем файл с настройками базы данных
require "classes/config.php";

//Устанавливаем соединение с БД
$conn = new PDO('mysql:host='.$HOST.';dbname=task_3'.$dbName, $USER, $PASSWORD);
//Указываем кодировку
$conn->exec('SET CHARACTER SET utf8');
//Запрос к БД на выборку всех данных из таблицы с городами
$sql = "SELECT * FROM city ";
//Подготавлваем SQL-выражение к выполнению запроса
$st = $conn->prepare($sql);
//Вызываем метод для выполнения запроса
$st->execute();
//Последовательное получение всех строк из результата запроса к БД
$list_city=$st->fetchAll(PDO::FETCH_ASSOC);
//Просматриваем полученный массив и выводим данные в таблицу
foreach ($list_city as $value)
{
	echo "<tr>
				<td>".$value['name_city']."</td>
				<td>".$value['year_city_was_founded']."</td>
				<td>".$value['city_founder']."</td>
				</tr>";
	
}
?>
</table> 

<input name='one' type='text' value='' onkeypress='return filter_input(event,/([A-Za-zА-Яа-яЁё]|\s|\-)/)' required>
<input name='two' type='text' pattern='[0-9]{4}' placeholder='Год в формате: 1234' onkeypress='return filter_input(event,/(\d)/)' value='' required>
<input name='three' type='text' value='' onkeypress='return filter_input(event,/([A-Za-zА-Яа-яЁё]|\.|\s|\-)/)' required>
<input name='sub' type='submit' class="but" value='Отправить'>
<?php
//Если копка "Отправить" была нажата то добавляем новые данные в БД
if(isset($_POST['sub']))
{
	$sql = "INSERT INTO city (name_city,year_city_was_founded,city_founder) VALUES ('".$_POST['one']."','".$_POST['two']."','".$_POST['three']."')";
	$st = $conn->prepare($sql); // сохраняем полученный дискриптор из SELECT в st
	$st->execute(); // вызываем метод для выполнения запроса
	//обновляем страницу для того чтобы отобразить новые данные
	header("Refresh:0"); 
}
?>

</form>
</body>
</html>