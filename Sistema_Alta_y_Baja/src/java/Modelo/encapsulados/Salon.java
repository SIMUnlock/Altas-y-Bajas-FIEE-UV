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
public class Salon {
    String id;
    String Salon;
    String Climatizado;
    String Proyector;
    String Otros;
   

    Salon() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public String getSalon() {
		return Salon;
	}
	public void setSalon(String Salon) {
		this.Salon = Salon;
	}
    public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
  
         public String getClimatizado() {
		return Climatizado;
	}
	public void setClimatizado(String Climatizado) {
		this.Climatizado= Climatizado;
	}
	
	public String getProyector() {
		return Proyector;
	}
	public void setProyector(String Proyector) {
		this.Proyector = Proyector;
	}
	public String getOtros() {
		return Otros;
	}
	public void setOtros(String Otros) {
		this.Otros = Otros;
	}
        
    
public Salon(String id,String Salon, String Climatizado, String Proyector, String Otros) {
  super();
  this.id=id;
  this.Salon = Salon;
  this.Climatizado = Climatizado;
  this.Proyector = Proyector;
  this.Otros = Otros;
 }

    
}
