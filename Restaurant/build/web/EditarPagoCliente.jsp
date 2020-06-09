<%-- 
    Document   : EditarPagoCliente
    Created on : 05-12-2019, 12:27:48
    Author     : Raul
--%>



<%@page import="Modelo.MesaBO"%>
<%@page import="Modelo.Mesa"%>
<%@page import="java.sql.Date"%>
<%@page import="Modelo.Venta"%>
<%@page import="Modelo.VentaBO"%>
<%@page import="Modelo.Pedido"%>
<%@page import="Modelo.PedidoBO"%>
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
        <link rel="stylesheet" type="text/css" href="css/util.css">
        <link rel="stylesheet" type="text/css" href="css/main.css">

        <!-- Google Fonts -->

        <%
            HttpSession sesion = request.getSession(true);

            Connection con;
            Conexion cn = new Conexion();
            PreparedStatement ps10, ps11, ps12, ps13;
            ResultSet rs10, rs11, rs12, rs13;

            String sql10 = "SELECT * FROM TRABAJADOR";
            con = cn.getConexion();
            ps10 = con.prepareStatement(sql10);
            rs10 = ps10.executeQuery();

            int id = Integer.parseInt(request.getParameter("id"));

            sesion.setAttribute("id_PedidoImprimir", id);

            String sql11 = "SELECT * FROM pedido where id_pedido = ? ";
            ps11 = con.prepareStatement(sql11);
            ps11.setInt(1, id);
            rs11 = ps11.executeQuery();
            
             String sql13 = "SELECT * FROM pedido where id_pedido = ? ";
            ps13 = con.prepareStatement(sql13);
            ps13.setInt(1, id);
            rs13 = ps13.executeQuery();
            
            if (rs13.next()) {
                    int idMesa = rs13.getInt("id_mesa");
                    
                     String sql12 = "SELECT * FROM MESA where id_mesa = ?";
            con = cn.getConexion();
            ps12 = con.prepareStatement(sql12);
            ps12.setInt(1, idMesa);
            rs12 = ps12.executeQuery();

            if (rs12.next()) {
                String DISPONIBILIDAD = rs12.getString("DISPONIBILIDAD");

                if (DISPONIBILIDAD.equals("n")) {
                    response.sendRedirect("ValidacionPago.jsp");
                }

            }
                    
                }

           

        %>

        <!-- Prata for body  -->
        <link href='https://fonts.googleapis.com/css?family=Prata' rel='stylesheet' type='text/css'>
        <!-- Tangerine for small title -->
        <link href='https://fonts.googleapis.com/css?family=Tangerine' rel='stylesheet' type='text/css'>   
        <!-- Open Sans for title -->
        <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>



        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->




    </head>
    <body>
        <!--START SCROLL TOP BUTTON -->
        <a class="scrollToTop" href="#">
            <i class="fa fa-angle-up"></i>
        </a>
        <!-- END SCROLL TOP BUTTON -->

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
                        <a class="navbar-brand" href="#">Siglo<span>XXI</span></a> 

                    </div>
                    <div id="navbar" class="navbar-collapse collapse">
                        <ul id="top-menu" class="nav navbar-nav navbar-right mu-main-nav">

                            <li><a href="Controlador?accion=Salir">cerrar sesión</a></li> 
                        </ul>                            
                    </div><!--/.nav-collapse -->       
                </div>          
            </nav> 
        </header>

        <div class="limiter" >
            <div class="container-login100" >
                <div class="wrap-login100" >
                    <br>
                    <br>
                    <H2 style="padding-left: 30%">CONFIRMACION DE PAGO</H2>


                    <form class="login100-form validate-form" action="" method="POST">


                        <div class=" validate-input m-b-18" data-validate = "debe ingresar su nombre" style="width: 100%">
                            <span class="label-input100 text-center">NOMBRE CAJERO</span>

                            <select name="TrabajadorCajero" required="" class="form-control">
                                <option value="">Seleccione</option>
                                <%while (rs10.next()) {

                                        //if (rs10.get("DISPONIBILIDAD").equals('s')) {

                                %>


                                <option value="<%=rs10.getInt("ID_TRABAJADOR")%>"><%=rs10.getString("PRIMER_NOMBRE")%></option>

                                <%}%>
                            </select>
                            <br> 

                            <div class="wrap-input100 validate-input m-b-26" data-validate="debe ingresar el metodo de pago">
                                <span class="label-input100  text-center"> Metodo de pago</span>
                                <select name="MetodoPago" required="" class="form-control">
                                    <option value="">Seleccione</option>
                                    <option value="Credito">Credito</option>
                                    <option value="Debito">Debito</option>
                                    <option value="Efectivo">Efectivo</option>
                                </select>

                            </div>

                            <%if (rs11.next()) {
                            %>
                            <input name="idPedido" class="text-center" hidden="" value="<%=rs11.getInt("id_pedido") %>" ></input>
                            <input  name="nombreCliente" class="text-center" hidden="" value="<%=rs11.getString("nombre_cliente")%>" ></input>
                            <input name="total"class="text-center" hidden="" value="<%=rs11.getInt("precio_total")%>" > </input>
                            <%} %>
                            <div class="container-login100-form-btn" style="padding-left:25%">
                                <button  class="login100-form-btn" value="ConfirmarPago" name="" >
                                    Confirmar Pago
                                </button>

                            </div>
                    </form>
                </div>
            </div>
        </div>



        <!-- Start Footer -->
        <footer id="mu-footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="mu-footer-area">
                            <div class="mu-footer-social">
                            </div>              

                            <div class="mu-footer-copyright">
                                <p>&copy; Siglo XXI Todos Los Derechos Reservados.</p>
                            </div>         
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- End Footer -->

        <!-- jQuery library -->
        <script src="assets/js/jquery.min.js"></script>  
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

<%
    con = cn.getConexion();

    String trabajador, mpago, ncliente, idped, tot;

    trabajador = request.getParameter("TrabajadorCajero");
    mpago = request.getParameter("MetodoPago");
    idped = request.getParameter("idPedido");
    ncliente = request.getParameter("nombreCliente");
    tot = request.getParameter("total");

    if (trabajador != null && mpago != null && ncliente != null
            && idped != null && tot != null) {

        int idPedido2 = Integer.parseInt(idped);
        int total2 = Integer.parseInt(tot);
        int id_trabajador2 = Integer.parseInt(trabajador);

        sesion.setAttribute("id_trabajadorImprimir", id_trabajador2);

        VentaBO vent = new VentaBO();
        Venta ven = new Venta();

        Date fecha = new Date(2000 / 9 / 10);
        ven.setFecha_venta(fecha);
        ven.setNombre_cliente(ncliente);
        ven.setTotal_pagar(total2);
        ven.setDetalle_pago("nulo");
        ven.setMetodo_pago(mpago);
        ven.setId_pedido(idPedido2);
        ven.setId_trabajador(id_trabajador2);

        vent.agregarVenta(ven);

        try {

            PedidoBO pBO = new PedidoBO();
            Pedido p = new Pedido();

            p.setEstado("2");
            p.setId_orden(id);
            pBO.modificarEstado("2", id);

        } catch (Exception e) {
            System.out.println(e);

        }
        response.sendRedirect("ImprimirBoleta.jsp");
        
    } else {

        System.out.println("error");
    }

    /*
        String sql2 = "Select MAX(id_pedido) as id_pedido from pedido";
        ps2 = con.prepareStatement(sql2);
        rs2 = ps2.executeQuery();
        int id_pe = 0;
        while (rs2.next()) {

            id_pe = rs2.getInt(1);
        }

        String sql1 = "Select * from pedido where id_pedido =? ";
        ps = con.prepareStatement(sql1);
        ps.setInt(1, id_pe);
        //ps.setString(1, ped.getNombre_cliente());
        //ps.setInt(2, ped.getId_mesa());

        rs = ps.executeQuery();

        HttpSession sesion = request.getSession();

        while (rs.next()) {
            int id_pedido = rs.getInt("id_pedido");
            ped.setId_pedido(id_pedido);
            sesion.setAttribute("id_pedido", id_pedido);

        }

        sesion.setAttribute("ped", ped);

        response.sendRedirect("AgregarOrden.jsp");
    }
     */
%>

