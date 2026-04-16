<?php
$link = new mysqli('localhost','root','','w3schools');

$sql ="SELECT CEIL( MAX(price)) AS max_price
        FROM Products";
$result = $link -> query($sql);
$max_price = $result -> fetch_assoc();
$max_price = $max_price['max_price'];


$max_price_f = $_POST['max-price'] ?? $max_price;
$min_price_f = $_POST['min-price'] ?? 0;

    $sql = "SELECT productname, categoryname, price
            FROM Products
            inner join categories on categories.categoryid=Products.categoryid
            where price between $min_price_f and $max_price_f;";
    $result = $link -> query($sql);
    $products = $result -> fetch_all(1);


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
    <!-- <input type="number" name="min-price" id="min-price" value="0">  -->
     <?php
        echo "
        <input type='number' name='min-price' id='min-price' 
        value='0' min='0' max='$max_price'>
        ";
     ?>
    <br> <label for="max-price">Podaj maksymalną cenę</label>
    <!-- <input type="number" name="max-price" id="max-price" 
        value="">  -->
    <?php
    
    echo "
        <input type='number' name='max-price' id='max-price' 
        value='$max_price' min='0' max='$max_price'>
    ";
    
    ?>
    
        <br>

    <button>Wyślij</button>

    <ul>
        <?php
            foreach($products as $product){
            echo"
            <li>{$product['productname']} {$product['categoryname']} - {$product['price']}
            ";
            }
        ?>
    </ul>
</form>
</body>
</html>
<?php
$link -> close();
?>