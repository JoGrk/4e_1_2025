<?php
    $link = new mysqli('localhost','root','','4e_1_szkola');

    $sql = "
        SELECT *
        FROM uczen
    ";
    $result = $link -> query($sql);
    $students = $result -> fetch_all(1);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="szkola.css">
</head>
<body>
    <table>
        <?php
            foreach($students as $student){
                echo "<tr>";
                foreach($student as $data){
                    echo "<td>$data</td>";
                }
                echo "</tr>";
            }
        ?>
    </table>

    <h3>Aktualizacja</h3>
    <form action="aktualizacja.php" method="post">
        <label for="id">ID ucznia:</label>
        <input type="text" name="id_f" id="id">
        <button>Wyślij</button>
    </form>

    <h3>Usuwanie</h3>
    <form action="usuwanie.php" method="post">
        <label for="id">ID ucznia</label>
        <input type="text" name="id_f" id="id">
        <button>Wyślij</button>
    </form>

</body>
</html>

<?php
    $link -> close();
?>