<?php
    $link = new mysqli('localhost', 'root', '', '4e_1_wynajem2');
    $sql = "
        SELECT *
        FROM pokoje
    ";
    $result = $link -> query($sql);
    $rooms = $result -> fetch_all(1);


    $sql = "
    SELECT id_pok, nazwa, sezon
    FROM pokoje
    INNER JOIN rezerwacje ON pokoje.id = rezerwacje.id_pok
    WHERE liczba_dn >= 7
    ";

    $result = $link -> query($sql);
    $rooms2 = $result -> fetch_all(1);
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
            <th>id</th>
            <th>nazwa</th>
            <th>cena</th>
        </tr>

        <!-- <tr>
            <td>['id']</td>
            <td>['nazwa']</td>
            <td>['cena']</td>
        </tr> -->
        <?php
        foreach($rooms AS $room){
            echo"
                <tr>
            <td>{$room['id']}</td>
            <td>{$room['nazwa']}</td>
            <td>{$room['cena']}</td>
        </tr>
            ";
        }
            
        ?>

    </table>
<ul>
    <li></li>
</ul>
</body>
</html>

<?php
    $link -> close();
?>