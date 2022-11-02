/*
 * Here comes the text of your license
 * Each line should be prefixed with  * 
 */
package tema1;
import PaqueteLectura.*;
/**
 *
 * @author guill
 */
public class Ejercicio3 {
    public static void main(String[] args){
        
        final   int DF = 10;
                int matriz [] [] = new int [DF] [DF];
                int vector [] = new int [DF];
                int suma;
                int unValor;
                int fila = 0; 
                int columna = 0;
                int unaFila, unaColumna;
                boolean Encontre = false;
                
                for (int i=0; i<200; i++){
                    GeneradorAleatorio.generarDouble(201);
                }
                
                for (int i=2; i<DF; i++){
                    for (int j=0; j<3; j++){
                        System.out.println(matriz[i][j]);
                    }
                }
                
                for (int i=0; i<DF; i++){
                    suma = 0;
                    for (int j=0; j<DF; j++){
                        suma = suma + matriz [i][j];
                    }
                    vector[i] = suma;
                }
                
                System.out.println("ingrese un valor entero");
                unValor = Lector.leerInt();
                
                while (fila < DF && !Encontre){
                    while (columna < DF && !Encontre){
                        if (unValor == matriz[fila][columna]){
                            Encontre = true;
                            unaFila = fila;
                            unaColumna = columna;
                        }
                    }
                    fila++;
                }
    }
}
