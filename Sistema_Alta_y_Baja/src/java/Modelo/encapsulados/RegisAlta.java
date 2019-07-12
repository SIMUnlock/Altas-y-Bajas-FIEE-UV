/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.encapsulados;

/**
 *
 * @author trdni
 */
public class RegisAlta {
        private String ID;
    private String NRC;
    private String Experiencia_Educativa;
    private String credito;
    private String L;
    private String M;
    private String MI;
    private String J;
    private String V;
    private String Oportunidad;
    private String Tipo;


 public RegisAlta(String id,String Nrc,String EE,String Lunes,String Martes,String Miercoles,String Jueves,String Viernes,String opo,String tipo){
   
     NRC=Nrc;
     Experiencia_Educativa=EE;
     ID=id;
     L=Lunes;
     M=Martes;
     MI=Miercoles;
     J=Jueves;
     V=Viernes;
     Oportunidad=opo;
     Tipo=tipo;
    
 }
    /**
     * @return the id
     */
    public String getId() {
        return ID;
    }

    /**
     * @param id the id to set
     */
    public void setId(String id) {
        this.ID = id;
    }

    /**
     * @return the nrc
     */
    public String getNrc() {
        return NRC;
    }

    /**
     * @param nrc the nrc to set
     */
    public void setNrc(String nrc) {
        this.NRC = nrc;
    }

    /**
     * @return the EE
     */
    public String getEE() {
        return Experiencia_Educativa;
    }

    /**
     * @param EE the EE to set
     */
    public void setEE(String EE) {
        this.Experiencia_Educativa = EE;
    }

    /**
     * @return the L
     */
    public String getL() {
        return L;
    }

    /**
     * @param L the L to set
     */
    public void setL(String L) {
        this.L = L;
    }

    /**
     * @return the M
     */
    public String getM() {
        return M;
    }

    /**
     * @param M the M to set
     */
    public void setM(String M) {
        this.M = M;
    }

    /**
     * @return the MI
     */
    public String getMI() {
        return MI;
    }

    /**
     * @param MI the MI to set
     */
    public void setMI(String MI) {
        this.MI = MI;
    }

    /**
     * @return the J
     */
    public String getJ() {
        return J;
    }

    /**
     * @param J the J to set
     */
    public void setJ(String J) {
        this.J = J;
    }

    /**
     * @return the V
     */
    public String getV() {
        return V;
    }

    /**
     * @param V the V to set
     */
    public void setV(String V) {
        this.V = V;
    }

    /**
     * @return the credito
     */
    public String getCredito() {
        return credito;
    }

    /**
     * @param credito the credito to set
     */
    public void setCredito(String credito) {
        this.credito = credito;
    }

    /**
     * @return the oportunidad
     */
    public String getOportunidad() {
        return Oportunidad;
    }

    /**
     * @param oportunidad the oportunidad to set
     */
    public void setOportunidad(String oportunidad) {
        this.Oportunidad = oportunidad;
    }

    /**
     * @return the Tipo
     */
    public String getTipo() {
        return Tipo;
    }

    /**
     * @param Tipo the Tipo to set
     */
    public void setTipo(String Tipo) {
        this.Tipo = Tipo;
    }

    /**
     * @return the alta
     */
  
  
    
}
