<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Steam</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
<h2>Gry w twoim koszyku:</h2>
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
        $id = $_SESSION['user_ID'];
            require_once "./conect.php";
            $polaczenie = new mysqli( $db_host, $db_user, $db_pass, $db_name );
            if ($polaczenie->connect_errno!=0)
            {
                echo "Error: ".$polaczenie->connect_errno;
            }
            else{
                $wynik = mysqli_query($polaczenie,"SELECT * FROM cart,game WHERE game_id=game.id AND user_id=$id;" );
                echo '<table><tr><th>Nazwa gry</th><th>Cena gry</th></tr>';
                while($row = mysqli_fetch_array($wynik)){
                echo '<tr>';
                echo '<td>'.$row['title'].'</td><td>'.$row['price'].' PLN </td>'; 
                echo '</tr>';
                }  
                echo '</table>';
                $wynik1 = mysqli_query($polaczenie,"SELECT SUM(price) FROM cart,game WHERE game_id=game.id AND user_id=$id;" );
                while($row = mysqli_fetch_array($wynik1)){
                    echo '<p>Suma gier w koszyku: '.$row['SUM(price)'].'  PLN'; 
                    }  
            }
    }
?>
<br>
<button><a href="./index.php">Powrót do strony głównej</a></button><br>
<button><a href="./checkout.php">Przejdź do płatności</a></button>
</body>
</html>

