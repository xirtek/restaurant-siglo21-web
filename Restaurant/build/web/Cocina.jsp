<%-- 
    Document   : Cocina
    Created on : 24-09-2019, 15:38:19
    Author     : Raul
--%>


<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DBConexion.Conexion"%>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html lang="en">
    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">    
        <title>Siglo XXI</title>


        <link rel="stylesheet" href="http://cdn.datatables.net/1.10.2/css/jquery.dataTables.css">
        <script src="http://code.jquery.com/jquery-2.1.1.min.js"></script>
        <script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
        <script src="js/table.js"></script>

        <!-- Favicon -->
        <link rel="shortcut icon" href="assets/img/favicon.ico" type="image/x-icon">

        <!-- Font awesome -->
        <link href="assets/css/font-awesome.css" rel="stylesheet">
        <!-- Bootstrap -->
        <link href="assets/css/bootstrap.css" rel="stylesheet">   
        <!-- Slick slider -->
        <link rel="stylesheet" type="text/css" href="assets/css/slick.css">    
        <!-- Date Picker -->
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap-datepicker.css">   
        <!-- Gallery Lightbox -->
        <link href="assets/css/magnific-popup.css" rel="stylesheet"> 
        <!-- Theme color -->
        <link id="switcher" href="assets/css/theme-color/default-theme.css" rel="stylesheet">     

        <!-- Main style sheet -->
        <link href="assets/css/style.css" rel="stylesheet">    


        <!-- Google Fonts -->

        <!-- Prata for body  -->
        <link href='https://fonts.googleapis.com/css?family=Prata' rel='stylesheet' type='text/css'>
        <!-- Tangerine for small title -->
        <link href='https://fonts.googleapis.com/css?family=Tangerine' rel='stylesheet' type='text/css'>   
        <!-- Open Sans for title -->
        <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>

    </head>
    <body>

        <!-- Start header section -->
        <header id="mu-header">  
            <nav class="navbar navbar-default mu-main-navbar" role="navigation">  
                <div class="container">
                    <div class="navbar-header">
                        <!-- FOR MOBILE VIEW COLLAPSED BUTTON -->
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>

                        <!-- LOGO -->       

                        <!--  Text based logo  -->
                        <a class="navbar-brand" href="Principal.jsp">Siglo<span>XXI</span></a> 

                        <!--  Image based logo  -->
                        <!-- <a class="navbar-brand" href="index.html"><img src="assets/img/logo.jpg" alt="Logo img"></a>  -->
                        <%
                            Connection con;
                            Conexion cn = new Conexion();
                            PreparedStatement ps;
                            ResultSet rs;

                            String sql = "Select p.id_pedido,o.id_orden, p.nombre_cliente, p.id_mesa, o.estado ,pla.descripcion as des1, b.descripcion as des2, po.descripcion as des3, m.disponibilidad from ORDEN o join pedido p on o.id_pedido = p.id_pedido join mesa m on p.id_mesa = m.id_mesa join bebestible b on b.id_bebestible = o.id_bebestible join plato pla on pla.id_plato = o.id_plato join postre po on po.id_postre = o.id_postre where p.estado = 1"
                                    + " order by  o.id_orden asc";
                            con = cn.getConexion();
                            ps = con.prepareStatement(sql);

                            rs = ps.executeQuery();


                        %>

                    </div>
                    <div id="navbar" class="navbar-collapse collapse">
                        <ul id="top-menu" class="nav navbar-nav navbar-right mu-main-nav">

                            <li><a href="Controlador?accion=Salir">cerrar sesión</a></li> 
                        </ul>                            
                    </div><!--/.nav-collapse -->       
                </div>          
            </nav> 
        </header>
        <!-- End header section -->
        <div class="container">            
            <button type="button" class="btn btn-success btn-lg" data-toggle="modal" data-target="#myModal">New Add</button>
            <div style="padding-left: 800px">                  
                <input type="text" class="form-control" value="Buscar"/>                            
            </div>
        </div>  

        <br>
        <div class="container" >               
            <!--<a  class="btn btn-success" href="Agregar.jsp">Nuevo Registro</a> Esto es Cuando se Crea un nuevo Archivo Agregar.jsp -->         
            <!DOCTYPE html>

            <table id="tabla" class="display" cellspacing="0" width="100%" >

                <a href="Cocina.jsp" class="btn btn-success btn-lg" style="float: right;">Actualizar</a>
               <h1 style="color: white;">Listado de Órdenes</h1>
                <thead style="color: white;">
                    <tr style="color: white;">
                        <th class="text-center">Nr Órden</th>
                        <th>Nombre Cliente</th>
                        <th class="text-center">Número Mesa</th>
                        <th class="text-center">Plato</th>
                        <th class="text-center">Bebida</th>
                        <th class="text-center">Postre</th>
                        <th class="text-center"></th>
                    </tr>
                </thead>

                <tbody >
                    <% while (rs.next()) {
                            if (rs.getString("estado").equals("Preparando")) {
                    %>
                    <tr>
                        <td class="text-center"><%= rs.getInt("id_orden")%></td>

                        <td><%= rs.getString("nombre_cliente")%></td>
                        <td class="text-center"><%= rs.getInt("id_mesa")%></td>
                        <td class="text-center"><%= rs.getString("des1")%></td>
                        <td class="text-center"><%= rs.getString("des2")%></td>
                        <td class="text-center"><%= rs.getString("des3")%></td>

                        <td class="text-center">


                            <a href="EditarPedidosCocina.jsp?id=<%= rs.getInt("id_orden")%>" class="btn btn-primary">Órden lista</a>


                        </td>
                    </tr>
                    <%}
                        }%>
                </tbody>
            </table>



        </div>


        <!-- Start Footer -->
        <footer id="mu-footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="mu-footer-area">
                            <div class="mu-footer-social">
                            </div>              
                            </br>
                            <div class="mu-footer-copyright">
                                <p>&copy; Siglo XXI Todos Los Derechos Reservados.</p>
                            </div>         
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- End Footer -->

        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="assets/js/bootstrap.js"></script>   
        <!-- Slick slider -->
        <script type="text/javascript" src="assets/js/slick.js"></script>
        <!-- Counter -->
        <script type="text/javascript" src="assets/js/simple-animated-counter.js"></script>
        <!-- Gallery Lightbox -->
        <script type="text/javascript" src="assets/js/jquery.magnific-popup.min.js"></script>
        <!-- Date Picker -->
        <script type="text/javascript" src="assets/js/bootstrap-datepicker.js"></script> 
        <!-- Ajax contact form  -->
        <script type="text/javascript" src="assets/js/app.js"></script>

        <!-- Custom js -->
        <script src="assets/js/custom.js"></script> 

    </body>
</html>