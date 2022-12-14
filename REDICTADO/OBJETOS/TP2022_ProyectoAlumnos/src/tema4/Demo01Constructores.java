/*
Demo que crea objetos Libro invocando a los constructores definidos. Tema 4.
 */
package tema4;

/**
 *
 * @author vsanz
 */
public class Demo01Constructores {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Autor a1 = new Autor("Herbert Schildt", "zzz", "xxx");
        
        Libro libro1= new  Libro( "Java: A Beginner's Guide",   
                                 "Mcgraw-Hill", 2014,   
                                 a1, "978-0071809252", 21.72);
        Libro libro2= new Libro("Practicas del Lenguaje",  
                                a1,  "978-9501314694",19.95);
        
        System.out.println(libro2.getPrimerAutor().toString());
        
        System.out.println(libro1.toString());
        System.out.println(libro2.toString());
        System.out.println("Editorial de libro2: " +libro2.getEditorial());
        System.out.println("Año edición de libro2: " +libro2.getAñoEdicion());
        
    }
    
}
