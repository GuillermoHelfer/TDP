/*
 * Here comes the text of your license
 * Each line should be prefixed with  * 
 */
package tema3;
import PaqueteLectura.Lector;
/**
 *
 * @author guill
 */
public class Ejercicio1 {
    public static void main (String[] args){
        Triangulo t1 = new Triangulo();
        double lado1;
        double lado2;
        double lado3;
        String colorRelleno;
        String colorLinea;
        
        System.out.println("ingrese el lado1");
        lado1 = Lector.leerDouble();
        System.out.println("ingrese el lado2");
        lado2 = Lector.leerDouble();
        System.out.println("ingrese el lado3");
        lado3 = Lector.leerDouble();
        System.out.println("ingrese el color de relleno");
        colorRelleno = Lector.leerString();
        System.out.println("ingrese el color de linea");
        colorLinea = Lector.leerString();
        
        System.out.println(t1.calcularPerimetro());
        System.out.println(t1.calcularArea());
    }
}
