/*
 * Here comes the text of your license
 * Each line should be prefixed with  * 
 */
package tema5;

/**
 *
 * @author guill
 */
public class VisorFigurasModificado {
    private int guardadas;
    private int capacidadMaxima=5;
    private Figura [] vector;

    public VisorFigurasModificado(){
        this.guardadas = 0;
        vector = new Figura [capacidadMaxima];
    }

    public void guardar(Figura f){
        if (quedaEspacio()){
            vector [getGuardadas()] = f;
            this.guardadas++;
        }
    }
    
    public boolean quedaEspacio(){
        return (getGuardadas() < capacidadMaxima);
    }

    public void mostrar(){
        int i=0;
        while(i<getGuardadas()){
            System.out.println(vector[i].toString());
            i++;
        }
    }
    
    public int getGuardadas() {
        return guardadas;
    }

}
