package domain;

import datos.ControladoraPersistencia;
import datos.exceptions.NonexistentEntityException;
import java.util.List;


public class Controladora {
    ControladoraPersistencia controlPersis = new ControladoraPersistencia(); 
    
    public void crearProducto(Producto producto){
        controlPersis.crearProducto(producto);
    }
    
    public List<Producto> getProductos(){
        return controlPersis.getUsuarios(); 
    }
    public List<Producto> filtrarProductos(int id){
        return controlPersis.filtrarProducto(id); 
    }
    public List<Producto> filtrarPorDuenio(int duenio){
        return controlPersis.filtrarProductoPorDuenio(duenio);
    }
    public void crearUsuario(Usuario usuario){
        controlPersis.crearUsuario(usuario);
    }
    
    public Usuario login(String t, String contrasenia){
        return controlPersis.finUsuario(t, contrasenia);
    }
    
    public void eliminarProducto(int id) throws NonexistentEntityException{
        controlPersis.delete(id);
    }
    public void updateProducto(Producto producto) throws Exception{
        controlPersis.update(producto);
    }
    public boolean correo_existe(String correo){
         return controlPersis.existe_correo(correo);
    }
}
