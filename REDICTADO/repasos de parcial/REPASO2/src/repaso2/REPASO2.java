/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repaso2;
import PaqueteLectura.Lector;
/**
 *
 * @author guill
 */
public class REPASO2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        EventoOcasional EO;
        Gira G;
        
        EO = new EventoOcasional(Lector.leerString(), Lector.leerInt(), Lector.leerString(), Lector.leerString(), Lector.leerInt());
        System.out.println(EO.calcularCosto());
        
        G = new Gira(Lector.leerString(), Lector.leerInt(), Lector.leerString(), Lector.leerInt());
        System.out.println(G.calcularCosto());
        G.actuar();
        
    }
    
}
