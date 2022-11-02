/*
 * Here comes the text of your license
 * Each line should be prefixed with  * 
 */
package tema5;

/**
 *
 * @author guill
 */
public class VisorFiguras {
    private int mostradas;

    public VisorFiguras(){
        mostradas=0;
    }
    
    public void mostrar(Figura f){
        System.out.println(f.toString());
        mostradas++;
    }
    
    public int getMostradas() {
        return mostradas;
    }
}
