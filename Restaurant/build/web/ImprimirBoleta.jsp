<%-- 
    Document   : ImprimirBoleta
    Created on : 06-12-2019, 21:51:52
    Author     : Raul
--%>

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
            Connection con;
            Conexion cn = new Conexion();
            PreparedStatement ps10, ps11, ps12, ps13;
            ResultSet rs10, rs11, rs12, rs13;

            HttpSession sesion = request.getSession(true);

            int id = ((Integer) sesion.getAttribute("id_PedidoImprimir")).intValue();
            int id_trabajador = ((Integer) sesion.getAttribute("id_trabajadorImprimir")).intValue();

            String sql10 = "SELECT * FROM TRABAJADOR where id_trabajador = ? ";
            con = cn.getConexion();
            ps10 = con.prepareStatement(sql10);
            ps10.setInt(1, id_trabajador);
            rs10 = ps10.executeQuery();

            String sql11 = "SELECT * FROM pedido where id_pedido = ? ";
            ps11 = con.prepareStatement(sql11);
            ps11.setInt(1, id);
            rs11 = ps11.executeQuery();

            String sql12 = "Select p.id_pedido,o.id_orden,o.PRECIO_SUBTOTAL, o.estado as estado1, p.nombre_cliente, p.id_mesa, p.estado ,pla.descripcion as des1, PLA.PRECIO_UNITARIO AS PRECIO1,B.PRECIO_UNITARIO AS PRECIO2 ,PO.PRECIO_UNITARIO AS PRECIO3, b.descripcion as des2, po.descripcion as des3, m.disponibilidad from ORDEN o join pedido p on o.id_pedido = p.id_pedido join mesa m on p.id_mesa = m.id_mesa join bebestible b on b.id_bebestible = o.id_bebestible join plato pla on pla.id_plato = o.id_plato join postre po on po.id_postre = o.id_postre"
                    + " where p.id_pedido =?";
            ps12 = con.prepareStatement(sql12);
            ps12.setInt(1, id);
            rs12 = ps12.executeQuery();

            String sql13 = "SELECT * FROM venta where id_pedido = ? ";
            ps13 = con.prepareStatement(sql13);
            ps13.setInt(1, id);
            rs13 = ps13.executeQuery();

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

        <style>input {width: 100%;}</style>


        <div class="limiter text-center" >

            <div class="container-login100 text-center"   >

                <div class="wrap-login100 text-center"   >

                    <form class=" validate-form" action="" method="POST"  >


                        <div >


                            <br><br>
                            <div id="imp1"  >
                                <table  >
                                    <H2 align="center">Restaurant Siglo XXI</H2>
                                    </br>

                                    <%if (rs11.next()) {
                                    %>



                                    <div align="center">
                                        Pedido: &nbsp;
                                        <%=rs11.getInt("id_pedido")%>
                                    </div>






                                    <div align="center">
                                        Mesa: &nbsp;
                                        <%=rs11.getInt("id_mesa")%>
                                    </div>
                            </div> 


                            <div align="center">
                                Cliente: &nbsp;
                                <%=rs11.getString("nombre_cliente")%>
                            </div>


                            <%while (rs10.next()) {

                            %>



                            <div align="center">
                                Cajero: &nbsp;
                                <%=rs10.getString("PRIMER_NOMBRE")%>
                            </div>

                            <%}%>

                            <!-- <%if (rs13.next()) {

                            %>
                            <div class=" validate-input m-b-10" >
                                <span class="label-input100"> Fecha Venta</span>
                                <input name="total" class="text-center" disabled="" value="falta la fecha"> </input>

                            </div> 
                            <%}%>
                            <div align="center">
                                </br></br>
                        -----------------------------------------------
                         </br></br>
                            </div>
                            -->
                            </br></br>

                            <H2 align="center">Detalle Productos</H2>
                            </br>

                            <%while (rs12.next()) {

                            %>
                            <div align="center">


                                <%=rs12.getString("des1")%>
                                $<%=rs12.getString("PRECIO1")%>
                                </br>
                                <%=rs12.getString("des2")%>
                                $<%=rs12.getString("PRECIO2")%>
                                </br>
                                <%=rs12.getString("des3")%>
                                $<%=rs12.getString("PRECIO3")%>
                                </br>
                            </div>
                            <%}%>
                            <div align="center">
                                </br></br>                       
                                -----------------------------------------------
                                </br></br>
                            </div>


                            <div align="center" >
                                Total: &nbsp;
                                <%=rs11.getInt("precio_total")%>
                            </div>


                            </br>
                            <div align="center">
                                Gracias Por Su Compra
                            </div>
                            <%} %>
                            </br></br>
                            </table>
                        </div>

                        <button type="submit" class="btn btn-primary btn-lg" onclick="javascript:imprim1(imp1);">Imprimir</button>
                       
                        
                        <button  class="btn btn-primary btn-lg"><a style="color: white;"href="CajeroPrincipal.jsp">Terminar<a/></button>
                       
                        
                        <br><br>
                    </form
                </div>
            </div>
        </div>
    </div>
</div>
</div>
<script>

    function imprim1(imp1) {
        var printContents = document.getElementById('imp1').innerHTML;
        w = window.open();
        w.document.write(printContents);
        w.document.close(); // necessary for IE >= 10
        w.focus(); // necessary for IE >= 10
        w.print();
        w.close();
        return true;
    }

</script>



<!--
<script>

function imprim2(){
    var mywindow = window.open('', 'PRINT', 'height=400,width=600');
    mywindow.document.write('<html><head>');
        mywindow.document.write('<style>.tabla{width:100%;border-collapse:collapse;margin:16px 0 16px 0;}.tabla th{border:1px solid #ddd;padding:4px;background-color:#d4eefd;text-align:left;font-size:15px;}.tabla td{border:1px solid #ddd;text-align:left;padding:6px;}</style>');
    mywindow.document.write('</head><body >');
    mywindow.document.write(document.getElementById('muestra').innerHTML);
    mywindow.document.write('</body></html>');
    mywindow.document.close(); // necesario para IE >= 10
    mywindow.focus(); // necesario para IE >= 10
    mywindow.print();
    mywindow.close();
    return true;}
</script>
-->

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
<script src="jquery-2.1.4.min.js"></script>
<script src="jspdf.debug.js"></script> 
<script src=?dist/jspdf.min.js?></script>
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


%>

