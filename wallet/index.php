<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Steam</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
<div class="menu">
<a href="../index.php">Home</a><a href="../my_library.php">Twoje gry</a><a href="../cart.php">Koszyk</a><a href="../wallet/">Portfel</a>
<?php
require_once "../conect.php";
session_start();
$polaczenie = new mysqli( $db_host, $db_user, $db_pass, $db_name);
            $user_ID = $_SESSION['user_ID'];
            $wynik = mysqli_query($polaczenie, "SELECT balance FROM wallet_balance_cache WHERE user_id=".$user_ID.";");
            if($row = mysqli_fetch_row($wynik)){
                echo '<a id="userinfo">Witaj '.$_SESSION['username'].' <br>Portfel: '.$row[0].' PLN</a>';
            }
            else{
                echo '<a id="userinfo">Witaj '.$_SESSION['username'].' <br>Portfel: 0 PLN</a>';
            }
          
        ?>
        
    </div>


<?php

    if(isset($_SESSION['sessionId']) && isset($_SESSION['user_ID'])){
        $token = $_SESSION['sessionId'];
        $user_ID = $_SESSION['user_ID'];
        $rezultat = mysqli_query($polaczenie, "SELECT * FROM `sessions` WHERE token='$token' AND user_id=$user_ID;");
        $czy_jest_sesja = mysqli_num_rows($rezultat); 
    }
    if($czy_jest_sesja<1){
        header('Location: ../logout.php');
            exit();
    }


    if( !(isset ($_SESSION['zalogowany'])) || !($_SESSION[
        'zalogowany']==true)){
            header('Location: ../index.php');
            exit();
        }
?>

<h2>Dodaj środki do Portfela Steam</h2>
<h4>Dodaj środki do Portfela Steam</h4>
<p>
Środki w twoim Portfelu Steam mogą posłużyć do zakupu dowolnej gry na Steam lub do płatności w grach, które obsługują transakcje Steam.
</p>
<div class="dodaj_srodki">
<p>Dodaj 20.00zł</p>
<form method="POST">
<input type="hidden" name="kowta_dodania" value="20">
<input type="submit" value="Dodaj środki">
</form>
</div>

<div class="dodaj_srodki">
<p>Dodaj 40.00zł</p>
<form method="POST">
<input type="hidden" name="kowta_dodania" value="40">
<input type="submit" value="Dodaj środki">
</form>
</div>

<div class="dodaj_srodki">
<p>Dodaj 100.00zł</p>
<form method="POST">
<input type="hidden" name="kowta_dodania" value="100">
<input type="submit" value="Dodaj środki">
</form>
</div>

<div class="dodaj_srodki">
<p>Dodaj 200.00zł</p>
<form method="POST">
<input type="hidden" name="kowta_dodania" value="200">
<input type="submit" value="Dodaj środki">
</form>
</div>

<div class="dodaj_srodki">
<p>Dodaj 400.00zł</p>
<form method="POST">
<input type="hidden" name="kowta_dodania" value="400">
<input type="submit" value="Dodaj środki">
</form>
</div>
<?php
        if(isset($_POST['kowta_dodania'])){
            $kowta_dodania = $_POST['kowta_dodania'];
            mysqli_query($polaczenie, "INSERT INTO `wallet_transactions` (`id`, `created_at`, `updated_at`, `kwota`, `user_id`) VALUES (NULL, current_timestamp(), current_timestamp(), '".$kowta_dodania."', '".$user_ID."');");
            
             echo "Do twoje portfela dodano: ".$kowta_dodania."zł";

            $wynik = mysqli_query($polaczenie, "SELECT SUM(kwota), max(id)  FROM wallet_transactions WHERE user_id=".$user_ID.";");
            $row = mysqli_fetch_row($wynik);
            $lastBalance = $row[0];
            $lastTransaction = $row[1];
            mysqli_query($polaczenie, "REPLACE INTO `wallet_balance_cache` (`id`, `user_id`, `updated_at`, `balance`, `last_transaction_id`) VALUES (NULL, '".$user_ID."', current_timestamp(), '".$lastBalance."', '".$lastTransaction."');");
          
           
        }

?>
</body>
</html>

