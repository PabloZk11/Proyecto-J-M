<?php

include('conexion.php');

$nom_m=$_POST['nombre_mer'];
$cantidad_u=$_POST['cantidad_u'];
$precio=$_POST['precio_compra'];
$desc=$_POST['descripccion'];
$id_p=$_POST['id_pedido'];
$id_pr=$_POST['id_proveedor'];


$consulta= "INSERT INTO entrada_mercancia (nom_producto,cantidad_unidades,precio_compra,detalles_descripcion,id_pedido_entrada,id_proveedor_entrada ) 
values ('$nom_m','$cantidad_u','$precio','$desc','$id_p','$id_pr'); ";

$resultado=mysqli_query($conexion,$consulta) or die("Error de registro");

echo "Registrado correctamente";

?>