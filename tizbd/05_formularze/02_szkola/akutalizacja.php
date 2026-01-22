<?php
    $link = new mysqli('localhost','root','','4e_1_szkola');
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <?php
        if(isset($_POST['id_f'])){
            $id_f = htmlspecialchars($_POST['id_f']);
            $sql = "
                UPDATE uczen
                SET miejsce_urodzenia = 'Bydgoszcz'
                where  id = $id_f;
            ";
            $result = $link -> query($sql);

            if($result){
                echo "Uczen o id $id_f został pomyślnie zaktualizowany";
            }
        }
    ?>
    <a href="uczniowie.php">Główna strona</a>
</body>
</html>
<?php
    $link -> close();
?>