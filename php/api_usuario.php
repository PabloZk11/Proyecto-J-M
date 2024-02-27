<?php

$conexion=mysqli_connect("localhost","root","","aulas","3307") or die ("Error al conectar a la base de datos".mysql_error());

header("Content_Type: application/json");
$metodo= $_SERVER['REQUEST_METHOD'];

$path= isset($_SERVER['PATH_INFO'])?$_SERVER['PATH_INFO']:'/';
    $buscarId = explode('/',$path);
   
    $id= ($path!=='/') ? end($buscarId):null;

    switch ($metodo){
        case 'GET':
            consulta($conexion, $id);
        break;
        case 'POST':
            insertar($conexion);
        break;
        case 'PUT':
            actualizar($conexion, $id);
        break;
        case 'DELETE':
            borrar($conexion,$id);
        break;
        default:
            echo " Método no permitido ";
        break;
    }

    function consulta($conexion,$id){
        $sql= ($id===null) ? "SELECT * FROM usuario":"SELECT * FROM usuario WHERE id_usuario=$id" ;
        $resultado = $conexion->query($sql);


        if($resultado){
            $datos = array();
            while($fila= $resultado->fetch_assoc()){
                $datos[]= $fila;
            }
            echo json_encode($datos);
        }
     }

    function insertar($conexion){
        $dato= json_decode(file_get_contents('php://input'), true);
        $nombre= $dato['nombre'];

        $sql= "INSERT INTO usuario(nombre) VAlUES ('$nombre')";
        $resultado = $conexion->query($sql);

        if($resultado){
            $dato['id'] = $conexion->insert_id;
            echo json_encode($dato);
        }else{
            echo json_encode(array('error'=>'Error al crear'));
        }
       }


?>