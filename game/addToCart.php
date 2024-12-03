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
    
    
    $polaczenie = new mysqli( $db_host, $db_user, $db_pass, $db_name );
    $wynik1 = mysqli_query($polaczenie,"SELECT * FROM game_library WHERE user_id=$id_user AND game_id=$id_game;");
    $iloscWynik1 = mysqli_num_rows($wynik1);
    $wynik2 = mysqli_query($polaczenie,"SELECT * FROM cart WHERE user_id=$id_user AND game_id=$id_game;");
    $iloscWynik2 = mysqli_num_rows($wynik2);
    if($iloscWynik1<1 && $iloscWynik2<1){
    $wynik = mysqli_query($polaczenie,"INSERT INTO `cart` (id, user_id, game_id) VALUES (NULL, $id_user, $id_game);" );
    $wynik0 = mysqli_query($polaczenie,"SELECT * FROM game WHERE id=$id_game" );
    $row = mysqli_fetch_array($wynik0);
    echo '<h1>Dodano do koszyka grę: '.$row['title'].'</h1><br>';
    }
    elseif(!$iloscWynik1<1 ){
        echo "Posiadasz już tą grę";
    }
    else{
        echo "Ta gra już znajduje się w twoim koszyku";
    }
}
else{
    echo "Błąd";
} 
echo ' <center><a href="../game/show.php?id='.$id_game.'">Powrot</a></center>';
?>


               
</body>
</html>