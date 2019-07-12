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
public class Restricion {
    
    private String Id;
    private String Carreras;
    private String Fecha;
    private String Generacion;
    private String RangoCredito;
    private String Departamento;

    public Restricion(String id,String carreras,String fecha,String generacion,String rango,String Dep){
        this.Id=id;
        this.Carreras=carreras;
        this.Fecha=fecha;
        this.Generacion=generacion;
        this.RangoCredito=rango;
        this.Departamento=Dep;
        
        
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

    /**
     * @return the Carreras
     */
    public String getCarreras() {
        return Carreras;
    }

    /**
     * @param Carreras the Carreras to set
     */
    public void setCarreras(String Carreras) {
        this.Carreras = Carreras;
    }

    /**
     * @return the Fecha
     */
    public String getFecha() {
        return Fecha;
    }

    /**
     * @param Fecha the Fecha to set
     */
    public void setFecha(String Fecha) {
        this.Fecha = Fecha;
    }

    /**
     * @return the Generacion
     */
    public String getGeneracion() {
        return Generacion;
    }

    /**
     * @param Generacion the Generacion to set
     */
    public void setGeneracion(String Generacion) {
        this.Generacion = Generacion;
    }

    /**
     * @return the RangoCredito
     */
    public String getRangoCredito() {
        return RangoCredito;
    }

    /**
     * @param RangoCredito the RangoCredito to set
     */
    public void setRangoCredito(String RangoCredito) {
        this.RangoCredito = RangoCredito;
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
