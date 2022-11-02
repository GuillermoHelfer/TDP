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
public class Ejercicio2 {
    public static void main (String[] args){
        BalanzaComercial b1 = new BalanzaComercial();
        Producto unProd = new Producto();
        double pesoEnKg;
        double precioPorKg;
        
        b1.iniciarCompra();
        
        System.out.println("ingrese el Peso En Kg");
        unProd.setPesoEnKg(Lector.leerDouble());
        System.out.println("ingrese la descripcion del producto");
        unProd.setDescripcion(Lector.leerString());
        System.out.println("ingrse el Precio Por Kg");
        precioPorKg = Lector.leerDouble();
        
        while (unProd.getPesoEnKg() != 0){
            System.out.println("ingrese el Peso En Kg");
            unProd.setPesoEnKg(Lector.leerDouble());
            System.out.println("ingrese la descripcion del producto");
            unProd.setDescripcion(Lector.leerString());
            System.out.println("ingrse el Precio Por Kg");
            precioPorKg = Lector.leerDouble();
        }
        
        System.out.println(b1.getResumenDeCompra());
        
    }
}
