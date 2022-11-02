/*
 * Here comes the text of your license
 * Each line should be prefixed with  * 
 */
package tema4;

/**
 *
 * @author guill
 */
public class Estante {
    final private int dimF = 20;
    private Libro [] vLibros;
    private int dimL = 0;
    
    public void iniciarEstante(int N){
        this.vLibros = new Libro [N]; 
        for (int i=0;i<dimF;i++){
            this.vLibros[i] = new Libro();
        }
    }
    
    public int getDimL(){
        int i = 0;
        while (vLibros[i] != null){
            dimL++;
            i++;
        }
        return dimL;
    }
    
    public boolean EstaLleno(){
        return (dimL == dimF);
    }
    
    public void AgregarLibro(Libro unLibro){
        if (dimL < dimF){
            this.vLibros[dimL+1] = unLibro;
            dimL++;
        }
    }
    
    public Libro getLibro(String unTitulo){
        int i = 0;
        while (! unTitulo.equals(vLibros[i].getTitulo()) && (i < this.dimF))
            i++;
        if (dimL > dimF)
            return vLibros[i];
        else
            return null;
    }
}
