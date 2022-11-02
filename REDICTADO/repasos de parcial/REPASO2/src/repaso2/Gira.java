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
public class Gira extends Recital{
    private String nombre;
    private Fecha [] v;
    private int actual;
    final private int dimF;

    public Gira(String nombreBanda, int cant, String nombreGira, int c) {
        super(nombreBanda, cant);
        this.nombre = nombreGira;
        this.dimF = c;
        this.v = new Fecha [dimF];
        this.actual = 0;
    }

    public String getNombre() {
        return nombre;
    }

    public Fecha[] getV() {
        return v;
    }

    public int getActual() {
        return actual;
    }

    public int getDimF() {
        return dimF;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setV(Fecha[] v) {
        this.v = v;
    }

    public void setActual(int actual) {
        this.actual = actual;
    }
    
    public void agregarFecha(String unaCiudad, int unDia){
        v[getDimL()] = new Fecha (unaCiudad, unDia);
        setDimL(getDimL()+1);
    }

    @Override
    public void actuar (){
        for (int i=0; i< super.getDimL(); i++){
            System.out.println("Buenas noches... " + v[actual].getCiudad() +
            "y ahora tocaremos... " + super.getTemas()[i]);
        }
        actual++;
    }

    @Override
    public boolean finalizado() {
        return(this.getActual() > this.getDimF());
    }

    @Override
    public double calcularCosto() {
        return (this.getDimF() * 30000);
    }
    
}
