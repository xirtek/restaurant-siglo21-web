<%-- 
    Document   : FinanzasPrincipal
    Created on : 29-11-2019, 20:40:46
    Author     : xirtek
--%>


<%@ page import="java.io.*" %>  
<%@ page import="java.util.*" %> 
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBConexion.Conexion"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
    <head>

        <script type="text/javascript" src="https://cdn.zingchart.com/zingchart.min.js"></script>  

        <!-- Fontfaces CSS-->
        <link href="assets/interfazfinanza/css/font-face.css" rel="stylesheet" media="all">
        <link href="assets/interfazfinanza/vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">
        <link href="assets/interfazfinanza/vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
        <link href="assets/interfazfinanza/vendor/mdi-font/css/material-design-iconic-font.min.css" rel="stylesheet" media="all">

        <!-- Vendor CSS-->
        <link href="assets/interfazfinanza/vendor/animsition/animsition.min.css" rel="stylesheet" media="all">
        <link href="assets/interfazfinanza/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" media="all">
        <link href="assets/interfazfinanza/vendor/wow/animate.css" rel="stylesheet" media="all">
        <link href="assets/interfazfinanza/vendor/css-hamburgers/hamburgers.min.css" rel="stylesheet" media="all">
        <link href="assets/interfazfinanza/vendor/select2/select2.min.css" rel="stylesheet" media="all">

        <!-- Main CSS-->
        <link href="assets/interfazfinanza/css/theme.css" rel="stylesheet" media="all">


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

        <title>Interfaz Principal Finanzas</title>
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
    <br><br><br>
</head>
<body>
    <%!
        // --- String Join Function converts from Java array to javascript string.  
        public String join(ArrayList<?> arr, String del) {

            StringBuilder output = new StringBuilder();

            for (int i = 0; i < arr.size(); i++) {

                if (i > 0) {
                    output.append(del);
                }

                // --- Quote strings, only, for JS syntax  
                if (arr.get(i) instanceof String) {
                    output.append("\"");
                }
                output.append(arr.get(i));
                if (arr.get(i) instanceof String) {
                    output.append("\"");
                }
            }

            return output.toString();
        }
    %>  

    <%
        HttpSession sesion = request.getSession(true);

        Connection con;
        Conexion cn = new Conexion();

        PreparedStatement ps1;
        ResultSet rs1;
        PreparedStatement ps2;
        ResultSet rs2;
        PreparedStatement ps3;
        ResultSet rs3;
        PreparedStatement ps4;
        ResultSet rs4;
        PreparedStatement ps5;
        ResultSet rs5;
        PreparedStatement ps6;
        ResultSet rs6;

        con = cn.getConexion();

        /* Ganancia Total en Ventas */
        int gananciaTotVentas = 0;
        String sqlgantotVentas = "select sum(total_pagar) from venta";
        ps1 = con.prepareStatement(sqlgantotVentas);
        rs1 = ps1.executeQuery();

        while (rs1.next()) {
            gananciaTotVentas = rs1.getInt(1);
        }

        /* Cantidad de Ventas */
        int cantVentas = 0;
        String sqlcantVentas = "select count(id_venta) from venta";
        ps2 = con.prepareStatement(sqlcantVentas);
        rs2 = ps2.executeQuery();

        while (rs2.next()) {
            cantVentas = rs2.getInt(1);
        }

        /* Cantidad de Trabajadores */
        int cantTrabajadores = 0;
        String sqlcantTrabajadores = "select count(id_trabajador) from trabajador";
        ps3 = con.prepareStatement(sqlcantTrabajadores);
        rs3 = ps3.executeQuery();

        while (rs3.next()) {
            cantTrabajadores = rs3.getInt(1);
        }

        /* Cantidad de Reservas */
        int cantReservas = 0;
        String sqlcantReservas = "select count(id_reserva) from reserva";
        ps4 = con.prepareStatement(sqlcantReservas);
        rs4 = ps4.executeQuery();

        while (rs4.next()) {
            cantReservas = rs4.getInt(1);
        }

        /* Gráfico Cantidad Ventas x Mes */
        ArrayList<Integer> ventas1 = new ArrayList<Integer>();
        ArrayList<String> fechas1 = new ArrayList<String>();
        String sqlcantVentasMes = "select to_char(fecha_venta, 'Month/YYYY'),count(id_venta) from venta group by to_char(fecha_venta, 'Month/YYYY') order by to_char(fecha_venta, 'Month/YYYY')";
        ps5 = con.prepareStatement(sqlcantVentasMes);
        rs5 = ps5.executeQuery();

        while (rs5.next()) {
            fechas1.add(rs5.getString(1));
            ventas1.add(rs5.getInt(2));
        }

        /* Gráfico Ganancia x Mes */
        ArrayList<Integer> ventas2 = new ArrayList<Integer>();
        ArrayList<String> fechas2 = new ArrayList<String>();
        String sqlgananciaMes = "select to_char(fecha_venta, 'Month/YYYY'),sum(total_pagar) from venta group by to_char(fecha_venta, 'Month/YYYY') order by to_char(fecha_venta, 'Month/YYYY')";
        ps6 = con.prepareStatement(sqlgananciaMes);
        rs6 = ps6.executeQuery();

        while (rs6.next()) {
            fechas2.add(rs6.getString(1));
            ventas2.add(rs6.getInt(2));
        }

    %> 

    <script>
        // --- add a comma after each value in the array and convert to javascript string representing an array  
        var monthData = [<%= join(fechas1, ",")%>];
        var userData = [<%= join(ventas1, ",")%>];
        var monthData1 = [<%= join(fechas2, ",")%>];
        var userData1 = [<%= join(ventas2, ",")%>];

    </script>  

    <div class="main-content">
        <div class="section__content section__content--p30">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="overview-wrap">
                            <h2 class="title-1">Visión general</h2>
                        </div>
                    </div>
                </div>
                <div class="row m-t-25">
                    <div class="col-sm-6 col-lg-3">
                        <div class="overview-item overview-item--c1">
                            <div class="overview__inner">
                                <div class="overview-box clearfix">
                                    <div class="icon">
                                        <i class="zmdi zmdi-shopping-cart"></i>
                                    </div>
                                    <div class="text">
                                        <h2><%=cantVentas%></h2>
                                        <span>Cantidad de Ventas</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-lg-3">
                        <div class="overview-item overview-item--c2">
                            <div class="overview__inner">
                                <div class="overview-box clearfix">
                                    <div class="icon">
                                        <i class="zmdi zmdi-money"></i>
                                    </div>
                                    <div class="text">
                                        <h2>$<%=gananciaTotVentas%> pesos</h2>
                                        <span>Ganancia Total en Ventas</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-lg-3">
                        <div class="overview-item overview-item--c3">
                            <div class="overview__inner">
                                <div class="overview-box clearfix">
                                    <div class="icon">
                                        <i class="zmdi zmdi-account-o"></i>
                                    </div>
                                    <div class="text">
                                        <h2><%=cantTrabajadores%></h2>
                                        <span>Cantidad de Trabajadores</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-lg-3">
                        <div class="overview-item overview-item--c4">
                            <div class="overview__inner">
                                <div class="overview-box clearfix">
                                    <div class="icon">
                                        <i class="zmdi zmdi-calendar-note"></i>
                                    </div>
                                    <div class="text">
                                        <h2><%=cantReservas%></h2>
                                        <span>Cantidad de Reservas</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <script>
                    window.onload = function () {
                        zingchart.render({
                            id: "myChart",
                            width: "100%",
                            height: 400,
                            data: {
                                "type": "bar",
                                "title": {
                                    "text": ""
                                },
                                "scale-x": {
                                    "labels": monthData
                                },
                                "plot": {
                                    "line-width": 1
                                },
                                "series": [{
                                        "values": userData
                                    }]
                            }
                        });

                        zingchart.render({
                            id: "myChart1",
                            width: "100%",
                            height: 400,
                            data: {
                                "type": "area",
                                "title": {
                                    "text": ""
                                },
                                "scale-x": {
                                    "labels": monthData1
                                },
                                "plot": {
                                    "line-width": 1
                                },
                                "series": [{
                                        "values": userData1
                                    }]
                            }
                        });
                    };
                </script>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="au-card m-b-30">
                            <div class="au-card-inner">
                                <h3 class="title-2 m-b-40">Gráfico Cantidad de Ventas x Mes</h3>
                                <div id="myChart"></div>  
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="au-card m-b-30">
                            <div class="au-card-inner">
                                <h3 class="title-2 m-b-40">Gráfico Ganancia x Mes</h3>
                                <div id="myChart1"></div> 
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
