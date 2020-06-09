<%
HttpSession sesion = request.getSession();
sesion.setAttribute("nombre", "");
sesion.setAttribute("pw", "");
sesion.setAttribute("id", "");
sesion.setAttribute("id_trabajador", "");
sesion.setAttribute("id_perfil", "");
sesion.invalidate();
response.sendRedirect("index.jsp");
%>