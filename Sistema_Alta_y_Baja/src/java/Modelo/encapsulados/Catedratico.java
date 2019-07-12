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
public class Catedratico {
    private String id;
    private String Nombre;
    private String ApellidoP;
    private String ApellidoM;
    private String Puesto;
    private String Categoria;
    private String Plaza;
    private int Fecha;
    private int Antiguedad;
    
     Catedratico() {
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

    public String getPuesto() {
        return Puesto;
    }

    
    public void setPuesto(String Puesto) {
        this.Puesto = Puesto;
    }
    
     public String getCategoria() {
        return Categoria;
    }   
    public void setCategoria(String Categoria) {
        this.Categoria = Categoria;
    }

  
    public String getPlaza() {
        return Plaza;
    }

    
    public void setPlaza(String Plaza) {
        this.Plaza = Plaza;
    }

  
    public int getFecha() {
        return Fecha;
    }


    public void setFecha(int Fecha) {
        this.Fecha = Fecha;
    }

    public int getAntiguedad() {
        return Antiguedad;
    }

    
    public void setAntiguedad(int Antiguedad) {
        this.Antiguedad = Antiguedad;
    }
    public Catedratico(String id,String Nombre,String ApellidoP,String ApellidoM,String Puesto,int Antiguedad,String Categoria,String Plaza,int Fecha) {
  super();
  this.id=id;
  this.Nombre=Nombre;
  this.ApellidoP=ApellidoP;
  this.ApellidoM=ApellidoM;
  this.Puesto=Puesto;
  this.Antiguedad=Antiguedad;
  this.Categoria=Categoria;
  this.Plaza=Plaza;
  this.Fecha=Fecha;
 }
}
