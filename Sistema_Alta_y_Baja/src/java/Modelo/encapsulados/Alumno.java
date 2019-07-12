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
public class Alumno {
    
    private String id;
    private String Matricula;
    private String Nombre;
    private String AP;
    private String AM;
    private String calle;
    private String telefono;
    private String Carrera;
    private String colonia;
    private String entre;
    private String tel2;
    private String Nombre2;
    private String telSeg;
    private String facu;

 
    public Alumno(String id,String Matricula,String Nombre,String AP,String AM,String Dir,String Dir2,String Carrera,String colonia,String entre,String tel2,String nombre2,String telSeg,String facu){
        this.id=id;
        this.Matricula=Matricula;
        this.Nombre=Nombre;
        this.AP=AP;
        this.AM=AM;
        this.calle=Dir;
        this.telefono=Dir2;
        this.Carrera=Carrera;
        this.entre=entre;
        this.Nombre2=nombre2;
        this.tel2=tel2;
        this.colonia=colonia;
        this.telSeg = telSeg;
        this.facu = facu;
    }

    /**
     * @return the id
     */
       public String getFacu() {
        return facu;
    }

    public void setFacu(String facu) {
        this.facu = facu;
    }
    
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

    public String getCalle() {
        return calle;
    }

    public void setCalle(String calle) {
        this.calle = calle;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getTelSeg() {
        return telSeg;
    }

    public void setTelSeg(String telSeg) {
        this.telSeg = telSeg;
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

    /**
     * @return the Dir
     */
    public String getcalle() {
        return calle;
    }

    /**
     * @param Dir the Dir to set
     */
    public void setcalle(String Dir) {
        this.calle = Dir;
    }

    /**
     * @return the Dir2
     */
    public String gettelefono() {
        return telefono;
    }

    /**
     * @param Dir2 the Dir2 to set
     */
    public void settelefono(String Dir2) {
        this.telefono = Dir2;
    }

    /**
     * @return the Carrera
     */
    public String getCarrera() {
        return Carrera;
    }

    /**
     * @param Carrera the Carrera to set
     */
    public void setCarrera(String Carrera) {
        this.Carrera = Carrera;
    }

    /**
     * @return the colonia
     */
    public String getColonia() {
        return colonia;
    }

    /**
     * @param colonia the colonia to set
     */
    public void setColonia(String colonia) {
        this.colonia = colonia;
    }

    /**
     * @return the entre
     */
    public String getEntre() {
        return entre;
    }

    /**
     * @param entre the entre to set
     */
    public void setEntre(String entre) {
        this.entre = entre;
    }

    /**
     * @return the tel2
     */
    public String getTel2() {
        return tel2;
    }

    /**
     * @param tel2 the tel2 to set
     */
    public void setTel2(String tel2) {
        this.tel2 = tel2;
    }

    /**
     * @return the Nombre2
     */
    public String getNombre2() {
        return Nombre2;
    }

    /**
     * @param Nombre2 the Nombre2 to set
     */
    public void setNombre2(String Nombre2) {
        this.Nombre2 = Nombre2;
    }
    
}
