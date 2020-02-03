<html>
<head>
<title>Задание 2</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"> 
<link rel="stylesheet" type="text/css" href="styles.css"> 
</head>

<body>
<?php require "task_2_1.php"; ?>
<form action='#' method = "GET" enctype="multipart/form-data">
<input type=submit name=all_product class="but" value="Список всех продуктов">
<input type=submit name=some_product class="but" value="Список новинок зеленого цвета">
<table align="center" border=1> 
	<tr> 
		<td> Название товара </td>
		<td> Размер </td>
		<td> Цвет </td>
	</tr>
	<?php
	$current_page=1;
	if(isset($_GET['some_product']))
	{ 
	  $index=0;
	  $on_page=3;//количество записей на одной странице
	  $count_records=count($itog);//получаем количество записей таблицы продукт
	  $num_pages=ceil($count_records/$on_page);//получаем количество страниц, делим количество записей на количество строчек на странице и округляем в большую сторону
	  $current_page=isset($_GET['page'])?(int)$_GET['page']:1;//текущая страница из GET-параметра page. Если параметр не определен то текущая страница равна 1
	  if($current_page<1) //если текущая страница меньше единицы, то страница равна 1
	  {
		 $current_page=1;
	  } 
	  elseif ($current_page>$num_pages) //если текущая страница больше общего количества страниц, то текущая страница равна количеству страниц
	  {
			$current_page=$num_pages;
	  }
	  $start_from=($current_page-1)*$on_page; //начать получение данных от числа (текущая страница - 1)*количество записей на странице
	  $i=0;
	  while($i<$on_page)
			
		{
			$index=$i+$start_from;
					  echo "<tr>
								<td>".$itog[$index]['title_prod']."</td>
								<td> ".$new_size[$itog[$index]['id_product']]."<br></td>
								<td>".$itog[$index]['value']."</td>
							</tr>";
					$i++;
			
		}
		echo "</table>";
		echo "<br><p align=center>";
		for($page=1;$page<=$num_pages;$page++)
		{
			if($page==$current_page)
			{
				echo "<strong>".$page."</stronh>&nbsp;";
			}
			else
			{
				echo "<a href='task_2.php?page=".$page."&some_product=Список новинок зеленого цвета'>".$page."</a>&nbsp;";
			}
				
		}
		echo "</p>";
	}
	
	if (isset($_GET['all_product']))
	{
		$index=0;
	  $on_page=3;//количество записей на одной странице
	  $count_records=count($product);//получаем количество записей таблицы продукт
	  $num_pages=ceil($count_records/$on_page);//получаем количество страниц, делим количество записей на количество строчек на странице и округляем в большую сторону
	  $current_page=isset($_GET['page'])?(int)$_GET['page']:1;//текущая страница из GET-параметра page. Если параметр не определен то текущая страница равна 1
	  if($current_page<1) //если текущая страница меньше единицы, то страница равна 1
	  {
		 $current_page=1;
	  } 
	  elseif ($current_page>$num_pages) //если текущая страница больше общего количества страниц, то текущая страница равна количеству страниц
	  {
			$current_page=$num_pages;
	  }
	  $start_from=($current_page-1)*$on_page; //начать получение данных от числа (текущая страница - 1)*количество записей на странице
	  $i=0;
	  while($i<$on_page)
			
		{
		
			$index=$i+$start_from;
			echo "<tr>
					<td>".$product[$index]['title_prod']."</td>
					<td> ".$new_size[$product[$index]['id_product']]."<br></td>
					<td>".$new_color[$product[$index]['id_product']]."</td>
							</tr>";$i++;
		}
		echo "</table>";
		echo "<br><p align=center>";
		for($page=1;$page<=$num_pages;$page++)
		{
			if($page==$current_page)
			{
				echo "<strong>".$page."</stronh>&nbsp;";
			}
			else
			{
				echo "<a href='task_2.php?page=".$page."&all_product=Список всех продуктов'>".$page."</a>&nbsp;";
			}
				
		}
		echo "</p>";
	}
	?>
	</form>
</body>
</html>