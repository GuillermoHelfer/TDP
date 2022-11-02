/*
 * Here comes the text of your license
 * Each line should be prefixed with  * 
 */
package tema5;

/**
 *
 * @author guill
 */
public class Persona {
    private String nom;
    private int dni;
    private int edad;

    public Persona(String nom, int dni, int edad) {
        this.nom = nom;
        this.dni = dni;
        this.edad = edad;
    }

    public Persona() {
    }

    public String getNom() {
        return nom;
    }

    public int getDni() {
        return dni;
    }

    public int getEdad() {
        return edad;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    @Override
    public String toString() {
        return "Mi nombre es " + nom + ", mi DNI es " + dni + " y tengo " + edad + " anios.";
    }
    
    
    
}
