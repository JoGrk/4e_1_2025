<?php
$link = new mysqli('localhost','root','','4e_1_baza');

$dish_name_f = $_POST["dish-name"]??NULL;

$dish_type_f = $_POST["dish-type"] ??'';

$price_f = $_POST['price'] ??'';

if($dish_name_f && $dish_type_f && $price_f){
    $sql = "INSERT INTO dania
            (typ, nazwa, cena)
            VALUES
            ($dish_type_f, '$dish_name_f', $price_f)";
    $link -> query($sql);
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
    
</body>
</html>
<?php
$link -> close();
?>