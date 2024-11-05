
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
// polaczenie i sprawdzienie id sesji
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
        $haslo = $_POST['haslo'];
        $wynik = mysqli_query($polaczenie,"SELECT * FROM users WHERE email=".'"'.$login.'"'.";");
        $ilu_userow = mysqli_num_rows($wynik); 
        $row = mysqli_fetch_array($wynik);
        if($ilu_userow<1){
            echo "błędne dane";
        }
        else if(password_verify($haslo, $row['password'])){
                $_SESSION['zalogowany'] = true;
                $id = $row['id'];
                $_SESSION['user_ID'] = $id;
                $sessionId = session_id();
                $_SESSION['sessionId'] = $sessionId;
                mysqli_query($polaczenie, "INSERT INTO `sessions` (`id`, `user_id`, `token`) VALUES (NULL, '$id', '$sessionId');");
                header("Location: my_library.php");
        }
  }
}
?> 


<div class="log" style="text-align: center;">
                    <form method="post">
                    <h1>Logowanie</h1>
                    <label for="login">
                        <input type="text" name="login" placeholder="login">
                    </label>
                    <br>
                    <label for="haslo">
                        <input type="password" name="haslo" placeholder="password">
                    </label>
                    <br>
                    <a href="rejestracja.php">Jeżeli nie masz konta zarejestuj się</a>
                    <br>
                    <br>
                    <button style="border-radius:5px; background-color:black; color:white; margin-top: 20px">Zaloguj</button>
                </div>
</body>
</html>