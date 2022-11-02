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
public class Ejercicio5 {
    public static void main (String[] args){
        int dias = 5;
        int turnos = 8;
        int i= 0;
        int j= 0;
        
        Persona [][] mPers = new Persona [5][8];
        String nom = "";
        int DNI;
        int edad;
        
        System.out.println("ingrese el nombre de la persona");
        nom = Lector.leerString();
        while(!(nom.equals("ZZZ")) & (i<dias)){
            System.out.println("ingrese el DNI de la persona");
            DNI = Lector.leerInt();
            System.out.println("ingrese la edad de la persona");
            edad = Lector.leerInt();
            while(!(nom.equals("ZZZ")) & (j<turnos)){
                mPers[i][j]= new Persona(nom,DNI,edad);
                System.out.println("ingrese el nombre de la persona");
                nom = Lector.leerString();
                System.out.println("ingrese el DNI de la persona");
                DNI = Lector.leerInt();
                System.out.println("ingrese la edad de la persona");
                edad = Lector.leerInt();
                j++;
            }
            System.out.println("ingrese el nombre de la persona");
            nom = Lector.leerString();
            i++;
        }
        
        for (int p=0;p<i;p++){
            for (int q=0;q<j;q++){
                System.out.println(mPers[p][q].getNombre());
            }
        }
    }
}
