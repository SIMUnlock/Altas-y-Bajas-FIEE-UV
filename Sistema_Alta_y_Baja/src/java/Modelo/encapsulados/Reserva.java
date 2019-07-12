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
public class Reserva {
    private String Id;
    private String Matricula;
    private String Nombre;
    private String AP;
    private String AM;
    private String tiempo;

    /**
     * @return the Matricula
     */
    public String getMatricula() {
        return Matricula;
    }

    /**
     * @param Matricula the Matricula to set
     */
    public void setMatricula(String Matricula) {
        this.Matricula = Matricula;
    }

    /**
     * @return the Nombre
     */
    public String getNombre() {
        return Nombre;
    }

    /**
     * @param Nombre the Nombre to set
     */
    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    /**
     * @return the AP
     */
    public String getAP() {
        return AP;
    }

    /**
     * @param AP the AP to set
     */
    public void setAP(String AP) {
        this.AP = AP;
    }

    /**
     * @return the AM
     */
    public String getAM() {
        return AM;
    }

    /**
     * @param AM the AM to set
     */
    public void setAM(String AM) {
        this.AM = AM;
    }
    
    public Reserva(String id,String M,String N,String AP,String AM,String tiempo) {
  super();
  this.Id=id;
  this.Matricula=M;
  this.Nombre=N;
  this.AP=AP;
  this.AM=AM;
  this.tiempo=tiempo;
  }

    /**
     * @return the tiempo
     */
    public String getTiempo() {
        return tiempo;
    }

    /**
     * @param tiempo the tiempo to set
     */
    public void setTiempo(String tiempo) {
        this.tiempo = tiempo;
    }

    /**
     * @return the Id
     */
    public String getId() {
        return Id;
    }

    /**
     * @param Id the Id to set
     */
    public void setId(String Id) {
        this.Id = Id;
    }
    
}
