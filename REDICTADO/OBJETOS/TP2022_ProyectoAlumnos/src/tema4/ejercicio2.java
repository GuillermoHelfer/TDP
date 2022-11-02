/*
 * Here comes the text of your license
 * Each line should be prefixed with  * 
 */
package tema4;

import PaqueteLectura.Lector;

/**
 *
 * @author guill
 */
public class ejercicio2 {
    public static void main (String[] args) {
        Micro m1 = new Micro("ABC123","Mar del Plata",500);
    
        for (int i=0;i<20;i++){
            System.out.println("ingrese el numero de asiento");
            int asiento = Lector.leerInt();
            if((m1.validarRango(asiento))&&(m1.devolverEstado(asiento)==false)){
                m1.ocuparAsiento(asiento);
            }
        }
    } 
}
