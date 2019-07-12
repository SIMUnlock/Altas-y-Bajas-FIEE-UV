/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador.eliminacion;

import Modelo.ConsultaDepartamento;
import Modelo.ConsultaReserva;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author trdni
 */
public class EliminarReserva extends HttpServlet {

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
        Calendar cal= Calendar.getInstance();
        int depa=0;
         ConsultaDepartamento dep=new ConsultaDepartamento();
        depa=dep.getdepartamento(departamento);
                   
                         int anio = cal.get(Calendar.YEAR);
                         int mes= cal.get(Calendar.MONTH)+1;
                         int minuto=cal.get(Calendar.MINUTE);
                         int segundos=cal.get(Calendar.SECOND);
                         String min="";
                         if(minuto<10)
                             min=":0"+minuto;
                         else
                             min=":"+minuto;
                             
                         String segun="";  
                        if(segundos<10)
                            segun=":0"+segundos;
                        else
                            segun=":"+segundos;
                        
                             
                         String fecha=anio+"-"+mes+"-"+cal.get(Calendar.DAY_OF_MONTH);
                         String hora=cal.get(Calendar.HOUR_OF_DAY)+min+segun;
                         String FH=fecha+" "+hora;
        String id=request.getParameter("id");
       ConsultaReserva a= new ConsultaReserva();
       ConsultaReserva ultimo= new ConsultaReserva();
       if(a.eliminar_Reserva(id,depa)){
           if(ultimo.actualisarultimo(FH))
              response.getWriter().println("Eliminado");
           else
               response.getWriter().println("error de actualizacion");
           //response.getWriter().println("Lugar eliminado"+FH);
        }else response.getWriter().println("error"+depa);
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
