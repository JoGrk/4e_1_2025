<?php
$link = new mysqli('localhost','root','','w3schools');

$productname_f = $_POST['productname_f']?? NULL;
$price_f = $_POST['price_f']?? NULL;
$supplierid_f = $_POST['supplierid_f']?? NULL;

if($productname_f && $price_f && $supplierid_f){
    $sql = "INSERT INTO products
        (productname, price, supplierid)
        VALUES
        ('$productname_f',$price_f,$supplierid_f)";
    $result = $link -> query($sql);
}

$sql = "SELECT 
            productid,
            productname, 
            price, 
            supplierid
        FROM products
        ";
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

<table>
    <tr>
        <th>ID</th>
        <th>Nazwa</th>
        <th>cena</th>
        <th>ID dostawcy</th>
    </tr>

    <!-- <tr>
        <td>['productid']</td>
        <td>['productname']</td>
        <td>['price']</td>
        <td>['supplierid']</td>
    </tr> -->

    <?php
        foreach($products as $product){
            echo"<tr>
                    <td>{$product['productid']}</td>
                    <td>{$product['productname']}</td>
                    <td>{$product['price']}</td>
                    <td>{$product['supplierid']}</td>
                </tr>";
        }
    ?>


</table>
    
<br>

<form action="" method="post">

    <label for="productname">Nowy Produkt</label>
    <input type="text" name="productname_f" id="productname">

    <br>

    <label for="price">Nowa Cena</label>
    <input type="text" name="price_f" id="price">

    <br>

    <label for="supplierid">ID Dostawcy</label>
    <input type="text" name="supplierid_f" id="supplierid">

    <button>Dodaj</button>

</form>

</body>
</html>

<?php
$link -> close()
?>