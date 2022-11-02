/*
 * Here comes the text of your license
 * Each line should be prefixed with  * 
 */
package tema3;
import PaqueteLectura.Lector;
/**
 *
 * @author guill
 */
public class Ejercicio3 {
    public static void main (String[] args){
        Entrenador e1= new Entrenador();
        String nom;
        double sueldo;
        int antiguedad;
        int campeonatosGanados;
        
        System.out.println("ingrese el nombre del entrenador");
        nom = Lector.leerString();
        System.out.println("ingrese el sueldo basico");
        sueldo = Lector.leerDouble();
        System.out.println("ingrese la antiguedad");
        antiguedad = Lector.leerInt();
        System.out.println("ingrese la cantidad de campeonatos ganados");
        campeonatosGanados = Lector.leerInt();
        
        e1.setNombre(nom);
        e1.setSueldo(sueldo);
        e1.setAntiguedad(antiguedad);
        e1.setCampeonatosGanados(campeonatosGanados);
        
        System.out.println(e1.calcularSueldoACobrar());
        System.out.println(e1.calcularEfectividad());
    }
}
