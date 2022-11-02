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
public class Investigador {
    private String nomApeInvestigador;
    private int categoria;
    private String especialidad;
    private final int dimF = 5;
    private int dimL;
    private Subsidio [] v = new Subsidio [dimF];

    public Investigador(String nomApeInvestigador, int categoria, String especialidad) {
        this.nomApeInvestigador = nomApeInvestigador;
        this.categoria = categoria;
        this.especialidad = especialidad;
        this.dimL = 0;
    }

    public String getNomApeInvestigador() {
        return nomApeInvestigador;
    }

    public int getCategoria() {
        return categoria;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public int cantidadDeSubsidios() {
        return dimL;
    }

    public int getDimF() {
        return dimF;
    }
    
    public void setNomApeInvestigador(String nomApeInvestigador) {
        this.nomApeInvestigador = nomApeInvestigador;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public void setDimL(int dimL) {
        this.dimL = dimL;
    }
    
    public double DineroDelInvestigador(){
        double total = 0;
        for (int j=0; j < dimL; j++){
            if (v[j].isOtorgado()){
                total = total + v[j].getMonto();
            }
        }
        return total;
    }
    
    public void OtorgarSubsidios(){
        for (int i=0; i<dimL; i++){
            v[i].setOtorgado(true);
        }
    }
    
    public void agregarSubsidio(Subsidio unSubsidio){
        if (cantidadDeSubsidios() < getDimF()){
            v[cantidadDeSubsidios()] = unSubsidio;
            setDimL(cantidadDeSubsidios() + 1);
        }
    }

    @Override
    public String toString() {
        return "Investigador{" + "nomApeInvestigador=" + nomApeInvestigador + ", categoria=" + categoria + 
                "dinero de todos sus subsidios= " + DineroDelInvestigador() + '}';
    }
    
    
    
}
