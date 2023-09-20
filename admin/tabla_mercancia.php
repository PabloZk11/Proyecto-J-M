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
    <link rel="stylesheet" href="tabla_mercancia.css">
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
                    <a href="index-admin.html" class="but_menu">
                        <i class="fa-solid fa-boxes-stacked"></i>
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
                    <a href="productos_admin.html" class="but_menu">
                        <i class="fas fa-server"></i>
                        <label for="btn-modal-ventas">
                            Productos
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
                </ul>
        </div>  

    <!--Ventana Modal Cierre Sesión-->
    <input type="checkbox" id="btn-modal">
            </li>
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

    <input type="checkbox" id="btn-modal-añadir">
    <div class="container-modal-añadir">
        <div class="content-modal-añadir">
            <h2>Registrar Entrada de Mercancía</h2>
            <div>
                <form class="formulario" action="../php/registro_mercancia.php" method="POST">
                    <div class="f1">
                        <input type="search" name="nombre_mer" class="in" placeholder="Nombre mercancía:" required="required">
                        <input type="search" name="cantidad_u" class="in" placeholder="Cantidad id_pedido_entrada:" required="required">
                        <input type="search" name="precio_compra_compra" class="in" placeholder="precio_compra Compra:" required="required">
                        <input type="search" name="descripccion" class="in" placeholder="Descripccion:" required="required">
                        <input type="search" name="id_pedido" class="in" placeholder="Id_Pedido:" required="required">
                        <input type="search" name="id_proveedor" class="in" placeholder="Id_Proveedor:" required="required">
                        <button id="but_repo" type="submit">REGISTRAR PROVEEDOR</button>
                    </div>
                </form> 
            </div>
        </div>
        <label for="btn-modal-añadir" class="cerrar-modal-añadir"></label>
    </div>

    <!--Ventana Modal Filtro-->
    <input type="checkbox" id="btn-modal-filtro">
    <div class="container-modal-filtro">
        <div class="content-modal-filtro">
            <h2>Filtrar Mercancía</h2>
            <p>En este apartado podras elegir desde que fecha quieres 
                ver las mercarcía realizadas en la papeleria Aulas. </p>
                <div>
                    <form class="formulario">
                        <div class="f1">
                            <input type="date" name="Fecha" class="in" placeholder="Fecha:" required="required"> 
                        </div>
                    </form> 
                </div>
                <div class="btn-cerrar-filtro" >
                    <label for="btn-modal-filtro" ><a href="ventas_vendedor_vacio.html"><input type="submit" value="Buscar" class="enviar"></a></label>
                </div>
            </div>
            <label for="btn-modal-filtro" class="cerrar-modal-filtro"></label>
        </div>

<!--Fin de Ventana Modal-->
<section id="cont_table">
    <div class="cont">
        <h2 class="title"> Entrada de Mercancía</h2>   

        <div class="but_cont">
            <section id="ag_prod">
                <a href="#" id="but_ag"><label for="btn-modal-añadir">
                    Registrar Entrada de Mercancía
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

        <section>
    <!--Fin de Ventana Modal-->

    <section>
                <table class="table table-striped">
                    <thead class="table-dark">
                      <tr>
                        <th scope="col">id_entrada</th>
                        <th scope="col">nom_producto</th>
                        <th scope="col">cantidad_unidades</th>
                        <th scope="col">precio_compra</th>
                        <th scope="col">Descripcion/Detalles</th>
                        <th scope="col">id_pedido_entrada</th>
                        <th scope="col">id_proveedor_entrada</th>
                      </tr>
                    </thead>

                    <?php 
                    #capturamos la conexio
                    $sql="SELECT * FROM entrada_mercancia";
                    $query=mysqli_query($con,$sql);
                    if($query){
                        $contador=1;
                        while ($row=mysqli_fetch_assoc($query)) {
                            #capturamos los datos
                            $id_entrada = $row["id_entrada"];
                            $nom_producto = $row["nom_producto"];
                            $cantidad_unidades = $row["cantidad_unidades"];
                            $precio_compra = $row["precio_compra"];               
                            $detalles_descripcion = $row["detalles_descripcion"];
                            $id_pedido_entrada = $row["id_pedido_entrada"];    
                            $id_proveedor_entrada = $row["id_proveedor_entrada"];    
                     ?>

                    <tr>
                        <th scope="row"><?php echo $id_entrada; ?></th>
                        <td><?php echo $nom_producto; ?></td>
                        <td><?php echo $cantidad_unidades; ?></td>
                        <td><?php echo $precio_compra; ?></td>
                        <td><?php echo $detalles_descripcion; ?></td>
                        <td><?php echo $id_pedido_entrada; ?></td>
                        <td><?php echo $id_proveedor_entrada; ?></td>
                    </tr>
                    <?php
                        }
                    }
                    ?>
                  </table>
            </section>

        
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