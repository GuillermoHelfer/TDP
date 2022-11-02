/*
 * Here comes the text of your license
 * Each line should be prefixed with  * 
 */
package tema3;

/**
 *
 * @author guill
 */
public class BalanzaComercial {
    private double monto;
    private int cantidad;
    private String resumen;

    public double getMonto() {
        return monto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
    
    public void iniciarCompra(){
        this.monto = 0;
        this.cantidad = 0;
        this.resumen = "";
    }
    
    public void registrarProducto(Producto unProducto, double precioEnKg){
        this.monto = this.monto + unProducto.getPesoEnKg() * precioEnKg;
        this.cantidad++;
        this.resumen = this.resumen + unProducto.getDescripcion() + " " + (unProducto.getPesoEnKg() * precioEnKg) + " - "; 
    }
    
    public String getResumenDeCompra(){
        String aux = this.resumen + " Total a pagar " + this.monto;
        return aux;
    }
    
}
