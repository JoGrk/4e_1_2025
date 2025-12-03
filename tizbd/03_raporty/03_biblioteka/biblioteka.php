<?php
    $link = new mysqli('localhost','root','','4e_1_biblioteka2');
    $sql ="SELECT imie, nazwisko
            FROM czytelnicy
            ORDER BY nazwisko;";
    $result = $link -> query($sql);
    $readers = $result -> fetch_all(1);

        $sql = "SELECT tytul
            FROM ksiazki
            JOIN kategorie ON ksiazki.id_kategoria = kategorie.id
            WHERE nazwa = 'dramat';";
        $result = $link -> query($sql);
        $titles = $result -> fetch_all(1);
         
    $sql ="SELECT
    tytul,data_wypozyczenia
    FROM ksiazki
    INNER JOIN wypozyczenia ON ksiazki.id = wypozyczenia.id_ksiazka
    WHERE id_czytelnik = 2;";
    $result = $link -> query($sql);
    $hires = $result -> fetch_all(1);
    
    $sql ="SELECT 
                imie,
                nazwisko,
                COUNT(*) AS ile_tytulow
            FROM autorzy
                INNER JOIN ksiazki ON autorzy.id = ksiazki.id_autor
            GROUP BY id_autor;";
    $result = $link -> query($sql);
    $autors = $result -> fetch_all(1);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        table,td,th{
            border:1px solid black;
        }
        table{
            border-collapse:collapse;
        }
    </style>
</head>

<body>
    <h2>czytelnicy</h2>
    <!-- <p> [imie] <strong>[nazwisko]</strong></p> -->
     <?php
     foreach($readers as $reader){
        echo "
        <p> {$reader['imie']} <strong> {$reader['nazwisko']}</strong></p>
        ";
     }
     ?>

    <h2>tytuły dramatów</h2>

    <ul>
        <!-- <li>['tytul']</li> -->

        <?php
        foreach($titles as $title){
            echo"
            <li>{$title['tytul']}</li>
            ";
        }
        ?>
    </ul>

    <ol> 
        <!-- <li>['tytul'] <em>['data']</em></li> -->
         <?php
         foreach($hires as $hire){
            echo "
                <li>{$hire['tytul']} <em>{$hire['data_wypozyczenia']}</em></li>
                ";

         }

         ?>
    </ol>

    <table>
        <tr>
            <th>Imię</th>
            <th>Nazwisko</th>
            <th>Ilość tytułów</th>
        </tr>
        <!-- <tr>
            <td> ['imie']</td>
            <td> ['nazwisko']</td>
            <td> ['ile_tytulow']</td>
        </tr> -->

        <?php 
            foreach($autors as $autor){
                echo"
                 <tr>
                    <td> {$autor['imie']}</td>
                    <td> {$autor['nazwisko']}</td>
                    <td> {$autor['ile_tytulow']}</td>
                </tr>
                ";   
            }
        ?>
    </table>

    

</body>
</html>
<?php
$link -> close();
?>