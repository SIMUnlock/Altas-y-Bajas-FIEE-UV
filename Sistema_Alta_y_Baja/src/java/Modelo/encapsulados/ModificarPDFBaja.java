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
public class ModificarPDFBaja {
     private String ID;
     private String Periodo;
     private String Matricula;
    private String Nombre;
    private String Apellido_Paterno;
    private String Apellido_Materno;
    private String NRC;
     private String Experiencia_Educativa;
     private String Credito;
    private String Usuario;
      private String Oportunidad;
     private String Tipo;
    private String Acciones;
    
   
    
    public String getId() {
        return ID;
    }

    public void setId(String id) {
        this.ID = id;
    }

    public String getNombre() {
        return Nombre;
    }

    
    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    
    public String getApellidoP() {
        return Apellido_Paterno;
    }

   
    public void setApellidoP(String ApellidoP) {
        this.Apellido_Paterno = ApellidoP;
    }

   
    public String getApellidoM() {
        return Apellido_Materno;
    }

    
    public void setApellidoM(String ApellidoM) {
        this.Apellido_Materno = ApellidoM;
    }

    public String getMatricula() {
        return Matricula;
    }

    
    public void setMatricula(String Matricula) {
        this.Matricula = Matricula;
    }
    
     public String getEE() {
        return Experiencia_Educativa;
    }   
    public void setEE(String EE) {
        this.Experiencia_Educativa = EE;
    }

  
    public String getNRC() {
        return NRC;
    }

    
    public void setNRC(String NRC) {
        this.NRC = NRC;
    }
    
    

      public String getPeriodo() {
        return Periodo;
    }

    
    public void setPeriodo(String Periodo) {
        this.Periodo = Periodo;
    }
  
    
    public ModificarPDFBaja(String ID,String Periodo,String Matricula,String Nombre,String ApellidoP,String ApellidoM,String NRC,String EE,String Credito,String Usuario,String Acciones,String Op,String tipo) {
  super();
  this.ID=ID;
  this.Nombre=Nombre;
  this.Apellido_Paterno=ApellidoP;
  this.Apellido_Materno=ApellidoM;
  this.Matricula=Matricula;
  this.Experiencia_Educativa=EE;
  this.NRC=NRC;
  this.Periodo=Periodo;
  this.Credito=Credito;
  this.Usuario=Usuario;
  this.Oportunidad=Op;
  this.Tipo=tipo;
  this.Acciones=Acciones;
          
  
 }

    /**
     * @return the Usuario
     */
    public String getUsuario() {
        return Usuario;
    }

    /**
     * @param Usuario the Usuario to set
     */
    public void setUsuario(String Usuario) {
        this.Usuario = Usuario;
    }

    /**
     * @return the Acciones
     */
    public String getAcciones() {
        return Acciones;
    }

    /**
     * @param Acciones the Acciones to set
     */
    public void setAcciones(String Acciones) {
        this.Acciones = Acciones;
    }

    /**
     * @return the Credito
     */
    public String getCredito() {
        return Credito;
    }

    /**
     * @param Credito the Credito to set
     */
    public void setCredito(String Credito) {
        this.Credito = Credito;
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
