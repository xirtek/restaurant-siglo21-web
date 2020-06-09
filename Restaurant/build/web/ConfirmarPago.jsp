<%-- 
    Document   : ConfirmarPago
    Created on : 02-12-2019, 18:22:03
    Author     : Raul
--%>

<%@page import="Modelo.PedidoBO"%>
<%@page import="Modelo.Pedido"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Bebida"%>
<%@page import="Modelo.OrdenBO"%>
<%@page import="Modelo.Orden"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBConexion.Conexion"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="assets/css/style.css" rel="stylesheet">    
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


        <title>JSP Page</title>
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
                    <a class="navbar-brand" href="#">Siglo<span>XXI</span></a> 
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul id="top-menu" class="nav navbar-nav navbar-right mu-main-nav">
                        <li><a href="AgregarOrden.jsp">Mis Pedidos</a></li> 
                        <!-- <li><a href="Controlador?accion=Salir">cerrar sesión</a></li> -->
                      
                    </ul>                            
                </div><!--/.nav-collapse -->       
            </div>          
        </nav> 
    </header>
    <br><br><br>
    <body>





        <!-- End header section -->
        <div class="container">            

            <div style="padding-left: 800px">                  

            </div>
        </div>  

        <br>
        <div class="container">               
    
            <head>
                <meta charset="UTF-8">

            </head>
            
             <%
            HttpSession sesion = request.getSession(true);

            int p = ((Integer) sesion.getAttribute("id_pedido")).intValue();
            
             int tot = ((Integer) sesion.getAttribute("total")).intValue();
             if (tot <= 0) {
                     response.sendRedirect("ValidarTotal0.jsp");
                 }

            Connection con;
            Conexion cn = new Conexion();
            PreparedStatement ps;
            ResultSet rs;
            con = cn.getConexion();

            Pedido pe = new Pedido();
            int nroMesa1 = pe.getId_mesa();

            String sql4 = "Select p.precio_total, p.id_pedido,o.id_orden,o.PRECIO_SUBTOTAL, o.estado as estado1, p.nombre_cliente, p.id_mesa, p.estado ,pla.descripcion as des1, PLA.PRECIO_UNITARIO AS PRECIO1,B.PRECIO_UNITARIO AS PRECIO2 ,PO.PRECIO_UNITARIO AS PRECIO3, b.descripcion as des2,"
                    + " po.descripcion as des3, m.disponibilidad from ORDEN o join pedido p on o.id_pedido = p.id_pedido join mesa m on p.id_mesa = m.id_mesa join bebestible b on b.id_bebestible = o.id_bebestible join plato pla on pla.id_plato = o.id_plato join postre po on po.id_postre = o.id_postre"
                    + " where p.id_pedido =?";
            con = cn.getConexion();
            ps = con.prepareStatement(sql4);

            ps.setInt(1, p);
            rs = ps.executeQuery();


        %>

            <body style=" ">
                
                <div style="background: #ECEBEB; width: 55%; margin: 15% 25%">
                    <br>
                    <h1 style="text-align:center; " ><b>Detalle de compra </b></h1>
                    <br>
                     <%                        
                                while (rs.next()) {
                                    String nombre_final;
                                    int id_final,mesa_final,precio_final;
                                    nombre_final = rs.getString("nombre_cliente");
                                    mesa_final = rs.getInt("id_mesa");
                                    id_final= rs.getInt("id_pedido");
                                    precio_final= rs.getInt("precio_total");
                                     
                                    sesion.setAttribute("mesa_final", mesa_final);
                                     sesion.setAttribute("id_final", id_final);
                                      sesion.setAttribute("precio_final", precio_final);
                                       sesion.setAttribute("nombre_final", nombre_final);
                                }

                            %>
                            <h4 style="text-align: center; color:black; size: 8;" >
                                <b>&nbsp &nbsp&nbsp&nbsp&nbsp&nbsp &nbsp&nbsp &nbsp&nbsp&nbsp&nbsp Numero de boleta: </b>&nbsp ${id_final}
                    <br><br>
                    <b>  Nombre:</b>&nbsp ${nombre_final} 
                    <br><br>
                    <b>&nbsp&nbsp&nbsp&nbsp&nbsp &nbsp &nbsp&nbsp Numero de Mesa: </b>&nbsp ${mesa_final}
                    <br><br>
                    <b>Precio Total: </b>&nbsp${precio_final}
                    <br><br>
                    </h4>
                  
                   <form action="ConfirmacionPagoCliente.jsp"  method="post"  style="margin: 5% 30%; width: 40%; height: 50%; text-align:center;">

                  <input type="submit" value="Pagar" class="btn btn-primary btn-lg"/>

            <br>   
            <br>
        </form>
<br>
                </div>
        </div>

    </div>
</body>
</html>


