<?php
    $link = new mysqli('localhost', 'root', '', '4e_1_terminarz');

    $sql = "
    SELECT DISTINCT
        wpis
    FROM zadania
    WHERE dataZadania BETWEEN '2020-07-01' AND '2020-07-07' AND wpis IS NOT NULL AND wpis != '';";
    $result = $link -> query($sql);
    $tasks = $result -> fetch_all(1);

    $sql = "SELECT
                dataZadania,
                wpis
            FROM zadania
            WHERE miesiac = 'lipiec';
    ";
    $result = $link -> query($sql);
    $tasks2 = $result -> fetch_all(1);
    
?>

<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Zadania na lipiec</title>
    <link rel="stylesheet" href="07_styl.css">
</head>
<body>
    
    <header>
        <section id="baner1">
            <img src="logo1.png" alt="lipiec">
        </section>

        <section id="baner2">
            <h1>TERMINARZ</h1>
            <p>
                najbliższe zadania:
                <?php
                // ===== SKRYPT 1 =====
                // tu powinien znaleźć się kod PHP wyświetlający najbliższe zadania
                foreach($tasks as $task){
                    echo"{$task['wpis']}; ";
                }
                ?>
            </p>
        </section>
    </header>

    <main>

        <!-- <section class="calendar">
            <h6>[dataZadania]</h6>
            <p>[wpis]</p>
        </section> -->
        <?php
        // ===== SKRYPT 2 =====
        // tu powinien znaleźć się kod PHP generujący bloki kalendarza
        foreach($tasks2 as $task2){
            echo"
            <section class='calendar'>
                <h6> {$task2['dataZadania']} </h6>
                <p> {$task2['wpis']} </p>
            </section>
            ";
        }
        ?>
    </main>

    <footer>
        <a href="sierpien.html">Terminarz na sierpień</a>
        <p>Stronę wykonał: <strong>NUMER_ZDAJĄCEGO</strong></p>
    </footer>
</body>
</html>

<?php
    $link -> close();
?>