/*
 * Here comes the text of your license
 * Each line should be prefixed with  * 
 */
package tema5;

/**
 *
 * @author guill
 */
public class Ejercicio2 {
    public static void main (String[] args){
        Jugador j = new Jugador(10,3,"Julian Alvarez", 300000, 2);
        Entrenador e = new Entrenador (2,"Marcelo Gallardo", 500000, 6);
        
        System.out.println(j.toString());
        System.out.println(e.toString());
    }
}
