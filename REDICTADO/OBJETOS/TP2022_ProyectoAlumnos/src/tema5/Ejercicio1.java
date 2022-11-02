/*
 * Here comes the text of your license
 * Each line should be prefixed with  * 
 */
package tema5;

/**
 *
 * @author guill
 */
public class Ejercicio1 {
    public static void main (String[] args){
        Triangulo t1 = new Triangulo(2,3,4,"ROJO","NEGRO");
        Circulo c1 = new Circulo(1.8,"CELESTE","AZUL");
        
        System.out.println(t1.toString());
        System.out.println(c1.toString());
        
        t1.despintar();
        c1.despintar();
        
        System.out.println(t1.toString());
        System.out.println(c1.toString());
    }
}