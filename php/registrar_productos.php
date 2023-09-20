<?php

include('conexion.php');

$id_fac=$_POST['id_producto'];
$id_tdoc=$_POST['categoria'];
$id_vend=$_POST['nom_producto'];
$desc=$_POST['precio'];
$fecha=$_POST['unidades'];
$detalle=$_POST['detalles'];


$consulta= "INSERT INTO producto (id_producto, id_categoria_producto, nom_producto, precio, unidades, detalles_descripcion)
 values ('$id_fac','$id_tdoc','$id_vend','$desc','$fecha', '$detalle');";

$resultado=mysqli_query($conexion,$consulta) or die("Error de registro");

echo "Añadido con exito";

?>
