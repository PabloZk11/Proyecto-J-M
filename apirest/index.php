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
    // Select usuarios
    case 'GET':
        consulta($conexion, $id);
        break;
    // Insert usuarios
    case 'POST':
        insertar($conexion);
        break;
    // Update usuarios
    case 'PUT':
        actualizar($conexion, $id);
        break;
    // Delete usuarios
    case 'DELETE':
        borrar($conexion, $id);
        break;
    default:
        echo "Método no permitido";
        break;
}

function consulta($conexion, $id)
{
    $sql = ($id === null) ? "SELECT * FROM usuarios" : "SELECT * FROM usuarios WHERE id_usuario=$id";
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
    $id_usuario = $dato['id_usuario'];
    $id_tdoc_usuario = $dato['id_tdoc_usuario'];
    $nombre = $dato['nombre'];
    $email = $dato['email'];
    $contrasena = $dato['contrasena'];

    $sql = "INSERT INTO usuarios (id_usuario, id_tdoc_usuario, nombre, email, contrasena) VALUES ('$id_usuario', '$id_tdoc_usuario', '$nombre', '$email', '$contrasena')";
    $resultado = $conexion->query($sql);

    if ($resultado) {
        echo json_encode(array("mensaje" => "Usuario creado"));
    } else {
        echo json_encode(array('error' => 'Error al crear el usuario'));
    }
} 

function borrar($conexion, $id)
{
    $sql = "DELETE FROM usuarios WHERE id_usuario = $id";
    $resultado = $conexion->query($sql);

    if ($resultado) {
        echo json_encode(array("mensaje" => "Usuario borrado"));
    } else {
        echo json_encode(array('error' => 'Error al borrar el usuario'));
    }
}

function actualizar($conexion, $id)
{
    $dato = json_decode(file_get_contents('php://input'), true);
    $id_tdoc_usuario = $dato['id_tdoc_usuario'];
    $nombre = $dato['nombre'];
    $email = $dato['email'];
    $contrasena = $dato['contrasena'];

    $sql = "UPDATE usuarios SET id_tdoc_usuario=$id_tdoc_usuario, nombre='$nombre', email='$email', contrasena='$contrasena' WHERE id_usuario = $id";
    $resultado = $conexion->query($sql);

    if ($resultado) {
        echo json_encode(array("mensaje" => "Usuario actualizado"));
    } else {
        echo json_encode(array('error' => 'Error al actualizar el usuario'));
    }
}
?>
