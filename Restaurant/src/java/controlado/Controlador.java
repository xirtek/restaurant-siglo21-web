/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlado;

import DBConexion.Conexion;
import Modelo.Orden;
import Modelo.OrdenDAO;
import Modelo.Pedido;
import Modelo.PedidoBO;
import Modelo.PedidoDAO;
import Modelo.Usuario;
import Modelo.UsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.jms.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import static org.jboss.weld.servlet.SessionHolder.getSession;

/**
 *
 * @author Raul
 */
public class Controlador extends HttpServlet {

    UsuarioDAO dao = new UsuarioDAO();
    Usuario u = new Usuario();
    PedidoDAO orao = new PedidoDAO();
    Pedido or = new Pedido();
    int r;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String accion = request.getParameter("accion");
        if (accion.equals("Ingresar")) {
            String nombre = request.getParameter("Usuario");
            String pw = request.getParameter("pass");
            u.setNombre(nombre);
            u.setPw(pw);

            r = dao.validar(u);

            if (r == 1) {

                    //Cocina//
                if (u.getId_perfil() == 3) {
                    HttpSession sesion = request.getSession();
                    sesion.setAttribute("nombre", nombre);
                    sesion.setAttribute("id", u.getId());

                    sesion.setAttribute("id_perfil", u.getId_perfil());
                    request.getRequestDispatcher("Cocina.jsp").forward(request, response);

                    //Mesa//
                } else if (u.getId_perfil() == 4) {

                    HttpSession sesion = request.getSession();
                    sesion.setAttribute("nombre", nombre);
                    sesion.setAttribute("id", u.getId());

                    sesion.setAttribute("id_perfil", u.getId_perfil());
                    request.getRequestDispatcher("principal1.jsp").forward(request, response);

                    //Finanzas//
                } else if (u.getId_perfil() == 5) {

                    HttpSession sesion = request.getSession();
                    sesion.setAttribute("nombre", nombre);
                    sesion.setAttribute("id", u.getId());

                    sesion.setAttribute("id_perfil", u.getId_perfil());
                    request.getRequestDispatcher("FinanzasPrincipal.jsp").forward(request, response);
                    
                    //Caja//
                } else if (u.getId_perfil() == 7) {

                    HttpSession sesion = request.getSession();
                    sesion.setAttribute("nombre", nombre);
                    sesion.setAttribute("id", u.getId());

                    sesion.setAttribute("id_perfil", u.getId_perfil());
                    request.getRequestDispatcher("CajeroPrincipal.jsp").forward(request, response);
                }
            } else {
                //Iniciar Sesión//
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }

        } else if (accion.equals("Salir")) {
            HttpSession sesion = request.getSession();
            sesion.setAttribute("nombre", "");
            sesion.setAttribute("pw", "");
            sesion.setAttribute("id", "");

            sesion.setAttribute("id_perfil", "");
            sesion.invalidate();

            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else if (accion.equals("Orden")) {
            request.getRequestDispatcher("RealizarOrden.jsp").forward(request, response);
        } else if (accion.equals("ConfirmarPago")) {
            request.getRequestDispatcher("ConfirmarPago.jsp").forward(request, response);
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
