/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repaso1;

/**
 *
 * @author guill
 */
public class Proyecto {
    private String nomPro;
    private int codigo;
    private String nomApeDirector;
    final private int dimF = 50;
    private int dimL;
    private Investigador [] v = new Investigador [dimF];

    public Proyecto(String nomPro, int codigo) {
        this.nomPro = nomPro;
        this.codigo = codigo;
        dimL = 0;
    }

    public String getNomPro() {
        return nomPro;
    }

    public int getCodigo() {
        return codigo;
    }

    public String getNomApeDirector() {
        return nomApeDirector;
    }

    public int getDimL() {
        return dimL;
    }

    public int getDimF() {
        return dimF;
    }

    public void setNomPro(String nomPro) {
        this.nomPro = nomPro;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public void setNomApeDirector(String nomApeDirector) {
        this.nomApeDirector = nomApeDirector;
    }

    public void setDimL(int dimL) {
        this.dimL = dimL;
    }
    
    public void agregarInvestigador(Investigador unInvestigador){
        if(getDimL() <= getDimF()){
            v[getDimL()] = unInvestigador;
            setDimL(getDimL()+1);
        }
    }
    
    public double dineroTotalOtorgado(){
        double total = 0;
        for (int i=0; i<getDimL(); i++){
            total = total + v[i].DineroDelInvestigador();
        }
        return total;
    }
    
    public void otorgarTodos(String unNomApe){
        int i=0;
        while ((!v[i].getNomApeInvestigador().equals(unNomApe))&&(i <= getDimL())){
            i++;
        }
        if (v[i].getNomApeInvestigador().equals(unNomApe)){
                v[i].OtorgarSubsidios();
        }
    }

    @Override
    public String toString() {
        String strInv = "";
        for (int i=0; i < getDimL(); i++){
            strInv = strInv + v[i].toString();
        }
        
        return "Proyecto{" + "nomPro=" + nomPro + 
                ", codigo=" + codigo + 
                ", nomApeDirector=" + nomApeDirector +
                ", total de dinero otorgado=" + dineroTotalOtorgado() +
                strInv + '}';
    }
    
}
