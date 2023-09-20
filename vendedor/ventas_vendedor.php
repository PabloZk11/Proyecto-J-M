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
    <link rel="stylesheet" href="ventas_vendedor.css">
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
                        <i class="fa-sharp fa-solid fa-cart-shopping"></i>
                        <label for="btn-modal-ventas">
                            Inicio
                        </label>
                    </a>
                </li>
                <li>
                    <a href="productos_vendedor.html" class="but_menu">
                        <i class="fas fa-server"></i>
                        <label for="btn-modal-ventas">
                            Productos
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

        <!--Ventana Modal Cierre Advertencia-->
        <input type="checkbox" id="btn-modal-añadir">
        <div class="container-modal-añadir">
            <div class="content-modal-añadir">
                <h2>Añadir Venta</h2>
                <div>
                    <form class="formulario" method="post" action="../php/ventas_admin.php">
                        <div class="f1">
        
                            <input type="number" name="Id_factura" class="in" placeholder="N_factura" required="required">
                            <input type="search" name="documento_vendedor" class="in" placeholder="id_tdoc_vendedor" required="required">
                            <input type="search" name="id_vendedor" class="in" placeholder="id_vendedor" required="required">
                            <input type="text" name="descripcion" class="in" placeholder="descripcion" required="required">
                            <input type="date" name="Fecha" class="in" placeholder="Fecha:" required="required">
                            <button  type="submit">Añadir venta</button>
                        </div>
                    </form> 
                </div>
                <div class="btn-cerrar-añadir" >
                    <label for="btn-modal-añadir" ><a href="ventas_vendedor_añadir.html"><input type="submit" value="Añadir" class="enviar"></a></label>
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
            <h2 class="title">Ventas</h2>   

            <div class="but_cont">
                <section id="ag_prod">
                    <a href="#" id="but_ag"><label for="btn-modal-añadir">
                        Añadir venta
                    </label></a>
                </section>
                <section id="ag_prod">
                    <a href="#" id="but_ag"><label for="btn-modal-filtro">
                        Filtro
                    </label></a>
                </section>
                <section id="ag_prod">
                    <a href="dsc/informe.docx" id="but_ag" download="Informe Ventas">Generar informe</a>
                </section>
                <section id="ag_prod">
                    <a href="dsc/imprimir.pdf" id="but_ag" download="Ultima Venta">Imprimir última venta</a>
                </section>
            </div>


            <section>

                <table class="table table-striped">
                    <thead class="table-dark">
                      <tr>
                        <th scope="col">Id_factura</th>
                        <th scope="col">Tipo_documento</th>
                        <th scope="col">Id_vendedor</th>
                        <th scope="col">Nombre_vendedor</th>
                        <th scope="col">Descripcion</th>
                        <th scope="col">Factura</th>
                      </tr>
                    </thead>

                    <?php 
                    #capturamos la conexio
                    $sql="SELECT f.id_factura, di.tipo_documento, u.id_usuario, u.nombre, f.descripcion, f.fecha FROM factura f INNER JOIN vendedor v ON f.id_vendedor_factura = v.id_usuario_papeleria INNER JOIN usuario u ON v.id_usuario_papeleria = u.id_usuario INNER JOIN documento_identificacion di ON u.id_tdoc_usuario = di.id_documento";
                    $query=mysqli_query($con,$sql);
                    if($query){
                        $contador=1;
                        while ($row=mysqli_fetch_assoc($query)) {
                            #capturamos los datos
                            $id_factura = $row["id_factura"];
                            $tipo_documento = $row["tipo_documento"];
                            $id_vendedor = $row["id_usuario"];
                            $nombre_vendedor = $row["nombre"];
                            $descripcion = $row["descripcion"];
                            $fecha = $row["fecha"];               

                     ?>

                    <tr>
                        <th scope="row"><?php echo $id_factura; ?></th>
                        <td><?php echo $tipo_documento; ?></td>
                        <td><?php echo $id_vendedor; ?></td>
                        <td><?php echo $nombre_vendedor; ?></td>
                        <td><?php echo $descripcion; ?></td>
                        <td><?php echo $fecha; ?></td>
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