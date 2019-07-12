/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.registros;

import Modelo.ConsultaCargaAcademica;
import Modelo.ConsultaCatedratico;
import Modelo.ConsultaDepartamento;
import Modelo.ConsultaEE;
import Modelo.ConsultaSalon;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author trdni
 */
public class RegistrarCargaAcademicaN extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
         HttpSession objsesion = request.getSession(true);
        String  departamento = (String)objsesion.getAttribute("depa");
        int depa=0;
         ConsultaDepartamento dep=new ConsultaDepartamento();
        depa=dep.getdepartamento(departamento);
        
        String exp=request.getParameter("TEE");
        String nrc=request.getParameter("nrc");
        String tipo=request.getParameter("TCAT");
        int hsm=Integer.parseInt(request.getParameter("hsm"));       
        String progc=request.getParameter("prog");
        String academia=request.getParameter("academia");
        String seccion=request.getParameter("seccion");
        String SL=request.getParameter("sl"); 
        String LIH=request.getParameter("LunesIH");       
        String LFH=request.getParameter("LunesFH");
        String SM=request.getParameter("sm"); 
        String MIH=request.getParameter("MarIH");       
        String MFH=request.getParameter("MarFH");
        String SMI=request.getParameter("smi"); 
        String MIIH=request.getParameter("MIIH");        
        String MIFH=request.getParameter("MIFH");
        String SJ=request.getParameter("sj");        
        String JIH=request.getParameter("JIH");        
        String JFH=request.getParameter("JFH");
        String SV=request.getParameter("sv");     
        String VIH=request.getParameter("VIH");       
        String VFH=request.getParameter("VFH");  
        String Periodo=request.getParameter("P");
        String snl=request.getParameter("snl");
        String snm=request.getParameter("snm");
        String snmi=request.getParameter("snmi");
        String snj=request.getParameter("snj");
        String snv=request.getParameter("snv");
        int Cupo=Integer.parseInt(request.getParameter("Cupo"));         
        String TC=request.getParameter("TCATI");
       ConsultaCargaAcademica co = new ConsultaCargaAcademica();
       
       int a=0;
       int b=0;
       int c=0;
       int d=0;
       int e=0;
        ConsultaSalon  LU=new ConsultaSalon();
       ConsultaSalon  MA=new ConsultaSalon();
       ConsultaSalon  MI=new ConsultaSalon();
       ConsultaSalon  JU=new ConsultaSalon();
       ConsultaSalon  VI=new ConsultaSalon();
       int Lunes=LU.getSalonID(SL);
       int Martes=MA.getSalonID(SM);
       int Miercoles=MI.getSalonID(SMI);
       int Jueves=JU.getSalonID(SJ);
       int Viernes=VI.getSalonID(SV);
     /*  
       if(snl.equals("No")){
        
       }else{
           a=co.ValidarTraslapeL(LIH,LFH,Lunes,Periodo); 
       } if(snm.equals("No")){
        
       }else{
           b=co.ValidarTraslapeM(MIH, MFH,Martes,Periodo);
       } if(snmi.equals("No")){
        
       }else{
          c=co.ValidarTraslapeMI(MIIH, MIFH,Miercoles,Periodo);  
       } if(snj.equals("No")){
        
       }else{
          d=co.ValidarTraslapeJ(JIH, JFH,Jueves,Periodo);
       } if(snv.equals("No")){
        
       }else{
           e=co.ValidarTraslapeV(VIH, VFH,Viernes,Periodo);
       }*/
         ConsultaCatedratico CAT= new ConsultaCatedratico();
         ConsultaCatedratico CATI= new ConsultaCatedratico();
         int CATE=CAT.getCatedraticoAPM(tipo);
         int CATED=CATI.getCatedraticoAPM(TC);
       ConsultaEE cre= new ConsultaEE();
       int cred=cre.getEEString(exp);
      /*
       if(a==0)
       {    
           if(b==0)
           {
               if(c==0)
               {
                   if(d==0)
                   {
                       if(e==0)
                       {    */
                           if(co.registrar_carga(Periodo,cred, nrc, CATE, hsm ,progc, academia, seccion, LIH,LFH, MIH, MFH,MIIH,MIFH,JIH,JFH,VIH,VFH,Lunes,Martes,Miercoles,Jueves,Viernes,Cupo,CATED,0,snl,snm,snmi,snj,snv,depa))
                           {
                               response.getWriter().println("Exito al guardar");            
                           }else
                           {
                               response.getWriter().println("Error al guardar");
                           }/*
                       }else response.getWriter().println(5);
                   }else response.getWriter().println(4);
               }else response.getWriter().println(3);
           }else response.getWriter().println(2);
       }else response.getWriter().println(1);*/
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
