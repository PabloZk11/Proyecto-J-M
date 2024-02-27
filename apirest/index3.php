<?php
$host = "localhost";
$usuario = "root";
$password = "";
$database = "aula";
$port = "3307";

$conexion = new mysqli($host, $usuario, $password, $database, $port) or die("Error De Conexion");

header("Content_Type: application/json");
$metodo = $_SERVER['REQUEST_METHOD'];

$path = isset($_SERVER['PATH_INFO']) ? $_SERVER['PATH_INFO'] : '/';
$buscarId = explode('/', $path);
$id = ($path !== '/') ? end($buscarId) : null;

switch ($metodo) {
    // Select proveedores
    case 'GET':
        consulta($conexion, $id);
        break;
    // Insert proveedores
    case 'POST':
        insertar($conexion);
        break;
    // Update proveedores
    case 'PUT':
        actualizar($conexion, $id);
        break;
    // Delete proveedores
    case 'DELETE':
        borrar($conexion, $id);
        break;
    default:
        echo "Método no permitido";
        break;
}

function consulta($conexion, $id)
{
    $sql = ($id === null) ? "SELECT * FROM proveedor" : "SELECT * FROM proveedor WHERE id_proveedor=$id";
    $resultado = $conexion->query($sql);

    if ($resultado) {
        $datos = array();
        while ($fila = $resultado->fetch_assoc()) {
            $datos[] = $fila;
        }
        echo json_encode($datos);
    }
}

function insertar($conexion)
{
    $dato = json_decode(file_get_contents('php://input'), true);
    $id_proveedor = $dato['id_proveedor'];
    $id_tdoc_proveedor = $dato['id_tdoc_proveedor'];
    $producto = $dato['producto'];
    $detalles_productos = $dato['detalles_productos'];

    $sql = "INSERT INTO proveedor (id_proveedor, id_tdoc_proveedor, producto, detalles_productos) VALUES ('$id_proveedor', '$id_tdoc_proveedor', '$producto', '$detalles_productos')";
    $resultado = $conexion->query($sql);

    if ($resultado) {
        echo json_encode(array("mensaje" => "Proveedor creado"));
    } else {
        echo json_encode(array('error' => 'Error al crear el proveedor'));
    }
} 

function borrar($conexion, $id)
{
    $sql = "DELETE FROM proveedor WHERE id_proveedor = $id";
    $resultado = $conexion->query($sql);

    if ($resultado) {
        echo json_encode(array("mensaje" => "Proveedor borrado"));
    } else {
        echo json_encode(array('error' => 'Error al borrar el proveedor'));
    }
}

function actualizar($conexion, $id)
{
    $dato = json_decode(file_get_contents('php://input'), true);
    $id_tdoc_proveedor = $dato['id_tdoc_proveedor'];
    $producto = $dato['producto'];
    $detalles_productos = $dato['detalles_productos'];

    $sql = "UPDATE proveedor SET id_tdoc_proveedor='$id_tdoc_proveedor', producto='$producto', detalles_productos='$detalles_productos' WHERE id_proveedor = $id";
    $resultado = $conexion->query($sql);

    if ($resultado) {
        echo json_encode(array("mensaje" => "Proveedor actualizado"));
    } else {
        echo json_encode(array('error' => 'Error al actualizar el proveedor'));
    }
}
?>