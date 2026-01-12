<?php
    $link = new mysqli('localhost', 'root', '', '4e_1_terminarz');

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
                echo "brak danych";
                ?>
            </p>
        </section>
    </header>

    <main>
        <?php
        // ===== SKRYPT 2 =====
        // tu powinien znaleźć się kod PHP generujący bloki kalendarza
        echo "<div>kalendarz – brak danych</div>";
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