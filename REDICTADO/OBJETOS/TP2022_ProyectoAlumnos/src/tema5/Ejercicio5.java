/*
 * Here comes the text of your license
 * Each line should be prefixed with  * 
 */
package tema5;

/**
 *
 * @author guill
 */
public class Ejercicio5 {
    public static void main (String[] args){
        VisorFigurasModificado VFM = new VisorFigurasModificado();
        
        Cuadrado c1 = new Cuadrado(10,"Violeta","Rosa");
        Rectangulo r= new Rectangulo(20,10,"Azul","Celeste");
        Cuadrado c2= new Cuadrado(30,"Rojo","Naranja");
        
        VFM.guardar(c1);
        VFM.guardar(r);
        VFM.guardar(c2);
        
        VFM.mostrar();
    }
}
