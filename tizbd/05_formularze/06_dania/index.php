<?php

    $link = new mysqli('localhost','root','','4e_1_baza');

    $sql = "
        SELECT
            dania.nazwa AS danie,
            cena,
            typy_dan.nazwa AS typ
        FROM dania  
            INNER JOIN typy_dan ON dania.typ = typy_dan.id
    ";
    $result = $link -> query($sql);
    $dishes = $result -> fetch_all(1);


    $sql ="
            SELECT 
            id,
            nazwa
            FROM typy_dan";
    $result = $link -> query($sql);
    $types = $result -> fetch_all(1);


?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>Lista dań</h1>
    <ol>
        <!-- <li><strong>[typ]</strong> [danie] - [cena]</li> -->
         <?php
         foreach($dishes as $dish){
            echo"<li><strong>{$dish['typ']}</strong> {$dish['danie']} - {$dish['cena']}</li>";
         } 
         ?>
    </ol>
    <form action="dodawanie.php" method="post">

        <label for="dish-name">Nazwa</label>
        <input type="text" name="dish-name" id="dish-name"><br>

        <label for="dish-type">Typ dania:</label>
        <select name="dish-type" id="dish-type">
            <!-- skrypt a -->
             <!-- <option value="[id]">[nazwa]</option> -->
            <?php
                foreach($types as $type){
                    echo"
                    <option value='{$type['id']}'>{$type['nazwa']}</option>
                    ";
                }
            ?>
          
        </select><br>

        <label for="price">Cena</label>
        <input type="number" name="price" id="price"><br>

        <button>Wyślij</button>

    </form>


</body>
</html>

<?php
$link -> close();
?>