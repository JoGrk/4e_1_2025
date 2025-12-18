<?php
    $link = new mysqli('localhost','root','','4e_1_kadry');
    $sql = "SELECT pensja, COUNT(*) AS ilosc
            FROM pracownicy
            GROUP BY pensja
            ORDER BY pensja DESC;     
    ";
    $result = $link -> query($sql);
    $salaries = $result -> fetch_all(1); 

    $sql = "SELECT imie, nazwisko, nazwa 
            FROM pracownicy
                inner join stanowiska on pracownicy.stanowiska_id=stanowiska.id
            WHERE staz >10; ";
    $result = $link -> query($sql);
    $workers = $result -> fetch_all(1);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title> 
    <link rel="stylesheet" href="kadry.css">
</head>
<body>
    <h2>Statystkyki dotyczące pensji</h2>

    <table>
        <tr>
            <th>pensja</th>
            <th>ilość pracowników</th>
        </tr>
        <!-- skrypt 1 -->
        <!-- <tr>
            <td>{['pensja']}</td>
            <td>{['ilosc']}</td>
        </tr> -->

        <?php
            // foreach($salaries as $salary){
            //     echo "
            //     <tr>
            //         <td>{$salary['pensja']}</td>
            //         <td>{$salary['ilosc']}</td>
            //     </tr>
            //     ";
            // }

            foreach($salaries as $salary){
                echo " <tr>";
                foreach($salary as $data){
                    echo "<td>$data</td>";
                }
                echo " </tr>";
            }
        ?>
    </table>
    <h1>pracownicy ze stażem wyższym niż 10 lat</h1>

    <table>
        <tr>
            <th>imie</th>
            <th>nazwisko</th>
            <th>stanowisko</th>
        </tr>
        <!-- skrypt 2 -->
         <!-- skrypt 2 -->
        <!-- <tr>
            <td>{['imie']}</td>
            <td>{['nazwisko']}</td>
            <td>{['nazwa']}</td>
        </tr> -->
        <?php
            foreach($workers as $worker){
                echo "
                <tr>
                    <td>{$worker['imie']}</td>
                    <td>{$worker['nazwisko']}</td>
                    <td>{$worker['nazwa']}</td>
                </tr>
                ";
            }
        ?>

    </table>
    <hr>
    <h2>Średnie pensje ze względu na rodzaj stanowiska”</h2>
    <!-- skrypt 3 -->
</body>
</html>

<?php
$link -> close();
?>