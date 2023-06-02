package test;

import domain.Controladora;
import domain.Producto;
import java.util.List;

public class main {
    public static void main(String[] args) {
        Controladora controladora = new Controladora();
        List<Producto> productos = controladora.filtrarProductos(5);
        for (Producto producto : productos) {
            System.out.println(producto);
        }
    }
}
