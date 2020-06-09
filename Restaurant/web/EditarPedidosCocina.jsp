<%-- 
    Document   : EditarPedidosCocina
    Created on : 25-09-2019, 0:06:57
    Author     : Raul
--%>


<%@page import="Modelo.OrdenBO"%>
<%@page import="Modelo.Orden"%>
<%@page import="DBConexion.Conexion"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
<%
    //CONECTANOD A LA BASE DE DATOS:
    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    

    //Emnpezamos Listando los Datos de la Tabla Usuario pero de la fila seleccionada
    int id = Integer.parseInt(request.getParameter("id"));
    
   
    try {
     
          OrdenBO obo = new OrdenBO();
        Orden or = new Orden();

        or.setEstado("Listo");
        or.setId_orden(id);
        obo.modificarOrden(or);

        
    } catch (Exception e) {
        System.out.println(e);

    }
    
response.sendRedirect("Cocina.jsp");


%>