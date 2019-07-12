/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.registros;

import Modelo.ConsultaAlumno;
import Modelo.ConsultaDepartamento;
import Modelo.ConsultaReserva;
import Modelo.ConsultaRestrincion;
import Modelo.ConsultarCarrera;
import Modelo.encapsulados.Alumno;
import Modelo.encapsulados.Carrera;
import Modelo.encapsulados.Restricion;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author trdni
 */
public class RegistrarReserva extends HttpServlet {

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
        
        String Matricula=request.getParameter("M");
        String credito=request.getParameter("cred");
        String Generacion=request.getParameter("gen");
        
        String Departamento=request.getParameter("dep");

        
        ConsultaReserva re = new ConsultaReserva();
        ConsultaReserva ver = new ConsultaReserva();
        ConsultaAlumno alu = new ConsultaAlumno();
        Alumno alum=alu.VerificarAlumno(Matricula);
        ConsultaRestrincion res=new ConsultaRestrincion();
        ConsultaRestrincion res1=new ConsultaRestrincion();
        ConsultaRestrincion res2=new ConsultaRestrincion();
        ConsultarCarrera car=new ConsultarCarrera();
        Restricion restrin=res.verRestricion(Departamento);
        
       

        int con=0;
        int con1=0;
        int permitido=0;
        
        if(credito.equals("menor 32")){
            con=2;
        }else{
            if(restrin.getRangoCredito().equals(credito)){
                con=0;
            }else{
                con=1;
            }
            
        }
        
        if(res1.VerGeneracion(Departamento,Generacion)){
            con1=0;
            
        }else{
            con1=1;
        }
        
        if( (con==0 && con1==1) || (con==1 && con1==0) | (con==1 && con1==1) )
        {
            permitido=1;
        }else{
            permitido=0;
        }
        
        
        int depa=0;
         ConsultaDepartamento dep=new ConsultaDepartamento();
        depa=dep.getdepartamento(Departamento);
      
        
        if(permitido==0){
            Carrera carrera=car.getStringCarrera(alum.getCarrera());
            
            
            if(!alum.getId().equals("no")){
                if(res2.VerRescarrera(Departamento, carrera.getCarrera())){
                    if(!ver.verificarmatricula(Matricula,depa)){
                        if(re.registrar_reserva(Matricula, alum.getNombre(), alum.getAP(), alum.getAM(),depa)){
                            response.getWriter().println("Exito al guardar");
                        }else
                        { 
                            response.getWriter().println("No se guardo el lugar");
                        }
                    }else
                    { 
                        response.getWriter().println(2);
                    }
                }else
                {
                    response.getWriter().println("Atencion a Alumnos de las carreras "+restrin.getCarreras());
                }   
            }else
            {
                response.getWriter().println(1);
            }
            
           
        }else{
            if(con1==1)
            response.getWriter().println("Atencion a Alumnos de "+restrin.getRangoCredito()+" creditos de la generacion " +restrin.getGeneracion() );
            else
            response.getWriter().println("Atencion a Alumnos de "+restrin.getRangoCredito()+" creditos ");
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
