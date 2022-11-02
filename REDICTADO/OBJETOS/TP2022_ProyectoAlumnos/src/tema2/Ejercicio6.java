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
public class Ejercicio6 {
    public static void main (String[] args){
        int cantPart = 20;
        Partido [] vPar = new Partido [cantPart];
        String nomVi;
        String nomLo;
        int golesVi;
        int golesLo;
        int partido = 0;
        int cantGanoRiver = 0;
        int cantGolesLocalBoca = 0;
        int cantPartidosEmpate = 0;
        
        System.out.println("ingrese el nombre del equipo visitante");
        nomVi = Lector.leerString();
        while (!(nomVi.equals("ZZZ")) & partido<cantPart){
            System.out.println("ingrese el nombre del equipo local");
            nomLo = Lector.leerString();
            System.out.println("ingrese el nombre del equipo visitante");
            golesVi = Lector.leerInt();
            System.out.println("ingrese el nombre del equipo visitante");
            golesLo = Lector.leerInt();
            
            vPar[partido] = new Partido(nomVi,nomLo,golesVi,golesLo);
            partido++;
            
            System.out.println("ingrese el nombre del equipo visitante");
            nomVi = Lector.leerString();
        }
        for (int i=0;i<partido;i++){
            if (vPar[i].getGanador().equalsIgnoreCase("river")){
                cantGanoRiver++;
            }
            if (vPar[i].getLocal().equalsIgnoreCase("boca")){
                cantGolesLocalBoca = cantGolesLocalBoca + vPar[i].getGolesLocal();
            }
            if (vPar[i].getGolesLocal() == vPar[i].getGolesVisitante()){
                cantPartidosEmpate++;
            }
        }
        System.out.println("la cantidad de partidos que gano river fue de: " + cantGanoRiver);
        System.out.println("la cantidad de goles que metio boca de local fueron: " + cantGolesLocalBoca);
        System.out.println("el porcentaje de partidos que terminaron en empate fue de: " + cantPartidosEmpate/partido * 100 + "%");
    }
}
