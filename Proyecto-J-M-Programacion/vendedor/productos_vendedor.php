<?php

include("../php/conexion.php");
$con=conectar();

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/20420209b7.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="productos_vendedor.css">
    <link href="https://fonts.googleapis.com/css2?family=DM+Sans&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <title>Productos</title>
</head>
<body>
    <header id="header">
        <img src="../img/logo.png" alt="" id="logo">
        <nav id="nav_re">
        </nav>
    </header>

    <main class="apart">
        <div class="sidebar">
            <h2>Menú</h2>
            <ul class="menu_nav">
                <li>
                    <a href="vendedor1.html" class="but_menu">
                        <i class="fas fa-server"></i>
                        <label for="btn-modal-ventas">
                            Inicio
                        </label>
                    </a>
                </li>
                <li>
                    <a href="ventas_vendedor.html" class="but_menu">
                        <i class="fa-sharp fa-solid fa-cart-shopping"></i>
                        <label for="btn-modal-ventas">
                            Ventas
                        </label>
                    </a>
                </li>
                <li>
                    <a href="proveedor-v.html" class="but_menu">
                        <i class="fa-solid fa-boxes-stacked"></i>
                            Proveedores
                        </label>
                    </a>
                </li>
                <li>
                    <a href="dsc/informe.docx" class="but_menu" download="Vendedor 1">
                        <i class="fa-solid fa-file"></i>
                        <label for="btn-modal-ventas">
                            Generar informe
                        </label>
                    </a>
                </li>
                </li>
                <li id="li_cerrar">
                    <a href="#" class="but_menu">
                        <i class="fa-regular fa-circle-xmark"></i>
                        <label for="btn-modal">
                            Cerrar sesión
                        </label>
                    </a>
                </li>
            </ul>
        </div>

    <!--Ventana Modal Cierre Sesión-->
    <input type="checkbox" id="btn-modal">
    <div class="container-modal">
        <div class="content-modal">
            <h2>¡Hasta pronto!</h2>
            <p>¡Esperamos verte pronto de regreso! Que tengas un excelente día.</p>
            <div class="btn-cerrar" >
                <label for="btn-modal" ><a href="/index.html">Cerrar</a></label>
            </div>
        </div>
        <label for="btn-modal" class="cerrar-modal"></label>
    </div>
    <!--Fin de Ventana Modal-->

    <section id="cont_table">
        <div class="cont">
            <h2 class="title">Productos</h2>   


            <section>
                <table class="table table-striped">
                    <thead class="table-dark">
                      <tr>
                        <th scope="col">Id_producto</th>
                        <th scope="col">Id_Categoria</th>
                        <th scope="col">Categoria</th>
                        <th scope="col">Nom_producto</th>
                        <th scope="col">Precio</th>
                        <th scope="col">Unidades</th>
                        <th scope="col">Descripcion/Detalles</th>
                      </tr>
                    </thead>

                    <?php 
                    #capturamos la conexio
                    $sql="SELECT *,cp.nombre_categoria FROM producto p INNER JOIN categoria_producto cp ON p.id_categoria_producto = cp.id_categoria LIMIT 8";
                    $query=mysqli_query($con,$sql);
                    if($query){
                        $contador=1;
                        while ($row=mysqli_fetch_assoc($query)) {
                            #capturamos los datos
                            $id_producto = $row["id_producto"];
                            $id_categoria_producto = $row["id_categoria_producto"];
                            $categoria_producto = $row["nombre_categoria"];
                            $nom_producto = $row["nom_producto"];
                            $precio = $row["precio"];
                            $unidades = $row["unidades"];               
                            $detalles_descripcion = $row["detalles_descripcion"];    
                     ?>

                    <tr>
                        <th scope="row"><?php echo $id_producto; ?></th>
                        <td><?php echo $id_categoria_producto; ?></td>
                        <td><?php echo $categoria_producto; ?></td>
                        <td><?php echo $nom_producto; ?></td>
                        <td><?php echo $precio; ?></td>
                        <td><?php echo $unidades; ?></td>
                        <td><?php echo $detalles_descripcion; ?></td>
                    </tr>
                    <?php
                        }
                    }
                    ?>
                  </table>
            </section>
    </main>
    <div class="pqrs">
        <i class="fa-solid fa-circle-exclamation fa-beat"></i>
        <script src="https://kit.fontawesome.com/2880b366dc.js" crossorigin="anonymous"></script>  
    </div>


    <footer id="foot">
        <p id="derechos">J&M D.S - Todos los derechos reservados</p>
    </footer>
</body>
</html>