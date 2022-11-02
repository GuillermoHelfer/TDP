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
public class EventoOcasional extends Recital{
    private String motivo;
    private String nomContratador;
    private int dia;

    public EventoOcasional(String nombre, int cant, String motivo, String nomContratador, int dia) {
        super(nombre, cant);
        this.motivo = motivo;
        this.nomContratador = nomContratador;
        this.dia = dia;
    }

    public String getMotivo() {
        return motivo;
    }

    public String getNomContratador() {
        return nomContratador;
    }

    public int getDia() {
        return dia;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public void setNomContratador(String nomContratador) {
        this.nomContratador = nomContratador;
    }

    public void setDia(int dia) {
        this.dia = dia;
    }

    @Override
    public void actuar (){
        if(getMotivo().toUpperCase().equals("show de beneficiencia"))
            System.out.println("Recuerden colaborar con… " + this.getNomContratador());
        else{
            if(getMotivo().toUpperCase().equals("show de tv"))
                System.out.println("Saludos amigos televidentes... ");
            else
                System.out.println("Un feliz cumpleaños para... " + this.getNomContratador());
        }
        for (int i=0; i< super.getDimL(); i++){
            System.out.println("/n y ahora tocaremos... " + super.getTemas()[i]);
        }
    }

    @Override
    public boolean finalizado() {
        return(super.getDimL() > super.getDimF());
    }

    @Override
    public double calcularCosto() {
        if(getMotivo().toUpperCase().equals("show de beneficiencia"))
            return 0;
        else{
            if(getMotivo().toUpperCase().equals("show de tv"))
                return 50000;
            else
                return 150000;
        }
    }
    
    
    
}
