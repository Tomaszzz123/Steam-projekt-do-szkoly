<?php

 session_start();



if(isset($_SESSION['sessionId']) && isset($_SESSION['user_ID'])){
    $token = $_SESSION['sessionId'];
    $user_ID = $_SESSION['user_ID'];
    require_once "./conect.php";
    $polaczenie = new mysqli( $db_host, $db_user, $db_pass, $db_name);
    mysqli_query($polaczenie, "DELETE FROM `sessions` WHERE  token= '$token' AND user_id='$user_ID'");
}

 session_unset();
 header("Location: index.php");
 ?>

