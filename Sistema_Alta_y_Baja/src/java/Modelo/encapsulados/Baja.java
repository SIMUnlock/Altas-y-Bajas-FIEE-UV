/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo.encapsulados;

/**
 *
 * @author pedro
 */
public class Baja {
     private String id_BajasV;
    private String Matricula;
    private String Nombre;
    private String ApellidoP;
    private String ApellidoM;
    private String NRC;
    private String EE;
    private String UsuarioB;
    private String Periodo;
    private String credito;
     private String  Oportunidad;
     private String  Tipo;
    
    Baja() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    Baja(String string, String string0, String string1, String string2, String string3, int aInt, String string4, String string5, int aInt0) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public String getid_BajasV() {
        return id_BajasV;
    }

    public void setid_BajasV(String id_BajasV) {
        this.id_BajasV= id_BajasV;
    }

    public String getMatricula() {
        return Matricula;
    }

    
    public void setMatricula(String Matricula) {
        this.Matricula = Matricula;
    }
 
    public String getNombre() {
        return Nombre;
    }
    
    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }
    
    public String getApellidoP() {
        return ApellidoP;
    }

   
    public void setApellidoP(String ApellidoP) {
        this.ApellidoP = ApellidoP;
    }

   
    public String getApellidoM() {
        return ApellidoM;
    }

    
    public void setApellidoM(String ApellidoM) {
        this.ApellidoM = ApellidoM;
    }

    public String getNRC() {
        return NRC;
    }

    
    public void setNRC(String NRC) {
        this.NRC = NRC;
    }
    
     public String getEE() {
        return EE;
    }   
    public void setEE(String EE) {
        this.EE = EE;
    }

  
    public String getUsuarioB() {
        return UsuarioB;
    }

    
    public void setUsuarioB(String UsuarioB) {
        this.UsuarioB = UsuarioB;
    }

    public String getPeriodo() {
        return Periodo;
    }

    
    public void setPeriodo(String Periodo) {
        this.Periodo = Periodo;
    }
   
    
    public Baja(String id_BajasV,String Matricula,String Nombre, String ApellidoP,String ApellidoM,String NRC, String  EE,String UsuarioB,String Periodo,String credito,String Op,String Tipo) {
  super();
  this.id_BajasV=id_BajasV;
  this.Matricula=Matricula;
  this.Nombre=Nombre;
  this.ApellidoP=ApellidoP;
  this.ApellidoM=ApellidoM;
  this.NRC=NRC;
  this.EE=EE;
  this.UsuarioB=UsuarioB;
  this.Periodo=Periodo;
  this.credito=credito;
  this.Oportunidad=Op;
  this.Tipo=Tipo;
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
     * @return the Oportunidad
     */
    public String getOportunidad() {
        return Oportunidad;
    }

    /**
     * @param Oportunidad the Oportunidad to set
     */
    public void setOportunidad(String Oportunidad) {
        this.Oportunidad = Oportunidad;
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
}


