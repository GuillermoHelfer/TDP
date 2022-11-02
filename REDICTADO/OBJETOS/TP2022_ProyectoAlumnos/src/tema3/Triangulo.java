/*
 * Here comes the text of your license
 * Each line should be prefixed with  * 
 */
package tema3;

/**
 *
 * @author guill
 */
public class Triangulo {
    private double lado1;
    private double lado2;
    private double lado3;
    private String colorRelleno;
    private String colorLinea;

    public Triangulo(double lado1, double lado2, double lado3, String colorRelleno, String colorLinea) {
        this.lado1 = lado1;
        this.lado2 = lado2;
        this.lado3 = lado3;
        this.colorRelleno = colorRelleno;
        this.colorLinea = colorLinea;
    }
    
    public Triangulo(){
        
    }

    public double getLado1() {
        return lado1;
    }

    public double getLado2() {
        return lado2;
    }

    public double getLado3() {
        return lado3;
    }

    public String getColorRelleno() {
        return colorRelleno;
    }

    public String getColorLinea() {
        return colorLinea;
    }

    public void setLado1(double lado1) {
        this.lado1 = lado1;
    }

    public void setLado2(double lado2) {
        this.lado2 = lado2;
    }

    public void setLado3(double lado3) {
        this.lado3 = lado3;
    }

    public void setColorRelleno(String colorRelleno) {
        this.colorRelleno = colorRelleno;
    }

    public void setColorLinea(String colorLinea) {
        this.colorLinea = colorLinea;
    }
    
    public double calcularS(){
        double aux = (lado1 + lado2 + lado3) / 2;
        return aux;
    }
    
    public double calcularArea(){
        double s = (lado1 + lado2 + lado3) / 2;
        return Math.sqrt(s * (lado1 - s) * (lado2 - s) * (lado3 - s));
    }
    
    public double calcularPerimetro(){
        return (lado1 + lado2 + lado3);
    }
    
}
