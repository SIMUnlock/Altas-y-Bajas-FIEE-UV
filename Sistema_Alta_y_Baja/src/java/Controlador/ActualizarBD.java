/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.RespaldoBD;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author trdni
 */
public class ActualizarBD extends HttpServlet {

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
        DiskFileItemFactory factory = new DiskFileItemFactory();
        
        String path = getServletContext().getRealPath("/respaldo");
        factory.setSizeThreshold(1024);
        factory.setRepository(new File(path));
        ServletFileUpload upload = new ServletFileUpload(factory);
        try{
            List<FileItem> partes = upload.parseRequest(request);
            for(FileItem items: partes){
                File file=new File(path,items.getName());
                items.write(file);
            }
            RespaldoBD BD=new RespaldoBD();
            BD.restaurar(path+"/respaldo.sql");
            
            
             response.getWriter().println(2);
       
        }catch(Exception e){
             response.getWriter().println(1);
       
        }
        /*response.setContentType("text/html;charset=UTF-8");
         RespaldoBD BD=new RespaldoBD();
         String path;
         path= getServletContext().getRealPath("/respaldo/respaldo.sql");
         BD.export(path);
         response.getWriter().println("respaldo.sql");*/
         
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
