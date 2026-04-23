<?php
$link = new mysqli('localhost','root','','w3schools');
$sql = "SELECT DISTINCT country
FROM customers
ORDER BY country";
$result = $link -> query($sql);
$countries = $result -> fetch_all(1);

$country_f = $_POST['country']?? '';
if($country_f){
    $sql ="SELECT customername
            FROM customers
            WHERE Country = '$country_f'
            ORDER BY customername;";
    $result = $link -> query($sql);
    $customers = $result -> fetch_all(1);
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
        <select name="country" id="country">
            <!-- <option>country</option> -->
             <?php
             foreach($countries AS $country){
                echo"<option>{$country['country']}</option>";
             }
             ?>
        </select>
        <button>Wyślij</button>
    </form>

    <ol>
        <!-- <li>{$customer['customername']}</li> -->
        <?php
            if($country_f){
                foreach($customers as $customer){
                    echo"
                    <li>{$customer['customername']}</li>
                    ";
                }
            }
        ?>
    </ol>
</body>
</html>
<?php
$link -> close();
?>