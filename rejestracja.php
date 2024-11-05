
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Steam</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>

<?php

session_start();
require_once "./conect.php";
$polaczenie = new mysqli( $db_host, $db_user, $db_pass, $db_name);

if(isset($_SESSION['sessionId']) && isset($_SESSION['user_ID'])){
    $token = $_SESSION['sessionId'];
    $user_ID = $_SESSION['user_ID'];
    $rezultat = mysqli_query($polaczenie, "SELECT * FROM `sessions` WHERE token='$token' AND user_id=$user_ID;");
    $czy_jest_sesja = mysqli_num_rows($rezultat); 
}

if( (isset($_SESSION['zalogowany'])) && $czy_jest_sesja>0){
        header('Location: my_library.php');
        exit();
    }
if(isset($_POST['login'])){
    require_once "./conect.php";
    $polaczenie = new mysqli( $db_host, $db_user, $db_pass, $db_name );
    if ($polaczenie->connect_errno!=0)
    {
        echo "Error: ".$polaczenie->connect_errno;
    }
    else{
        $login = $_POST['login'];
        $haslo0 = $_POST['haslo'];
        $wynik = mysqli_query($polaczenie,"SELECT * FROM user WHERE email=".'"'.$login.'"'.";");
        $ilu_userow = mysqli_num_rows($wynik); 
        if($ilu_userow<1){
            $haslo = password_hash($haslo0, PASSWORD_DEFAULT);
            mysqli_query($polaczenie,"INSERT INTO `users` (`id`, `email`, `password`) VALUES ('', '$login', '$haslo');");

     }
    else{
            echo "Takie konto już istnieje";
    }
  }
}
?> 


<div class="log" style="text-align: center;">
                    <form method="post">
                    <h1>Rejestracja</h1>
                    <label for="login">
                        <input type="text" name="login" placeholder="login">
                    </label>
                    <br>
                    <label for="haslo">
                        <input type="password" name="haslo" placeholder="password">
                    </label>
                    <a href="rejestracja.php"></a>
                    <br>
                    <br>
                    <button style="border-radius:5px; background-color:black; color:white; margin-top: 20px">Zarejestruj</button>
                </div>
</body>
</html>