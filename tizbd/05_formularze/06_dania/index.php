<?php

    $link = new mysqli('localhost','root','','4e_1_baza');


?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    
    <form action="dodawanie.php" method="post">

        <label for="dish-name">Nazwa</label>
        <input type="text" name="dish-name" id="dish-name"><br>

        <label for="dish-type">Typ dania:</label>
        <select name="dish-type" id="dish-type">
            <!-- skrypt a -->
          
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