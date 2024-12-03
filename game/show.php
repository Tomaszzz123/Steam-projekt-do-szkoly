
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
   
</head>
<body>
<div class="menu">
        <a href="../index.php">Home</a>
        <?php
//sprawdzenie czy jest zalogownay
require_once "../conect.php";
session_start();
$polaczenie = new mysqli( $db_host, $db_user, $db_pass, $db_name);
        $czyZalogowany;
        if(isset($_SESSION['sessionId']) && isset($_SESSION['user_ID'])){
            $token = $_SESSION['sessionId'];
            $user_ID = $_SESSION['user_ID'];
            $rezultat = mysqli_query($polaczenie, "SELECT * FROM `sessions` WHERE token='$token' AND user_id=$user_ID;");
            $czy_jest_sesja = mysqli_num_rows($rezultat); 
            if($czy_jest_sesja<1){
                $czyZalogowany = false;
            }
            else{
                $czyZalogowany = true;
            }
        }

        if( !(isset ($_SESSION['zalogowany'])) || !($_SESSION['zalogowany']==true)){
            $czyZalogowany = false;
        }
        else{
            $czyZalogowany = true;
        }
//wygnerenowanie menu
        if($czyZalogowany){
            echo'<a href="../my_library.php">Twoje gry</a><a href="../cart.php">Koszyk</a><a href="../wallet/">Portfel</a>';
            $wynik = mysqli_query($polaczenie, "SELECT balance FROM wallet_balance_cache WHERE user_id=".$user_ID.";");
            if($row = mysqli_fetch_row($wynik)){
                echo '<a id="userinfo">Witaj '.$_SESSION['username'].' <br>Portfel: '.$row[0].' PLN</a>';
            }
            else{
                echo '<a id="userinfo">Witaj '.$_SESSION['username'].' <br>Portfel: 0 PLN</a>';
            }
        }
        else{
            echo '<a href="../logowanie.php">Logowanie</a> <a href="../rejestracja.php">Rejestracja</a>';
        }
        ?>
        
    </div>
<?php
 require_once "../conect.php";
if(isset($_GET['id'])){
    $id = $_GET['id'];

    $polaczenie = new mysqli( $db_host, $db_user, $db_pass, $db_name );
    if ($polaczenie->connect_errno!=0)
    {
        echo "Error: ".$polaczenie->connect_errno;
    }
    else{
        $wynik = mysqli_query($polaczenie,"SELECT * FROM game WHERE id=$id"  );
        while($row = mysqli_fetch_array($wynik)){
           echo '<h1> '.$row['title'].'</h1><br>';
           echo '<p>Opis gry: <br> '.$row['description'].'</p>';
           echo '<title>'.$row['title'].' </title>';
           echo '<h3> Cena: '.$row['price'].' PLN </h3>';
        }  
    }
}
else{
    echo "Błąd";
} 
if( !(isset ($_SESSION['zalogowany'])) || !($_SESSION[
    'zalogowany']==true)){
        echo "Zaloguj się aby kupić grę";
    }
else{
    echo '<a href="./buy.php?id='.$id.'">Kup</a> <br>';
    echo '<a href="./addToCart.php?id='.$id.'">Dodaj do koszyka</a>';
}
?> 
  
                
</body>
</html>