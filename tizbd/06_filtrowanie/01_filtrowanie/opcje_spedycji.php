<!-- Utwórz grupę opcji z nazwami firm spedycyjnych (kurierskich). Po kliknięciu wyświetlone są identyfikatory i daty zamówień obsługiwanych przez te firmy\ -->
<?php 
    $link = new mysqli('localhost','root','','w3schools');

    $sql ="SELECT ShipperID, ShipperName
            FROM Shippers";
    $result = $link -> query($sql);
    $shippers = $result -> fetch_all(1);


    $shipper_id_f = $_POST['shipper-id']?? '';

    if($shipper_id_f){

        $sql = "SELECT OrderDate, OrderID
                FROM orders
                WHERE ShipperID =$shipper_id_f";
        $result = $link -> query($sql);
        $orders = $result -> fetch_all(1);

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
    <form action="" method="post">
        <!-- <label>
            <input type="radio" name="shipper-id" value="1">
            Speedy Express           
        </label> <br>
        <label>
            <input type="radio" name="shipper-id" value="2">
            United Package
        </label><br>
        <label>
            <input type="radio" name="shipper-id" value="3">
            Federal Shipping
        </label><br> -->

        <?php
            foreach($shippers as $shipper){
                echo "
                <label>
                    <input type='radio' name='shipper-id' value='{$shipper['ShipperID']}'>
                    {$shipper['ShipperName']}
                </label> <br>
                ";
            }
        ?>

        <button>wyslij</button>
    </form>

    <ul>
        <!-- <li>[OrderDate]</li> -->
         <?php
         if ($shipper_id_f){
            foreach($orders AS $order){
                echo "
                    <li>{$order['OrderDate']}</li>
                ";
            }
         }
         
         ?>
    </ul>
    

</body>
</html>

<?php
    $link -> close()
?>