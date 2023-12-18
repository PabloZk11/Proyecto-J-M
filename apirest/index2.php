<?php
$host = "localhost";
$usuario = "root";
$password = "";
$database = "aula";

$conexion = new mysqli($host, $usuario, $password, $database) or die("Error De Conexion");

header("Content_Type: application/json");
$metodo = $_SERVER['REQUEST_METHOD'];

$path = isset($_SERVER['PATH_INFO']) ? $_SERVER['PATH_INFO'] : '/';
$buscarId = explode('/', $path);
$id = ($path !== '/') ? end($buscarId) : null;

switch ($metodo) {
    // Select vendedores
    case 'GET':
        consulta($conexion, $id);
        break;
    // Insert vendedores
    case 'POST':
        insertar($conexion);
        break;
    // Update vendedores
    case 'PUT':
        actualizar($conexion, $id);
        break;
    // Delete vendedores
    case 'DELETE':
        borrar($conexion, $id);
        break;
    default:
        echo "Método no permitido";
        break;
}

function consulta($conexion, $id)
{
    $sql = ($id === null) ? "SELECT * FROM vendedor" : "SELECT * FROM vendedor WHERE id_usuario_papeleria=$id";
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
    $id_usuario_papeleria = $dato['id_usuario_papeleria'];
    $id_tdoc_vendedor = $dato['id_tdoc_vendedor'];

    $sql = "INSERT INTO vendedor (id_usuario_papeleria, id_tdoc_vendedor) VALUES ('$id_usuario_papeleria', '$id_tdoc_vendedor')";
    $resultado = $conexion->query($sql);

    if ($resultado) {
        echo json_encode(array("mensaje" => "Vendedor creado"));
    } else {
        echo json_encode(array('error' => 'Error al crear el vendedor'));
    }
} 

function borrar($conexion, $id)
{
    $sql = "DELETE FROM vendedor WHERE id_usuario_papeleria = $id";
    $resultado = $conexion->query($sql);

    if ($resultado) {
        echo json_encode(array("mensaje" => "Vendedor borrado"));
    } else {
        echo json_encode(array('error' => 'Error al borrar el vendedor'));
    }
}

function actualizar($conexion, $id)
{
    $dato = json_decode(file_get_contents('php://input'), true);
    $id_tdoc_vendedor = $dato['id_tdoc_vendedor'];

    $sql = "UPDATE vendedor SET id_tdoc_vendedor='$id_tdoc_vendedor' WHERE id_usuario_papeleria = $id";
    $resultado = $conexion->query($sql);

    if ($resultado) {
        echo json_encode(array("mensaje" => "Vendedor actualizado"));
    } else {
        echo json_encode(array('error' => 'Error al actualizar el vendedor'));
    }
}
?>