/*
 * Here comes the text of your license
 * Each line should be prefixed with  * 
 */
package tema3;

/**
 *
 * @author guill
 */
public class Entrenador {
    private String nombre;
    private double sueldo;
    private int antiguedad;
    private int campeonatosGanados;

    public String getNombre() {
        return nombre;
    }

    public double getSueldo() {
        return sueldo;
    }

    public int getAntiguedad() {
        return antiguedad;
    }

    public int getCampeonatosGanados() {
        return campeonatosGanados;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setSueldo(double sueldo) {
        this.sueldo = sueldo;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }

    public void setCampeonatosGanados(int campeonatosGanados) {
        this.campeonatosGanados = campeonatosGanados;
    }
    
    public double calcularEfectividad(){
        return ((double)this.campeonatosGanados / (double)this.antiguedad);
    }
    
    public double calcularSueldoACobrar(){
        if (this.campeonatosGanados == 0){
            return this.sueldo + (this.antiguedad * (this.sueldo * 0.10));
        }
        else{
            if (this.campeonatosGanados <= 4){
                return this.sueldo + (this.antiguedad * (this.sueldo * 0.10)) + 5000;
            }
            else{
                if (this.campeonatosGanados <= 10){
                    return this.sueldo + (this.antiguedad * (this.sueldo * 0.10)) + 30000;
                }
                else{
                    return this.sueldo + (this.antiguedad * (this.sueldo * 0.10)) + 50000;
                }
            }
        }
    }
}