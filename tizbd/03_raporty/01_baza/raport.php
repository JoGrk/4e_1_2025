<?php
   $link = new mysqli('localhost', 'root', '', 'w3schools');
   $sql = "select distinct city from customers";
   $result = $link -> query($sql);
   $cities = $result -> fetch_all(1);

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>pierwszy raport</h1>
    <?php
        echo " <h2> Hello world </h2>";
       foreach($cities as $city){
            echo "<p> {$city['city']}  </p>  ";
       }
        
    ?>
</body>
</html>
<?php
  $link -> close();
?>