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
public class Usuario {
    String id;
    String Nombre;
    String ApellidoP;
    String ApellidoM;
    String Usuario;
    String Contrasena;
    String Tipo;
    private String Departamento;

    Usuario() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
    public String getTipo() {
		return Tipo;
	}
	public void setTipo(String Tipo) {
		this.Tipo = Tipo;
	}
    public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	
	public String getNombre() {
		return Nombre;
	}
	public void setNombre(String Nombre) {
		this.Nombre = Nombre;
	}
	public String getUsuario() {
		return Usuario;
	}
	public void setUsuario(String Usuario) {
		this.Usuario = Usuario;
	}
        public String getContrasena() {
		return Contrasena;
	}
	public void setContrasena(String Contrasena) {
		this.Contrasena = Contrasena;
	}
    
public Usuario(String id,String nombre, String apellidop, String apellidom, String usuario, String clave,String tipo,String departamento ) {
  super();
  this.id=id;
  this.Nombre = nombre;
  this.ApellidoP = apellidop;
  this.ApellidoM = apellidom;
  this.Usuario = usuario;
  this.Contrasena = clave;
  this.Tipo= tipo;
  this.Departamento=departamento;
 }

    /**
     * @return the Departamento
     */
    public String getDepartamento() {
        return Departamento;
    }

    /**
     * @param Departamento the Departamento to set
     */
    public void setDepartamento(String Departamento) {
        this.Departamento = Departamento;
    }
}