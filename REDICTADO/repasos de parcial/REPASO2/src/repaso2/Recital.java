/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repaso2;

/**
 *
 * @author guill
 */
public abstract class Recital {
    private String nombre;
    private String [] temas;
    private int dimL;
    final private int dimF;
    

    public Recital(String nombre, int cant) {
        this.nombre = nombre;
        this.temas = new String [cant];
        dimL = 0;
        dimF = cant;
    }

    public String getNombre() {
        return nombre;
    }

    public String[] getTemas() {
        return temas;
    }

    public int getDimL() {
        return dimL;
    }

    public int getDimF() {
        return dimF;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setTemas(String[] temas) {
        this.temas = temas;
    }

    public void setDimL(int dimL) {
        this.dimL = dimL;
    }
    
    public void agregarTema (String nombreTema){
        if(getDimL() <= getDimF())
            this.temas[getDimL()] = nombreTema;
        else
            System.out.println("no hay mas espacio para guardar temas");
    }
    
    abstract public void actuar ();
    
    abstract public boolean finalizado();
    
    abstract public double calcularCosto();
    
}
