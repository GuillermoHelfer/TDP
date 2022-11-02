/*
 * Here comes the text of your license
 * Each line should be prefixed with  * 
 */
package tema5;

/**
 *
 * @author guill
 */
public class Trabajador extends Persona{
    private String oficio;

    public Trabajador(String oficio, String nom, int dni, int edad) {
        super(nom, dni, edad);
        setOficio(oficio);
    }

    public String getOficio() {
        return oficio;
    }

    public void setOficio(String oficio) {
        this.oficio = oficio;
    }

    @Override
    public String toString() {
        return super.toString() + " Soy " + oficio;
    }
    
}
