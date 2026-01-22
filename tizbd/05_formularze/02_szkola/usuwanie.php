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
        if( isset($_POST['id_f'])){
            $id_f = htmlspecialchars($_POST['id_f']);
            $sql = "
                    DELETE FROM uczen
                    WHERE id = $id_f;";
            $result = $link -> query($sql);
            if($result){
                echo "uczen o id $id_f został pomyslnie usuniety";
            }

            
        }
    ?>
    
    <a href="uczniowie.php">Strona Główna</a>
</body>
</html>

<?php
    $link -> close();
?>