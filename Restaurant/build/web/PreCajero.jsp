<%-- 
    Document   : PreCajero
    Created on : 05-12-2019, 12:33:09
    Author     : Raul
--%>

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
            Connection con;
    Conexion cn = new Conexion();
            PreparedStatement ps10;
                ResultSet rs10;
                

                String sql10 = "SELECT * FROM TRABAJADOR";
                con = cn.getConexion();
                ps10 = con.prepareStatement(sql10);
                rs10 = ps10.executeQuery();
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

        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100">
                    <br>
                    <br>
                    <H2 style="padding-left: 30%">SELECCIONE SU NOMBRE</H2>


                    <form class="login100-form validate-form" action="" method="POST">
                        <!--<div class="wrap-input100 validate-input m-b-26" data-validate="debe ingresar su nombre">
                            <span class="label-input100"> Nombre</span>
                            <input class="input100" type="text" name="nombre" placeholder="Ingrese su nombre" required="">
                            <span class="focus-input100"></span>
                        </div> -->

                        <div class=" validate-input m-b-18" data-validate = "debe ingrresar el numero de mesa" style="width: 100%">
                            <span class="label-input100">NOMBRE</span>
            <select name="TrabajadorCajero" required="" class="form-control">
                <option value="">Seleccione</option>
                <%while (rs10.next()) {
                    
                        //if (rs10.get("DISPONIBILIDAD").equals('s')) {
                                
                            
                %>


                <option value="<%=rs10.getInt("ID_TRABAJADOR")%>"><%=rs10.getString("PRIMER_NOMBRE")%></option>

                <%} //}%>
            </select>
            <br>   
                        </div>




                        <div class="container-login100-form-btn">

                            <button  class="login100-form-btn" value="agregarPedido" name="" >
                                Ingresar
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
    
    PreparedStatement ps,ps6,ps2;
    ResultSet rs, rs6, rs2;
    con = cn.getConexion();

    String nombreCliente, nromesa;

    nombreCliente = request.getParameter("nombre");
    nromesa = request.getParameter("nroMesa");

    if (nombreCliente != null && nromesa != null) {

        int nrmesa = Integer.parseInt(nromesa);

        PedidoBO pbo = new PedidoBO();
        Pedido ped = new Pedido();

        ped.setId_mesa(nrmesa);
        ped.setNombre_cliente(nombreCliente);
        ped.setEstado("1");
        ped.setPrecio(0);
 
        pbo.agrregarPedido(ped);
        
         String sql2 = "Select MAX(id_pedido) as id_pedido from pedido";
        ps2 = con.prepareStatement(sql2);
        rs2 = ps2.executeQuery();
        int id_pe=0;
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
           int id_pedido= rs.getInt("id_pedido");
            ped.setId_pedido(id_pedido);
            sesion.setAttribute("id_pedido", id_pedido);
      
    }

                 sesion.setAttribute("ped", ped);

        

        response.sendRedirect("AgregarOrden.jsp");
    }

%>
