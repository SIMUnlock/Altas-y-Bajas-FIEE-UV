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
public class Alta {
     private String id;
    private String Nombre;
    private String ApellidoP;
    private String ApellidoM;
    private String Matricula;
    private String EE;
    private String NRC;
    private String UsuarioA;
    private String Periodo;
    private String  Oportunidad;
    private String  Tipo;
    
    Alta() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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

    public String getMatricula() {
        return Matricula;
    }

    
    public void setMatricula(String Matricula) {
        this.Matricula = Matricula;
    }
    
     public String getEE() {
        return EE;
    }   
    public void setEE(String EE) {
        this.EE = EE;
    }

  
    public String getNRC() {
        return NRC;
    }

    
    public void setNRC(String NRC) {
        this.NRC = NRC;
    }
    
    public String getUsuarioA() {
        return UsuarioA;
    }

    
    public void setUsuarioA(String UsuarioA) {
        this.UsuarioA = UsuarioA;
    }

      public String getPeriodo() {
        return Periodo;
    }

    
    public void setPeriodo(String Periodo) {
        this.Periodo = Periodo;
    }
  
    
    public Alta(String id,String Matricula,String Nombre,String ApellidoP,String ApellidoM,String NRC,String EE,String UsuarioA,String Periodo,String Op,String Tipo) {
  super();
  this.id=id;
  this.Nombre=Nombre;
  this.ApellidoP=ApellidoP;
  this.ApellidoM=ApellidoM;
  this.Matricula=Matricula;
  this.Matricula=Matricula;
  this.EE=EE;
  this.NRC=NRC;
  this.UsuarioA=UsuarioA;
  this.Periodo=Periodo;
  this.Oportunidad=Op;
  this.Tipo=Tipo;
  
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
