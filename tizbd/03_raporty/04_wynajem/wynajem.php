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

    $sql ="
        SELECT
        sezon,
        SUM(liczba_dn) AS razem_rezerwacji
        FROM rezerwacje
        GROUP BY sezon;";
    $result = $link -> query($sql);
    $rooms3 = $result -> fetch_all(1);
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
    <!-- B. Skrypt wysyła do bazy danych zapytanie 2
    Dane z każdego zwróconego zapytaniem wiersza wypisywane są formie listy wypunktowanej,  nazwa pokoju powinna być pogrubiona, a sezon pochyloną czcionką -->


    <h2> Rezerwacje </h2>
    <ul>
        <!-- <li>[id_pok] <strong>[nazwa]</strong> <em>[sezon]</em></li> -->

        <?php
        foreach($rooms2 as $room){
            echo"
            <li>{$room['id_pok']} <strong>{$room['nazwa']}</strong> <em>{$room['sezon']}</em></li>
            ";   
        }
        ?>
    </ul>


    <!-- C. B. Skrypt wysyła do bazy danych zapytanie 3
    Nazwa sezonu powinna być wypisana jako nagłówek poziomu 4, suma dni rezerwacji poniżej w formie: "suma dni rezerwacji dla sezonu [sezon] wynosi [razem_rezerwacji]". w miejscu [sezon] i [razem_rezerwacji] wpisz właściwe pola wybrane zapytaniem -->

    <h2> Suma dni rezerwacji </h2>

    <!-- <h4>[sezon]</h4>
    <p>suma dni rezerwacji dla sezonu [sezon] wynosi [razem_rezerwacji]</p> -->

    <?php
    foreach($rooms3 as $room){
        echo"
            <h4>{$room['sezon']}</h4>
        <p>suma dni rezerwacji dla sezonu {$room['sezon']} wynosi 
        {$room['razem_rezerwacji']}</p>
        ";
    }

    ?>

</body>
</html>

<?php
    $link -> close();
?>