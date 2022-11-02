/*
 * Here comes the text of your license
 * Each line should be prefixed with  * 
 */
package tema5;

/**
 *
 * @author guill
 */
public abstract class Empleado {
    private String nombre;
    private double sueldoB;
    private int antiguedad;

    public Empleado(String nombre, double sueldoB, int antiguedad) {
        this.nombre = nombre;
        this.sueldoB = sueldoB;
        this.antiguedad = antiguedad;
    }

    public String getNombre() {
        return nombre;
    }

    public double getSueldoB() {
        return sueldoB;
    }

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setSueldoB(double sueldoB) {
        this.sueldoB = sueldoB;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }
    
    public abstract double calcularEfectividad();
    public abstract double calcularSueldoACobrar();

    @Override
    public String toString() {
        return "Empleado{" + "nombre=" + nombre + ", sueldo A Cobrar=" + this.calcularSueldoACobrar() + ", Efectividad=" + this.calcularEfectividad() + '}';
    }
    
}
