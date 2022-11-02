/*
 * Here comes the text of your license
 * Each line should be prefixed with  * 
 */
package tema2;

import PaqueteLectura.*;

/**
 *
 * @author guill
 */
public class Ejercicio2 {
    public static void main (String[] args){
        String nom;
        int DNI;
        int edad;
        int cant = 0;
        int i;
        int totalMayores = 0;
        Persona pMin = new Persona("",999999999,0);
        Persona [] vector = new Persona [15];
        
        System.out.println("ingrese la edad de la persona");
        edad = GeneradorAleatorio.generarInt(100);
        while (edad != 0 & cant != 15){
            System.out.println("ingrese el nombre de la persona");
            nom = GeneradorAleatorio.generarString(15);
            System.out.println("ingrese el DNI de la persona");
            DNI = GeneradorAleatorio.generarInt(999999);
            
            vector[cant] = new Persona(nom,DNI,edad);
            cant++;
            System.out.println("ingrese la edad de la persona");
            edad = GeneradorAleatorio.generarInt(100);
        }
        
        for (i=0;i<cant;i++){
            if (vector[i].getEdad() > 65){
                totalMayores++;
            }
        }
        System.out.println("la cantidad de personas mayores a 655 anos es de: " + totalMayores);
        
        for (i=0;i<cant;i++){
            if (vector[i].getDNI() < pMin.getDNI()){
                pMin = vector[i];
            }
        }
        System.out.println(pMin.toString());
    }
}
