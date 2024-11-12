
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
   
</head>
<body>
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
session_start();
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