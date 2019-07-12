/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.registros;

import Modelo.ConsultaCatedratico;
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
public class RegistroCatedratico extends HttpServlet {

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
         String nombre=request.getParameter("nom");
        String apellidop=request.getParameter("app");
        String apellidom=request.getParameter("apm");
        String puesto=request.getParameter("pues");
        String tipo=request.getParameter("tip");
        String plaza=request.getParameter("plaz");
        int anio=Integer.parseInt(request.getParameter("B"));
        int antiguedad=Integer.parseInt(request.getParameter("ant"));
        nombre = nombre.replaceAll("\\s+$", "");
        apellidop = apellidop.replaceAll("\\s+$", "");
        apellidom = apellidom.replaceAll("\\s+$", "");
        puesto = puesto.replaceAll("\\s+$", "");
        plaza = plaza.replaceAll("\\s+$", "");
        ConsultaCatedratico co = new ConsultaCatedratico();
        
       if(co.registrar_CateDratico(nombre, apellidop, apellidom, puesto, tipo, plaza, anio, antiguedad)){
             response.getWriter().println("Exito al guardar");
        }else{
             response.getWriter().println("No se guardo el Catedratico ");
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
