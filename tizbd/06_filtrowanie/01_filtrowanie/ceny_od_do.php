<?php
$link = new mysqli('localhost','root','','w3schools');

$sql ="SELECT CEIL( MAX(price)) AS max_price
        FROM Products";
$result = $link -> query($sql);
$max_price = $result -> fetch_assoc();
// var_dump($max_price); 

$max_price_f = $_POST['max-price'] ?? null;
$min_price_f = $_POST['min-price'] ?? null;

if($max_price_f && $min_price_f){
    $sql = "SELECT productname, categoryname, price
            FROM Products
            inner join categories on categories.categoryid=Products.categoryid
            where price between $min_price_f and $max_price_f;"
};
else{
    $sql = "SELECT productname, categoryname, price
            FROM Products
            inner join categories on categories.categoryid=Products.categoryid"
};

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
<form action="" method="post">
    <label for="min-price">Podaj minimalną cenę</label>
    <input type="number" name="min-price" id="min-price" default="0"> 
    <label for="max-price">Podaj maksymalną cenę</label>
    <input type="number" name="max-price" id="max-price" 
        default="<?echo $max_price['max_price']?>">

    <button>Wyślij</button>

    
</form>
</body>
</html>
<?php
$link -> close();
?>