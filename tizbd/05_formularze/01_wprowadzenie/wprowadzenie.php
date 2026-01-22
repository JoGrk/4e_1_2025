<?php
  if( isset($_GET['name_f']) ){
    var_dump($_GET['name_f']);
  }
  
  if( isset($_POST['age_f']) ){
    var_dump($_POST['age_f']);
  }

//   $surname_f = $_POST['surname_f'] ?? 'nie podano nazwiska';
//   var_dump($surname_f);

  $surname_f = $_POST['surname_f'] ?? null;
  if($surname_f) {
    var_dump($surname_f);
  }


?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h2>GET</h2>
    <form action="">
        <label for="name">Imię</label>
        <input type="text" name="name_f" id="name">
        <button> Wyślij </button>
    </form>

    <h2>POST</h2>
    <form action="" method="POST">
        <label for="age">Wiek: </label>
        <input type="text" name="age_f" id="age">
        <button> Wyślij </button>
    </form>

    <h2> ?? </h2>
    <form action="" method="POST">
        <label for="surname">Nazwisko: </label>
        <input type="text" name="surname_f" id="surname">
        <button> Wyślij </button>
    </form>
</body>
</html>