/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.eliminacion;

import Modelo.ConsultaUsuario;
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
public class EliminarUsuario extends HttpServlet {

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
        
       String  a = (String)objsesion.getAttribute("a");

        String usuario=request.getParameter("id");
        String tipou=request.getParameter("tipo");
        ConsultaUsuario an= new ConsultaUsuario();
        int con=0;
        
        if(a.equals("superadmin"))
        {
            con=1;
        }else if(a.equals("superusuario")){
            if(tipou.equals("superadmin")){
                con=0;
            }else{
                con=1;
            }
            
        }else if(a.equals("admin")){
            if(tipou.equals("superadmin") || tipou.equals("superusuario") ){
                con=0;
            }else{
                con=1;
            }
            
        }else con=0;
        
        
        
        
      if(con==1)
      {
        if(an.eliminarUsuario(usuario)){
           response.getWriter().println(1);
        }else{
                      response.getWriter().println(2);

        }
      }
      else response.getWriter().println(3);
    
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
