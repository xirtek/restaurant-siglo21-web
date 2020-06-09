<%-- 
    Document   : OperadorPrincipal
    Created on : 29-11-2019, 20:36:12
    Author     : xirtek
--%>


<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Modelo.Reserva"%>
<%@page import="Modelo.ReservaBO"%>
<%@page import="java.util.Date"%>
<%@page import="javafx.scene.control.Alert"%>
<%@page import="java.util.List"%>
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
        <script src="jquery-2.1.4.min.js"></script>
        <script src="jspdf.debug.js"></script>
        <script src=”dist/jspdf.min.js”></script>
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

        <!-- CSS OPERADOR -->
        <link rel="stylesheet" type="text/css" href="css/reservaopera.css">

        <!-- CSS IMPRIMIR PDF -->
        <link href="estilos_impresion.css" rel="stylesheet" type="text/css" media="print">

        <!-- Google Fonts -->

        <!-- Prata for body  -->
        <link href='https://fonts.googleapis.com/css?family=Prata' rel='stylesheet' type='text/css'>
        <!-- Tangerine for small title -->
        <link href='https://fonts.googleapis.com/css?family=Tangerine' rel='stylesheet' type='text/css'>   
        <!-- Open Sans for title -->
        <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>


        <title>Interfaz Principal Operador</title>
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

    <%

        Connection con;
        Conexion cn = new Conexion();

        PreparedStatement ps;
        ResultSet rs;
        con = cn.getConexion();

        PreparedStatement psreserva;
        ResultSet rsreserva;
        String sqlreserva = "Select id_reserva, fecha_uso, hora_uso, rut, id_mesa from reserva order by id_reserva asc";
        con = cn.getConexion();
        psreserva = con.prepareStatement(sqlreserva);
        rsreserva = psreserva.executeQuery();


    %>

    <br/>
    <div class="operario-body">
        <div class="operador-principal-primera-columna">
            <!-- Your first column here -->
            <h1 style="color:black; text-align:center; ">Reservar Mesa</h1>
            <form action=""  method="post" class="form-control" style="margin: 5% 30%; width: 40%; height: 50%; text-align:center; background: url(images/fondo.jpg)  ">
                <%            PreparedStatement ps1, ps2;
                    ResultSet rs1, rs2;

                    String sql = "Select RUT, PRIMER_NOMBRE, SEGUNDO_NOMBRE, APELL_PATERNO, APELL_MATERNO, TELEFONO, CORREO_CONTACTO  from CLIENTE";
                    con = cn.getConexion();
                    ps1 = con.prepareStatement(sql);
                    rs1 = ps1.executeQuery();

                    String sql2 = "Select ID_MESA from MESA ORDER BY ID_MESA ASC";
                    con = cn.getConexion();
                    ps2 = con.prepareStatement(sql2);
                    rs2 = ps2.executeQuery();
                %>

                <h1 style="color:black">Cliente</h1>
                <select name="txtrut" required="" class="form-control">
                    <option value="">Seleccione un Cliente</option>
                    <%while (rs1.next()) {

                    %>
                    <option value="<%=rs1.getString("RUT")%>"><%=rs1.getString("PRIMER_NOMBRE")%></option>
                    <%}%>
                </select>
                <br> 
                <h1 style="color:black">Mesa</h1>
                <select name="txtmesa" required="" class="form-control">
                    <option value="">Seleccione Mesa</option>
                    <%while (rs2.next()) {
                            //if (rs10.get("DISPONIBILIDAD").equals('s')) {       
                    %>
                    <option value="<%=rs2.getInt("ID_MESA")%>"><%=rs2.getInt("ID_MESA")%></option>
                    <%} %>
                </select>
                <br> 
                <h1 style="color:black">Fecha de Reserva</h1>
                <input type="text" name="txtfecha" class="form-control" required=""/>

                <h1 style="color:black">Hora de uso</h1>
                <input type="text" name="txthora" class="form-control" required=""/>
                <br>   
                <br>
                <p>
                    <input type="submit" value="Guardar" class="btn btn-primary btn-lg"/>
                    <input type="submit" value="Imprimir" onClick="window.print()">
                    
                <p/>
            </form>
        </div>
        <div class="operador-principal-segunda-columna" >
            <h1 style="color:black; text-align:center; ">Lista de Reservas</h1>
            <!-- Your second column here -->
            <br/>
            <br/>
            <div id="muestra">
            <table id="muestra" class="tabla" >
                <thead>
                <style>
                    table {
                        border-collapse: collapse;
                        width: 100%;
                    }

                    th {
                        background-color: #4CAF50;
                        color: black;
                    }

                    th, td {
                        padding: 8px;
                        text-align: left;
                        border-bottom: 1px solid #ddd;
                    }

                    tr:hover {background-color:#f5f5f5;}
                </style>
                <tr><th>ID</th><th>Fecha de uso</th><th>Hora de uso</th><th>Rut</th><th>Mesa</th></tr>           
                </thead>
                <tbody>
                    <%
                        while (rsreserva.next()) {
                    %>
                    <tr>
                        <td><%= rsreserva.getInt("id_reserva")%></td>
                        <td><%= rsreserva.getDate("fecha_uso")%></td>
                        <td><%= rsreserva.getString("hora_uso")%></td>
                        <td><%= rsreserva.getString("rut")%></td>
                        <td><%= rsreserva.getInt("id_mesa")%></td>
                      
                        
                    <tr/>
                    <% }%>
                </tbody>
            </table>   
          </div> 
                  <input type="submit" value="Modificar" class="btn btn-primary btn-lg"/>
                  <input type="submit" value="Eliminar" class="btn btn-primary btn-lg"/>
         <!--    <input name="Imprimir"   type="submit" id="imprimir" value="Descargar PDF" /> -->
          <button type="button" onclick="javascript:imprim2();">Imprimir</button>
       
        </div>
    </div>  
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
                
 <!--            
<script>
function DescargarPDF(ContenidoID,nombre) {
	
    var pdf = new jsPDF('p', 'pt', 'letter');
	
    html = $('#'+ContenidoID).html();
	
    specialElementHandlers = {};
	
    margins = {top: 10,bottom: 20,left: 20,width: 522};
	
    pdf.fromHTML(html, margins.left, margins.top, {'width': margins.width},function (dispose) {pdf.save(nombre+'.pdf');}, margins);
	
}
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
<%

    String fecha = "12";
    String hora = "12";
    String rut = "12";
    String mesa = "12";

    rut = request.getParameter("txtrut");
    mesa = request.getParameter("txtmesa");
    fecha = request.getParameter("txtfecha");
    hora = request.getParameter("txthora");
    

    if (rut != null && mesa != null && fecha != null && hora != null) {
        String mensaje = "nosé q problema";
        out.println(mensaje);
        
        /*String fe = "10-12-2018"; */
        SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");
        Date parsed = format.parse(fecha);
        java.sql.Date sqlfecha = new java.sql.Date(parsed.getTime());

        String hor = hora;
        String rt = rut;
        int mesita = Integer.parseInt(mesa);

        ReservaBO rbo = new ReservaBO();
        Reserva reser = new Reserva();

        reser.setFecha_uso(sqlfecha);
        reser.setHora_uso(hor);
        reser.setRut(rt);
        reser.setId_mesa(mesita);
        rbo.agregarReserva(reser);

        response.sendRedirect("OperadorPrincipal.jsp");
    }
%>

