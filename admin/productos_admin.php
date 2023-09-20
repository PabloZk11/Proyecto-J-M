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
    <link rel="stylesheet" href="productos_admin.css">
    <link href="https://fonts.googleapis.com/css2?family=DM+Sans&display=swap" rel="stylesheet">
    <script src="https://kit.fontawesome.com/20420209b7.js" crossorigin="anonymous"></script>
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
            <h2>Menu</h2>
            <ul class="menu_nav">
                <li>
                    <a href="index-admin.html" class="but_menu">
                        <i class="fas fa-server"></i>
                        <label for="btn-modal-ventas">
                            Inicio
                        </label>
                    </a>
                </li>
                <li>
                    <a href="ventas_admin.html" class="but_menu">
                        <i class="fa-sharp fa-solid fa-cart-shopping"></i>
                        <label for="btn-modal-ventas">
                            Ventas
                        </label>
                    </a>
                </li>
                <li>
                    <a href="proveedores.html" class="but_menu">
                        <i class="fa-solid fa-truck-field"></i>      
                        <label for="btn-modal-ventas">
                            Proveedores
                        </label>
                    </a>
                </li>
                <li>
                    <a href="tabla_mercancia.html" class="but_menu">
                        <i class="fa-solid fa-boxes-stacked"></i>
                        <label for="btn-modal-ventas">
                            Mercancia
                        </label>
                    </a>
                </li>
                <li id="li_cerrar">
                    <a href="Vendedor.html" class="but_menu">
                        <i class="fa-solid fa-users"></i>
                        <label for="btn-modal">
                            Vendedor
                        </label>
                    </a>
                </li>
                <li>
                    <a href="dsc/informe.docx" class="but_menu" download="administrador Informe">
                        <i class="fa-solid fa-file"></i>
                        <label for="btn-modal-ventas">
                            Generar Informe
                        </label>
                    </a>
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

        <input type="checkbox" id="btn-modal-añadir">
        <div class="container-modal-añadir">
            <div class="content-modal-añadir">
                <h2>Productos</h2>
                <div>
                    <form class="formulario">
                        <div class="f1">
        
                           <input type="search" name="Nombre del producto  " class="in" placeholder="Nombre del producto:" required="required">
                            <input type="search" name="Precio Compra" class="in" placeholder="Precio Compra:" required="required">
                            <input type="number" name="Unidades" class="in" placeholder="Unidades:" required="required">
                            <input type="number" name="Descripccion" class="in" placeholder="Descripccion:" required="required">
                        </div>
                    </form> 
                </div>
                <div class="btn-cerrar-añadir" >
                    <label for="btn-modal-añadir" ><a href="ventas_vendedor_añadir.html"><input type="submit" value="Añadir" class="enviar"></a></label>
                </div>
            </div>
            <label for="btn-modal-añadir" class="cerrar-modal-añadir"></label>
        </div>

    <!--Ventana Modal Cierre Sesión-->
    <input type="checkbox" id="btn-modal">
    <div class="container-modal">
        <div class="content-modal">
            <h2>¡Hasta pronto!</h2>
            <p>¡Esperamos verte pronto de regreso! Que tengas un excelente día.</p>
            <div class="btn-cerrar" >
                <label for="btn-modal" ><a href="index.html">Cerrar</a></label>
            </div>
        </div>
        <label for="btn-modal" class="cerrar-modal"></label>
    </div>
    <!--Fin de Ventana Modal-->
        
    <section id="cont_table">
        <div class="cont">
            <h2 class="title">Productos</h2>   

            <div class="but_cont">
                <section id="ag_prod">
                    <a href="#" id="but_ag"><label for="btn-modal-añadir">
                        Añadir Producto
                    </label></a>
                </section>
                <section id="ag_prod">
                    <a href="dsc/informe.docx" id="but_ag" download="Informe Ventas Admin">Generar informe</a>
                </section>
                
            </div>

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

            <div id="div_buscador">
                <img src="../img/Lupa.png" alt="">
                <input type="text" id="buscador" placeholder="Busca algún Producto:">
            </div>
        </div>
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
