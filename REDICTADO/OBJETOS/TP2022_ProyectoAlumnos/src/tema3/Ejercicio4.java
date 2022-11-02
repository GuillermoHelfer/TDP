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
public class Ejercicio4 {
    public static void main(String[] args){
        Circulo c1 = new Circulo();
        double radio;
        String colorRelleno;
        String colorLinea;
        
        System.out.println("ingrese el radio");
        radio = Lector.leerDouble();
        System.out.println("ingrese el color de relleno");
        colorRelleno = Lector.leerString();
        System.out.println("ingrese el color de Linea");
        colorLinea = Lector.leerString();
        
        c1.setRadio(radio);
        c1.setColorRelleno(colorRelleno);
        c1.setColorLinea(colorLinea);
        
        System.out.println(c1.calcularPerimetro());
        System.out.println(c1.calcularArea());
        
    }
}
