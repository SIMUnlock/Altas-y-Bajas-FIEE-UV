/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.registros;

import Modelo.ConsultaAlumno;
import Modelo.ConsultaCargaAcademica;
import Modelo.ConsultaDepartamento;
import Modelo.ConsultarBaja;
import Modelo.PDFBaja;
import Modelo.encapsulados.Alta;
import Modelo.encapsulados.Alumno;
import Modelo.encapsulados.Baja;
import Modelo.encapsulados.CargaAcademica;
import Modelo.encapsulados.Departamento;
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author trdni
 */
public class RegistrarBaja extends HttpServlet {

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
        HttpSession objsesion = request.getSession(true);
        String  departamento = (String)objsesion.getAttribute("depa");
        Alumno  sinmatricula = (Alumno)objsesion.getAttribute("sin");
        
        //PDF
        PDF p=null;
        PDFBaja pdf1=new PDFBaja();
        p=pdf1.getPdf(0);
        int num=p.getId();
        num=num+1;
        
        
        int depa=0;
        ConsultaDepartamento dep=new ConsultaDepartamento();
        depa=dep.getdepartamento(departamento);
        ConsultaAlumno alu = new ConsultaAlumno();
        
        
       String id=request.getParameter("ids");
        String nombre=request.getParameter("N");
        String apellidop=request.getParameter("AP");
        String apellidom=request.getParameter("AM");
        String usuario=request.getParameter("user"); 
        String Periodo=request.getParameter("P"); 
        String M=request.getParameter("MAT"); 
        String carrera=request.getParameter("car");
        String t=request.getParameter("table");
        Alumno alumno;
        if(sinmatricula==null){
        M=request.getParameter("MAT"); 
        alumno=alu.VerificarAlumno(M);
       }else{
           M=sinmatricula.getMatricula()+num;
           alumno=sinmatricula;
           HttpSession sesion = request.getSession(true);
           sesion.removeValue("sin");
       }
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
        tipoObjeto = new TypeToken<List <RegisAlta>>(){}.getType();
ArrayList<RegisAlta> alumnos2=gson.fromJson(t, tipoObjeto);
System.out.println("nJSON A JAVA");
int contador=0;
LinkedList<Baja>  listaBajas = new LinkedList<>();
        Baja Ba=null;
        for(int i=0;i<alumnos2.size();i++){
            RegisAlta al=alumnos2.get(i);
        
        ConsultarBaja co = new ConsultarBaja();
        ConsultaCargaAcademica car = new  ConsultaCargaAcademica();
         ConsultaCargaAcademica carg = new  ConsultaCargaAcademica();
        ConsultarBaja RegistroM = new ConsultarBaja();
       // String aa=vector[i];
        int ide;
            ide = Integer.parseInt(al.getId());
             
         CargaAcademica cup=car.getCarga(ide);
        int cupo=Integer.parseInt(cup.getCupo());       
        int SINO= RegistroM.Checar_Matricula(M,cup.getNRC());
        if(SINO==0){
        if(cupo>0)
        {   int cupoN = cupo-1;
            if(carg.Dar_Alta(ide,cupoN))
            { int ida=Integer.parseInt(alumno.getId());
            if(co.registrar_Baja(ida,cup.getNRC(), cup.getEE(),usuario,Periodo,fecha,hora,cup.getCredito(),depa,al.getOportunidad(),al.getTipo())){
                response.getWriter().println("Exito al guardar Baja");
                
                 Ba = new Baja("","","","","",cup.getNRC(),cup.getEE(),"","",cup.getCredito(),al.getOportunidad(),al.getTipo());
                listaBajas.add(Ba);
                contador++;
            }else{
                response.getWriter().println("No se pudo guardar la Baja");
            }
            }
            else response.getWriter().println("No se pudo Guardar el cupo de Baja ");
        }else 
            response.getWriter().println("El cupo es cero no se puede dar de Baja  ");
        }else
            response.getWriter().println("Materia:"+cup.getEE()+" "+"ya dada de Baja");
    }
        if(contador!=0){
        String path = getServletContext().getRealPath("/pdf/Bajas.pdf");
        
                int idFacuAlum =parseInt(alumno.getFacu());
        String facu="";
        LinkedList<Departamento> listaDe = TablaDepartamento.getDepartamento();
       for (int i=0;i<listaDe.size();i++){
           if(idFacuAlum==listaDe.get(i).getId()){
               facu=""+listaDe.get(i).getNombre();
               break;
           }
       }
           
       
        PDFBaja pdf =new PDFBaja();
        
        PDFBaja pdf2=new PDFBaja();
        
        String path2 ="";
        
        path2= getServletContext().getRealPath("/pdf/Bajas/"+num+"_"+M+".pdf");
               int ida=Integer.parseInt(alumno.getId());
       pdf2.registrar_pdf(ida,Periodo,fecha,hora,carrera,"Original",depa);
        pdf.crear_pdf(listaBajas,contador, nombre, apellidop,apellidom,path,path2,M,carrera,Periodo,dia,mes,anio,alumno.getcalle(),alumno.getColonia(),alumno.getEntre(),alumno.gettelefono(),facu);
        response.getWriter().println(";"+num+"_"+M);
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
            Logger.getLogger(RegistrarBaja.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(RegistrarBaja.class.getName()).log(Level.SEVERE, null, ex);
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
