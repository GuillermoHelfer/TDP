/*
 * Here comes the text of your license
 * Each line should be prefixed with  * 
 */
package tema4;

/**
 *
 * @author guill
 */
public class Micro {
    final private int dimF = 20;
    private String patente;
    private String destino;
    private int horaSalida;
    private boolean [] vAsientos = new boolean [dimF];
    private int cantAsientosOcupados;

    public Micro(String patente, String destino, int horaSalida) {
        this.patente = patente;
        this.destino = destino;
        this.horaSalida = horaSalida;
        for (int i=0;i<dimF;i++)
            vAsientos[i] = false;
    }

    public String getPatente() {
        return patente;
    }

    public String getDestino() {
        return destino;
    }

    public int getHoraSalida() {
        return horaSalida;
    }

    public void setPatente(String patente) {
        this.patente = patente;
    }

    public void setDestino(String destino) {
        this.destino = destino;
    }

    public void setHoraSalida(int horaSalida) {
        this.horaSalida = horaSalida;
    }

    public int getCantAsientosOcupados() {
        return cantAsientosOcupados;
    }
    
    public boolean estaLleno(){
        return(getCantAsientosOcupados() == dimF);
    }
    
    public boolean validarRango(int N){
        if ((N > 0)&&!(N>dimF))
            return true;
        else
            return false;
    }
    
    public boolean devolverEstado(int N){
        return (vAsientos[N]);
    }
    
    public void ocuparAsiento(int N){
        this.vAsientos[N] = true;
    }
    
    public void liberarAsiento(int N){
        this.vAsientos[N] = false;
    }
    
    public int getPrimerAsientoLibre(){
        int i = 0;
        while (!vAsientos[i])
            i++;
        if (!(i>dimF))
            return i;
        else
            return 0;
    }
}
