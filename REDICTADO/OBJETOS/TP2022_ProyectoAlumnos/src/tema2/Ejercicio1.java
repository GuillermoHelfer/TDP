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
public class Ejercicio1 {
    public static void main (String[] args){
        String nom;
        int DNI;
        int edad;
        Persona personita;
        
        System.out.println("ingrese el nombre de la persona");
        nom = Lector.leerString();
        System.out.println("ingrese el DNI de la persona");
        DNI = Lector.leerInt();
        System.out.println("ingrese la edad de la persona");
        edad = Lector.leerInt();
        
        personita = new Persona (nom,DNI,edad);
        System.out.println(personita.toString());
    }
}
