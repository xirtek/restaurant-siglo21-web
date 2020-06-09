
<%@page import="Modelo.Mesa"%>
<%@page import="Modelo.MesaBO"%>
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>


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
                        <!--<li><a href="AgregarOrden.jsp">Mis Pedidos</a></li> 
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

            <body style=" ">
                <%

                    HttpSession sesion = request.getSession(true);
                    Connection con;
                    Conexion cn = new Conexion();
                    PreparedStatement ps;
                    ResultSet rs;
                    int p = ((Integer) sesion.getAttribute("id_pedido")).intValue();
                    String sql = "Select * from pedido where id_pedido = ?";
                    con = cn.getConexion();
                    ps = con.prepareStatement(sql);

                    ps.setInt(1, p);
                    rs = ps.executeQuery();

                    if (rs.next()) {
                        String estado;
                        estado = rs.getString("estado");

                        sesion.setAttribute("estadoFinal", estado);
                        if (estado.equals("1")) {


                %>


                <div style="background: #ECEBEB; width: 55%; margin: 15% 25%" align="center" onload="redireccionar()">
                    <meta http-equiv="refresh" content="5" />
                    <br>
                    <h1 style="text-align:center; " ><b>Esperando Confirmación De Pago</b></h1>
                    <%                        int DisNumeroMesa = ((Integer) sesion.getAttribute("DispoNumeroMesa")).intValue();
                        MesaBO mbo = new MesaBO();
                        Mesa me = new Mesa();
                        mbo.modificarMesa(DisNumeroMesa, 's');

                    %>
                    <br>   
                    <br>
                    <img src="images/gifCargando.gif" style="width: 15%;"align="center"   >

                </div>


                <%    } else {
                %>  
                <div style="background: #ECEBEB; width: 55%; margin: 15% 25%">
                    <br>
                    <h1 style="text-align:center; " ><b>Pago Confirmado</b></h1>
                    <form action="index.jsp"  method="post"  style="margin: 5% 30%; width: 40%; height: 50%; text-align:center;">

                        <input type="submit" value="Cerrar Sesión" class="btn btn-primary btn-lg"/>

                        <br>   
                        <br>

                    </form>

                    <br>
                </div>
                <%
                        }

                    }
                %>
        </div>

    </div>
</body>
</html>


<script language="JavaScript">
    function redireccionar() {
        setTimeout('document.location.reload()', 5000);
    }
</script>