<%-- 
    Document   : Agregar
    Created on : 25-09-2019, 21:49:32
    Author     : Raul
--%>



<%@page import="Modelo.Usuario"%>
<%@page import="Modelo.UsuarioBO"%>
<%@page import="Modelo.Perfil"%>
<%@page import="Modelo.PerfilBO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="Modelo.Trabajador"%>
<%@page import="Modelo.TrabajadorBO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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

        <div style="padding-top:  0;  padding-left: 30%; ">
            
            
            <form action=""  method="post" class="form-control" style="width: 50%; height: 50%; text-align:center; ">
                <h1 style="color:blue;">Agregar Empleado</h1>
                Primer Nombre:
                <input type="text" name="txtNom" class="form-control" required=""/><br>
                Segundo Nombre:
                <input type="text" name="txtNom2" class="form-control" required=""/><br>
                Apellido Paterno:
                <input type="text" name="txtApe" class="form-control" required=""/><br>
                Apellido Materno:
                <input type="text" name="txtApe2" class="form-control"required=""/><br>
                Rut:
                <input type="text" name="txtRut" class="form-control"required=""/>
                <br>
                Fecha de Nacimiento:
                <input type="date" name="txtfechaNa" class="form-control"required=""/>
                <br>
                Sexo:
                <input type="text" name="txtSexo" class="form-control"required=""/>
                <br>
                Direccion:
                <input type="text" name="txtDire" class="form-control"required=""/>
                <br>
                Nro Direccion:
                <input type="number" name="txtNrDire" class="form-control"required=""/>
                <br>
                Ciudad:
                <input type="text" name="txtCiudad" class="form-control"required=""/>
                <br>
                Cargo:
                <input type="text" name="txtCargo" class="form-control"required=""/>
                <br>
                Telefono:
                <input type="number" name="txtFono" class="form-control"required=""/>
                <br>
                Correo:
                <input type="text" name="txtCorreo" class="form-control"required=""/>
                <br>
                Sueldo:
                <input type="number" name="txtSueldo" class="form-control"required=""/>
                <br>
                Nombre Usuario:
                <input type="text" name="txtUsuario" class="form-control"required=""/>
                <br>
                Clave:
                <input type="text" name="txtClave" class="form-control"required=""/>
                <br>
                Perfil:
                <select name="txtPerfil" required="" class="form-control">
  <option value="1">Cocinero</option>
  <option value="2">Admistrador</option>
  <option value="3">Mesa</option>
  
</select>
                <br>   
                <br>

                <input type="submit" value="Guardar" class="btn btn-primary btn-lg"/>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="index.jsp">Regresar</a>
                <br>   
                <br>
            </form>
        </div>
    </body>
</html>
<%
    Connection con;
    Conexion cn = new Conexion();
    con = cn.getConexion();
    PreparedStatement ps, ps1;
    ResultSet rs;
    String usuario, nombre, nombre2, fechaNac,DesPerfil, ape, ape2, sexo, dire, ciudad, rut, cargo, correo, clave, id_trabajador, perfil, sueldo, telefono, nroDire;

    usuario = request.getParameter("txtUsuario");
    nombre = request.getParameter("txtNom");
    nombre2 = request.getParameter("txtNom2");
    ape = request.getParameter("txtApe");
    ape2 = request.getParameter("txtApe2");
    fechaNac = request.getParameter("txtfechaNa");
    sexo = request.getParameter("txtSexo");
    dire = request.getParameter("txtDire");
    ciudad = request.getParameter("txtCiudad");
    cargo = request.getParameter("txtCargo");
    correo = request.getParameter("txtCorreo");
    clave = request.getParameter("txtClave");
    perfil = request.getParameter("txtPerfil");
    sueldo = request.getParameter("txtSueldo");
    telefono = request.getParameter("txtFono");
    nroDire = request.getParameter("txtNrDire");
    rut = request.getParameter("txtRut");
   
    if (nombre != null) {
        TrabajadorBO tbo = new TrabajadorBO();
        Trabajador tra = new Trabajador();
        
         PerfilBO pbo = new PerfilBO();
    Perfil per = new Perfil();
    
    UsuarioBO Ubo = new UsuarioBO();
    Usuario usu = new Usuario();

        Date fecha = new Date(10 / 10 / 2019);
        char sex = sexo.charAt(0);

        int nrodir = Integer.parseInt(nroDire);
        int sueld = Integer.parseInt(sueldo);
        int telefonoo = Integer.parseInt(telefono);

        tra.setRut_trabajador(rut);
        tra.setPrimer_nombre(nombre);
        tra.setSegundo_nombre(nombre2);
        tra.setApell_paterno(ape);
        tra.setApell_materno(ape2);
        tra.setFecha_nacimiento(fecha);
        tra.setSexo(sex);
        tra.setDireccion(dire);
        tra.setNro_direccion(nrodir);
        tra.setCiudad(ciudad);
        tra.setCargo(cargo);
        tra.setCorreo_contacto(correo);
        tra.setSueldo(sueld);
        tra.setTelefono(telefonoo);
        tbo.agregarTrabajador(tra);

        
      int perf = Integer.parseInt(perfil);
        usu.setNombre(usuario);
        usu.setPw(clave);
        usu.setId_perfil(perf);
       
        Ubo.agregarUsuario(usu);
       response.sendRedirect("index.jsp");

    }


%>
