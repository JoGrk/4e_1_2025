<?php
    $link = new mysqli('localhost','root','','4e_1_biblioteka');

    $first_name_f = $_POST['first-name'] ?? '';
    $last_name_f = $_POST['last-name'] ?? '';

    if($first_name_f && $last_name_f){
        $sql = "
                INSERT INTO czytelnicy
                (imie,nazwisko,kod)
                VALUES
                ('$first_name_f','$last_name_f','');
        ";
        $result = $link -> query($sql);
    }

    // formularz ksiazki
    $book_id_f = $_POST['book-id'] ?? '';

    if($book_id_f){
        $sql = "
            DELETE FROM ksiazki
            WHERE id = $book_id_f
        ";
        $result = $link -> query($sql);
    }

    $sql = "
            SELECT ksiazki.id, tytul, imie, nazwisko
            FROM Autorzy
                INNER JOIN ksiazki ON autorzy.id = ksiazki.id_autor;";
    $result = $link -> query($sql);
    $books = $result -> fetch_all(1);

    $sql = "SELECT 
                wypozyczenia.id,
                tytul,
                nazwisko,
                data_oddania
            FROM wypozyczenia
                INNER JOIN ksiazki ON wypozyczenia.id_ksiazka = ksiazki.id
                INNER JOIN czytelnicy ON wypozyczenia.id_czytelnik = czytelnicy.id;
            ";
    $result = $link -> query($sql);
    $borrows = $result -> fetch_all(1);
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h2>Czytelnicy</h2>
    <form action="" method="post">
        <label for="first-name">Podaj Imie</label>
        <input type="text" name="first-name" id="first-name">
        <label for="last-name">Podaj Nazwisko</label>
        <input type="text" name="last-name" id="last-name">
        <button>Wyślij</button>
    </form>

    <h2>Książki</h2>

    <ul>
        <!-- Skrypt B -->
         <!-- <li><strong>[id]</strong> [tytul], [imie] [nazwisko] </li> -->

        <?php
        foreach($books as $book){
            echo"<li><strong>{$book['id']}</strong> {$book['tytul']}
            , {$book['imie']} {$book['nazwisko']} </li>";
        }
        ?>
         
         
    </ul>

    <form action="" method="post">
        <label for="book-id">Podaj ID książki do usunięcia</label>
        <input type="number" name="book-id" id="book-id">
        <button>Usuń</button>
    </form>

    <h2>Wypożyczenia</h2>
    <table>
        <tr>
            <th>id Wypożyczenia</th>
            <th>tytul</th>
            <th>nazwisko czytelnika</th>
            <th>data oddania</th>
        </tr>
        <!-- skrypt d -->
         <tr>
            <td>[id]</td>
            <td>[tytul]</td>
            <td>[nazwisko]</td>
            <td>[data_oddania]</td>
         </tr>
         <?php
                foreach($borrows as $borrow){
                    echo"  
        <tr>
            <td>{$borrow['id']}</td>
            <td>{$borrow['tytul']}</td>
            <td>{$borrow['nazwisko']}</td>
            <td>{$borrow['data_oddania']}</td>
         </tr>
            ";
                }
                    
?>
    </table>

    <form action="" method="post">
        <label for="borrow-id">podaj id Wypożyczenia</label>
        <input type="number" name="borrow-id" id="borrow-id">
        <button>zmien date oddania</button>
    </form>

</body>
</html>

<?php
    $link -> close();
?>