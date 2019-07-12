package Modelo.encapsulados;


public class ExperienciaEducativa {
    String EE;
    String id;
    String Creditos;
    private String PA;

     ExperienciaEducativa() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    public String getEE() {
        return EE;
    }

    public void setEE(String EE) {
        this.EE = EE;
    }
     public String getCreditos() {
        return Creditos;
    }

    public void setCreditos(String Creditos) {
        this.Creditos = Creditos;
    }
    public String getId() {
        return id;
    }
  
    public void setId(String id) {
        this.id = id;
    }
    public ExperienciaEducativa(String id,String EE,String Creditos,String PA) {
  super();
  this.id=id;
  this.EE=EE;
  this.Creditos=Creditos;
  this.PA=PA;
 }

    /**
     * @return the PA
     */
    public String getPA() {
        return PA;
    }

    /**
     * @param PA the PA to set
     */
    public void setPA(String PA) {
        this.PA = PA;
    }
}
