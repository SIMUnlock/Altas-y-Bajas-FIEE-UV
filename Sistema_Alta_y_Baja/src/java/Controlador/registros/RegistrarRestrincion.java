/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.registros;

import Modelo.ConsultaDepartamento;
import Modelo.ConsultaRestrincion;
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
public class RegistrarRestrincion extends HttpServlet {

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
    
        
        String creditos=request.getParameter("creditos");
        String carrera=request.getParameter("carrera");
        String Generacion=request.getParameter("generacion");
        
        ConsultaRestrincion res=new ConsultaRestrincion();
        ConsultaRestrincion res2=new ConsultaRestrincion();
        ConsultaRestrincion res3=new ConsultaRestrincion();
        
        int depa=0;
        ConsultaDepartamento dep=new ConsultaDepartamento();
        depa=dep.getdepartamento(departamento);
        
        if(res.ComprobarRestrincion(departamento)){
           
            if(res2.modificar_Restrincion(depa,carrera, Generacion, creditos)){
                response.getWriter().println("Exito al guardar configuracion");
            }else{
                response.getWriter().println("No se pudo guardar las configuracion ");
            }
            
            
            
        }else{
             if(res3.registrar_restrincion(carrera,"12.12.12", Generacion, creditos,depa)){
                response.getWriter().println("Exito al guardar configuracion");
            }else{
                response.getWriter().println("No se guardo la configuracion Nueva"+depa+" "+Generacion+carrera+creditos);
            }
            
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
