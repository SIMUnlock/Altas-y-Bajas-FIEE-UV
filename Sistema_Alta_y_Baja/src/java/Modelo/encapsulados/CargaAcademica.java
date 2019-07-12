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
public class CargaAcademica {
    private String id;
    private String Periodo;
    private String EE;
    private String NRC;
    private String Catedratico;
    private String HSM;
    private String Programa;
    private String Academia;
    private String Seccion; private String Linicio;
    private String Lfin;
    private String Minicio;
    private String Mfin; 
    private String MIinicio;
    private String MIfin;
    private String Jinicio;
    private String Jfin;
    private String Vinicio; private String Vfin;
    private String SL;
    private String SM;
    private String SMI;
    private String SJ;
    private String SV;
    private String CupoM;

    private String Cupo;
    private String Credito;
    private String TIC;
    private String TICP;
    private String TICM;
    private String CatedraticoP;
    private String CatedraticoM;
    private String Departamento;
     CargaAcademica() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
   
    public String getId() {
        return id;
    }

    
    public void setId(String id) {
        this.id = id;
    }

   
    public String getPeriodo() {
        return Periodo;
    }

    
    public void setPeriodo(String Periodo) {
        this.Periodo = Periodo;
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

    public String getCatedratico() {
        return Catedratico;
    }

   
    public void setCatedratico(String Catedratico) {
        this.Catedratico = Catedratico;
    }

    public String getHSM() {
        return HSM;
    }

   
    public void setHSM(String HSM) {
        this.HSM = HSM;
    }

    
    public String getPrograma() {
        return Programa;
    }

   
    public void setPrograma(String Programa) {
        this.Programa = Programa;
    }

   
    public String getAcademia() {
        return Academia;
    }

   
    public void setAcademia(String Academia) {
        this.Academia = Academia;
    }

   
    public String getSeccion() {
        return Seccion;
    }

   
    public void setSeccion(String Seccion) {
        this.Seccion = Seccion;
    }

   
    public String getLinicio() {
        return Linicio;
    }

    
    public void setLinicio(String Linicio) {
        this.Linicio = Linicio;
    }

    
    public String getLfin() {
        return Lfin;
    }

  
    public void setLfin(String Lfin) {
        this.Lfin = Lfin;
    }

   
    public String getMinicio() {
        return Minicio;
    }

   
    public void setMinicio(String Minicio) {
        this.Minicio = Minicio;
    }

    
    public String getMfin() {
        return Mfin;
    }

    public void setMfin(String Mfin) {
        this.Mfin = Mfin;
    }

   
    public String getMIinicio() {
        return MIinicio;
    }

   
    public void setMIinicio(String MIinicio) {
        this.MIinicio = MIinicio;
    }

   
    public String getMIfin() {
        return MIfin;
    }

   
    public void setMIfin(String MIfin) {
        this.MIfin = MIfin;
    }

   
    public String getJinicio() {
        return Jinicio;
    }

    
    public void setJinicio(String Jinicio) {
        this.Jinicio = Jinicio;
    }

    public String getJfin() {
        return Jfin;
    }

    
    public void setJfin(String Jfin) {
        this.Jfin = Jfin;
    }

  
    public String getVinicio() {
        return Vinicio;
    }

   
    public void setVinicio(String Vinicio) {
        this.Vinicio = Vinicio;
    }

    
    public String getVfin() {
        return Vfin;
    }

   
    public void setVfin(String Vfin) {
        this.Vfin = Vfin;
    }

   
    public String getSL() {
        return SL;
    }

   
    public void setSL(String SL) {
        this.SL = SL;
    }

    
    public String getSM() {
        return SM;
    }

    public void setSM(String SM) {
        this.SM = SM;
    }

    
    public String getSMI() {
        return SMI;
    }

    
    public void setSMI(String SMI) {
        this.SMI = SMI;
    }

   
    public String getSJ() {
        return SJ;
    }

   
    public void setSJ(String SJ) {
        this.SJ = SJ;
    }

    public String getSV() {
        return SV;
    }

    
    public void setSV(String SV) {
        this.SV = SV;
    }

    
    public String getCupoM() {
        return CupoM;
    }

  
    public void setCupoM(String CupoM) {
        this.CupoM = CupoM;
    }

 
   

   
    public String getCupo() {
        return Cupo;
    }

   
    public void setCupo(String Cupo) {
        this.Cupo = Cupo;
    }
    
     public String getCredito() {
        return Credito;
    }

   
    public void setCredito(String Credito) {
        this.Credito = Credito;
    }
    
    
    
   public CargaAcademica(String id, String NRC,String EE,String Credito,String TIC,String TICP,String TICM, String Catedratico, String CatedraticoP, String CatedraticoM, String HSM,String Programa, String Academia, String Seccion, String SL,String Linicio, String Lfin,String SM,String Minicio, String Mfin,String SMI, String MIinicio, String MIfin,String SJ,String Jinicio,String Jfin,String SV, String Vinicio, String Vfin,String Cupo,String CupoM) {
  super();
  this.id=id; 
    this.Periodo= Periodo;
    this.EE=EE;
    this.NRC=NRC;
    this.Catedratico=Catedratico;
    this.CatedraticoP=CatedraticoP;
    this.CatedraticoM=CatedraticoM;
    this.HSM=HSM;
    this.Programa=Programa;
    this.Academia=Academia;
    this.Seccion=Seccion; 
     this.Linicio=Linicio;
    this.Lfin=Lfin;
    this.Minicio=Minicio;
    this.Mfin=Mfin; 
    this.MIinicio=MIinicio;
    this.MIfin=MIfin;
    this.Jinicio=Jinicio;
    this.Jfin=Jfin;
    this.Vinicio=Vinicio;
    this.Vfin=Vfin;
    this.SL=SL;
    this.SM=SM;
    this.SMI=SMI;
    this.SJ=SJ;
    this.SV=SV;
    this.CupoM=CupoM;
    this.TIC=TIC;
    this.TICP=TICP;
    this.TICM=TICM;
    this.Cupo=Cupo;
    this.Credito=Credito;
    
 }

    /**
     * @return the TIC
     */
    public String getTIC() {
        return TIC;
    }

    /**
     * @param TIC the TIC to set
     */
    public void setTIC(String TIC) {
        this.TIC = TIC;
    }

    /**
     * @return the TICP
     */
    public String getTICP() {
        return TICP;
    }

    /**
     * @param TICP the TICP to set
     */
    public void setTICP(String TICP) {
        this.TICP = TICP;
    }

    /**
     * @return the TICM
     */
    public String getTICM() {
        return TICM;
    }

    /**
     * @param TICM the TICM to set
     */
    public void setTICM(String TICM) {
        this.TICM = TICM;
    }

    /**
     * @return the CatedraticoP
     */
    public String getCatedraticoP() {
        return CatedraticoP;
    }

    /**
     * @param CatedraticoP the CatedraticoP to set
     */
    public void setCatedraticoP(String CatedraticoP) {
        this.CatedraticoP = CatedraticoP;
    }

    /**
     * @return the CatedraticoM
     */
    public String getCatedraticoM() {
        return CatedraticoM;
    }

    /**
     * @param CatedraticoM the CatedraticoM to set
     */
    public void setCatedraticoM(String CatedraticoM) {
        this.CatedraticoM = CatedraticoM;
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