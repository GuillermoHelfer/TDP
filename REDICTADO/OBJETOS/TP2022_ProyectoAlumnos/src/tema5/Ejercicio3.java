/*
 * Here comes the text of your license
 * Each line should be prefixed with  * 
 */
package tema5;

/**
 *
 * @author guill
 */
public class Ejercicio3 {
    public static void main (String [] args){
        Persona p = new Persona("guille",45034325,18);
        Trabajador t = new Trabajador("gnomo de jardin","ivan",1111111,20);
        
        System.out.println(p.toString());
        System.out.println(t.toString());
    }
}
