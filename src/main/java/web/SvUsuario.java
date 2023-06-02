package web;

import domain.Controladora;
import domain.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SvUsuario", urlPatterns = {"/SvUsuario"})
public class SvUsuario extends HttpServlet {

    Controladora control = new Controladora();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        switch (accion) {
            case "login":
                this.login(request, response);
                break;

            case "logout":
                HttpSession sesion = request.getSession();
                sesion.setAttribute("usuario", null);
                request.getRequestDispatcher("main.jsp").forward(request, response);
                break;
                
                
            case "registrar":
                System.out.println("REGISTRANDO USUARIO");
                this.register(request, response);
                break;
            default:
                throw new AssertionError();
        }
    }

    protected void register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String username = request.getParameter("username"); 
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String password2 = request.getParameter("confirm_password");
        
        
        //Validar contraseña
        if(!password.equals(password2)){
            request.setAttribute("status", "failurePass");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }else if(this.control.correo_existe(email)){ //Validar correo
            request.setAttribute("status", "failureMail");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }else{
            System.out.println("REGISTRANDO");
            this.control.crearUsuario(new Usuario(username, email, password));
            this.login(request, response);
        }
        
        
    }
    
    protected void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        System.out.println("HOLA MUNDO");
        System.out.println(username + " " + password);
        Usuario usuario = control.login(username, password);
        if (usuario != null) {
            HttpSession sesion = request.getSession();
            sesion.setAttribute("usuario", usuario);
            response.sendRedirect("main.jsp");
        } else {
            request.setAttribute("status", "failure");
            request.getRequestDispatcher("main.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
