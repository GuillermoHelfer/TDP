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
public class Ejercicio5 {
    public static void main (String[] args){
        int clientes = 5;
        int aspectos = 5;
        int m [][] = new int [clientes][aspectos];
        double v [] = new double [aspectos]; 
        
        for (int i= 0; i<clientes; i++){
            System.out.println("cliente nro: " + i);
            for (int j=0; j<aspectos; j++){
                System.out.println("ingrese el puntaje del aspecto " + j);
                m[i][j] = Lector.leerInt();
            }
        }
        
        for (int i= 0; i<clientes; i++){
            for (int j=0; j<aspectos; j++){
                v[j] = v[j] + m[i][j];
            }
        }
        
        for (int i= 0; i<clientes; i++){
            v[i]= (double) v[i] / clientes;
            System.out.println("promedio del aspecto " + i + " es: " + v[i]);
        }
    }
}
