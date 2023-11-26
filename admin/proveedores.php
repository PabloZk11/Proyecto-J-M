<?php

include("../php/conexion.php");

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://kit.fontawesome.com/20420209b7.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="proveedores.css">
    <link href="https://fonts.googleapis.com/css2?family=DM+Sans&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

    <title>Proveedores</title>
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
                    <a href="index-admin.html" class="but_menu">
                        <i class="fa-solid fa-truck-field"></i>      
                        <label for="btn-modal-ventas">
                            Inicio
                        </label>
                    </a>
                </li>
                <li>
                    <a href="ventas_admin.php" class="but_menu">
                        <i class="fa-sharp fa-solid fa-cart-shopping"></i>
                        <label for="btn-modal-ventas">
                            Ventas
                        </label>
                    </a>
                </li>
                <li>
                    <a href="productos_admin.php" class="but_menu">
                        <i class="fas fa-server"></i>
                        <label for="btn-modal-ventas">
                            Productos
                        </label>
                    </a>
                </li>
                <li>
                    <a href="tabla_mercancia.php" class="but_menu">
                        <i class="fa-solid fa-boxes-stacked"></i>
                        <label for="btn-modal-ventas">
                            Mercancia
                        </label>
                    </a>
                </li>
                <li id="li_cerrar">
                    <a href="Vendedor.html" class="but_menu">
                        <i class="fa-solid fa-users"></i>
                        <label for="btn-modal-ventas">
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

    
        <!--Ventana Modal Cierre Advertencia-->
        
    <input type="checkbox" id="btn-modal-añadir">
    <div class="container-modal-añadir">
        <div class="content-modal-añadir">
            <h2>Registrar Proveedor</h2>
            <div>
                <form class="formulario" action="../php/registro_proveedor.php" method="POST">
                    <div class="f1">
    
                        <input type="search" name="id_usu" class="in" placeholder="Id_usuario :" required="required">
                        <input type="search" name="id_tdo" class="in" placeholder="id_tdoc_usuario :" required="required">
                        <input type="search" name="nombre" class="in" placeholder="nombre_prov:" required="required">
                        <input type="search" name="emai" class="in" placeholder="Email:" required="required">
                        <input type="search" name="contra" class="in" placeholder="Contraseña:" required="required">
                        <button type="submit">Registrar</button>
                    </div>
                </form> 
            </div>
        </div>
        <label for="btn-modal-añadir" class="cerrar-modal-añadir"></label>
    </div>
    <!--Fin de Ventana Modal Advertencia-->

    <!--Ventana Modal Filtro-->
        <input type="checkbox" id="btn-modal-filtro">
        <div class="container-modal-filtro">
            <div class="content-modal-filtro">
                <h2>Filtrar Ventas</h2>
                <p>En este apartado podras elegir desde que fecha quieres 
                    ver las ventas realizadas en la papeleria Aulas. </p>
                    <div>
                        <form class="formulario">
                            <div class="f1">
                                <input type="date" name="Fecha" class="in" placeholder="Fecha:" required="required"> 
                            </div>
                        </form> 
                    </div>
                    <div class="btn-cerrar-filtro" >
                        <label for="btn-modal-filtro" ><a href="ventas_vendedor_vacio.html"><input type="submit" value="Añadir" class="enviar"></a></label>
                    </div>
                </div>
                <label for="btn-modal-filtro" class="cerrar-modal-filtro"></label>
            </div>
    <!--Fin de Ventana Modal-->

    <section id="cont_table">
        <div class="cont">
            <h2 class="title">Proveedores</h2>   

            <div class="but_cont">
                <section id="ag_prod">
                    <a href="#" id="but_ag"><label for="btn-modal-añadir">
                        Añadir proveedor
                    </label></a>
                </section>
                <section id="ag_prod">
                    <a href="#" id="but_ag"><label for="btn-modal-filtro">
                        Filtro
                    </label></a>
                </section>
                <section id="ag_prod">
                    <a href="dsc/informe.docx" id="but_ag" download="Informe Ventas Admin">Generar informe</a>
                </section>
            </div>

    <!--Fin de Ventana Modal-->

    <section>
                <table class="table table-striped">
                    <thead class="table-dark">
                      <tr>
                        <th scope="col">Id_proveedor</th>
                        <th scope="col">Tipo documento</th>
                        <th scope="col">Nombre</th>
                        <th scope="col">Email</th>
                        <th scope="col">Producto</th>
                        <th scope="col">detalles_productos</th>
                      </tr>
                    </thead>

                    <?php 
                    #capturamos la conexio
                    $sql="SELECT * FROM proveedor p INNER JOIN usuario u ON p.id_proveedor = u.id_usuario INNER JOIN documento_identificacion di ON u.id_tdoc_usuario = di.id_documento";
                    $query=mysqli_query($con,$sql);
                    if($query){
                        $contador=1;
                        while ($row=mysqli_fetch_assoc($query)) {
                            #capturamos los datos
                            $id_proveedor = $row["id_proveedor"];
                            $id_tdoc_proveedor = $row["tipo_documento"];
                            $nombre = $row["nombre"];
                            $email = $row["email"];
                            $producto = $row["producto"];
                            $detalles_productos = $row["detalles_productos"];    
                     ?>

                    <tr>
                        <th scope="row"><?php echo $id_proveedor; ?></th>
                        <td><?php echo $id_tdoc_proveedor; ?></td>
                        <td><?php echo $nombre; ?></td>
                        <td><?php echo $email; ?></td>
                        <td><?php echo $producto; ?></td>
                        <td><?php echo $detalles_productos; ?></td>
                    </tr>
                    <?php
                        }
                    }
                    ?>
                  </table>
            </section>

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