<?php
    $link = new mysqli('localhost','root','','w3schools');

    $sql = "
            SELECT CustomerName, City, Country
            FROM customers
                INNER JOIN orders ON customers.CustomerID = orders.CustomerID
            WHERE OrderDate LIKE '%-07-%'
    ";
    $result = $link -> query($sql);
    $customers = $result -> fetch_all(1);

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="styl.css">
</head>
<body>
    <section class="top">
        <table>
            <tr>
                <th>Imię klienta</th>
                <th>Miasto</th>
                <th>Kraj</th>
            </tr>
            <!-- skrypt 1 -->
             <!-- <tr>
                <td>[CustomerName]</td>
                <td>[City]</td>
                <td>[Country]</td>
             </tr> -->

            <?php

            foreach($customers as $customer){
                echo "
                    <tr>
                        <td>{$customer['CustomerName']}</td>
                        <td>{$customer['City']}</td>
                        <td>{$customer['Country']}</td>
                    </tr>
                ";

            }

            ?>

        </table>
    </section>
    
    <section class="bottom">
        <!-- skrypt 2 -->
         <!-- <section class="customer">
            <h5>[CustomerName]</h5>
            <ul>
                <li>[City]</li>
                <li>[Country]</li>
            </ul>
         </section> -->

         <?php
            foreach($customers as $customer){
                echo"
                <section class='customer'>
                    <h5>{$customer['CustomerName']}</h5>
                    <ul>
                        <li>{$customer['City']}</li>
                        <li>{$customer['Country']}</li>
                    </ul>
                </section>";
            };
         ?>
    </section>
</body>
</html>

<?php
    $link -> close();
?>