/*
 * Here comes the text of your license
 * Each line should be prefixed with  * 
 */
package tema5;

/**
 *
 * @author guill
 */
public class Circulo extends Figura{
    private double radio;

    public Circulo(double radio, String unCR, String unCL) {
        super(unCR, unCL);
        this.radio = radio;
    }

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }

    @Override
    public void setColorLinea(String unColor) {
        super.setColorLinea(unColor); 
    }

    @Override
    public String getColorLinea() {
        return super.getColorLinea(); 
    }

    @Override
    public void setColorRelleno(String unColor) {
        super.setColorRelleno(unColor); 
    }

    @Override
    public String getColorRelleno() {
        return super.getColorRelleno(); 
    }
    
    @Override
    public double calcularPerimetro(){
        return 2*Math.PI*radio;
    }
    
    @Override
    public double calcularArea(){
        return (Math.PI*radio*radio);
    }
    
    @Override
    public String toString() {
        return super.toString() + "Circulo{" + "radio=" + radio + '}';
    }
}
