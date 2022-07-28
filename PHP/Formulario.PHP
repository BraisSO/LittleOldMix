<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
.error {color: #FF0000;}
</style>
</head>
<body>
    
<?php
$nombreErr = $apellidosErr = $edadErr = $animeErr = "";
$nombre = $apellidos = $edad = $anime = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
if (empty($_POST["nombre"])) { $nombreErr = "El campo
nombre es obligatorio";
} else { $nombre = validar_input($_POST["nombre"]); }

if (empty($_POST["apellidos"])) { $apellidosErr = "El campo apellidos es
obligatorio";
} else { $apellidos = validar_input($_POST["apellidos"]); }

if (empty($_POST["anime"])) { $animeErr = "PON UN ANIME";
} 
else { $anime = validar_input($_POST["anime"]); }


if (empty($_POST['edad'])) {$edadErr="Pon una edad";} 
else {$edad=validar_input($_POST["edad"]);}


}



if (!preg_match("/^[a-zA-Z-' ]*$/",$nombre)) {
  $nombreErr = "El nombre sólo puede contener letrars y espacios en blanco";
  }
  
if (!preg_match("/^[a-zA-Z-' ]*$/",$apellidos)) {
$apellidosErr = "El nombre sólo puede contener letras y espacios en blanco";
  }



function validar_input($data){
    $data=trim($data);
    $data=stripslashes($data);
    $data=htmlspecialchars($data);
    return $data;   
}


echo $nombre,"</br>", $apellidos, "</br>" , $anime,"</br>", $edad, "</br>" ;

?>

<form method="POST"
    action="<?php echo htmlspecialchars($_SERVER['PHP_SELF']);?>">

    <p>Nombre: <input type="text" name="nombre" placeholder="'Like: Manoliño'" ></p>
    <span class="error"><?php echo $nombreErr;?></span>
    <p>Apellidos:
        <input type="text" name="apellidos" size="40" placeholder="Escriba sus dos apellidos">
        <span class="error"><?php echo $apellidosErr;?></span>
    </p>
      <p>Anime favorito:
        <input type="text" name="anime" size="30" placeholder="Not Evangelion PLS">
        <span class="error"><?php echo $animeErr;?></span>
    </p>
      <p>Canto mola Brais?:
        <input type="range" name="bmola" value="100">
      </p>

    <p>Sexo:
      <input type="radio" name="hma" value="h" required>  <?php if (isset($sexo) && $sexo=="hombre") 
      echo "checked";?> Hombre
      <input type="radio" name="hma" value="m" checked required> <?php if (isset($sexo) && $sexo=="mujer") 
      echo "checked";?> Mujer
      <input type="radio" name="hma" value="a" disabled required> Alien
    </p>

    <p>Edad:
      <input type="number" name="edad" style="width:40px" value=" " required  >
    </p>

    <p> <form action="manejoArchivos.php" method="POST" enctype="multipart/form-data">
            Seleccione Archivo:
            <input type="file" name="archivo" id="archivo"><br>
            <input type="submit" name="submit" value="Subir Archivo al Servidor"> </p>

    <p><button input type="submit" value="enviar" style="background-color:lightgray; border-radius:30%">Enviar</button></p>

   
  
</form>

<?php
file_exists(string $archivo): bool

$servername = "localhost";
$username = "root";
$password = "";
$database = 'nombreDB';

$conn = mysqli_connect($servername, $username, $password);

if (!$conn)

{die("No ha sido posible realizar la conexión, error: " .
mysqli_connect_error());
}

$sql = "CREATE DATABASE nombreDB3";

if (mysqli_query($conn, $sql)) {
  echo "La base de datos ha sido creada correctamente";
  
  } else {
  echo "No ha sido posible crear la Base de Datos, error: " .
  mysqli_error($conn);
  }

$sql22 = 'Use nombredb3';
mysqli_query($conn, $sql22);

$sql = "CREATE TABLE Usuarios (

  id INT auto_increment PRIMARY KEY,
  nombre VARCHAR(20) NOT NULL,
  email VARCHAR(50)
  
  )";
  

  if (mysqli_query($conn, $sql)) {

    echo "La Tabla ha sido creada correctamente";
    } else {
    echo "No ha sido posible crear la Tabla, error: " . mysqli_error($conn);
    }

$sql= "INSERT INTO Usuarios (id, nombre, email) VALUES
('1', 'María', 'maria@gmail.com')";

if (mysqli_query($conn, $sql)) {
  echo "El registro ha sido insertado correctamente en la Tabla";
  } else {
  echo "Error: " . $sql . "<br>" . mysqli_error($conn);
  }




mysqli_close($conn);



?>

</body>
</html>