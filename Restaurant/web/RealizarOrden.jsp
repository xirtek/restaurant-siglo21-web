<%-- 
    Document   : AgregarOrden
    Created on : 27-09-2019, 14:50:53
    Author     : Raul
--%>

<%@page import="javafx.scene.control.Alert"%>
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
                        <!--<li><a href="Controlador?accion=Salir">cerrar sesión</a></li> -->
                    </ul>                            
                </div><!--/.nav-collapse -->       
            </div>          
        </nav> 
    </header>
    <br><br><br>
    <body style="">




        <%
            HttpSession sesion = request.getSession(true);

            int p = ((Integer) sesion.getAttribute("id_pedido")).intValue();

            Connection con;
            Conexion cn = new Conexion();
            PreparedStatement ps;
            ResultSet rs;
            con = cn.getConexion();

            Pedido pe = new Pedido();
            int nroMesa1 = pe.getId_mesa();

            String sql4 = "Select p.id_pedido,o.id_orden,o.PRECIO_SUBTOTAL, o.estado as estado1, p.nombre_cliente, p.id_mesa, p.estado ,pla.descripcion as des1, PLA.PRECIO_UNITARIO AS PRECIO1,B.PRECIO_UNITARIO AS PRECIO2 ,PO.PRECIO_UNITARIO AS PRECIO3, b.descripcion as des2, po.descripcion as des3, m.disponibilidad from ORDEN o join pedido p on o.id_pedido = p.id_pedido join mesa m on p.id_mesa = m.id_mesa join bebestible b on b.id_bebestible = o.id_bebestible join plato pla on pla.id_plato = o.id_plato join postre po on po.id_postre = o.id_postre"
                    + " where p.id_pedido =?";
            con = cn.getConexion();
            ps = con.prepareStatement(sql4);

            ps.setInt(1, p);
            rs = ps.executeQuery();


        %>



        <!-- End header section -->
        <div class="container" >            

            <div style="padding-left: 800px">                  

            </div>
        </div>  
        <br>
        <h1 style="color:black; text-align:center; ">Agregar Orden</h1>
        <form action=""  method="post" class="form-control" style="margin: 5% 30%; width: 40%; height: 50%; text-align:center; background: url(images/fondo.jpg)  ">

            <%                PreparedStatement ps1, ps2, ps3;
                ResultSet rs1, rs2, rs3;

                String sql = "Select ID_BEBESTIBLE, DESCRIPCION, PRECIO_UNITARIO  from BEBESTIBLE ORDER BY ID_BEBESTIBLE ASC";
                con = cn.getConexion();
                ps1 = con.prepareStatement(sql);
                rs1 = ps1.executeQuery();

                String sql2 = "Select ID_PLATO, DESCRIPCION, PRECIO_UNITARIO from PLATO ORDER BY ID_PLATO ASC";
                con = cn.getConexion();
                ps2 = con.prepareStatement(sql2);
                rs2 = ps2.executeQuery();

                String sql3 = "Select ID_POSTRE, DESCRIPCION, PRECIO_UNITARIO from POSTRE ORDER BY ID_POSTRE ASC";
                con = cn.getConexion();
                ps3 = con.prepareStatement(sql3);
                rs3 = ps3.executeQuery();

            %>
            <br>
            <h1 style="color:black">Bebida</h1>
            <select name="txtbebida" required="" class="form-control">
                <option value="">Seleccione</option>
                <%while (rs1.next()) {

                %>


                <option value="<%=rs1.getInt("ID_BEBESTIBLE")%>"><%=rs1.getString("DESCRIPCION")%></option>

                <%}%>
            </select>
            <br>   
            <h1 style="color:black">Plato</h1>
            <select name="txtplato" required="" class="form-control">
                <option value="">Seleccione</option>
                <%while (rs2.next()) {%>
                <option value="<%=rs2.getInt("ID_PLATO")%>"><%=rs2.getString("DESCRIPCION")%></option>

                <%}%>
            </select>


            <br>   
            <h1 style="color:black;">Postre</h1>
            <select name="txtpostre" required="" class="form-control">
                <option value="">Seleccione</option>
                <%while (rs3.next()) {%>
                <option value="<%=rs3.getInt("ID_POSTRE")%>"><%=rs3.getString("DESCRIPCION")%></option>

                <%}%>
            </select>
            <br>   
            <br>
            <input type="submit" value="Guardar" class="btn btn-primary btn-lg"/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

            <br>   
            <br>
        </form>
    </div>
</body>
</html>
<%

    String bebida, plato, postre;

    bebida = request.getParameter("txtbebida");
    plato = request.getParameter("txtplato");
    postre = request.getParameter("txtpostre");

    if (bebida != null && plato != null && postre != null) {

        int bebid = Integer.parseInt(bebida);
        int plat = Integer.parseInt(plato);
        int postr = Integer.parseInt(postre);

        if (bebid == 0 && plat == 0 && postr == 0) {

            String mensaje = "<script language='javascript'>alert('Debe seleccionar almenos una opcion del menu')</script>";
            out.println(mensaje);

        } else {

            OrdenBO obo = new OrdenBO();
            Orden ord = new Orden();

            PreparedStatement ps11, ps12, ps13;
            ResultSet rs11, rs12, rs13;

            String sql11 = "Select PRECIO_UNITARIO  from BEBESTIBLE where id_bebestible  =?";

            ps11 = con.prepareStatement(sql11);
            ps11.setInt(1, bebid);
            rs11 = ps11.executeQuery();
            String sql12 = "Select PRECIO_UNITARIO  from POSTRE where id_postre  =?";

            ps12 = con.prepareStatement(sql12);
            ps12.setInt(1, postr);
            rs12 = ps12.executeQuery();
            String sql13 = "Select PRECIO_UNITARIO  from PLATO where id_plato  =?";

            ps13 = con.prepareStatement(sql13);
            ps13.setInt(1, plat);
            rs13 = ps13.executeQuery();
            int totalBebida = 0, totalPlato = 0, totalPostre = 0;

            while (rs11.next()) {
                totalBebida = rs11.getInt("PRECIO_UNITARIO");
            }
            while (rs13.next()) {
                totalPlato = rs13.getInt("PRECIO_UNITARIO");
            }
            while (rs12.next()) {
                totalPostre = rs12.getInt("PRECIO_UNITARIO");
            }
            int totall;
            totall = totalBebida + totalPlato + totalPostre;

            ord.setPrecio_total(totall);
            ord.setId_pedido(p);
            ord.setId_bebestible(bebid);
            ord.setId_postre(postr);
            ord.setId_plato(plat);
            ord.setEstado("Preparando");
            obo.agregarOrden(ord);

            response.sendRedirect("AgregarOrden.jsp");

        }

    }
%>
