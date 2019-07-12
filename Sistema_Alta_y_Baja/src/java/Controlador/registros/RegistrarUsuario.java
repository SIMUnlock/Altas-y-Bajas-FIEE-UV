/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.registros;

import Modelo.ConsultaDepartamento;
import Modelo.ConsultaUsuario;
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
public class RegistrarUsuario extends HttpServlet {

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
       String nombre=request.getParameter("nombre");
        String apellidop=request.getParameter("apellidop");
        String apellidom=request.getParameter("apellidom");
        String usuario=request.getParameter("usuario");
        String pass="12345";
        String tipo=request.getParameter("Tipo");
        String departamento=request.getParameter("departamento");
        ConsultaUsuario co = new ConsultaUsuario();
        ConsultaUsuario con = new ConsultaUsuario();
        int depa=0;
        
        ConsultaDepartamento dep=new ConsultaDepartamento();
        depa=dep.getdepartamento(departamento);
        
        
        if(!con.noreplicausuario(usuario)){
            if(co.registrar_usuario(nombre, apellidop, apellidom, usuario, pass,tipo,depa)){
                response.getWriter().println("Exito al guardar");

            }else{
                response.getWriter().println("No se pudo guardar Usuario");
            }
        }else{
            response.getWriter().println(1);
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
