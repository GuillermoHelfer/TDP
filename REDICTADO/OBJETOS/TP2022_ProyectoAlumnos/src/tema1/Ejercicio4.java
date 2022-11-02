/*
 * Here comes the text of your license
 * Each line should be prefixed with  * 
 */
package tema1;
import PaqueteLectura.Lector;
/**
 *
 * @author guill
 */
public class Ejercicio4 {
    public static void main(String[] args){
        final int pisos = 8;
        final int oficinas = 4;
        int m [][] = new int [pisos][oficinas];
        int v [] = new int [pisos];
        int unPiso;
        int unaOficina;
       
        System.out.println("ingrese el piso");
        unPiso = Lector.leerInt();
        System.out.println("ingrese la oficina");
        unaOficina = Lector.leerInt();
        
        for (int i = 0; i<pisos; i++)
            v[i] = 0;
        
        while (unPiso != 9){
            v[unPiso]++;
            System.out.println("ingrese el piso");
            unPiso = Lector.leerInt();
            System.out.println("ingrese la oficina");
            unaOficina = Lector.leerInt();
        }
        for (int i = 0; i<pisos; i++)
            System.out.println("cant de personas en el piso " + i + " = " + v[i]);
    }
}
