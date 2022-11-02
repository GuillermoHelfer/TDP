/*
 * Here comes the text of your license
 * Each line should be prefixed with  * 
 */
package tema4;
import PaqueteLectura.Lector;
/**
 *
 * @author guill
 */
public class Ejercicio1 {
    public static void main (String [] args){
        Estante e1 = new Estante();
        Autor a1 = new Autor();
        Libro l1 = new Libro(Lector.leerString(), a1, Lector.leerString(), Lector.leerDouble());
        e1.AgregarLibro(l1);
    }
}
