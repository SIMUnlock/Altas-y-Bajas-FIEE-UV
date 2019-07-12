/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.registros;

import Modelo.ConsultaAlumno;
import Modelo.encapsulados.Alumno;
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
public class RegistrarAlumno extends HttpServlet {

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
        String nombre=request.getParameter("N");
        String ap=request.getParameter("AP");
        String am=request.getParameter("AM");
        String calle=request.getParameter("calle");
        String colonia=request.getParameter("colonia");
        String carrera=request.getParameter("car");
        String entre=request.getParameter("entre");
        String tel=request.getParameter("tel");
        String n2=request.getParameter("N2");
        String tel2=request.getParameter("tel2");
        
        String telSeg=request.getParameter("NSEG");
        
        String facu=request.getParameter("Facu");
             
        nombre = nombre.replaceAll("\\s+$", "");
        ap = ap.replaceAll("\\s+$", "");
        am = am.replaceAll("\\s+$", "");
        Matricula = Matricula.replaceAll("\\s+$", "");
            
        
        ConsultaAlumno alu=new ConsultaAlumno();
        ConsultaAlumno alum=new ConsultaAlumno();
        Alumno alumno=alum.VerificarAlumno(Matricula);
        if(alumno.getId().equals("no")){
            if(alu.registrar_Alumno(Matricula, nombre, ap, am, calle, tel,carrera,colonia,entre,tel2,n2,telSeg,facu)){
                response.getWriter().print("Exito");
            }else{
                response.getWriter().println("Error al guardar");}
        }else{
                response.getWriter().println("Alumno ya registrado");}
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
