<?php
$link = new mysqli ('localhost', 'root', '', '4e_1_hodowla2');
$sql = "SELECT rasa
        FROM rasy;
        ";
$result = $link -> query($sql);
$races = $result -> fetch_all(1);

$sql2 ="SELECT DISTINCT 
            data_ur,
            miot,
            rasa
        FROM swinki
            INNER JOIN rasy ON swinki.rasy_id = rasy.id 
        WHERE rasy_id = 1;";
$result2 = $link -> query($sql2);
$peruvians = $result2 -> fetch_all(1);

$sql = "SELECT imie, cena, opis
        FROM swinki
        WHERE rasy_id = 1;";
$result = $link -> query($sql);
$pigs = $result -> fetch_all(1);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h3>Poznaj wszystkie rasy świnek morskich</h3>
    <ol>
        <!-- skrypt 1 -->
        <!-- <li>[rasa]</li> -->
         <?php
            foreach($races as $race){
                echo "
                    <li>{$race['rasa']}</li>
                ";
            }
         ?>
    </ol>

    <h1>Świnka morska rasy peruwianka</h1>
    <!-- skrypt 2 -->
     <!-- <h2>Rasa: [rasa]</h2>
     <p>Data urodzenia: [data_ur]</p>
     <p>Oznaczenie miotu: [miot]</p> -->
    <?php
        foreach($peruvians as $peruvian){
            echo "
                <h2>Rasa: {$peruvian['rasa']}</h2>
                <p>Data urodzenia: {$peruvian['data_ur']}</p>
                <p>Oznaczenie miotu: {$peruvian['miot']}</p>
            ";

        }
    ?>
    <hr>

    <h2>Świnki w tym miocie</h2>
    <!-- skrypt 3 -->
     <!-- <h3>[imie] - [cena]</h3>
     <p>[opis]</p> -->

    <?php
    foreach($pigs AS $pig){
        echo "<h3>{$pig['imie']} - {$pig['cena']}</h3>
            <p>{$pig['opis']}</p>";
    }

    ?>

    <h2>Świnki urodzone w lipcu</h2>
    <!-- skrypt 4 -->

</body>
</html>

<?php
$link -> close();
?>