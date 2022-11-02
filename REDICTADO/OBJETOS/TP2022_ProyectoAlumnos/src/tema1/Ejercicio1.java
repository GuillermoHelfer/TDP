/*
 * Here comes the text of your license
 * Each line should be prefixed with  * 
 */

/**
 * 
 * @author guill
 */
import PaqueteLectura.GeneradorAleatorio;

public class Ejercicio1 {
    public static void main(String[] args){
    final   int DF = 11;
            int [] tabla2 = new int [DF];
            
            
            for (int i = 1; i<10; i++)
                tabla2[i]=2*i;
            int num = GeneradorAleatorio.generarInt(12);
            while (num != 11){
                System.out.println("2x" + num + "=" + tabla2[12]);
                num = GeneradorAleatorio.generarInt(12);
            }
    }
}
