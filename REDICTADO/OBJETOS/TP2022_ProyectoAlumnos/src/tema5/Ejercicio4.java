/*
 * Here comes the text of your license
 * Each line should be prefixed with  * 
 */
package tema5;

/**
 *
 * @author guill
 */
public class Ejercicio4 {
    public static void main(String[] args) {
        VisorFiguras visor = new VisorFiguras();

        Cuadrado c1 = new Cuadrado(10,"Violeta","Rosa");
        Rectangulo r= new Rectangulo(20,10,"Azul","Celeste");
        Cuadrado c2= new Cuadrado(30,"Rojo","Naranja");

        visor.mostrar(c1);
        visor.mostrar(r);
        visor.mostrar(c2);

        System.out.println(visor.getMostradas());
        
        /* Imprime correctamente los datos. Porque el cuadrado y el rectangulo 
        son clases hijas de FIGURAS y figuras en fin. Es lo que se pide por 
        parametro para mostrar la figura*/
    }
}
