/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.registros;

import java.util.List;
import Modelo.ConsultaAlta;
import Modelo.ConsultaAlumno;
import Modelo.ConsultaCargaAcademica;
import Modelo.ConsultaDepartamento;
import Modelo.ConsultarPDF;
import Modelo.encapsulados.Alta;
import Modelo.encapsulados.Alumno;
import Modelo.encapsulados.CargaAcademica;
import Modelo.encapsulados.PDF;
import Modelo.encapsulados.RegisAlta;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.lowagie.text.DocumentException;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Type;
import static java.nio.file.Files.list;
import static java.rmi.Naming.list;

import java.util.ArrayList;
import java.util.Calendar;
import static java.util.Collections.list;
import java.util.LinkedList;
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
public class RegistrarAlta extends HttpServlet {

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
        ConsultarPDF pdf1=new ConsultarPDF();
        p=pdf1.getPdf(0);
        int num=p.getId();
        num=num+1;
        
        
        
        int depa=0;
        ConsultaDepartamento dep=new ConsultaDepartamento();
        depa=dep.getdepartamento(departamento);
        ConsultaAlumno alu = new ConsultaAlumno();
        ConsultaAlumno alusin = new ConsultaAlumno(); 
        
       String id=request.getParameter("ids");
       String nombre=request.getParameter("N");
       String t=request.getParameter("table");
       String apellidop=request.getParameter("AP");
       String apellidom=request.getParameter("AM");
       String usuario=request.getParameter("user");
       String tipo=request.getParameter("tipo");
       String Periodo=request.getParameter("P");
       String Carrera=request.getParameter("ing");
       
       String M;
       Alumno alumno;
       if(sinmatricula==null){
        M=request.getParameter("MAT"); 
        alumno=alu.VerificarAlumno(M);
       }else{
           M=sinmatricula.getMatricula()+num;
           alumno=sinmatricula;
           alusin.registrar_Alumno(M, alumno.getNombre(), alumno.getAP(),alumno.getAM(),alumno.getcalle(), alumno.gettelefono(), alumno.getCarrera(), alumno.getColonia(), alumno.getEntre(), alumno.getTel2(),alumno.getNombre2(),alumno.getTelSeg(),alumno.getFacu());
           alumno=alu.VerificarAlumno(M);
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
 /*       ArrayList<Alumno> alumnos = new ArrayList();
Alumno alum1=new Alumno("Jose Perez",2,'A',10);
Alumno alum2=new Alumno("Jonathan Melgoza",3,'B',7);
Alumno alum3=new Alumno("Alexandra Ceballos",1,'A',8);
//agregamos los alumnos a una lista
alumnos.add(alum1);
alumnos.add(alum2);
alumnos.add(alum3);
//convertimos la lista de alumnos a formato JSON
String formatoJSON = gson.toJson(alumnos);
//imprimimos en consola el texto con formato JSON
System.out.println("Texto en Formato JSON de los alumnos agregados:n"+formatoJSON);
*/
        Type tipoObjeto;
        tipoObjeto = new TypeToken<List <RegisAlta>>(){}.getType();
ArrayList<RegisAlta> alumnos2=gson.fromJson(t, tipoObjeto);
System.out.println("nJSON A JAVA");
int contador=0;
LinkedList<Alta>  listaAltas = new LinkedList<>();

        Alta Ba=null;

for(int i=0;i<alumnos2.size();i++){
 RegisAlta al=alumnos2.get(i);
// response.getWriter().println("Exito al guardar Alta"+al.getEE()+al.getId()+al.getNrc());
//}




        
        
       // String[] vector = id.split(",");
        //int tamano = vector.length; 
        
        
       //for(int i=0;i<tamano;i++){
        ConsultaAlta co = new ConsultaAlta();
        ConsultaCargaAcademica car = new ConsultaCargaAcademica();
        ConsultaCargaAcademica carg = new ConsultaCargaAcademica();
        ConsultaCargaAcademica carga = new ConsultaCargaAcademica();
        ConsultaAlta RegistroM = new ConsultaAlta();
        //String aa=vector[i];
        int ide;
            ide = Integer.parseInt(al.getId());
             
         CargaAcademica cup=car.getCarga(ide);
        int cupo=Integer.parseInt(cup.getCupo());
        int Max=Integer.parseInt(cup.getCupoM());
        int cupoN = cupo+1;
        int SINO= RegistroM.Checar_Matricula(M,cup.getNRC());
        if(SINO==0){
            
         if( tipo.equals("superusuario")|| cupo<Max )
        {   
            
             if(cupo==Max && tipo.equals("superusuario"))
                {
                    int c=Max+1;
                    carga.aumentar_Cupo(ide,c);
                }
            
            if(carg.Dar_Alta(ide,cupoN))
            {
                int ida=Integer.parseInt(alumno.getId());
            if(co.registrar_Alta(ida,cup.getNRC(),cup.getEE(),usuario,Periodo,fecha,hora,depa,al.getOportunidad(),al.getTipo())){
                response.getWriter().println("Exito al guardar Alta"+ " " + cup.getEE());
                Ba = new Alta(" ",M, nombre, apellidop,apellidom,cup.getNRC(),cup.getEE(),Carrera,Periodo,al.getOportunidad(),al.getTipo());
                
                listaAltas.add(Ba);
                contador++;
            
            }else{
                response.getWriter().println("No se pudo guardar la Alta");
                carg.Dar_Alta(ide,cupoN-1);
            }
            }
            else response.getWriter().println("No se pudo Guardar el cupo ");
        }else 
            response.getWriter().println("Se alcanzo el cupo Maximo"+cup.getEE());
        }else
            response.getWriter().println("Materia:"+cup.getEE()+" "+"ya registrada");
       }
        if(contador!=0){
        String path = getServletContext().getRealPath("/pdf/ALTAS.pdf");
        
       
        objsesion.setAttribute("alta",listaAltas);
        ConsultarPDF pdf =new ConsultarPDF();
        ConsultarPDF pdf2=new ConsultarPDF();        
        String path2 ="";
        path2= getServletContext().getRealPath("/pdf/Altas/"+num+"_"+M+".pdf");
       int ida=Integer.parseInt(alumno.getId());
       pdf2.registrar_pdf(ida,Periodo,fecha,hora,Carrera,"Original",depa);
       pdf.crear_pdfAlta(listaAltas,contador, nombre, apellidop,apellidom,path,path2,M,Periodo,Carrera,dia,mes,anio,alumno.getcalle(),alumno.getColonia(),alumno.getEntre(),alumno.gettelefono(),alumno.getNombre2(),alumno.getTel2());
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
            Logger.getLogger(RegistrarAlta.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(RegistrarAlta.class.getName()).log(Level.SEVERE, null, ex);
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
