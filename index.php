
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Steam</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
    <h1>Lista gier:</h1>   
    <ul>
<?php
 require_once "./conect.php";
     $polaczenie = new mysqli( $db_host, $db_user, $db_pass, $db_name );
     if ($polaczenie->connect_errno!=0)
     {
         echo "Error: ".$polaczenie->connect_errno;
     }
     else{
         $wynik = mysqli_query($polaczenie,"SELECT * FROM game" );
         while($row = mysqli_fetch_array($wynik)){
            echo '<li> <a href="game/show.php?id='.$row['id'].'.">'.$row['title'].'</a></li>';
             
         }  
     }
?> 
</ul>
</div>
<a href="logowanie.php">Logowanie</a><br><br>
<a href="./my_library.php">Twoje gry</a><br><br>
<a href="./cart.php">Koszyk</a>
</body>
</html>