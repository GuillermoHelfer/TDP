/*
 * Here comes the text of your license
 * Each line should be prefixed with  * 
 */
package tema3;

/**
 *
 * @author guill
 */
public class Circulo {
    private double radio;
    private String colorRelleno;
    private String colorLinea;

    public double getRadio() {
        return radio;
    }

    public String getColorRelleno() {
        return colorRelleno;
    }

    public String getColorLinea() {
        return colorLinea;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }

    public void setColorRelleno(String colorRelleno) {
        this.colorRelleno = colorRelleno;
    }

    public void setColorLinea(String colorLinea) {
        this.colorLinea = colorLinea;
    }
    
    public double calcularArea(){
        return (Math.PI * (this.radio * this.radio));
    }
    
    public double calcularPerimetro(){
        return (2 * Math.PI * this.radio);
    }
}
