/*
 * Here comes the text of your license
 * Each line should be prefixed with  * 
 */
package tema5;

/**
 *
 * @author guill
 */
public class Jugador extends Empleado{
    private int partidosJ;
    private int goles;

    public Jugador(int partidosJ, int goles, String nombre, double sueldoB, int antiguedad) {
        super(nombre, sueldoB, antiguedad);
        setPartidosJ(partidosJ);
        setGoles(goles);
    }

    public int getPartidosJ() {
        return partidosJ;
    }

    public int getGoles() {
        return goles;
    }

    public void setPartidosJ(int partidosJ) {
        this.partidosJ = partidosJ;
    }

    public void setGoles(int goles) {
        this.goles = goles;
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
        return (double)getGoles()/(double)getPartidosJ();
    }
    
    @Override
    public double calcularSueldoACobrar() {
        double aux = super.getSueldoB() + super.getSueldoB()*0.1*super.getAntiguedad();
        if (calcularEfectividad() > 0.5)
            aux = aux + super.getSueldoB();
        return aux;
    }

    @Override
    public String toString() {
        return super.toString(); 
    }
    
    
}
