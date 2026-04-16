<?php
    $link = new mysqli('localhost', 'root', '', 'w3schools');

    $sql ="SELECT supplierID, suppliername
            FROM suppliers";
    $result = $link -> query($sql);
    $suppliers = $result -> fetch_all (1);

    $supplier_f = $_POST['supplier']??'';

    if($supplier_f){
        $sql = "SELECT productname, price
                FROM Products
                WHERE SupplierID = $supplier_f;";
        $result = $link -> query($sql);
        $products = $result -> fetch_all(1);
        
    }
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
    <label for="supplier">Wybierz dostawcę</label>
    <select name="supplier" id="supplier">
        <!-- <option value='[supplierID]'>[suppliername]</option> -->
        <?php
            foreach($suppliers as $supplier){
                echo "
                    <option value='{$supplier['supplierID']}'>{$supplier['suppliername']}</option>
                ";
            }
        ?>
    </select>

    <button>Wyślij</button>
</form>

    <table>
        <tr>
            <th>Nazwa Produktu</th>
            <th>Cena</th>
        </tr>
        <!-- <tr>
            <td>productname</td>
            <td>price</td>
        </tr> -->
        <?php
            if(isset($products)){
                foreach($products as $product){
                echo "
                    <tr>
                        <td>{$product['productname']}</td>
                        <td>{$product['price']}</td>
                    </tr>
                ";
            }
        }
        ?>
    </table>
    
</body>
</html>

<?php
    $link -> close();
?>