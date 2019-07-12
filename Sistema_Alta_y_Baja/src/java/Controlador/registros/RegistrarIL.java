/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.registros;

import Modelo.ConsultaCargaAcademica;
import Modelo.ConsultarIL;
import Modelo.encapsulados.CargaAcademica;
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
public class RegistrarIL extends HttpServlet {

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
        int id=Integer.parseInt(request.getParameter("iden"));
        int LO=Integer.parseInt(request.getParameter("LO"));            
        String EE=request.getParameter("EXE");
        String NRC=request.getParameter("NRC2");  
        String P=request.getParameter("P"); 
        ConsultarIL co = new ConsultarIL();
        ConsultaCargaAcademica car = new ConsultaCargaAcademica ();
        ConsultaCargaAcademica  carg = new ConsultaCargaAcademica ();
        CargaAcademica cup=car.getCarga(id);
        int cupo=Integer.parseInt(cup.getCupo());
        int Max=Integer.parseInt(cup.getCupoM());
        int CupoL = Max-LO; 
        int cupoN = cupo+1;
        if(LO<=Max)
        {   
            if(carg.Dar_Alta(id,LO))
            {
            if(co.registrar_IL(EE,NRC,LO,CupoL,Max,P)){
                response.getWriter().println("Exito al guardar IL los Lugares libres son: "+CupoL);
            
            }else{
                response.getWriter().println(3);
                carg.Dar_Alta(id,cupo);
            }
            }
            else response.getWriter().println(2);
        }else 
            response.getWriter().println(1);
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