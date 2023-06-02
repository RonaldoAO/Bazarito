package domain;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Producto implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)        
    int idProducto;
    int tipoProducto;
    int duenio;
    String nombre; 
    String descripcion; 
    Double precio; 

    public Producto() {
    }


    public Producto(int tipoProducto, int duenio, String nombre, String descripcion, Double precio) {
        this.tipoProducto = tipoProducto;
        this.duenio = duenio;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.precio = precio;
    }

    
    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public int getTipoProducto() {
        return tipoProducto;
    }

    public void setTipoProducto(int tipoProducto) {
        this.tipoProducto = tipoProducto;
    }

    public int getDuenio() {
        return duenio;
    }

    public void setDuenio(int duenio) {
        this.duenio = duenio;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Double getPrecio() {
        return precio;
    }

    public void setPrecio(Double precio) {
        this.precio = precio;
    }

    @Override
    public String toString() {
        return "Producto{" + "idProducto=" + idProducto + ", tipoProducto=" + tipoProducto + ", duenio=" + duenio + ", nombre=" + nombre + ", descripcion=" + descripcion + ", precio=" + precio + '}';
    }
   
    
    
}
