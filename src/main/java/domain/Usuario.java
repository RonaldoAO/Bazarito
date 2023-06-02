package domain;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Usuario implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)   
    private int idUsuario;
    private String nombre;
    private Date fechaDeNacimiento;
    private String localidad; 
    private String telefono;
    private String contrasenia;
    private String correo;

    public Usuario() {
    }

    public Usuario(String nombre, String correo, String contrasenia){
        this.nombre = nombre;
        this.correo = correo; 
        this.contrasenia = contrasenia; 
    }
    
    public Usuario(String nombre,String contrasenia, Date fechaDeNacimiento, String localidad, String telefono, String correo) {
        this.contrasenia = contrasenia;
        this.correo = correo; 
        this.nombre = nombre;
        this.fechaDeNacimiento = fechaDeNacimiento;
        this.localidad = localidad;
        this.telefono = telefono;
    }

    public String getContrasenia() {
        return contrasenia;
    }

    public void setContrasenia(String contrasenia) {
        this.contrasenia = contrasenia;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    
    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Date getFechaDeNacimiento() {
        return fechaDeNacimiento;
    }

    public void setFechaDeNacimiento(Date fechaDeNacimiento) {
        this.fechaDeNacimiento = fechaDeNacimiento;
    }

    public String getLocalidad() {
        return localidad;
    }

    public void setLocalidad(String localidad) {
        this.localidad = localidad;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
    
}
