<?php

include('conexion.php');

$id_usuario=$_POST['id_usu'];
$id_tdoc=$_POST['id_tdo'];
$nombre=$_POST['nombre'];
$email=$_POST['emai'];
$password=$_POST['contra'];


$consulta= "INSERT INTO usuario values ('$id_usuario','$id_tdoc','$nombre','$email','$password'); ";

$resultado=mysqli_query($con,$consulta) or die("Error de registro");

echo "Registrado correctamente";

if ($resultado === true) {
    // Insertar en la tabla correspondiente (cliente)
    $sql_cliente = "INSERT INTO vendedor (id_usuario_papeleria , id_tdoc_vendedor ) VALUES ('$id_usuario', '$id_tdoc')";
    $resultado_cliente = $con->query($sql_cliente);

    if ($resultado_cliente === true) {
        echo "Registro insertado correctamente.";
    } else {
        echo "Error al insertar en la tabla Cliente: " . $conexion->error;
    }
} else {
    echo "Error al insertar en la tabla Usuarios: " . $conexion->error;
}

?>