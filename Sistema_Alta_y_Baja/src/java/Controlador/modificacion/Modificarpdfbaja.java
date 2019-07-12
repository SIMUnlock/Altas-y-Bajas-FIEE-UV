/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.modificacion;

import Modelo.ConsultaAlumno;
import Modelo.ConsultaCargaAcademica;
import Modelo.ConsultarBaja;
import Modelo.PDFBaja;
import Modelo.encapsulados.Alumno;
import Modelo.encapsulados.Baja;
import Modelo.encapsulados.CargaAcademica;
import Modelo.encapsulados.Departamento;
import Modelo.encapsulados.ModificarPDFAlta;
import Modelo.encapsulados.ModificarPDFBaja;
import Modelo.encapsulados.PDF;
import Modelo.encapsulados.RegisAlta;
import Modelo.tablas.TablaDepartamento;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.lowagie.text.DocumentException;
import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.Integer.parseInt;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author trdni
 */
public class Modificarpdfbaja extends HttpServlet {

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
            throws ServletException, IOException, DocumentException {
        response.setContentType("text/html;charset=UTF-8");
        int id2=Integer.parseInt(request.getParameter("n"));
        String id=request.getParameter("ids");
        String carrera=request.getParameter("car");
        String t=request.getParameter("table");
          ConsultaAlumno alu = new ConsultaAlumno();
          Alumno alumno;
        
        Gson gson=new Gson();
         Calendar cal= Calendar.getInstance();
                   
                         int anio = cal.get(Calendar.YEAR);
                         int mes= cal.get(Calendar.MONTH)+1;
                         int minuto=cal.get(Calendar.MINUTE);
                         String min="";
                         if(minuto<10)
                             min=":0"+minuto;
                         else
                             min=":"+minuto;
                         int dia=cal.get(Calendar.DAY_OF_MONTH);
                         String fecha=cal.get(Calendar.DAY_OF_MONTH)+"/"+mes+"/"+anio;
                         String hora=cal.get(Calendar.HOUR_OF_DAY)+min;
        /*String[] vector = id.split(",");
        int tamano = vector.length;     
        LinkedList<Baja>  listaBajas = new LinkedList<>();
        Baja Ba=null;
        int contador=0;*/
        Type tipoObjeto;
        tipoObjeto = new TypeToken<List <ModificarPDFBaja>>(){}.getType();
ArrayList<ModificarPDFBaja> alumnos2=gson.fromJson(t, tipoObjeto);
System.out.println("nJSON A JAVA");
int contador=0;
LinkedList<Baja>  listaBajas = new LinkedList<>();
        Baja Ba=null;
         String M="";
 String nombre="";
 String  apellidop="";
 String apellidom="";
 String Periodo="";
        for(int i=0;i<alumnos2.size();i++){
            ConsultarBaja co = new ConsultarBaja();
            ModificarPDFBaja al=alumnos2.get(i);
            int ids=Integer.parseInt(al.getId());
            Baja AP=co.getBaja(ids);
            
            M=al.getMatricula();
            nombre=al.getNombre();
            apellidop=al.getApellidoP();
            apellidom=al.getApellidoM();
            Periodo=al.getPeriodo();
     
                response.getWriter().println("Exito al guardar Baja");
                
                 Ba = new Baja("","","","","",al.getNRC(),al.getEE(),"","",al.getCredito(),AP.getOportunidad(),AP.getTipo());
                listaBajas.add(Ba);
                contador++;
           
    }
        alumno=alu.VerificarAlumno(M);
        if(contador!=0){
        String path = getServletContext().getRealPath("/pdf/Bajas.pdf");
        
        
        PDF p=null;
        PDFBaja pdf =new PDFBaja();
        PDFBaja pdf1=new PDFBaja();
        PDFBaja pdf2=new PDFBaja();
        //p=pdf1.getPdf(0);
        String path2 ="";
       // int num=p.getId();
        //num=num+1;
        path2= getServletContext().getRealPath("/pdf/Bajas/"+id2+"_"+M+".pdf");
        int idFacuAlum =parseInt(alumno.getFacu());
        String facu="";
        LinkedList<Departamento> listaDe = TablaDepartamento.getDepartamento();
       for (int i=0;i<listaDe.size();i++){
           if(idFacuAlum==listaDe.get(i).getId()){
               facu=""+listaDe.get(i).getNombre();
               break;
           }
       }
                                                        
       
       pdf2.modificar_PDFBaja(id2,"Modificado");
        pdf.crear_pdf(listaBajas,contador, nombre, apellidop,apellidom,path,path2,M,carrera,Periodo,dia,mes,anio,alumno.getcalle(),alumno.getColonia(),alumno.getEntre(),alumno.gettelefono(),facu);
        response.getWriter().println(";"+id2+"_"+M);
       // response.getWriter().println("pdf  "+num);
    }
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
        try {
            processRequest(request, response);
        } catch (DocumentException ex) {
            Logger.getLogger(Modificarpdfbaja.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (DocumentException ex) {
            Logger.getLogger(Modificarpdfbaja.class.getName()).log(Level.SEVERE, null, ex);
        }
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
