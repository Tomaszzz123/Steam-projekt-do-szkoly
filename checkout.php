
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
   
</head>
<body>
<?php
require_once "./conect.php";
session_start();
$polaczenie = new mysqli( $db_host, $db_user, $db_pass, $db_name);

if(isset($_SESSION['sessionId']) && isset($_SESSION['user_ID'])){
    $token = $_SESSION['sessionId'];
    $user_ID = $_SESSION['user_ID'];
    $rezultat = mysqli_query($polaczenie, "SELECT * FROM `sessions` WHERE token='$token' AND user_id=$user_ID;");
    $czy_jest_sesja = mysqli_num_rows($rezultat); 
}
if($czy_jest_sesja<1){
    header('Location: logout.php');
        exit();
}


if( !(isset ($_SESSION['zalogowany'])) || !($_SESSION[
    'zalogowany']==true)){
        header('Location: index.php');
        exit();
    }
else{
    if(isset($_GET['platnosc'])){
        $sumaOperacji = $_GET['platnosc'] * -1;
        mysqli_query($polaczenie, "INSERT INTO `wallet_transactions` (`id`, `created_at`, `updated_at`, `kwota`, `user_id`) VALUES (NULL, current_timestamp(), current_timestamp(), '".$sumaOperacji."', '".$user_ID."');");
        
            $wynik = mysqli_query($polaczenie, "SELECT SUM(kwota), max(id)  FROM wallet_transactions WHERE user_id=".$user_ID.";");
            $row = mysqli_fetch_row($wynik);
            $lastBalance = $row[0];
            $lastTransaction = $row[1];
            mysqli_query($polaczenie, "REPLACE INTO `wallet_balance_cache` (`id`, `user_id`, `updated_at`, `balance`, `last_transaction_id`) VALUES (NULL, '".$user_ID."', current_timestamp(), '".$lastBalance."', '".$lastTransaction."');");
          
    }
        global $user_ID;
        mysqli_query($polaczenie,"INSERT INTO game_library (user_id, game_id) SELECT user_id, game_id FROM cart WHERE user_id=".$user_ID.";" );
        mysqli_query($polaczenie,"DELETE FROM `cart` WHERE `cart`.`user_id` = ".$user_ID.";" );  
        echo "<p>Gry z twojego koszyka zostały dodnane do twojej biblioteki</p>";
}
?>
 <center><a href="./index.php">Powrót</a></center>

               
</body>
</html>