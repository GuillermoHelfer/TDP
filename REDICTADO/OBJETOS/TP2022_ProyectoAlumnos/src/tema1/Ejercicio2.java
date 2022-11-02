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
public class Ejercicio2 {
    public static void main(String[] args){
        
        int DF = 15;
        double [] tablaJugadores = new double [DF];
        double sumaAux = 0.0;
        int mayorProm = 0;
        
        for (int i=0; i<DF; i++){
            System.out.println("ingrese la altura de un jugador");
            tablaJugadores[i] = Lector.leerDouble();
        }
        
        for (int i=0; i<DF; i++)
            sumaAux = sumaAux + tablaJugadores[i];
        double prom = (double) sumaAux/DF;
        System.out.println(prom);
        
        for (int i=0; i<DF; i++){
            if (tablaJugadores[i] > prom)
                mayorProm++;
        }
    }
}
