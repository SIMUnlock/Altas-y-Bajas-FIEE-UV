/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.ConsultaAlumno;
import Modelo.ConsultarCarrera;
import Modelo.encapsulados.Alumno;
import Modelo.encapsulados.Carrera;
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
public class Buscarcarrera extends HttpServlet {

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
         String Matricula = request.getParameter("M");
          ConsultaAlumno alum;
         Alumno alumno;
         String carrera;
         ConsultarCarrera Car=new ConsultarCarrera();
         Carrera Carre;
         HttpSession objsesion = request.getSession(true);
         String elec = request.getParameter("elec");
         String departamento = request.getParameter("depa");
         
         objsesion.setAttribute("depar",departamento);
         
         if(!Matricula.equals("NO")){
              alum=new ConsultaAlumno();
              alumno=alum.VerificarAlumno(Matricula);
              Carre=Car.getCarrera(alumno.getCarrera());
              if(Carre==null){
                  objsesion.setAttribute("carrera", alumno.getCarrera());
                  objsesion.setAttribute("elec","Si");
                  response.getWriter().println(alumno.getCarrera());
              }
              else {
                  objsesion.setAttribute("carrera", Carre.getClave());
                  objsesion.setAttribute("elec",elec);
                  response.getWriter().println(Carre.getCarrera());
              }   
              
              
         }else{
            carrera = request.getParameter("carrera");
            objsesion.setAttribute("elec",elec);
            objsesion.setAttribute("carrera", carrera);
         }
         //response.sendRedirect("Consultacargacademica.jsp");
            
        
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
