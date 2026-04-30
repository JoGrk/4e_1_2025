<?php
$link = new mysqli('localhost','root','','4e_1_zgloszenia');
$status_f = $_POST['status']??'';
if($status_f){
    $sql = "SELECT id, imie, nazwisko, status
            FROM personel
            WHERE status = '$status_f'";
    $result = $link -> query($sql);
    $personel = $result -> fetch_all(1);
}

   // skrypt 3

   $personel_id_f = $_POST['personel-id']?? '';

   if($personel_id_f){
        $sql = "INSERT INTO rejestr
                (id_personel, id_pojazd, data)
                VALUES
                ($personel_id_f, 14, CURRENT_DATE)";
        $result = $link -> query($sql);
   }

// skrypt 2
$sql ="SELECT
    id,
    nazwisko
FROM personel
WHERE ID NOT IN(
    SELECT
        ID_personel
    FROM rejestr
);";
$result = $link -> query($sql);
$personel2 = $result -> fetch_all(1);

 



?>
<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ZGŁOSZENIA</title>
    <link rel="stylesheet" href="styl.css">
</head>
<body>
    <header>
        <h1>Zgłoszenia wydarzeń</h1>
    </header>

    <main>
        <section class="left">
            <h2>Personel</h2>
            <form action="" method="post">
                <input type="radio" name="status" id="police" value="policjant" checked>
                <label for="police">Policjant</label>
                <input type="radio" name="status" id="lifeguard" value="ratownik">
                <label for="lifeguard">Ratownik</label>
                <button>pokaż</button>
            </form>

            <?php
            if($status_f){
                echo"<h3>wybrano opcję:$status_f</h3>";
            }
            ?>

            <table>
                <tr>
                    <th>Id</th>
                    <th>Imię</th>
                    <th>Nazwisko</th>
                </tr>
                <!-- skrypt 1 -->
                 <!-- <tr>
                    <td>id</td>
                    <td>imie</td>
                    <td>nazwisko</td>
                 </tr> -->
                 <?php
                    if($status_f){
                        foreach($personel as $person){
                            echo"
                                <tr>
                                    <td>{$person['id']}</td>
                                    <td>{$person['imie']}</td>
                                    <td>{$person['nazwisko']}</td>
                                </tr>
                            ";
                        }
                    }
                 ?>
                 
            </table>
        </section>

        <section class="right">
            <h2>Nowe zgłoszenie</h2>
            <ol>
                <!-- skrypt 2 -->
                 <!-- <li> id nazwisko</li> -->

            <?php

                foreach($personel2 as $person){
                    echo"
                    <li> {$person['id']} {$person['nazwisko']}</li>";
                }

            ?>
            </ol>

            <form action="" method="post">
                <label for="personel-id">Wybierz id osoby z listy: </label>
                <input type="number" name="personel-id" id="personel-id">

                <button>Dodaj zgłoszenie</button>
            </form>
        </section>
    </main>

    <footer>
        <p>Stronę wykonał: 0000000000000000000000000000000000</p>
    </footer>
</body>
</html>
<?php
$link -> close();
?>