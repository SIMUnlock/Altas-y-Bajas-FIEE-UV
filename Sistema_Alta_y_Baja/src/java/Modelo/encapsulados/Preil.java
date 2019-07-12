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
public class Preil {
     private String id;
    private String EE;
    private String NRC;
    private String LO;
    private String CupoM;
    private String CL;
    private String P;
Preil() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    /**
     * @return the id
     */
    public String getId() {
        return id;
    }

    /**
     * @param id the id to set
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * @return the EE
     */
    public String getEE() {
        return EE;
    }

    /**
     * @param EE the EE to set
     */
    public void setEE(String EE) {
        this.EE = EE;
    }

    /**
     * @return the NRC
     */
    public String getNRC() {
        return NRC;
    }

    /**
     * @param NRC the NRC to set
     */
    public void setNRC(String NRC) {
        this.NRC = NRC;
    }

    /**
     * @return the LC
     */
    public String getLO() {
        return LO;
    }

    /**
     * @param LC the LC to set
     */
    public void setLO(String LO) {
        this.LO = LO;
    }

    /**
     * @return the CupoM
     */
    public String getCupoM() {
        return CupoM;
    }

    /**
     * @param CupoM the CupoM to set
     */
    public void setCupoM(String CupoM) {
        this.CupoM = CupoM;
    }

    /**
     * @return the CL
     */
    public String getCL() {
        return CL;
    }

    /**
     * @param CL the CL to set
     */
    public void setCL(String CL) {
        this.CL = CL;
    }
    
     /**
     * @return the P
     */
    public String getPeriodo() {
        return P;
    }

    /**
     * @param P the P to set
     */
    public void setPeriodo(String P) {
        this.P = P;
    }
    
    public Preil(String id,String LO,String CL,String CupoM,String P,String EE,String NRC) {
  super();
  this.id=id;
  this.EE=EE;
  this.NRC=NRC;
  this.LO=LO;
  this.CupoM=CupoM;
  this.CL=CL;
  this.P=P; 
    }
    
}
