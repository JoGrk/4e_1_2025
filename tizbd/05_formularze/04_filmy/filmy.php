<?php
    $link = new mysqli('localhost','root','','4e_1_filmy');

    $name_f = $_POST['name_f']??'';
    $surname_f = $_POST['surname_f']??'';

    if($name_f && $surname_f){
        $sql = "INSERT INTO rezyserzy
                    (imie, nazwisko)
                    VALUES
                    ('$name_f', '$surname_f')";
        $result = $link -> query($sql); 
    } 

    $sql = "SELECT *
            FROM rezyserzy;";
    $result = $link -> query($sql);
    $directors = $result -> fetch_all(1);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    

    <h2>Reżysery</h2>
    <table>
        <?php
            foreach($directors as $director){
                echo "<tr>";
                foreach($director as $element){
                    echo "<td>$element</td>";
                }
                echo "</tr>";
                
            }
        ?>
    </table>
   
    <h3>Dodaj nowego rezysera</h3>
    <form action="" method="post">
        <label for="name">Imie</label>
        <input type="text" name="name_f" id="name"><br>

        <label for="surname">nazwisko</label>
        <input type="text" name="surname_f" id="surname">
        <button>Dodaj</button>
    </form>

    <h2>Filmy</h2>

    <h3>Zmiana tytulu filmu</h3>
    <form action="" method="post">
        <label for="IDfilm">Filmy</label>
        <input type="number" name="IDfilm_f" id="IDfilm"><br>

        <label for="tytul">nowy tytul</label>
        <input type="text" name="tytul_f" id="tytul">
        <button>Zmień</button>
    </form>

</body>
</html>