
package datos;

import datos.exceptions.NonexistentEntityException;
import domain.Producto;
import domain.Usuario;
import java.util.List;

public class ControladoraPersistencia {
    ProductoJpaController proJpa = new ProductoJpaController(); 
    UsuarioJpaController usuJpa = new UsuarioJpaController(); 
    //Create
    public void crearProducto(Producto producto){
        proJpa.create(producto);
    }
    public List<Producto> filtrarProducto(int id){
        return proJpa.filtrarProducto(id); 
    }
    public List<Producto> filtrarProductoPorDuenio(int duenio){
        return proJpa.filtrarProductoPorDuenio(duenio);
    }
    public void crearUsuario(Usuario usuario){
        usuJpa.create(usuario);
    }
    //Read
    public List<Producto> getUsuarios(){
        return proJpa.findProductoEntities(); 
    }
    
    public Usuario finUsuario(String c, String contrasenia){
        return usuJpa.login(c, contrasenia); 
    }
   
    //Delete
    public void delete(int id) throws NonexistentEntityException{
        proJpa.destroy(id);
    }
    
    
    //Update
    public void update(Producto producto) throws Exception{
        proJpa.edit(producto);
    }
    
    //Si existe un usuario con el mismo correo
    public boolean existe_correo(String correo){
        return usuJpa.correo_Existe(correo); 
    }
}
