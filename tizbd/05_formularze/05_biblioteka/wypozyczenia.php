<?php
    $link = new mysqli('localhost','root','','4e_1_biblioteka');

    $id_reader_f = $_POST['id-reader']?? '';
    $id_book_f = $_POST['id-book']?? '';

    if($id_reader_f && $id_book_f){
        $sql = "INSERT INTO wypozyczenia
                    (id_czytelnik, id_ksiazka, data_wypozyczenia)
                VALUES
                    ($id_reader_f, $id_book_f, CURRENT_DATE)";
        $result = $link -> query($sql);
    }

    $sql = "SELECT id, imie, nazwisko
            FROM czytelnicy;";
    $result = $link -> query($sql);
    $readers = $result -> fetch_all(1);

    $sql = "SELECT ksiazki.id, tytul, imie, nazwisko
            FROM Autorzy
                INNER JOIN ksiazki ON autorzy.id = ksiazki.id_autor;";
    $result = $link -> query($sql);
    $books = $result -> fetch_all(1);

    
    $sql = "SELECT 
                wypozyczenia.id,
                tytul,
                nazwisko,
                data_wypozyczenia
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
     
    <form action="" method="post">
        <label for="id-reader">Wybierz czytelnika</label>
        <select name="id-reader" id="id-reader">
            <!-- <option value="[id]">[imie] [nazwisko]</option> -->
             <?php
                foreach($readers as $reader){
                    echo "
                        <option value='{$reader['id']}'>{$reader['imie']} {$reader['nazwisko']}</option>
                    ";
                }
             ?>
        </select>

        <label for="id-book">Wybierz książkę</label>
        <select name="id-book" id="id-book">
            <!-- skrypt2 -->
            <!-- <option value='[id]'>[tytul] - [imie] [nazwisko]</option> -->
             <?php
                foreach($books as $book){
                    echo"
                        <option value='{$book['id']}'>{$book['tytul']} - {$book['imie']} {$book['nazwisko']}</option>
                    ";
                }
             ?>
        </select>

        <button>Prześlij</button>
        
    </form>

     <h2>Wypożyczenia</h2>
    <table>
        <tr>
            <th>id Wypożyczenia</th>
            <th>tytul</th>
            <th>nazwisko czytelnika</th>
            <th>data wypożyczenia</th>
        </tr>
        <!-- skrypt d -->
         <!-- <tr>
            <td>[id]</td>
            <td>[tytul]</td>
            <td>[nazwisko]</td>
            <td>[data_wypozyczenia]</td>
         </tr> -->
         <?php
                foreach($borrows as $borrow){
                    echo"  
        <tr>
            <td>{$borrow['id']}</td>
            <td>{$borrow['tytul']}</td>
            <td>{$borrow['nazwisko']}</td>
            <td>{$borrow['data_wypozyczenia']}</td>
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