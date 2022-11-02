/*
 * Here comes the text of your license
 * Each line should be prefixed with  * 
 */
package tema5;

/**
 *
 * @author guill
 */
public class Triangulo extends Figura{
    private double lado1;
    private double lado2;
    private double lado3;

    public Triangulo(double lado1, double lado2, double lado3, String unCR, String unCL) {
        super(unCR, unCL);
        this.lado1 = lado1;
        this.lado2 = lado2;
        this.lado3 = lado3;
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
    
    public void setLado1(int lado) {
        this.lado1 = lado;
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
    public double calcularPerimetro (){
        return lado1+lado2+lado3;
    }
    
    @Override
    public double calcularArea() {
        double aux = calcularPerimetro()/2;
        return (Math.sqrt(aux *(aux-lado1)*(aux-lado2)*(aux-lado3)));
    }

    @Override
    public String toString() {
        return super.toString() + "Triangulo{" + "lado1=" + lado1 + ", lado2=" + lado2 + ", lado3=" + lado3 + '}';
    }
}
