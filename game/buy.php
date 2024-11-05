
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
   
</head>
<body>
<?php
 session_start();
 require_once "../conect.php";
if(isset($_GET['id'])){
    $id_game = $_GET['id'];
    $id_user = $_SESSION['user_ID'];

    $polaczenie = new mysqli( $db_host, $db_user, $db_pass, $db_name );
    $wynik = mysqli_query($polaczenie,"INSERT INTO `game_library` (id, user_id, game_id) VALUES (NULL, $id_user, $id_game);" );

    $wynik0 = mysqli_query($polaczenie,"SELECT * FROM game WHERE id=$id_game" );
    $row = mysqli_fetch_array($wynik0);
    echo '<h1>Zakupiono grę: '.$row['title'].'</h1><br>';

}
else{
    echo "Błąd";
} 
?>
 <center><a href="../index.php">Powrót</a></center>

               
</body>
</html>