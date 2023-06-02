package web;

import datos.exceptions.NonexistentEntityException;
import domain.Controladora;
import domain.Producto;
import domain.Usuario;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SvProductos", urlPatterns = {"/SvProductos"})
public class SvProductos extends HttpServlet {

    Controladora control = new Controladora();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        System.out.println(id);
        HttpSession sesion = request.getSession();
        List<Producto> productos = null;
        if (id == null || id.isEmpty()) {
            productos = control.getProductos();

        } else {
            Usuario usuario = (Usuario) sesion.getAttribute("usuario");
            if (id.equals("editar")) {
                productos = control.filtrarPorDuenio(usuario.getIdUsuario());

            } else if(id.equals("eliminar")){
                String idproducto = request.getParameter("idProducto");
                try {
                    control.eliminarProducto(Integer.parseInt(idproducto));
                } catch (NonexistentEntityException ex) {
                    Logger.getLogger(SvProductos.class.getName()).log(Level.SEVERE, null, ex);
                }
                productos = control.filtrarPorDuenio(usuario.getIdUsuario());
                id = "editar"; 
            }
            else {
                System.out.println("##########" + id);
//                List<Producto> productos2 = (List<Producto>) sesion.getAttribute("productos");
//                productos = new ArrayList<>();
//                for (int i = 0; i < productos2.size(); i++) {
//                    if (productos2.get(i).getTipoProducto() == Integer.parseInt(id)) {
//                        productos.add(productos2.get(i));
//                    }
//                }
                try {
                    productos = control.filtrarProductos(Integer.parseInt(id));
                } catch (Exception e) {
                }
            }

        }

        sesion.setAttribute("productos", productos);
        if (id != null && id.equals("editar")) {
            response.sendRedirect("perfil.jsp");
        } else {
            response.sendRedirect("main.jsp");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");
        String idproducto = request.getParameter("idProducto");
        System.out.println(idproducto);
        HttpSession sesion = request.getSession();
        System.out.println("PPPPP " + accion +" IDPRODUCTO"+ idproducto);
        if (accion != null && accion.equals("editar")) {
            //Formulario de entrada con buttons ediitados
            List<Producto> productos = (List<Producto>) sesion.getAttribute("productos");
            for (Producto producto : productos) {
                if(producto.getIdProducto() == Integer.parseInt(idproducto)){
                    request.setAttribute("producto",producto);
                }
            }
            request.getRequestDispatcher("registrarProducto.jsp").forward(request, response);
            //response.sendRedirect("registrarProducto.jsp");
            
        }else if(accion != null && accion.equals("update")){
            String nombre = request.getParameter("nombre");
            String descripcion = request.getParameter("descripcion");
            int tipo = Integer.parseInt(request.getParameter("categoria"));
            //int precio = Integer.parseInt(request.getParameter("precio"));
            Double precio = Double.parseDouble("precio");
            Usuario usuario = (Usuario) request.getSession().getAttribute("usuario"); 
            Producto producto = new Producto(tipo, usuario.getIdUsuario(), nombre, descripcion, precio); 
            producto.setIdProducto(Integer.parseInt(idproducto));
            try {
                control.updateProducto(producto);
            } catch (Exception ex) {
                Logger.getLogger(SvProductos.class.getName()).log(Level.SEVERE, null, ex);
            }
            this.doGet(request, response);
        } 
        else {
            String nombre = request.getParameter("nombre");
            String descripcion = request.getParameter("descripcion");
            if(descripcion.isEmpty()){
                descripcion = "Sin Descripcion";
            }
            int tipo = Integer.parseInt(request.getParameter("categoria"));
            String precioant = request.getParameter("precio");
            
            Double precio = (precioant.isEmpty())?20:Double.parseDouble(precioant);
            Usuario usuario = (Usuario) sesion.getAttribute("usuario"); 
            control.crearProducto(new Producto(tipo, usuario.getIdUsuario(), nombre, descripcion, precio));
            this.doGet(request, response);
        }

    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
