/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.modificacion;

import Modelo.ConsultaAlta;
import Modelo.ConsultaAlumno;
import Modelo.ConsultaCargaAcademica;
import Modelo.ConsultarPDF;
import Modelo.encapsulados.Alta;
import Modelo.encapsulados.Alumno;
import Modelo.encapsulados.CargaAcademica;
import Modelo.encapsulados.ModificarPDFAlta;
import Modelo.encapsulados.PDF;
import Modelo.encapsulados.RegisAlta;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.lowagie.text.DocumentException;
import java.io.IOException;
import java.io.PrintWriter;
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
public class Modificarpdfalta extends HttpServlet {

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
        String id=request.getParameter("ids");
        
         String t=request.getParameter("table");
        int id2=Integer.parseInt(request.getParameter("n"));
        String usuario=request.getParameter("user");
        String tipo=request.getParameter("tipo");
        String carrera=request.getParameter("car");
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
        tipoObjeto = new TypeToken<List <ModificarPDFAlta>>(){}.getType();
ArrayList<ModificarPDFAlta> alumnos2=gson.fromJson(t, tipoObjeto);
System.out.println("nJSON A JAVA");
int contador=0;
LinkedList<Alta>  listaAltas = new LinkedList<>();
        Alta Ba=null;
         
 String M="";
 String nombre="";
 String  apellidop="";
 String apellidom="";
 String Periodo="";
for(int i=0;i<alumnos2.size();i++){
    ConsultaAlta co = new ConsultaAlta();
   
 ModificarPDFAlta al=alumnos2.get(i);
 int ids=Integer.parseInt(al.getId());
 Alta AP=co.getAlta(ids);
 M=al.getMatricula();
nombre=al.getNombre();
apellidop=al.getApellidoP();
apellidom=al.getApellidoM();
Periodo=al.getPeriodo();


// response.getWriter().println("Exito al guardar Alta"+al.getEE()+al.getId()+al.getNrc());
//}




        
        
       // String[] vector = id.split(",");
        //int tamano = vector.length; 
        
        
       //for(int i=0;i<tamano;i++){
       
        
        
            
                      

            
                response.getWriter().println("Exito al guardar Alta"+ " " + al.getEE() +AP.getOportunidad());
                Ba = new Alta("","","","","",al.getNRC(),al.getEE(),"","",AP.getOportunidad(),AP.getTipo());
                listaAltas.add(Ba);
                contador++;
            
}
       
        alumno=alu.VerificarAlumno(M);
        if(contador!=0){
        String path = getServletContext().getRealPath("/pdf/ALTAS.pdf");
        
       
        PDF p=null;
        ConsultarPDF pdf =new ConsultarPDF();
        ConsultarPDF pdf1=new ConsultarPDF();
        ConsultarPDF pdf2=new ConsultarPDF();
        p=pdf1.getPdf(0);
        String path2 ="";
        int num=p.getId();
        num=num+1;
        path2= getServletContext().getRealPath("/pdf/Altas/"+id2+"_"+M+".pdf");
               
       pdf2.modificar_PDFAlta(id2,"Modificado");
       pdf.crear_pdfAlta(listaAltas,contador, nombre, apellidop,apellidom,path,path2,M,Periodo,carrera,dia,mes,anio,alumno.getcalle(),alumno.getColonia(),alumno.getEntre(),alumno.gettelefono(),alumno.getNombre2(),alumno.getTel2());
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
            Logger.getLogger(Modificarpdfalta.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Modificarpdfalta.class.getName()).log(Level.SEVERE, null, ex);
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
