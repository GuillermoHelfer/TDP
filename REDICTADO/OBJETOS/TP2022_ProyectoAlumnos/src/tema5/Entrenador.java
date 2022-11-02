/*
 * Here comes the text of your license
 * Each line should be prefixed with  * 
 */
package tema5;

/**
 *
 * @author guill
 */
public class Entrenador extends Empleado{
    private int campeonatos;

    public Entrenador(int campeonatos, String nombre, double sueldoB, int antiguedad) {
        super(nombre, sueldoB, antiguedad);
        setCampeonatos(campeonatos);
    }

    public int getCampeonatos() {
        return campeonatos;
    }

    public void setCampeonatos(int campeonatos) {
        this.campeonatos = campeonatos;
    }

    @Override
    public void setAntiguedad(int antiguedad) {
        super.setAntiguedad(antiguedad); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void setSueldoB(double sueldoB) {
        super.setSueldoB(sueldoB); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void setNombre(String nombre) {
        super.setNombre(nombre); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int getAntiguedad() {
        return super.getAntiguedad(); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public double getSueldoB() {
        return super.getSueldoB(); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public String getNombre() {
        return super.getNombre(); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public double calcularEfectividad() {
        return (double)getCampeonatos()/(double)super.getAntiguedad();
    }

    @Override
    public double calcularSueldoACobrar() {
        double aux = super.getSueldoB() + super.getSueldoB()*0.1*super.getAntiguedad();
        if ((getCampeonatos() > 0) && (getCampeonatos() <= 4)){
            aux = aux + 5000;
        }
        else{
            if ((getCampeonatos() > 0) && (getCampeonatos() <= 10))
                aux = aux + 30000;
            else{
                if (getCampeonatos() > 0)
                aux = aux + 50000;
            }
        }
        return aux;
    }

    @Override
    public String toString() {
        return super.toString(); 
    }
    
    
}
