/*
 * Here comes the text of your license
 * Each line should be prefixed with  * 
 */
package tema2;
import PaqueteLectura.Lector;
/**
 *
 * @author guill
 */
public class Ejercicio4 {
    public static void main (String[] args){
        String [] vector = new String [10];
        String nuevo = "";
        
        for (int i=0;i<10;i++){
            System.out.println("ingrese el String");
            vector[i] = Lector.leerString();
        }
        
        for(int i=0;i<10;i++){
            nuevo = nuevo + vector[i].charAt(0);
        }
        
        System.out.println(nuevo);
    }
}
