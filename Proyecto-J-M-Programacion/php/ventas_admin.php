<?php

include('conexion.php');

$id_factura=$_POST['id_factura'];
$tdoc=$_POST['id_tdoc_vendedor'];
$id_vendedor=$_POST['id_vendedor'];
$id_factura_detalle=$_POST['id_factura'];
$id_producto=$_POST['id_producto'];
$unidades=$_POST['unidades'];
$precio=$_POST['valor_venta'];
$desc=$_POST['descripcion'];
$fecha=$_POST['fecha'];


$consulta= "INSERT INTO factura (id_factura,id_tdoc_vendedor_factura,id_vendedor_factura,descripcion,fecha) 
values ('$id_factura','$tdoc','$id_vendedor','$desc','$fecha')";

$consulta_factura_detalle= "INSERT INTO detalle_factura (id_factura_detalle,id_producto_detalle,unidades,precio) 
values ('$id_factura','$id_producto','$unidades','$precio')";

$resultado=mysqli_query($con,$consulta) or die("Error de registro");
$resultado2=mysqli_query($con,$consulta_factura_detalle) or die("Error de registro");
echo "Registrado correctamente";

?>